module VGA_test(
  input  logic  GCLK, // Pin Y9
  input  logic  BTNC, // Active High
  output logic [3:0] VGA_R, VGA_G, VGA_B,
  output logic  VGA_HS, VGA_VS);

  logic  rst_L, clk;
  logic [8:0] row;
  logic [9:0] col;
  logic  HSync, VSync;
  logic [3:0] VGA_R, VGA_G, VGA_B;
  logic [20:0] i;

  logic [7:0][7:0]  VRAM_VGA_data_out;
  logic [7:0][13:0] VRAM_VGA_addr;
  logic [7:0]  CRAM_VGA_data_out;
  logic [4:0]  CRAM_VGA_addr;

  always_comb begin
    clk = GCLK;
    rst_L = ~BTNC;
    VGA_HS = HSync;
    VGA_VS = VSync;
  end

  vga VGA(.*); 
  vdp_disp_interface INTERFACE(
    .*,
    .VRAM_VGA_data_out,
    .CRAM_VGA_data_out(CRAM_VGA_data_out[5:0]),
    .R2(),
    .col,
    .row,
    .VRAM_VGA_addr,
    .CRAM_VGA_addr,
    .VGA_R, 
    .VGA_G, 
    .VGA_B 
  );
  mem #(8, 14, 8) VRAM(
    .b_clk(clk),
    .rst_L,
    .b_addr(VRAM_VGA_addr),
    .b_re(8'hFF),
    .b_data_out(VRAM_VGA_data_out)
  );
  mem #(8, 5, 1) CRAM(
    .b_clk(clk),
    .rst_L,
    .b_addr(CRAM_VGA_addr),
    .b_re(1'b1),
    .b_data_out(CRAM_VGA_data_out)
  );

  /*
  initial begin
    clk = 1;
    forever #1 clk = ~clk;
  end
  */

  initial begin
    $readmemb("../../CRAM.bin", CRAM.memory);
    $readmemb("../../VRAM.bin", VRAM.memory);
    /*
    rst_L = 0;
    @(posedge clk);
    rst_L <= 1;
    for (i = 0; i < 1680000; i++) // Should be enough to do one full frame
      @(posedge clk);
    #10 $finish;
    */
  end

endmodule
