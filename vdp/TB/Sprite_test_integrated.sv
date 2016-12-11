module Sprite_test; /*(
  input  logic  GCLK, // Pin Y9
  input  logic  BTNC, // Active High
  input  logic [7:0] SW,
  output logic [3:0] VGA_R, VGA_G, VGA_B,
  output logic  VGA_HS, VGA_VS);
  */

  logic        clk_4, clk_25, clk_100, rst_L;
  //logic [8:0]  row;
  //logic [9:0]  col;
  
  logic       clkDiv_25;
  logic [3:0] clkDiv_4; 
  
  /*
  logic [7:0][7:0]  VRAM_VGA_data_out;
  logic [7:0][13:0] VRAM_VGA_addr, dummy_addr;
  logic [7:0]       CRAM_VGA_data_out;
  logic [4:0]       CRAM_VGA_addr;
  */
  
  //logic             VRAM_go;
  //logic             spr_inRange; // Controls mux'd input to CRAM
  //logic [8:0]       sprPat; // Sprite pattern address

  wire [7:0]  data_bus_in, data_bus_out, addr_bus_in;
  logic       IORQ_L, RD_L, WR_L, BUSY, M1_L, INT_L;
 
  logic [3:0] VGA_R, VGA_G, VGA_B;
  logic       VGA_HS, VGA_VS;

  logic [7:0] SW;

  assign SW = 8'd0;

  //assign rst_L = ~BTNC;
  //assign clk_100 = GCLK;
  assign IORQ_L = 1;
  assign RD_L = 1;
  assign WR_L = 1; 

  vdp_top vdp(.*);

  initial begin
    clk_100 = 0;
    forever #1 clk_100 = ~clk_100;
  end
  
  logic [20:0] i;

  initial begin
    $readmemb("../../VRAM.bin", vdp.VRAM.videoRam.memory);
    $readmemb("../../CRAM.bin", vdp.colorRam.memory);
    rst_L = 0;
    @(posedge clk_100);
    rst_L <= 1;
    for (i = 0; i < 21'h1FFFFF; i++) @(posedge clk_100);
    $finish;
  end

  // Divide the 100 MHz clk to get 25 MHz clk and 4 MHz clk
  always_ff @(posedge clk_100, negedge rst_L) begin
    if (~rst_L) begin 
      clkDiv_4 <= 0;
      clkDiv_25 <= 0;
      clk_4 <= 0;
      clk_25 <= 0;
    end
    else begin
      clkDiv_4 <= (clkDiv_4 == 4'd9) ? 4'd0 : clkDiv_4 + 4'd1;
      clkDiv_25 <= clkDiv_25 + 2'd1;
      clk_4 <= (clkDiv_4 == 4'd9) ? ~clk_4 : clk_4;
      clk_25 <= (clkDiv_25 == 1'd1) ? ~clk_25 : clk_25;
    end
  end   

  /*
  logic [3:0] intCount;
  logic       intClear, intEn;

  counter #(4) INT_ACK(
    .clk(clk_4), .rst_L,
    .clear(intClear),
    .en(intEn),
    .count(intCount)
  );

  assign intEn = ~INT_L;
  assign intClear = INT_L;
  assign M1_L = (intCount == 0);
  assign IORQ_L = (intCount == 0);
  */

endmodule
