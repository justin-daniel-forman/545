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
  input logic         WR_L,

  //---------------------------------------------------------------------------
  //Interrupt output interface
  //
  //TODO: Define the necessary outputs for VDP generated interrupts
  //---------------------------------------------------------------------------

  //---------------------------------------------------------------------------
  //Board output interface
  //---------------------------------------------------------------------------
  output logic VGA_HS, VGA_VS,
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
  logic [5:0]       CRAM_VGA_data_out;
  logic [5:0]       CRAM_io_data_in, 
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
  logic       HSync, VSync;

  /******* Decoder *******/

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

  /******* z80 I/O Logic *******/
  
  vdp_io IO_LOGIC(
    .clk(clk_4),
    .reset_L(reset_L),
    .MODE(MODE),
    .CSR_L(CSR_L),
    .CSW_L(CSW_L),
    .vdp_go(vdp_go),
    .data_in(data_bus),
    .data_out(data_port_out),
    .stat_reg_out(stat_reg_out),
    .VRAM_io_re,
    .VRAM_io_we,
    .VRAM_io_data_in,
    .VRAM_io_data_out,
    .CRAM_io_re,
    .CRAM_io_we,
    .CRAM_io_data_in,
    .rf_data_in,
    .rf_addr,
    .rf_en,
    .VRAM_io_addr,
    .CRAM_io_addr
  );

  /******* VGA Interface *******/

  /*
  vdp_disp_interface DISP_INTERFACE(
    // Already implemented, but need to modularize a bit
  );
  */

  vga VGA(
    .clk(clk_100),
    .rst_L(reset_L),
    .HSync,
    .VSync,
    .row(pixel_row),
    .col(pixel_col)
  );

  /******* Register File *******/ 
	 
  regFile rf(
    .clk(clk_4),
    .rst_L(reset_L),
    .data_in(rf_data_in),
    .addr(rf_addr),
    .en(rf_en),
    .data_out(rf_data_out)
  );
 
  /******** VRAM & CRAM ********/  
 
  mem #(8, 14, 8) VRAM(
    .a_clk(clk_4),
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

  mem #(6, 5, 1) CRAM(
    .a_clk(clk_4),
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

  /******* Top Level I/O Interface *******/

  //assign the data bus if we are reading from it
  assign data_bus = (MODE & ~CSR_L) ? 
                    (stat_reg_out) : (
                    (~MODE & ~CSR_L) ? data_port_out : 8'bz 
                    );

endmodule: vdp_top

/* vdp_disp_interface
 * Description: Interfaces between VRAM and the VGA output on the board.
 *              Specifically controls what pixel we should process and 
 *              outputs the corresponding colors depending on what the 
 *              screen looks like.
 */
module vdp_disp_interface(
  input  logic             clk, rst_L, // 100 MHz clock
  input  logic [7:0][7:0]  VRAM_VGA_data_out,
  input  logic      [5:0]  CRAM_VGA_data_out,
  input  logic      [7:0]  R2, // Used for offset into screen map in VRAM
  input  logic      [9:0]  col,
  input  logic      [8:0]  row,
  output logic [7:0][13:0] VRAM_VGA_addr,
  output logic      [4:0]  CRAM_VGA_addr,
  output logic      [3:0]  VGA_R, VGA_G, VGA_B
);

  logic       patSelLatch1_en, patSelLatch2_en; // Set in disp_fsm
  logic [7:0] patSelLatch1_in, patSelLatch1_out, patSelLatch2_in, patSelLatch2_out;

  // Determines where the screen should be blank, since 256x192 doesn't divide 640x480 evenly
  logic       blank;
  assign blank = ((col < 64) || (col > 575)) || ((row < 48) || (row > 431));

  // Screen Map Pattern Parsing
  logic [13:0] charPatternAddr;
  logic        paletteSel, horizFlip, vertFlip, patInBg;

  // Background Select Logic
  logic [13:0] bgSelIn, bgSelOut;
  logic        bgSelEn, bgSelLoadOrInc, bgOrPat; // Set in disp_fsm

  // Color Latch Logic
  logic [3:0][7:0] colorLatchOut;
  logic            colorLatchEn;

  // Misc stuff
  logic [5:0] colorToDisplay;

  /******** Background Select Register ********/
 
  register #(14) bgSelReg(
    .clk, 
    .rst_L,
    .D(bgSelIn),
    .Q(bgSelOut),
    .en(bgSelEn)
  );

  logic [8:0] pixelRow = row - 9'd48;
  logic [9:0] pixelCol = col - 9'd64;

  assign bgSelIn = (bgSelLoadOrInc) ? (
                   (blank) ? (14'h3800 + {pixelRow[7:3], pixelCol[7:3]}) : 14'h3800 // Could be wrong? Did the math though
                   ) : bgSelOut + 1;

  assign VRAM_VGA_addr[0] = (bgOrPat) ? charPatternAddr : bgSelOut;
  assign VRAM_VGA_addr[1] = VRAM_VGA_addr[0] + 1;
  assign VRAM_VGA_addr[2] = VRAM_VGA_addr[0] + 2;  
  assign VRAM_VGA_addr[3] = VRAM_VGA_addr[0] + 3; // Pixel colors are stored across 4 bytes each.

  /******** Pattern Selection Latches ********/

  register #(8) patSelLatch1(
    .clk,
    .rst_L,
    .D(patSelLatch1_in),
    .Q(patSelLatch1_out),
    .en(patSelLatch1_en)
  );

  register #(8) patSelLatch2(
    .clk,
    .rst_L,
    .D(patSelLatch2_in),
    .Q(patSelLatch2_out),
    .en(patSelLatch2_en)
  );

  assign patSelLatch1_in = VRAM_VGA_data_out[0];
  assign patSelLatch2_in = VRAM_VGA_data_out[0]; // Same input, latches different values

  /******** patSel Parsing ********/
  
  assign charPatternAddr = {patSelLatch2_out[0], patSelLatch1_out, row[2:0], 2'd0}; // 14-bit signal to differentiate 512 patterns of 32 bytes each
  assign horizFlip =       patSelLatch2_out[1];
  assign vertFlip =        patSelLatch2_out[2];
  assign paletteSel =      patSelLatch2_out[3];
  assign patInBg =         patSelLatch2_out[4];
  
  /******** Color Latches ********/

  register #(8) colorLatch [3:0] (
    .clk,
    .rst_L,
    .D(VRAM_VGA_data_out[3:0]),
    .Q(colorLatchOut[3:0]),
    .en(colorLatchEn)
  );  
  
  assign colorLatchEn = (col[2:0] == 3'd7);
  assign CRAM_VGA_addr = {
    paletteSel,
    colorLatchOut[3][col[2:0]], 
    colorLatchOut[2][col[2:0]],
    colorLatchOut[1][col[2:0]],
    colorLatchOut[0][col[2:0]]
  };

  /******* RGB Generation *******/

  assign colorToDisplay = (blank) ? 6'd0 : CRAM_VGA_data_out;
  colorGen c1(colorToDisplay[1:0], VGA_R);
  colorGen c2(colorToDisplay[3:2], VGA_G); 
  colorGen c3(colorToDisplay[5:4], VGA_B);

  /******* Disp FSM *******/

  disp_fsm DISP_FSM(
    .*,
    .row,
    .col,
    .blank,
    .bgSelLoadOrInc,
    .bgSelEn,
    .bgOrPat, 
    .patSelLatch1_en,
    .patSelLatch2_en 
  );

endmodule

// FSM for vdp_disp_interface
module disp_fsm(
  input  logic       clk, rst_L,
  input  logic [8:0] row,
  input  logic [9:0] col,
  input  logic       blank,
  output logic       bgSelLoadOrInc, bgSelEn, bgOrPat, patSelLatch1_en, patSelLatch2_en
);

  enum logic [1:0] {PatFetch1, PatFetch2, PatDisp} cs, ns;

  // Next State Logic
  always_comb begin
    case(cs)
      PatFetch1: ns = PatFetch2;
      PatFetch2: ns = PatDisp;
      PatDisp:   ns = ((col[2:0] == 0) & (~blank)) ? PatFetch1 : PatDisp;
    endcase
  end

  // Output Logic
  always_comb begin
    bgSelLoadOrInc = 0;
    bgSelEn = 0;
    bgOrPat = 0;
    patSelLatch1_en = 0;
    patSelLatch2_en = 0;
    case(cs)
      PatFetch1: begin
        bgSelLoadOrInc = 1;
        bgSelEn = 1;
      end
      PatFetch2: begin
        bgSelEn = 1;
        patSelLatch1_en = 1;
      end
      PatDisp: begin
        bgOrPat = 1;
        patSelLatch2_en = 1;
      end
    endcase
  end

  always_ff @(posedge clk, negedge rst_L) begin
    if (~rst_L) cs <= PatDisp;
    else        cs <= ns;
  end

endmodule

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

  input   logic [7:0] data_in, VRAM_io_data_out,
  output  logic [7:0] data_out,
  output  logic [7:0] stat_reg_out,
  output  logic rf_en, VRAM_io_re, VRAM_io_we, CRAM_io_re, CRAM_io_we,
  output  logic [7:0] VRAM_io_data_in,
  output  logic [5:0] CRAM_io_data_in,
  output  logic [13:0] VRAM_io_addr,
  output  logic [4:0] CRAM_io_addr,
  output  logic [7:0] rf_data_in,
  output  logic [3:0] rf_addr
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

  // RF assignment
  assign rf_data_in = cmd_port_out_1;
  assign rf_addr = cmd_port_out_2[3:0];

  // MEM assignment 
  assign VRAM_io_data_in = data_port_out;
  assign VRAM_io_addr = write_addr_out;
  assign VRAM_VGA_addr = 0; // FIX
  assign CRAM_io_data_in = data_port_out;
  assign CRAM_io_addr = write_addr_out;
  assign CRAM_VGA_addr = 0; // FIX

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
