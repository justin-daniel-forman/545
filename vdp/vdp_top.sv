module vdp_top (

  input logic       clk_4, clk_25, clk_100, // Need both clocks
  input logic       rst_L,

  //---------------------------------------------------------------------------
  //Bus Interface
  //  - data_bus:
  //  - addr_bus:
  //  - IORQ_L:   The data on the bus is part of an I/O request
  //  - RD_L:     Main CPU is ready for memory data to be placed onto data bus
  //  - WR_L:     Main CPU is placing valid data onto bus for write
  //---------------------------------------------------------------------------
  inout wire  [7:0] data_bus,
  inout wire  [7:0] addr_bus,
  input logic       IORQ_L,
  input logic       RD_L,
  input logic       WR_L,

  //---------------------------------------------------------------------------
  //Interrupt output interface
  //  - BUSY: Asserted when the screen is being updated.
  // 
  //TODO: Define the necessary outputs for VDP generated interrupts
  //---------------------------------------------------------------------------

  output logic      BUSY, 

  //---------------------------------------------------------------------------
  //Board output interface
  //---------------------------------------------------------------------------
  output logic       VGA_HS, VGA_VS,
  output logic [3:0] VGA_R, VGA_B, VGA_G
);

  // Decoder logic
  logic CSW_L, CSR_L, MODE, vdp_go;
  
  // RAM logic
  logic [7:0][7:0]  VRAM_VGA_data_out; // 8 VGA read ports 
  logic [7:0]       VRAM_io_data_in,  // 1 io write port
                    VRAM_io_data_out; // 1 io read port
  logic [7:0][13:0] VRAM_VGA_addr; // 8 VGA addr's
  logic [13:0]      VRAM_io_addr; // 1 io address
  logic [7:0]       VRAM_VGA_re; // 8 read enables
  logic             VRAM_io_re, VRAM_io_we; // 1 write enable - Set in io_FSM
  logic [7:0]       CRAM_VGA_data_out;
  logic [7:0]       CRAM_io_data_in, 
                    CRAM_io_data_out;
  logic [4:0]       CRAM_VGA_addr;
  logic [4:0]       CRAM_io_addr;
  logic             CRAM_VGA_re, CRAM_io_re, CRAM_io_we; // Set in io_FSM

  // RF logic
  logic [7:0] rf_data_out, rf_data_in;
  logic [3:0] rf_addr;
  logic       rf_en; // Set in FSM
   
  // VGA logic
  logic [9:0] pixel_col;
  logic [8:0] pixel_row;

  // Stuff
  logic screenBusy;

  assign BUSY = screenBusy && (pixel_row > 48 && pixel_row <= 575);

  /******* Decoder *******/

  vdp_port_decoder DECODER(
    .clk(clk_4),
    .reset_L(rst_L),
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

  /******* z80 I/O Logic *******/
  
  logic VRAM_go, VRAM_go_VGA, VGA_go_io;
  
  vdp_io IO_LOGIC(
    .clk(clk_4),
    .reset_L(rst_L),
    .MODE(MODE),
    .CSR_L(CSR_L),
    .CSW_L(CSW_L),
    .vdp_go(vdp_go),
    .data_in(data_bus),
    .data_out(data_port_out),
    .stat_reg_out(stat_reg_out),
    .screenBusy,
    .VRAM_io_re,
    .VRAM_io_we,
    .VRAM_io_data_in,
    .VRAM_io_data_out,
    .CRAM_io_re,
    .CRAM_io_we,
    .CRAM_io_data_in(CRAM_io_data_in[5:0]),
    .rf_data_in,
    .rf_addr,
    .rf_en,
    .VRAM_io_addr,
    .CRAM_io_addr,
    .VRAM_go(VRAM_go_io)
  );

  /******* VGA Interface *******/

  /*
  vdp_disp_interface DISP_INTERFACE(
    .clk_25,
    .clk_100, 
    .rst_L,
    .VRAM_VGA_data_out,
    .CRAM_VGA_data_out(CRAM_VGA_data_out[5:0]),
    .col(pixel_col),
    .row(pixel_row),
    .VRAM_VGA_addr,
    .CRAM_VGA_addr,
    .VGA_R, 
    .VGA_G, 
    .VGA_B,
    .VRAM_go(VRAM_go_VGA)
  );*/
  
  vdp_disp_interface_old DISP_INTERFACE(
      //.clk_25,
      //.clk_100,
      .clk(clk_25), 
      .rst_L,
      .VRAM_VGA_data_out,
      .CRAM_VGA_data_out(CRAM_VGA_data_out[5:0]),
      .col(pixel_col),
      .row(pixel_row),
      .VRAM_VGA_addr,
      .CRAM_VGA_addr,
      .VGA_R, 
      .VGA_G, 
      .VGA_B,
      .screenBusy,
      .VRAM_go(VRAM_go_VGA),
      .R2(8'd0),
      .R6(8'd0)
    );
  
  vga VGA(
    .clk(clk_25),
    .rst_L,
    .HSync(VGA_HS),
    .VSync(VGA_VS),
    .row(pixel_row),
    .col(pixel_col)
  );

  /******* Register File *******/ 
	 
  regFile RF(
    .clk(clk_4),
    .rst_L,
    .data_in(rf_data_in),
    .addr(rf_addr),
    .en(rf_en),
    .data_out(rf_data_out)
  );
 
  /******** VRAM & CRAM ********/  

  assign VRAM_go = (VRAM_go_VGA || (VRAM_go_io && ~BUSY));

  mem #(8, 5) CRAM(
    .clka(clk_4),
    .wea(CRAM_io_we),
    .addra(CRAM_io_addr),
    .dina(CRAM_io_data_in),
    .douta(CRAM_io_data_out),
    .clkb(clk_25),
    .web(1'b0),
    .addrb(CRAM_VGA_addr),
    .dinb(8'bz),
    .doutb(CRAM_VGA_data_out)
  );

  vram VRAM( 
    .clk_100, 
    .rst_L,
    .data_in(VRAM_io_data_in),
    .io_addr(VRAM_io_addr), 
    .vga_addr(VRAM_VGA_addr),
    .io_we(VRAM_io_we),
    .io_re(VRAM_io_re),
    .vga_re(VRAM_VGA_re),
    .io_data_out(VRAM_io_data_out),
    .vga_data_out(VRAM_VGA_data_out),
    .VRAM_go(VRAM_go)
  );

  assign VRAM_VGA_re = 8'hFF;

  /******* Top Level I/O Interface *******/

  //assign the data bus if we are reading from it
  assign data_bus = (MODE & ~CSR_L) ? 
                    (stat_reg_out) : (
                    (~MODE & ~CSR_L) ? data_port_out : 8'bz 
                    );

  /*
  ila_1 LOGIC_ANALYZER(
    .clk(clk_100),
    .probe0(VRAM_VGA_addr[0]), // 14 bits
    .probe1(VRAM_VGA_addr[1]), // 14 bits
    .probe2(VRAM_VGA_addr[2]), // 14 bits
    .probe3(VRAM_VGA_addr[3]), // 14 bits
    .probe4(VRAM_VGA_addr[4]), // 14 bits
    .probe5(VRAM_VGA_addr[5]), // 14 bits
    .probe6(pixel_col), 
    .probe7(pixel_row), 
    .probe8(VRAM_VGA_data_out[0]), 
    .probe9(VRAM_VGA_data_out[1]), 
    .probe10(VRAM_VGA_data_out[2]),  
    .probe11(VRAM_VGA_data_out[3]), 
    .probe12(VRAM_VGA_data_out[4]), 
    .probe13(VRAM_VGA_data_out[5]),                  
    .probe14({VGA_R, VGA_G, VGA_B}),
    .probe15({bitSliceSel[3:1], CRAM_VGA_addr}),
    .probe16({5'd0, disp_state}),
    .probe17(colorLatch_out[0]),
    .probe18(colorLatch_out[1]),
    .probe19(colorLatch_out[2]),
    .probe20(colorLatch_out[3])
  );*/

endmodule: vdp_top

// Helper Module to translate 2-bit to 4-bit color
module colorGen(
  input  logic [1:0] colorVal,
  output logic [3:0] RGBVal
);

  always_comb begin
    case(colorVal)
      0: RGBVal = 4'd0;
      1: RGBVal = 4'd5;
      2: RGBVal = 4'd10;
      3: RGBVal = 4'd15;
      default: RGBVal = 4'd0;
    endcase
  end

endmodule

/* vdp_port_decoder
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
  input  logic [7:0] addr_in,
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
    if(~reset_L) state <= WAIT;
    else state <= next_state;
  end

  always_comb begin
    // intialization
    vdp_go = 0;
    MODE   = 0; //Command port -> 1, data port -> 0
    CSR_L  = 1;
    CSW_L  = 1;
     
    // next state logic
    case (state)
      WAIT: begin
        if(~IORQ_L & ~WR_L) begin
          next_state = WR0;
        end
        else if (~IORQ_L & ~RD_L) begin
          next_state = RD0;
        end else next_state = WAIT;
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
        MODE  = (addr_in == 8'hBF); //Command port -> 1, data port -> 0
        CSR_L = 0;
        CSW_L = 1;
        vdp_go = 1;
      end
      WR0, WR1: begin
        MODE  = (addr_in == 8'hBF); //Command port -> 1, data port -> 0
        CSR_L = 1;
        CSW_L = 0; 
	    vdp_go = 1; 
      end
      default: begin
        vdp_go = 0;
        MODE   = 0; //Command port -> 1, data port -> 0
        CSR_L  = 1;
        CSW_L  = 1;
      end
    endcase
  end

endmodule: vdp_port_decoder

// vdp_io
// This module contains logic controlling interface between
// the data_bus and VRAM/CRAM, allowing the z80 to write/read
// to vdp memory or write to vdp registers.
module vdp_io(
  input   logic clk,
  input   logic reset_L,

  input   logic MODE,
  input   logic CSR_L,
  input   logic CSW_L,
  input   logic vdp_go,
  input   logic screenBusy,

  input   logic [7:0] data_in, VRAM_io_data_out,
  output  logic [7:0] data_out,
  output  logic [7:0] stat_reg_out,
  output  logic rf_en, VRAM_io_re, VRAM_io_we, CRAM_io_re, CRAM_io_we,
  output  logic [7:0] VRAM_io_data_in,
  output  logic [5:0] CRAM_io_data_in,
  output  logic [13:0] VRAM_io_addr,
  output  logic [4:0] CRAM_io_addr,
  output  logic [7:0] rf_data_in,
  output  logic [3:0] rf_addr,
  output  logic       VRAM_go
);

  logic [7:0] cmd_port_in_1, cmd_port_out_1, cmd_port_in_2, cmd_port_out_2;
  logic [7:0] data_port_in, data_port_out;
  logic       cmd_wr_1, cmd_wr_2, data_in_sel; // Set in FSM 
  
  logic [13:0] write_addr_in, write_addr_out;
  logic        write_addr_en, write_addr_sel; // Set in FSM 

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

  /******* I/O FSM *******/

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
    .CRAM_we(CRAM_io_we),
    .VRAM_go(VRAM_go),
    .screenBusy
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

  // RF assignment
  assign rf_data_in = cmd_port_out_1;
  assign rf_addr = cmd_port_out_2[3:0];

  // MEM assignment 
  assign VRAM_io_data_in = data_port_out;
  assign VRAM_io_addr = write_addr_out;
  assign CRAM_io_data_in = data_port_out;
  assign CRAM_io_addr = write_addr_out;

  // Data bus I/O assignment
  assign data_out = data_port_out;
  assign data_port_in = (~CSW_L) ?           
    (data_in_sel ? VRAM_io_data_out : data_in)
    : data_port_out;
  assign cmd_port_in_1 = data_in;
  assign cmd_port_in_2 = data_in;

endmodule: vdp_io

module vdp_io_fsm(
  input  logic       clk, rst_L,
  input  logic       MODE, CSR_L, CSW_L, go, screenBusy,
  input  logic [1:0] op,  
  output logic       wr_cmd_1, wr_cmd_2, rf_en,
  output logic       wr_addr_sel, wr_addr_en, stat_en,
  output logic       data_in_sel, VRAM_re, VRAM_we, 
  output logic       CRAM_re, CRAM_we,
  output logic       VRAM_go
);

  enum logic [4:0] {Load_addr_1,
                    Load_addr_1_wait,
                    Load_addr_2,
                    Load_addr_2_wait,
                    Decode,
                    VRAM_read_addr,
                    VRAM_read_wait,
                    VRAM_read_data_1,
                    VRAM_read_data_2,
                    VRAM_write_addr,
                    VRAM_write_wait,
                    VRAM_write_data_1,
                    VRAM_write_data_2,
                    RF_write,
                    CRAM_write_addr,
                    CRAM_write_wait,
                    CRAM_write_data
                   } cs, ns;

  // NS logic
  always_comb begin
    ns = Load_addr_1;
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
             (MODE) ? Load_addr_1 : VRAM_read_data_1
             ) : VRAM_read_wait;
      VRAM_read_data_1: ns = VRAM_read_data_2;
      VRAM_read_data_2: ns = VRAM_read_wait; // Prepare for sequential reads
      VRAM_write_addr: ns = VRAM_write_wait;
      VRAM_write_wait: begin
        ns = (go) ? (     
             (MODE) ? Load_addr_1 : VRAM_write_data_1
             ) : VRAM_write_wait;
      end
      VRAM_write_data_1: ns = VRAM_write_data_2;
      VRAM_write_data_2: ns = VRAM_write_wait;
      RF_write: ns = Load_addr_1;
      CRAM_write_addr: ns = CRAM_write_wait;
      CRAM_write_wait: begin
        ns = (go) ? (     
             (MODE) ? Load_addr_1 : CRAM_write_data
             ) : CRAM_write_wait;
      end
      CRAM_write_data: ns = CRAM_write_wait;
      default: ns = Load_addr_1;
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
    VRAM_go = 0;
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
      VRAM_read_data_1: begin
        wr_addr_en = 1; // Autoincrement address in case of sequential read
        VRAM_go = 1;
      end
      VRAM_read_data_2: begin
        wr_addr_en = 1;
      end
      VRAM_write_addr: begin
        wr_addr_sel = 1;
        wr_addr_en = 1;
      end
      VRAM_write_wait: begin
        
      end
      VRAM_write_data_1: begin
        VRAM_we = 1;
        wr_addr_en = 1; // Autoincrement address in case of sequential write
        VRAM_go = 1;
      end
      VRAM_write_data_2: begin
        VRAM_we = 1;
        wr_addr_en = 1;
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
      default: begin
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
        VRAM_go = 0;
      end
    endcase
  end

  // State register
  always_ff @(posedge clk, negedge rst_L) begin
    if (~rst_L) cs <= Load_addr_1;
    else cs <= ns;
  end 

endmodule

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

// Overclocked RAM, 2 ports:
//   - Read/Write Port
//   - Read Port
// Read latency is 2 clock cycles, writes are 1.
module vram(
  input  logic             clk_100, rst_L,
  input  logic      [7:0]  data_in,
  input  logic      [13:0] io_addr, 
  input  logic [7:0][13:0] vga_addr,
  input  logic             io_we,
  input  logic             io_re,
  input  logic      [7:0]  vga_re,
  input  logic             VRAM_go,
  output logic      [7:0]  io_data_out,
  output logic [7:0][7:0]  vga_data_out);
  
  logic [13:0] addr_a, addr_b;
  logic [7:0]  data_out_a, data_out_b;
  
  logic       we;
  enum logic [2:0] {WOrInit, R0, R1, R2, R3, Wait0, Wait1, Wait2} cs, ns;
  logic [7:0] en;

  // Output and State Logic - ****May need to add a BUSY signal to sync multiple users
  always_comb begin
    addr_a = 0;
    addr_b = 0;
    en = 0;
    we = 0;
    case (cs)
      WOrInit: begin // If both io_re and io_we are low, vga_addr[0]. 
        addr_a = ~(io_re | io_we) ? vga_addr[0] : io_addr;
        addr_b = vga_addr[4];
        we = io_we;
        ns = (VRAM_go) ? R0 : WOrInit; // Waits for a go signal from either the io or VGA interfaces
      end
      R0: begin
        addr_a = vga_addr[1];
        addr_b = vga_addr[5];
        en = 8'h11;
        ns = R1;
      end
      R1: begin
        addr_a = vga_addr[2];
        addr_b = vga_addr[6];
        en = 8'h22;
        ns = R2;
      end
      R2: begin
        addr_a = vga_addr[3];
        addr_b = vga_addr[7];
        en = 8'h44;
        ns = R3;
      end
      R3: begin
        addr_a = vga_addr[3];
        addr_b = vga_addr[7];
        en = 8'h88;
        ns = Wait0;
      end
      Wait0: ns = Wait1;
      Wait1: ns = Wait2;
      Wait2: ns = WOrInit;
      default: begin
        ns = WOrInit;
        addr_a = 0;
        addr_b = 0;
        en = 0;
        we = 0;
      end
    endcase
  end
 
  // 3:0
  register #(8) data_out_latches_A [3:0] (
    .clk(clk_100),
    .rst_L,
    .D(data_out_a),
    .en(en[3:0]),
    .Q(vga_data_out[3:0])
  );

  // 7:4
  register #(8) data_out_latches_B [3:0] (
    .clk(clk_100),
    .rst_L,
    .D(data_out_b),
    .en(en[7:4]),
    .Q(vga_data_out[7:4])
  );
 
  assign io_data_out = io_re ? vga_data_out[0] : 'bz;
 
  // Memory
  mem #(8, 14) cp(
    .clka(clk_100), // A-port is for io writes and VGA reads
    .wea(we),
    .addra(addr_a),
    .dina(data_in),
    .douta(data_out_a),
    .clkb(clk_100), // B-port is for VGA reads
    .web(1'b0),
    .addrb(addr_b),
    .dinb(8'bz),
    .doutb(data_out_b)
  );
  
  always_ff @(posedge clk_100, negedge rst_L) begin
    if (~rst_L) cs <= WOrInit;
    else        cs <= ns;
  end
  
endmodule

module vdp_sprite_interface(
  input  logic             clk, rst_L,
  input  logic [8:0]       row,
  input  logic [9:0]       col,
  input  logic             screenBusy,
  input  logic [5:0][7:0]  VRAM_sprite_data,
  output logic             VRAM_go,
  output logic [7:0]       sprPat, // Feeds into VRAM addr 2-5
  output logic [1:0][13:0] VRAM_sprite_addr,
  output logic             validSprite,
  output logic [7:0]       validHPOS,
  output logic [2:0]       sprPatRow_out,
  output logic [2:0]       sprCnt,
  output logic [7:0][2:0]  spriteOffset
);

  logic [8:0] pixelRow;
  logic [9:0] pixelCol;
  assign pixelRow = row - 9'd48;
  assign pixelCol = col - 10'd64; 

  // PosReg logic
  logic [7:0] posReg_in, posReg_out;
  logic       posReg_en, posReg_incr;

  // VRAM addressing logic   
  logic       VPOSorHPOS;

  // VRAM data handling logic
  logic [7:0][7:0] VPOSlatch_out;
  logic [7:0]      VPOSlatch_en;
  logic [7:0][7:0] HPOSlatch_out;
  logic [7:0]      HPOSlatch_en;
  logic            HPOSlatch_set, VPOSlatch_set, sprLatch_en;
  logic [7:0]      sprLatch_in, sprLatch_out;

  // FSM Status Points
  logic doneTable, validVPOS;

  // Sprite Counter logic
  logic       sprCnt_en, sprCnt_clr;
  logic       sprPatRow_en, sprPat_done;
  logic       VRAM_go_RC, VRAM_go_SPR;
  
  /******* Position Register *******/
  // Keeps track of where in the SAT we are

  register #(8) posReg(
    .clk,
    .rst_L,
    .D(posReg_in),
    .Q(posReg_out),
    .en(posReg_en)
  );

  assign posReg_in = (posReg_incr) ? posReg_out + 8'd1 : 8'd0;

  /******* VRAM Addressing *******/

  // VRAM_addr_6
  assign VRAM_sprite_addr[0] = (~VPOSorHPOS) ? 
    {6'd0, posReg_out} + 14'h3F00 :
    {5'd0, posReg_out, 1'd0} + 14'h3F80;

  assign VRAM_sprite_addr[1] = VRAM_sprite_addr[0] + 14'd1;

  /******* VRAM Data Handling *******/

  assign VPOSlatch_clr = (col > 575);
  assign HPOSlatch_clr = (col > 575);

  comparator #(8) doneTableCheck(
    .A(VRAM_sprite_data[4]),
    .B(8'hD0),
    .AgtB(),
    .AltB(),
    .AeqB(doneTable)
  );

  inRange #(8) validVPOSCheck(
    .IN(pixelRow[8:1]),
    .hi(VRAM_sprite_data[4] + 8'd7),
    .lo(VRAM_sprite_data[4]),
    .inRange(validVPOS)
  );

  generate
    genvar i; 
    for (i = 0; i < 8; i++) begin
      register_clr #(8) VPOSlatch(
        .clk, .rst_L,
        .D(VRAM_sprite_data[4]),
        .Q(VPOSlatch_out[i]),
        .en(VPOSlatch_en[i]),
        .clr(VPOSlatch_clr)
      );
      register_clr #(8) HPOSlatch(
        .clk, .rst_L,
        .D(VRAM_sprite_data[4]),
        .Q(HPOSlatch_out[i]),
        .en(HPOSlatch_en[i]),
        .clr(HPOSlatch_clr)
      );
      assign spriteOffset[i] = pixelRow[3:1] - VPOSlatch_out[i][2:0];
      assign HPOSlatch_en[i] = (sprCnt == i) && HPOSlatch_set;
      assign VPOSlatch_en[i] = (sprCnt == i) && VPOSlatch_set;
      inRange #(8) validHPOSCheck (
        .IN(pixelCol[8:1]),
        .hi(HPOSlatch_out[i] + 8'd7),
        .lo(HPOSlatch_out[i]),
        .inRange(validHPOS[i])
      );
    end
  endgenerate

  always_comb begin
    validSprite = 0;
    case(sprCnt)
      0: validSprite = 0;
      1: validSprite = |validHPOS[0] & (col >= 64 && col < 576);
      2: validSprite = |validHPOS[1:0] & (col >= 64 && col < 576);
      3: validSprite = |validHPOS[2:0] & (col >= 64 && col < 576);
      4: validSprite = |validHPOS[3:0] & (col >= 64 && col < 576);
      5: validSprite = |validHPOS[4:0] & (col >= 64 && col < 576);
      6: validSprite = |validHPOS[5:0] & (col >= 64 && col < 576);
      7: validSprite = |validHPOS[6:0]  & (col >= 64 && col < 576);
      // 8 valid sprites, may need to make sprCnt 4 bits
      default: validSprite = 0;
    endcase
  end 

  register #(8) sprLatch(
    .clk, .rst_L,
    .D(sprLatch_in),
    .Q(sprLatch_out),
    .en(sprLatch_en)
  );

  assign sprLatch_in = VRAM_sprite_data[5];
  assign sprPat = sprLatch_out;

  // FSM to read different pattern rows out of VRAM
  vdp_sprite_pattern_row_control SPR_PAT_DIV_CTRL(
    .clk,
    .rst_L,
    .sprLatch_en,
    .sprPatRow_en,
    .VRAM_go(VRAM_go_RC),
    .sprPat_done
  );

  /******* Various Counters *******/ 

  // Selects the current sprite
  counter #(3) SPRITE_COUNT(
    .clk, .rst_L,
    .clear(sprCnt_clr),
    .en(sprCnt_en),
    .count(sprCnt)
  );

  // Selects the row in the current sprite to read out
  counter #(3) SPRITE_PAT_ROW(
    .clk,
    .rst_L,
    .clear(~sprPatRow_en),
    .en(sprPatRow_en),
    .count(sprPatRow_out)
  );

  /******** FSM *******/

  vdp_sprite_fsm SPRITE_FSM(
    .clk, .rst_L,
    .row,
    .col,
    .doneTable,
    .validVPOS,
    .posReg_en,
    .posReg_incr,
    .VPOSorHPOS,
    .VPOSlatch_set,
    .HPOSlatch_set,
    .VRAM_go(VRAM_go_SPR),
    .sprLatch_en,
    .sprCnt_en,
    .sprCnt_clr,
    .sprPat_done
  );

  assign VRAM_go = VRAM_go_SPR || VRAM_go_RC;

endmodule

module vdp_sprite_fsm(
  input  logic clk, rst_L,
  input  logic [8:0] row, 
  input  logic [9:0] col,
  input  logic doneTable, validVPOS, sprPat_done,
  output logic posReg_en, posReg_incr, 
  output logic VPOSorHPOS, // VPOS = 0, HPOS = 1 
  output logic VPOSlatch_set, HPOSlatch_set,
  output logic VRAM_go, sprLatch_en, sprCnt_en, sprCnt_clr
);

  enum logic [3:0] {WaitInit, SetVPOS, WaitVPOS, LoadVPOS, 
                    SetHPOS, WaitHPOS, LoadHPOS, WaitForPattern,
                    WaitDone} 
                    cs, ns;

  // Next State logic
  always_comb begin
    ns = WaitInit;
    case(cs)
      WaitInit: ns = ((row >= 9'd48 && row < 9'd432) && col < 64) ? SetVPOS : WaitInit;
      SetVPOS:  ns = WaitVPOS;
      WaitVPOS: ns = LoadVPOS;
      LoadVPOS: begin
        ns = (doneTable) ?
        WaitDone :  
        ((validVPOS) ? SetHPOS : SetVPOS);
      end
      SetHPOS:  ns = WaitHPOS;
      WaitHPOS: ns = LoadHPOS;
      LoadHPOS: ns = (row < 9'd432) ? WaitForPattern : WaitDone;
      WaitForPattern: ns = (sprPat_done) ? SetVPOS : WaitForPattern;
      WaitDone: ns = (col < 10'd576) ? WaitDone : WaitInit;
      default:  ns = WaitInit;
    endcase
  end

  // Output logic
  always_comb begin
    posReg_en = 0;
    posReg_incr = 0;
    VPOSorHPOS = 0;
    VPOSlatch_set = 0;
    HPOSlatch_set = 0;
    VRAM_go = 0;
    sprLatch_en = 0;
    sprCnt_en = 0;
    sprCnt_clr = 0;
    case(cs)
      WaitInit: begin
        posReg_en = 1;
        sprCnt_clr = 1;
        sprCnt_en = 1;
      end
      SetVPOS: begin
        VRAM_go = 1;
      end
      WaitVPOS: begin
        // No outputs
      end
      LoadVPOS: begin
        VPOSlatch_set = validVPOS && ~doneTable;
        VPOSorHPOS = validVPOS && ~doneTable;
        posReg_en = ~validVPOS && ~doneTable;
        posReg_incr = ~validVPOS && ~doneTable;
      end
      SetHPOS: begin
        VRAM_go = 1;
        VPOSorHPOS = 1;
      end
      WaitHPOS: begin
        VPOSorHPOS = 1;
      end
      LoadHPOS: begin
        VPOSorHPOS = 1;
        posReg_en = 1;
        posReg_incr = (row < 9'd432);
        HPOSlatch_set = 1;
        sprLatch_en = 1;
      end
      WaitForPattern: begin
        sprCnt_en = (sprPat_done);
      end
      WaitDone: begin
        // No outputs
      end
      default: begin
        posReg_en = 0;
        posReg_incr = 0;
        VPOSorHPOS = 0;
        VPOSlatch_set = 0;
        HPOSlatch_set = 0;
        VRAM_go = 0;
        sprLatch_en = 0;
        sprCnt_en = 0;
        sprCnt_clr = 0;
      end
    endcase
  end

  always_ff @(posedge clk, negedge rst_L)
    cs <= (~rst_L) ? WaitInit : ns;

endmodule

// When the sprite pattern address gets latched, 
// read out the 8 different rows of the corresponding pattern.
module vdp_sprite_pattern_row_control(
  input  logic clk, rst_L,
  input  logic sprLatch_en,
  output logic sprPatRow_en,
  output logic VRAM_go, sprPat_done
);

  enum logic [4:0] {Wait, 
                    Row0, Row0_wait, 
                    Row1, Row1_wait, 
                    Row2, Row2_wait,      
                    Row3, Row3_wait, 
                    Row4, Row4_wait, 
                    Row5, Row5_wait, 
                    Row6, Row6_wait, 
                    Row7, Row7_wait} 
                    cs, ns;

  always_comb begin
    sprPatRow_en = 0;
    sprPat_done = 0;
    VRAM_go = 0;
    
    // NS logic
    case(cs)
      Wait: begin
        ns = (sprLatch_en) ? Row0 : Wait;
        sprPatRow_en = 0;
      end
      Row0:      ns = Row0_wait;
      Row0_wait: ns = Row1;
      Row1:      ns = Row1_wait;
      Row1_wait: ns = Row2;
      Row2:      ns = Row2_wait;
      Row2_wait: ns = Row3;
      Row3:      ns = Row3_wait;
      Row3_wait: ns = Row4;
      Row4:      ns = Row4_wait;
      Row4_wait: ns = Row5;
      Row5:      ns = Row5_wait;
      Row5_wait: ns = Row6;
      Row6:      ns = Row6_wait;
      Row6_wait: ns = Row7;
      Row7:      ns = Row7_wait;
      Row7_wait: ns = Wait;
      default: begin
        ns = Wait;
        sprPatRow_en = 1;
        VRAM_go = 0;
      end
    endcase
 
    // Output logic
    case(cs)
      Wait: begin
        sprPatRow_en = 0;
      end
      Row0: begin
        VRAM_go = 1;
      end
      Row0_wait: begin
        sprPatRow_en = 1;
      end     
      Row1: begin
        VRAM_go = 1;
      end
      Row1_wait: begin
        sprPatRow_en = 1;
      end  
      Row2: begin
        VRAM_go = 1;
      end
      Row2_wait: begin
        sprPatRow_en = 1;
      end
      Row3: begin
        VRAM_go = 1;
      end
      Row3_wait: begin
        sprPatRow_en = 1;
      end
      Row4: begin
        VRAM_go = 1;
      end
      Row4_wait: begin
        sprPatRow_en = 1;
      end
      Row5: begin
        VRAM_go = 1;
      end
      Row5_wait: begin
        sprPatRow_en = 1;
      end
      Row6: begin
        VRAM_go = 1;
      end
      Row6_wait: begin
        sprPatRow_en = 1;
      end
      Row7: begin
        VRAM_go = 1;
      end
      Row7_wait: begin
        sprPatRow_en = 1;
        sprPat_done = 1;
      end
      default: begin
        sprPatRow_en = 0;
        VRAM_go = 0;
        sprPat_done = 0;
      end
    endcase
  end

  always_ff @(posedge clk, negedge rst_L) begin
    cs <= (~rst_L) ? Wait : ns;
  end

endmodule

/****** Old stuff ********/

/* vdp_disp_interface
 * Description: Interfaces between VRAM and the VGA output on the board.
 *              Specifically controls what pixel we should process and 
 *              outputs the corresponding colors depending on what the 
 *              screen looks like.
 */
module vdp_disp_interface_old(
  input  logic             clk, rst_L, // 25 MHz clock
  input  logic [7:0][7:0]  VRAM_VGA_data_out,
  input  logic      [5:0]  CRAM_VGA_data_out,
  input  logic      [7:0]  R2, R6, // Used for offset into screen map in VRAM
  input  logic      [9:0]  col,
  input  logic      [8:0]  row,
  output logic [7:0][13:0] VRAM_VGA_addr,
  output logic      [4:0]  CRAM_VGA_addr,
  output logic      [3:0]  VGA_R, VGA_G, VGA_B,
  output logic             VRAM_go, screenBusy
);

  logic       patSelLatch_en; // Set in disp_fsm
  logic [7:0] patSelLatch1_in, patSelLatch1_out, patSelLatch2_in, patSelLatch2_out;

  // Determines where the screen should be blank, since 256x192 doesn't divide 640x480 evenly
  logic       blank;
  assign blank = ((col < 10'd64) || (col > 10'd575)) || ((row < 10'd48) || (row > 10'd431));

  // Screen Map Pattern Parsing
  logic [13:0] charPatternAddr;
  logic        paletteSel, horizFlip, vertFlip, patInBg;

  // Background Select Logic
  logic [13:0] bgSel_in, bgSel_out;
  logic        bgSel_en; // Set in disp_fsm

  // Color Latch Logic
  logic [3:0][7:0] colorLatch_out;
  logic            colorLatch_en;

  // Misc stuff
  logic [5:0] colorToDisplay;
  logic [4:0] CRAM_addr_BG, CRAM_addr_SPR;
  logic       VRAM_go_BG, VRAM_go_SPR;
  logic [7:0] sprPat;  
  logic       validSprite; // Used to let sprites hijack CRAM
  logic [2:0] sprPatRow, sprPatRow_1, sprPatRow_2;
  logic [2:0] sprCnt, sprCnt_1, sprCnt_2, sprCnt_3, sprCnt_4;  

  logic [7:0][255:0] sprPatLatch_out;
  logic [7:0]        validHPOS;
  logic [7:0][2:0]   spriteOffset;

  /******** Background Select Register ********/
 
  register #(14) bgSelReg(
    .clk, 
    .rst_L,
    .D(bgSel_in),
    .Q(bgSel_out),
    .en(bgSel_en)
  );

  logic [8:0] pixelRow;
  logic [9:0] pixelCol;

  assign pixelRow = row - 9'd48;
  assign pixelCol = col - 10'd64 + 10'd6; // Add 6 to pre-fetch pixel data for the pipeline

  // Each pixel position is 2 bytes, so -------------------|
  assign bgSel_in = {3'b111, pixelRow[8:4], pixelCol[8:4], 1'b0}; // Either blank screen or iterating

  assign VRAM_VGA_addr[0] = bgSel_out;
  assign VRAM_VGA_addr[1] = bgSel_out + 14'd1;

  assign VRAM_VGA_addr[2] = (col < 10'd57) ? {R6[2], sprPat, sprPatRow, 2'd0} : charPatternAddr;
  assign VRAM_VGA_addr[3] = VRAM_VGA_addr[2] + 2'd1;  
  assign VRAM_VGA_addr[4] = VRAM_VGA_addr[2] + 2'd2; // Pixel colors are stored across 4 bytes each.
  assign VRAM_VGA_addr[5] = VRAM_VGA_addr[2] + 2'd3;

  /******** Pattern Selection Latches ********/

  register #(8) patSelLatch1(
    .clk,
    .rst_L,
    .D(patSelLatch1_in),
    .Q(patSelLatch1_out),
    .en(patSelLatch_en)
  );

  register #(8) patSelLatch2(
    .clk,
    .rst_L,
    .D(patSelLatch2_in),
    .Q(patSelLatch2_out),
    .en(patSelLatch_en)
  );

  assign patSelLatch1_in = VRAM_VGA_data_out[1];
  assign patSelLatch2_in = VRAM_VGA_data_out[0]; // Little Endian, MSB goes in first

  /******** patSel Parsing ********/
  
  assign charPatternAddr = {patSelLatch1_out[0], patSelLatch2_out, pixelRow[3:1], 2'd0}; // 14-bit signal to differentiate 512 patterns of 32 bytes each
  assign horizFlip =       patSelLatch1_out[1];
  assign vertFlip =        patSelLatch1_out[2];
  assign paletteSel =      patSelLatch1_out[3];
  assign patInBg =         patSelLatch1_out[4];
  
  /******** Color Latches ********/

  register #(8) colorLatch [3:0] (
    .clk,
    .rst_L,
    .D(VRAM_VGA_data_out[5:2]), // Again, little endian
    .Q(colorLatch_out[3:0]),
    .en(colorLatch_en)
  );  
  
  logic [9:0] colorLatchIndex; 
  assign colorLatchIndex = col + 1;
  
  assign CRAM_addr_BG = {
    paletteSel,
    colorLatch_out[0][colorLatchIndex[3:1]], 
    colorLatch_out[1][colorLatchIndex[3:1]],
    colorLatch_out[2][colorLatchIndex[3:1]],
    colorLatch_out[3][colorLatchIndex[3:1]]
  };

  /******* RGB Generation *******/

  assign colorToDisplay = (blank) ? 6'd0 : CRAM_VGA_data_out;
  colorGen c1(colorToDisplay[1:0], VGA_R);
  colorGen c2(colorToDisplay[3:2], VGA_G); 
  colorGen c3(colorToDisplay[5:4], VGA_B);

  /******* Disp FSM *******/

  //logic [2:0] disp_state;

  disp_fsm_old DISP_FSM(
    .*,
    .row,
    .col(colorLatchIndex),
    .bgSel_en,
    .patSelLatch_en,
    .colorLatch_en,
    .screenBusy,
    .VRAM_go(VRAM_go_BG)
  );

  /******* Sprite Handling *******/

  vdp_sprite_interface SPRITE_LOGIC(
    .clk, 
    .rst_L,
    .row,
    .col,
    .screenBusy,
    .VRAM_sprite_data(VRAM_VGA_data_out[7:2]),
    .VRAM_go(VRAM_go_SPR),
    .sprPat, 
    .validSprite,
    .validHPOS,
    .VRAM_sprite_addr(VRAM_VGA_addr[7:6]),
    .sprPatRow_out(sprPatRow),
    .sprCnt,
    .spriteOffset
  );

  // Sprite Pattern Latches - *******TODO: Need to enable the right registers at the right time

  // Delay the sprite row index by 2 clock cycles to sync with the result from VRAM
  // BAD BAD BAD BAD BAD lol
  register #(3) SPR_PAT_ROW_1(.*, .D(sprPatRow),   .Q(sprPatRow_1), .en(1'b1));
  register #(3) SPR_PAT_ROW_2(.*, .D(sprPatRow_1), .Q(sprPatRow_2), .en(1'b1));

  // Delay the sprite count by 3 clock cycles to sync with the result from VRAM
  register #(3) SPR_CNT_1(.*, .D(sprCnt),   .Q(sprCnt_1), .en(1'b1));
  register #(3) SPR_CNT_2(.*, .D(sprCnt_1),   .Q(sprCnt_2), .en(1'b1));
  register #(3) SPR_CNT_3(.*, .D(sprCnt_2),   .Q(sprCnt_3), .en(1'b1));
  register #(3) SPR_CNT_4(.*, .D(sprCnt_3),   .Q(sprCnt_4), .en(1'b1)); // Might not be necessary

  // Sprite Pattern Row Buffer
  generate
    genvar i;
    genvar j;
    for(i = 0; i < 8; i++) begin      // 8 Possible Sprites
      for(j = 0; j < 8; j++) begin    // 8 sets of 4 bytes, for a total of 32 bytes per pattern
        logic [3:0][7:0] B;
        assign sprPatLatch_out[i][(j*4+1)*8-1:(j*4+0)*8] = B[0]; // Might be reversed
        assign sprPatLatch_out[i][(j*4+2)*8-1:(j*4+1)*8] = B[1];
        assign sprPatLatch_out[i][(j*4+3)*8-1:(j*4+2)*8] = B[2];
        assign sprPatLatch_out[i][(j*4+4)*8-1:(j*4+3)*8] = B[3];
        register #(8) SPR_PAT_LATCH [3:0] (
          .clk,
          .rst_L,
          .D(VRAM_VGA_data_out[5:2]),
          .Q(B),
          .en((sprPatRow == j) && (sprCnt_4 == i))
        );
      end
    end
  endgenerate
 
  logic [3:0][7:0]  currSprRow;
  
  spritePartition SPR_PARTITION(
    .sprPatLatch_out,
    .spriteOffset,
    .currSprRow,
    .validHPOS
  );  
  
  logic [3:0] sprColorIndex;

  assign CRAM_addr_SPR = {
    1'b0,
    currSprRow[0][sprColorIndex[3:1]],
    currSprRow[1][sprColorIndex[3:1]],
    currSprRow[2][sprColorIndex[3:1]],
    currSprRow[3][sprColorIndex[3:1]]
  }; 
  
  // Iterates over the bits in a 4-byte row to generate the palettes
  counter #(4) SPR_COLOR_INDEX(
    .clk,
    .rst_L,
    .en(validSprite),
    .clear(col > 10'd575),
    .count(sprColorIndex)
  );

  assign CRAM_VGA_addr = (~validSprite) ? CRAM_addr_BG : CRAM_addr_SPR;
  assign VRAM_go = VRAM_go_BG || VRAM_go_SPR;

endmodule

// FSM for vdp_disp_interface
module disp_fsm_old(
  input  logic       clk, rst_L,
  input  logic [9:0] col,
  input  logic [8:0] row,
  output logic       bgSel_en, patSelLatch_en, colorLatch_en,
  output logic       screenBusy,
  output logic       VRAM_go // Read from VRAM signal
);

  enum logic [2:0] {WaitInit, PosFetch, WaitForPos, PatFetch, WaitForPat, RowLoad, Wait} cs, ns; 

  // Next State Logic
  always_comb begin
    case(cs)
      WaitInit:   ns = ((row >= 48 && row < 432) && col < 58) ? PosFetch : WaitInit;
      PosFetch:   ns = WaitForPos;
      WaitForPos: ns = PatFetch;
      PatFetch:   ns = WaitForPat;
      WaitForPat: ns = RowLoad;
      RowLoad:    ns = Wait;
      Wait: begin
        if (col[3:0] == 10'd10) begin
          ns = (col < 570) ? PosFetch : WaitInit;
        end
        else begin
          ns = Wait;
        end
      end
      default:    ns = Wait;
    endcase
  end

  // Output Logic
  always_comb begin
    VRAM_go = 0;
    colorLatch_en = 0;
    bgSel_en = 0;
    patSelLatch_en = 0;
    screenBusy = 1;
    case(cs)
      WaitInit: begin
        screenBusy = 0;
      end  
      PosFetch: begin
        bgSel_en = 1; 
      end
      WaitForPos: begin
        VRAM_go = 1;
        // No outputs
      end
      PatFetch: begin
        patSelLatch_en = 1; 
      end
      WaitForPat: begin
        VRAM_go = 1;
        // No outputs
      end
      RowLoad: begin
        colorLatch_en = 1;
      end
      Wait: begin

      end
      default: begin
        colorLatch_en = 0;
        bgSel_en = 0;
        patSelLatch_en = 0;
        screenBusy = 1;
      end
    endcase
  end

  always_ff @(posedge clk, negedge rst_L) begin
    if (~rst_L) cs <= Wait;
    else        cs <= ns;
  end

endmodule

module spritePartition(
  input  logic [7:0]        validHPOS,
  input  logic [7:0][2:0]   spriteOffset,
  input  logic [7:0][255:0] sprPatLatch_out,
  output logic [3:0][7:0]   currSprRow
);
  
  logic [31:0][7:0] currSprPat;
  logic [2:0]       currSprIndex;

  always_comb
    if(validHPOS[0]) begin
      currSprIndex = 3'd0;
    end 
    else if(validHPOS[1]) begin
      currSprIndex = 3'd1;
    end 
    else if(validHPOS[2]) begin
      currSprIndex = 3'd2;
    end 
    else if(validHPOS[3]) begin
      currSprIndex = 3'd3;
    end 
    else if(validHPOS[4]) begin
      currSprIndex = 3'd4;
    end 
    else if(validHPOS[5]) begin
      currSprIndex = 3'd5;
    end 
    else if(validHPOS[6]) begin
      currSprIndex = 3'd6;
    end 
    else if(validHPOS[7]) begin
      currSprIndex = 3'd7;
    end 
    else begin
      currSprIndex = 3'd0;
    end

  // Sprite Row Buffer output muxing
  generate 
    genvar j;
    for (j = 0; j < 32; j++)
      assign currSprPat[j] = sprPatLatch_out[currSprIndex][(j*8)+8-1:(j*8)]; 
  endgenerate

  always_comb begin
    case(spriteOffset[currSprIndex])
      0: currSprRow = currSprPat[3:0];
      1: currSprRow = currSprPat[7:4];
      2: currSprRow = currSprPat[11:8];
      3: currSprRow = currSprPat[15:12];
      4: currSprRow = currSprPat[19:16];
      5: currSprRow = currSprPat[23:20];
      6: currSprRow = currSprPat[27:24];
      7: currSprRow = currSprPat[31:28];
      default: currSprRow = 32'd0;
    endcase
  end

endmodule
