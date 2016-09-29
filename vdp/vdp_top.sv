module vdp_top (

  input logic       clk_4, clk_100, // Need both clocks
  input logic       reset_L,

  //---------------------------------------------------------------------------
  //Bus Interface
  //  - data_bus:
  //  - addr_bus:
  //  - IORQ_L:   The data on the bus is part of an I/O request
  //  - RD_L:     Main CPU is ready for memory data to be placed onto data bus
  //  - WR_L:     Main CPU is placing valid data onto bus for write
  //---------------------------------------------------------------------------
  inout wire  [7:0]   data_bus,
  inout wire  [15:0]  addr_bus,
  input logic         IORQ_L,
  input logic         RD_L,
  input logic         WR_L

  //---------------------------------------------------------------------------
  //Interrupt output interface
  //
  //TODO: Define the necessary outputs for VDP generated interrupts
  //---------------------------------------------------------------------------

  //---------------------------------------------------------------------------
  //Board output interface
  //
  //TODO: Define the necessary board outputs for VGA interface
  //---------------------------------------------------------------------------
);

  logic CSW_L, CSR_L, MODE, vdp_go;
   
  vdp_port_decoder DECODER(
    .clk(clk_4),
    .reset_L(reset_L),
    .addr_in(addr_bus),
    .data_in(data_bus),
    .IORQ_L(IORQ_L),
    .RD_L(RD_L),
    .WR_L(WR_L),
    .CSW_L(CSW_L),
    .CSR_L(CSR_L),
    .MODE(MODE),
    .vdp_go(vdp_go)
  );

  logic [7:0] stat_reg_out;
  logic [7:0] data_port_out;

  vdp_ports PORTS(
    .clk(clk_4),
    .clk_100(clk_100),
    .reset_L(reset_L),
    .MODE(MODE),
    .CSR_L(CSR_L),
    .CSW_L(CSW_L),
    .vdp_go(vdp_go),
    .data_in(data_bus),
    .data_out(data_port_out),
    .stat_reg_out(stat_reg_out)
  );

  //assign the data bus if we are reading from it
  assign data_bus = (MODE & ~CSR_L) ? 
                    (stat_reg_out) : (
                    (~MODE & ~CSR_L) ? data_port_out : 8'bz 
                    );

endmodule: vdp_top


/* vdp_bus_decoder
 * Description: This module is responsible for generating the control signals
 *              for the command and data ports that interface with the addr and
 *              data bus lines.
 */
module vdp_port_decoder(

  //---------------------------------------------------------------------------
  //Bus Interface
  //  - data_in:
  //  - addr_in:
  //---------------------------------------------------------------------------
  input  logic clk,
  input  logic reset_L,
  input  logic [15:0] addr_in,
  input  logic [7:0]  data_in,

  //---------------------------------------------------------------------------
  //Control Signal Interface
  //  - IORQ_L: Main CPU is in the middle of an I/O request
  //  - RD_L:   Main CPU is ready for data on data bus
  //  - WR_L:   Main CPU is putting a byte of data on the bus
  //  - CSW_L:  When asserted, bus data goes into VDP port
  //  - CSR_L:  When asserted, VDP port is put out onto bus line
  //  - MODE:   Determines if transfer goes to/from control port or data port
  //---------------------------------------------------------------------------
  input   logic IORQ_L,
  input   logic RD_L,
  input   logic WR_L,
  output  logic CSW_L,
  output  logic CSR_L,
  output  logic MODE,
  output  logic vdp_go
);

  enum logic [2:0] {
    WAIT = 3'b000,
    RD0  = 3'b001,
    RD1  = 3'b010,
    WR0  = 3'b011,
    WR1  = 3'b100
  } state, next_state;

  always @(posedge clk) begin
    if(~reset_L) begin
      state <= WAIT;
    end

    else begin
      state <= next_state;
    end
  end

  always_comb begin
    // intialization
    vdp_go = 0;
     
    // next state logic
    case (state)

      WAIT: begin
        if(~IORQ_L & ~WR_L) begin
          next_state = WR0;
        end

        else if (~IORQ_L & ~RD_L) begin
          next_state = RD0;
        end
      end

      WR0: next_state = WR1;

      WR1: next_state = WAIT;

      RD0: next_state = RD1;

      RD1: next_state = WAIT;

      default: next_state = WAIT;
    endcase

    // output logic
    case (state)
      WAIT: begin
        MODE     = 0;
        CSR_L    = 1;
        CSW_L    = 1;
      end

      RD0, RD1: begin
        MODE  = (addr_in[7:0] == 8'hBF); //Command port -> 1, data port -> 0
        CSR_L = 0;
        CSW_L = 1;
        vdp_go = 1;
      end

      WR0, WR1: begin
        MODE  = (addr_in[7:0] == 8'hBF); //Command port -> 1, data port -> 0
        CSR_L = 1;
        CSW_L = 0; 
	vdp_go = 1; 
      end

    endcase

  end

endmodule: vdp_port_decoder

module vdp_ports(
  input   logic clk, clk_100,
  input   logic reset_L,

  input   logic MODE,
  input   logic CSR_L,
  input   logic CSW_L,
  input   logic vdp_go,

  input   logic [7:0] data_in,
  output  logic [7:0] data_out,
  output  logic [7:0] stat_reg_out
);

  logic [7:0] cmd_port_in_1, cmd_port_out_1, cmd_port_in_2, cmd_port_out_2;
  logic [7:0] data_port_in, data_port_out;
  logic       cmd_wr_1, cmd_wr_2, data_in_sel; // Set in FSM
  
  logic [7:0] rf_data_in, rf_data_out;
  logic [3:0] rf_addr;
  logic       rf_en; // Set in FSM
  
  logic [13:0] write_addr_in, write_addr_out;
  logic        write_addr_en, write_addr_sel; // Set in FSM
  
  logic [7:0][7:0]  VRAM_VGA_data_out; // 8 VGA read ports 
  logic [7:0]       VRAM_io_data_in,  // 1 io write port
                    VRAM_io_data_out; // 1 io read port
  logic [7:0][13:0] VRAM_VGA_addr; // 8 VGA addr's
  logic [13:0]      VRAM_io_addr; // 1 io address
  logic [7:0]       VRAM_VGA_re; // 8 read enables
  logic             VRAM_io_re, VRAM_io_we; // 1 write enable - Set in io_FSM
	 
  logic [7:0][5:0] CRAM_VGA_data_out;
  logic [5:0]      CRAM_io_data_in, 
                   CRAM_io_data_out;
  logic [7:0][4:0] CRAM_VGA_addr;
  logic [4:0]      CRAM_io_addr;
  logic [7:0]      CRAM_VGA_re;
  logic            CRAM_io_we; // Set in io_FSM


  /******* Register File *******/ 

  assign rf_data_in = cmd_port_out_1;
  assign rf_addr = cmd_port_out_2[3:0];
	 
  regFile rf(
    .clk(clk),
    .rst_L(reset_L),
    .data_in(rf_data_in),
    .addr(rf_addr),
    .en(rf_en),
    .data_out(rf_data_out)
  );

  /******* Address Register Logic *******/ 

  // Mux between incrementing the address or writing in a new one
  assign write_addr_in = 
	(write_addr_sel) ? 
	{cmd_port_out_2[5:0], cmd_port_out_1[7:0]} : 
	(write_addr_out + 1);

  register #(14) write_addr_reg(
    .clk(clk),
    .rst_L(reset_L),
    .D(write_addr_in),
    .Q(write_addr_out),
    .en(write_addr_en)
  );	 

  /******** VRAM & CRAM ********/  

  // #ScrollingBackAndForthIsForScrubs  
  // logic [7:0][7:0]  VRAM_VGA_data_out; // 8 VGA read ports 
  // logic [7:0]       VRAM_io_data_in,  // 1 io write port
  //                   VRAM_io_data_out; // 1 io read port
  // logic [7:0][13:0] VRAM_VGA_addr; // 8 VGA addr's
  // logic [13:0]      VRAM_io_addr; // 1 io address
  // logic [7:0]       VRAM_VGA_re; // 8 read enables
  // logic             VRAM_io_re, VRAM_io_we; // 1 write enable - Set in io_FSM
  // 	 
  // logic [7:0][5:0] CRAM_VGA_data_out;
  // logic [5:0]      CRAM_io_data_in, 
  //                  CRAM_io_data_out;
  // logic [7:0][4:0] CRAM_VGA_addr;
  // logic [4:0]      CRAM_io_addr;
  // logic [7:0]      CRAM_VGA_re;
  // logic            CRAM_io_we; // Set in io_FSM

  mem #(8, 14, 8) VRAM(
    .a_clk(clk),
    .b_clk(clk_100),
    .rst_L(reset_L),
    .data_in(VRAM_io_data_in),
    .a_addr(VRAM_io_addr),
    .b_addr(VRAM_VGA_addr),
    .a_we(VRAM_io_we),
    .a_re(VRAM_io_re),
    .b_re(VRAM_VGA_re),
    .a_data_out(VRAM_io_data_out),
    .b_data_out(VRAM_VGA_data_out)
  );

  mem #(6, 5, 8) CRAM(
    .a_clk(clk),
    .b_clk(clk_100),
    .rst_L(reset_L),
    .data_in(CRAM_io_data_in),
    .a_addr(CRAM_io_addr),
    .b_addr(CRAM_VGA_addr),
    .a_we(CRAM_io_we),
    .a_re(CRAM_io_re),
    .b_re(CRAM_VGA_re),
    .a_data_out(CRAM_io_data_out),
    .b_data_out(CRAM_VGA_data_out)
  );

  assign VRAM_io_data_in = data_port_out;
  assign VRAM_io_addr = write_addr_out;
  assign VRAM_VGA_addr = 0; // FIX
  assign CRAM_io_data_in = data_port_out;
  assign CRAM_io_addr = write_addr_out;
  assign CRAM_VGA_addr = 0; // FIX 

  /******* FSM *******/

  vdp_io_fsm io_fsm(
    .clk(clk),
    .rst_L(reset_L),
    .MODE(MODE),
    .CSR_L(CSR_L),
    .CSW_L(CSW_L),
    .op(cmd_port_out_2[7:6]),
    .go(vdp_go),
    .wr_cmd_1(cmd_wr_1),
    .wr_cmd_2(cmd_wr_2),
    .rf_en(rf_en),
    .wr_addr_sel(write_addr_sel),
    .wr_addr_en(write_addr_en),
    .stat_en(),                    // Probably just remove this
    .data_in_sel(data_in_sel),
    .VRAM_re(VRAM_io_re), 
    .VRAM_we(VRAM_io_we),
    .CRAM_re(CRAM_io_re),
    .CRAM_we(CRAM_io_we)
  );

  /******** Data Bus Interfacing ********/ 
  
  register #(8) cmd_port_1(
    .clk(clk),
    .rst_L(reset_L),
    .D(cmd_port_in_1),
    .Q(cmd_port_out_1),
    .en(MODE & cmd_wr_1) // Should only ever be written to on MODE == 1
  );

  register #(8) cmd_port_2(
    .clk(clk), 
    .rst_L(reset_L),
    .D(cmd_port_in_2),
    .Q(cmd_port_out_2),
    .en(MODE & cmd_wr_2) // Should be written to only when cmd_port is written to  
              // data valid when flag = 1
  );

  register #(8) data_port(
    .clk(clk),
    .rst_L(reset_L),
    .D(data_port_in),
    .Q(data_port_out),
    .en(~MODE) // Should only ever be written to on MODE == 0
  );

  assign data_out = data_port_out;
  assign data_port_in = (~CSW_L) ?           
    (data_in_sel ? VRAM_io_data_out : data_in)
    : data_port_out;
  assign cmd_port_in_1 = data_in;
  assign cmd_port_in_2 = data_in;

endmodule: vdp_ports

module vdp_io_fsm(
  input  logic       clk, rst_L,
  input  logic       MODE, CSR_L, CSW_L, go,
  input  logic [1:0] op,  
  output logic       wr_cmd_1, wr_cmd_2, rf_en,
  output logic       wr_addr_sel, wr_addr_en, stat_en,
  output logic       data_in_sel, VRAM_re, VRAM_we, 
  output logic       CRAM_re, CRAM_we
);

  enum logic [3:0] {Load_addr_1,
                    Load_addr_1_wait,
                    Load_addr_2,
                    Load_addr_2_wait,
                    Decode,
                    VRAM_read_addr,
                    VRAM_read_wait,
                    VRAM_read_data,
                    VRAM_write_addr,
                    VRAM_write_wait,
                    VRAM_write_data,
                    RF_write,
                    CRAM_write_addr,
                    CRAM_write_wait,
                    CRAM_write_data
                   } cs, ns;

  // NS logic
  always_comb begin
    case(cs) 
      Load_addr_1: ns = (go) ? Load_addr_1_wait : Load_addr_1;
      Load_addr_1_wait: ns = (~go) ? Load_addr_2 : Load_addr_1_wait;
      Load_addr_2: ns = (go) ? Load_addr_2_wait : Load_addr_2;
      Load_addr_2_wait: ns = (~go) ? Decode : Load_addr_2_wait;
      Decode:
        case (op) 
          2'd0: ns = VRAM_read_addr;
          2'd1: ns = VRAM_write_addr;
          2'd2: ns = RF_write;
          2'd3: ns = CRAM_write_addr;
        endcase
      VRAM_read_addr: ns = VRAM_read_wait;
      VRAM_read_wait:  // If read, read out another byte, otherwise 
                       // reconfigure the command register
        ns = (go) ? (     
             (MODE) ? Load_addr_1 : VRAM_read_data
             ) : VRAM_read_wait;
      VRAM_read_data: ns = VRAM_read_wait; // Prepare for sequential reads
      VRAM_write_addr: ns = VRAM_write_wait;
      VRAM_write_wait: begin
        ns = (go) ? (     
             (MODE) ? Load_addr_1 : VRAM_write_data
             ) : VRAM_write_wait;
      end
      VRAM_write_data: ns = VRAM_write_wait;
      RF_write: ns = Load_addr_1;
      CRAM_write_addr: ns = CRAM_write_wait;
      CRAM_write_wait: begin
        ns = (go) ? (     
             (MODE) ? Load_addr_1 : CRAM_write_data
             ) : CRAM_write_wait;
      end
      CRAM_write_data: ns = CRAM_write_wait;
    endcase
  end

  // Output logic
  always_comb begin
    wr_cmd_1 = 0;
    wr_cmd_2 = 0;
    rf_en = 0;
    wr_addr_sel = 0;
    wr_addr_en = 0;
    stat_en = 0;
    data_in_sel = 0;
    VRAM_re = 0;
    VRAM_we = 0;
    CRAM_re = 0;
    CRAM_we = 0;
    case(cs) 
      Load_addr_1: begin
        wr_cmd_1 = 1;
      end
      Load_addr_1_wait: begin end
      Load_addr_2: begin
        wr_cmd_2 = 1;
      end
      Load_addr_2_wait: begin end
      Decode: begin end
      VRAM_read_addr: begin
        wr_addr_sel = 1;
        wr_addr_en = 1;
      end
      VRAM_read_wait: begin
        VRAM_re = 1;
        data_in_sel = 1;
      end
      VRAM_read_data: begin
        wr_addr_en = 1; // Autoincrement address in case of sequential read
      end
      VRAM_write_addr: begin
        wr_addr_sel = 1;
        wr_addr_en = 1;
      end
      VRAM_write_wait: begin
        
      end
      VRAM_write_data: begin
        VRAM_we = 1;
        wr_addr_en = 1; // Autoincrement address in case of sequential write
      end
      RF_write: begin
        rf_en = 1;
      end
      CRAM_write_addr: begin
        wr_addr_sel = 1;
        wr_addr_en = 1;
      end
      CRAM_write_wait: begin
        
      end
      CRAM_write_data: begin
        CRAM_we = 1;
        wr_addr_en = 1; // Autoincrement address in case of sequential write
      end
    endcase
  end

  // State register
  always_ff @(posedge clk, negedge rst_L) begin
    if (~rst_L) cs <= Load_addr_1;
    else cs <= ns;
  end 

endmodule

/* command_decoder
 * Description: Interprets the two byte command written to the command port
 *              to generate the appropriate control signals for the specified
 *              read/write sequence
 */
module command_decoder (
);


endmodule: command_decoder

module regFile (
  input  logic clk,
  input  logic rst_L,
  input  logic [7:0] data_in,
  input  logic [3:0] addr,
  input  logic en,
  output logic [7:0] data_out);

  logic [15:0][7:0] reg_out;
  logic [15:0]      reg_en;

  // Output mux - 10 registers, addr 11-15 has no effect
  assign data_out = reg_out[addr]; 

  genvar i; 
  generate 
    for (i = 0; i < 10; i++) begin 
      register #(8) regi(
        .clk(clk),
        .rst_L(rst_L),
        .D(data_in),
        .en(en & (addr == i)),
        .Q(reg_out[i])
      );
    end
  endgenerate

endmodule
