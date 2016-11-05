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
  logic [9:0][7:0] rf_data_out;
  logic [7:0]      rf_data_in;
  logic [3:0]      rf_addr;
  logic            rf_en; // Set in FSM
   
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
  
  logic VRAM_go, VRAM_go_VGA, VRAM_go_io;
  
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
  
  vdp_disp_interface DISP_INTERFACE(
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
      .regFile(rf_data_out)
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

  blk_mem_gen_1 CRAM(
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

module regFile (
  input  logic clk,
  input  logic rst_L,
  input  logic [7:0] data_in,
  input  logic [3:0] addr,
  input  logic en,
  output logic [9:0][7:0] data_out);

  logic [15:0][7:0] reg_out;
  logic [15:0]      reg_en;

  // Output mux - 10 registers, addr 11-15 has no effect
  assign data_out = reg_out[9:0]; 

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
