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
  assign data_port_in = data_in_sel ? VRAM_io_data_out : data_in;
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
        VRAM_re = 1;
        data_in_sel = 1;
        wr_addr_en = 1; // Autoincrement address in case of sequential read
        VRAM_go = 1;
      end
      VRAM_read_data_2: begin
        data_in_sel = 1;
        VRAM_re = 1;
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
        //VRAM_we = 1;
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

