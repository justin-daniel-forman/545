module vdp_top (

  input logic       clk_4, clk_25, clk_100, // Need both clocks
  input logic       rst_L,

  //---------------------------------------------------------------------------
  //Bus Interface
  //  - data_bus:
  //  - addr_bus:
  //  - IORQ_L:   The data on the bus is part of an I/O request
  //  - MREQ_L:   Used to detect interrupt acknowledgement
  //  - RD_L:     Main CPU is ready for memory data to be placed onto data bus
  //  - WR_L:     Main CPU is placing valid data onto bus for write
  //---------------------------------------------------------------------------
  input  wire [7:0] data_bus_in,
  input  wire [7:0] addr_bus_in,
  output wire [7:0] data_bus_out,
  input  logic      IORQ_L,
  input  logic      M1_L,
  input  logic      RD_L,
  input  logic      WR_L,

  //---------------------------------------------------------------------------
  //Interrupt output interface
  //  - BUSY: Asserted when the screen is being updated.
  // 
  //TODO: Define the necessary outputs for VDP generated interrupts
  //---------------------------------------------------------------------------

  output logic      BUSY, 
  output logic      INT_L,

  //---------------------------------------------------------------------------
  //Board output interface
  //---------------------------------------------------------------------------
  output logic       VGA_HS, VGA_VS,
  output logic [3:0] VGA_R, VGA_B, VGA_G,
  
  // Debugging Tools
  input logic [7:0] SW
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
  logic [10:0][7:0] rf_data_out;
  logic [7:0]      rf_data_in;
  logic [3:0]      rf_addr;
  logic            rf_en; // Set in FSM
   
  // VGA logic
  logic [9:0] pixel_col, pixelCol, V_counter;
  logic [8:0] pixel_row, pixelRow;
  logic       scanline_en;

  // Stuff
  logic screenBusy;
  logic [2:0] bgDispState;

  assign BUSY = screenBusy && (pixel_row > 48 && pixel_row <= 575);

  /******* Decoder *******/

  vdp_port_decoder DECODER(
    .clk(clk_4),
    .reset_L(rst_L),
    .addr_in(addr_bus_in),
    .data_in(data_bus_in),
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
    .data_in(data_bus_in),
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
      //.pixelRow,
      //.pixelCol,
      //.SW,
      //.bgDispState
    );
  
  vga VGA(
    .clk(clk_25),
    .rst_L,
    .HSync(VGA_HS),
    .VSync(VGA_VS),
    .row(pixel_row),
    .col(pixel_col),
    .scanline_en
  );

  /******* Register File *******/ 
	 
  regFile RF(
    .clk(clk_4),
    .rst_L,
    .data_in(rf_data_in),
    .addr(rf_addr),
    .en(rf_en),
    .data_out()
  );
  
  /*
  // Begin Debugging Code
  
  logic [7:0] h_scroll_count, v_scroll_count;
  
  always_comb begin
    rf_data_out = 0;
    rf_data_out[0] = {SW[7:6], 6'h16};
    rf_data_out[1] = 8'h62;
    rf_data_out[2] = 8'hFF;
    rf_data_out[3] = 8'hFF;
    rf_data_out[4] = 8'hFF;
    rf_data_out[5] = 8'hFF;
    rf_data_out[6] = 8'hFB; // FB = sprite patterns start at 0x0, FF = sprite patterns start at 0x2000
    rf_data_out[7] = 8'h07; // Overscan color - Relevant?
    rf_data_out[8] = h_scroll_count; // 0x60 is 6 * 16 pixels = 96 pixels = 192/2
    rf_data_out[9] = v_scroll_count;
    rf_data_out[10] = 8'hFF;
  end
 
  logic h_scroll_count_en, v_scroll_count_en;
  counter #(8) H_SCROLL_COUNTER(
    .clk(clk_100), .rst_L,
    .clear(1'b0),
    .en(h_scroll_count_en),
    .count(h_scroll_count)
  );
  counter #(8) V_SCROLL_COUNTER(
      .clk(clk_100), .rst_L,
      .clear(v_scroll_count == 191 && v_scroll_count_en),
      .en(v_scroll_count_en),
      .count(v_scroll_count)
    );
  
  logic [16:0] h_scroll_count_en_tick, v_scroll_count_en_tick;
  assign h_scroll_count_en = (h_scroll_count_en_tick == 17'd100000);
  assign v_scroll_count_en = (v_scroll_count_en_tick == 17'd100000);
  
  counter #(17) H_SCROLL_COUNT_EN(
    .clk(clk_100), .rst_L,
    .clear(h_scroll_count_en),
    .en(SW[1]),
    .count(h_scroll_count_en_tick)
  );
  
  counter #(17) V_SCROLL_COUNT_EN(
    .clk(clk_100), .rst_L,
    .clear(v_scroll_count_en),
    .en(SW[0]),
    .count(v_scroll_count_en_tick)
  );
  
  // End Debugging Code
  */
 
  /******** VRAM & CRAM ********/  

  assign VRAM_go = (VRAM_go_VGA || (VRAM_go_io && ~BUSY));

  CRAM colorRam(
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
  
  //assign the data bus if we are writing to it
  logic [7:0] data_bus_out_temp;

  always_comb begin
    case(addr_bus_in) 
      8'hBF: data_bus_out_temp = stat_reg_out;
      8'hBE: data_bus_out_temp = data_port_out;
      8'h7E: data_bus_out_temp = V_counter[8:0];
    endcase
  end

  assign data_bus_out = data_bus_out_temp;

  //assign data_bus_out = (MODE) ? stat_reg_out : data_port_out;
  
  /******* Status Register *******/

  logic frame_int_in, frame_int_out, frame_int_en;
  logic spr_ovfw_in, spr_ovfw_out, spr_ovfw_en;
  logic spr_coll_in, spr_coll_out, spr_coll_en;

  register_clr #(1) FRAME_INT_REG(
    .clk(clk_25), .rst_L,
    .D(frame_int_in),
    .Q(frame_int_out),
    .en(frame_int_en),
    .clr(int_ack)
  );
  
  register_clr #(1) SPR_OVFW_REG(
    .clk(clk_25), .rst_L,
    .D(spr_ovfw_in),
    .Q(spr_ovfw_out),
    .en(spr_ovfw_en),
    .clr(int_ack)
  );
  
  register_clr #(1) SPR_COLL_REG(
    .clk(clk_25), .rst_L,
    .D(spr_coll_in),
    .Q(spr_coll_out),
    .en(spr_coll_en),
    .clr(int_ack)
  );

  frameInt FRAME_INTERRUPT_LOGIC(
    .clk(clk_25), .rst_L,
    .frame_int(frame_int_in), 
    .row(pixel_row),
    .col(pixel_col),
    .regFile(rf_data_out),
    .frame_int_en
  );

  assign spr_ovfw_in = 0;
  assign spr_coll_in = 0;
  assign spr_ovfw_en = 0;
  assign spr_coll_en = 0;

  assign stat_reg_out = {frame_int_out, spr_ovfw_out, spr_coll_out, 5'd0};
  assign INT_L = ~frame_int_out & ~spr_ovfw_out & ~spr_coll_out;

  /******* V Counter *******/

  logic [8:0] scanline_count;

  counter #(9) SCANLINE_REG(
    .clk(clk_25), .rst_L,
    .clear(scanline_count == 9'h104),
    .en(scanline_en),
    .count(scanline_count)
  );

  // Whoever thought this shit was funny...
  assign V_counter = (scanline_count >= 8'hDA) ? scanline_count - 9'd5 : scanline_count;

  ila_0 LOGIC_ANALYZER(
    .clk(clk_100),
    .probe0(VRAM_VGA_addr[0]), // 14 bits
    .probe1(VRAM_VGA_addr[1]), // 14 bits
    .probe2(VRAM_VGA_addr[2]), // 14 bits
    .probe3(VRAM_VGA_addr[3]), // 14 bits
    .probe4(VRAM_VGA_addr[4]), // 14 bits
    .probe5(VRAM_VGA_addr[5]), // 14 bits
    .probe6(VRAM_VGA_addr[6]),
    .probe7(VRAM_VGA_addr[7]),
    .probe8(pixel_col), 
    .probe9(pixel_row), 
    .probe10(VRAM_VGA_data_out[0]), 
    .probe11(VRAM_VGA_data_out[1]), 
    .probe12(VRAM_VGA_data_out[2]),  
    .probe13(VRAM_VGA_data_out[3]), 
    .probe14(VRAM_VGA_data_out[4]), 
    .probe15(VRAM_VGA_data_out[5]),
    .probe16(VRAM_VGA_data_out[6]),
    .probe17(VRAM_VGA_data_out[7]),
    .probe18(10'd0),
    .probe19(9'd0)
    //.probe18(pixelCol),
    //.probe19({6'd0, bgDispState})
  );

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
  output  logic vdp_go,
  output  logic int_ack
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
    int_ack = 0;
     
    // next state logic
    case (state)
      WAIT: begin
        if(addr_in == 8'hBE || addr_in == 8'hBF) begin
          if(~IORQ_L & ~WR_L) begin
            next_state = WR0;
          end
          else if (~IORQ_L & ~RD_L) begin
            next_state = RD0;
          end 
          else begin
            next_state = WAIT;
          end
        end 
        else 
          next_state = WAIT;
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
        int_ack = (addr_in == 8'hBF);
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
  output logic [10:0][7:0] data_out);

  logic [15:0][7:0] reg_out;
  logic [15:0]      reg_en;

  // Output mux - 10 registers, addr 11-15 has no effect
  assign data_out = reg_out[10:0]; 

  genvar i; 
  generate 
    for (i = 0; i < 11; i++) begin 
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

module frameInt(
  input  logic clk, rst_L,
  input  logic [8:0] row, 
  input  logic [9:0] col,
  input  logic [10:0][7:0] regFile,
  output logic frame_int,
  output logic frame_int_en
);
  
  enum logic {
    START,
    SET_INT
  } cs, ns;
  
  logic [8:0] pixelRow;
  assign pixelRow = row - 9'd48;
    
  // next state logic
  always_comb begin
    case(cs) 
      START: begin
        if(regFile[0][4])      ns = ((pixelRow[8:1] == regFile[10]) && (col == 10'd576)) ? SET_INT : START;
        else if(regFile[1][5]) ns = ((row == 9'd432) && (col == 10'd576)) ? SET_INT : START; 
        else                   ns = START;
      end
      SET_INT: ns = START;
      default: ns = START;
    endcase
  end

  // output logic
  always_comb begin
    frame_int = 1; frame_int_en = 1;
    case(cs)
      START: begin   
        frame_int = 1; frame_int_en = 1;
      end
      SET_INT: begin
        frame_int = 0; frame_int_en = 0;
      end
      default: begin
        frame_int = 1; frame_int_en = 1;
      end
    endcase
  end

  always_ff @(posedge clk, negedge rst_L) begin
    if(~rst_L) cs <= START;
    else       cs <= ns;
  end

endmodule: frameInt
