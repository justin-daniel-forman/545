module Sprite_test; /*(
  input  logic  GCLK, // Pin Y9
  input  logic  BTNC, // Active High
  input  logic [7:0] SW,
  output logic [3:0] VGA_R, VGA_G, VGA_B,
  output logic  VGA_HS, VGA_VS);
  */

  logic        clk_4, clk_25, clk_100, rst_L;
  logic [8:0]  row;
  logic [9:0]  col;
  
  logic       clkDiv_25;
  logic [3:0] clkDiv_4; 

  logic [7:0][7:0]  VRAM_VGA_data_out;
  logic [7:0][13:0] VRAM_VGA_addr, dummy_addr;
  logic [7:0]       CRAM_VGA_data_out;
  logic [4:0]       CRAM_VGA_addr;

  logic             VRAM_go;
  logic             spr_inRange; // Controls mux'd input to CRAM
  logic [8:0]       sprPat; // Sprite pattern address

  //wire [7:0]  data_bus, addr_bus;
  //logic       IORQ_L, RD_L, WR_L;
 
  //assign rst_L = ~BTNC;
  //assign clk_100 = GCLK;
  //assign IORQ_L = 1;
  //assign RD_L = 1;
  //assign WR_L = 1;

  assign CRAM_VGA_addr = 5'd0;
  assign VRAM_VGA_addr[5:2] = 56'd0;

  vga VGA(.clk(clk_25), .rst_L, .HSync(VGA_HS), .VSync(VGA_VS), .row, .col);
  vdp_sprite_interface SPRITE_LOGIC(
    .clk(clk_25),
    .rst_L,
    .row,
    .col,
    .R5(8'bz),
    .VRAM_sprite_data(VRAM_VGA_data_out[7:2]),
    .CRAM_sprite_addr(),
    .spr_inRange,
    .VRAM_go,
    .sprPat,
    .VRAM_sprite_addr({VRAM_VGA_addr[7:6], dummy_addr[5:2]})
  );  
  vram VRAM(
    .clk_100,
    .rst_L,
    .data_in(8'bz),
    .io_addr(14'bz),
    .vga_addr(VRAM_VGA_addr),
    .io_we(1'b0),
    .io_re(1'b0),
    .vga_re(8'hFF),
    .VRAM_go,
    .io_data_out(), // Disconnected
    .vga_data_out(VRAM_VGA_data_out)
  );

  //vdp_top vdp(.*);

  initial begin
    clk_100 = 0;
    forever #1 clk_100 = ~clk_100;
  end
  
  logic [20:0] i;

  initial begin
    $readmemb("../../VRAM.bin", VRAM.cp.memory);
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

endmodule
