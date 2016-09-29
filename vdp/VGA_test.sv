module VGA_test(
  input  logic       GCLK, // Pin Y9
  input  logic       BTNC, // Active High
  output logic [3:0] VGA_R, VGA_G, VGA_B,
  output logic       VGA_HS, VGA_VS);
 
  logic       rst_L, clk;
  logic       VSync, HSync;
  logic [8:0] row;
  logic [9:0] col;

  vga VGA (.*);
 
  logic       red_on;
  logic [1:0] green_on;
  logic [3:0] blue_on;
 
  assign red_on = (col >= 10'd320);
  assign green_on[0] = (col >= 10'd160) && (col < 10'd320);
  assign green_on[1] = (col >= 10'd480);
  assign blue_on[0] = (col >= 10'd80) && (col < 10'd160);
  assign blue_on[1] = (col >= 10'd240) && (col < 10'd320);
  assign blue_on[2] = (col >= 10'd400) && (col < 10'd480);
  assign blue_on[3] = (col >= 10'd560);

  always_comb begin
    clk = GCLK;
    VGA_HS = HSync;
    VGA_VS = VSync;
    VGA_R = red_on ? 4'hF : 4'h0;
    VGA_G = green_on ? 4'hF : 4'h0;
    VGA_B = blue_on ? 4'hF : 4'h0;
    rst_L = ~BTNC;
  end
 
endmodule

/*
module top;

  logic clk, BTNC, HSync, VSync;
  logic [3:0] RED, GREEN, BLUE;
  logic [20:0] i;

  VGA_test dut(.*);

  initial begin
    clk = 1;
    forever #1 clk = ~clk;
  end

  initial begin
    BTNC = 1;
    @(posedge clk);
    BTNC <= 0;
    for (i = 0; i < 1680000; i++) // Should be enough to do one full frame
      @(posedge clk);
    #10 $finish;
  end

endmodule
*/