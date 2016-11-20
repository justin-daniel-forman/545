module vga (
  input  logic       clk, rst_L,
  output logic       HSync, VSync,
  output logic [8:0] row,  // Count to 480
  output logic [9:0] col, // Count to 640
  output logic       scanline_en
);

  logic [9:0] HS_count; // Count to 800 Clk's
  logic [9:0] VS_count; // Count to 525 HSync's
    
  counter #(10) HS (.clk, .rst_L, .clear(HS_count == 799),  
                    .en(1'b1), .count(HS_count));
  counter #(10) VS (.clk, .rst_L, .clear(VS_count == 524),   
                    .en(HS_count == 799), .count(VS_count));
  counter #(9)  rCount (.clk, .rst_L, .clear(VS_count == 524),  
                        .en(VSync && (HS_count == 799)), .count(row));
  counter #(10) cCount (.clk, .rst_L, .clear(HS_count == 799),   
                        .en(HSync), .count(col)); 

  assign HSync = (HS_count >= 160);
  assign VSync = (VS_count >= 45);
  assign scanline_en = (HS_count == 799 && VS_count[0]); // every other line is an SMS scanline

endmodule		
