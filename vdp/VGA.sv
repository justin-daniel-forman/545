module vga (
  input  logic       clk, rst_L,
  output logic       HSync, VSync,
  output logic [8:0] row,  // Count to 480
  output logic [9:0] col); // Count to 640
   
  logic [11:0] HS_count; // Count to 3200 Clk's
  logic [9:0]  VS_count; // Count to 525 HSync's
    
  counter #(12) HS (.*, .clear(HS_count == 3199),  
                    .en(1'b1), .count(HS_count));
  counter #(10) VS (.*, .clear(VS_count == 524),   
                    .en(HS_count == 3199), .count(VS_count));
  counter #(9)  rCount (.*, .clear(VS_count == 524),              
                        .en(VSync && (HS_count == 3199)), .count(row));
  counter #(10) cCount (.*, .clear(HS_count == 3199),              
                        .en(HSync && (HS_count[1:0] == 2'd3)), .count(col)); 

  assign HSync = (HS_count >= 640);
  assign VSync = (VS_count >= 45);

endmodule		
