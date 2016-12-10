module VGA_test(
  input  logic       GCLK, // Pin Y9
  input  logic       BTNC, BTND, // Active High
  output logic [3:0] VGA_R, VGA_G, VGA_B,
  output logic       VGA_HS, VGA_VS);

  logic        clk_4, clk_25, clk_100, rst_L;
  logic [8:0]  row;
  logic [9:0]  col;
  
  logic       clkDiv_25;
  logic [3:0] clkDiv_4;

  /*
  clk_wiz_0 CLK25(
    .clk_in1(GCLK),
    .clk_out1(clk_25),
    .reset(BTNC),
    .locked()
  );
  
  clk_wiz_0 CLK10(
    .clk_in1(GCLK),
    .clk_out1(clk_4),
    .reset(BTNC),
    .locked()
  );
  */

  logic [7:0][7:0]  VRAM_VGA_data_out;
  logic [7:0][13:0] VRAM_VGA_addr;
  logic [7:0]       CRAM_VGA_data_out;
  logic [4:0]       CRAM_VGA_addr;
    
  wire [7:0]  data_bus, addr_bus;
  logic       IORQ_L, RD_L, WR_L;
 
  assign rst_L = ~BTNC;
  assign clk_100 = GCLK;
  assign IORQ_L = 1;
  assign RD_L = 1;
  assign WR_L = 1;
 
  //vga VGA(.clk(clk_25), .rst_L, .HSync(VGA_HS), .VSync(VGA_VS), .row, .col);
  vdp_top vdp(.*);

  /* 
  initial begin
    clk_100 = 0;
    forever #1 clk_100 = ~clk_100;
  end
  
  logic [20:0] i;

  initial begin
    rst_L = 0;
    @(posedge clk_100);
    rst_L <= 1;
    for (i = 0; i < 21'h1FFFFF; i++) @(posedge clk_100);
    $finish;
  end
  */

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
  logic red_on;
  logic green_on;
  logic blue_on;
  
  assign red_on = ((col >= 10'd320 && col < 10'd576) || (col == 10'd64)) &&
                   (row >= 48 && row < 432);
  assign green_on = ((col >= 10'd192 && col < 10'd320) || 
                     (col >= 10'd448 && col < 10'd576) || (col == 10'd64)) &&
                     (row >= 48 && row < 432);
  assign blue_on = ((col >= 10'd128 && col < 10'd192) || 
                    (col >= 10'd256 && col < 10'd320) ||
                    (col >= 10'd384 && col < 10'd448) || 
                    (col >= 10'd512 && col < 10'd576) || (col == 10'd64)) &&
                    (row >= 48 && row < 432);

  always_comb begin
    VGA_R = red_on ? 4'hF : 4'h0;
    VGA_G = green_on ? 4'hF : 4'h0;
    VGA_B = blue_on ? 4'hF : 4'h0;    
  end
  */

endmodule

module sendNewPatternsFSM(
  );

  

endmodule
