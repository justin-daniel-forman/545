module register #(parameter w = 8) (
  input logic      clk,
  input logic      rst_L,
  input logic [w]  D,
  input logic      en,
  output logic [w] Q
                                    );

  logic [w] 			 value;
   
  assign Q = value;

  always @(posedge clk) begin
    if(~rst_L) begin
      value <= 0;
    end

    else if(en) begin
      value <= D;
    end

    else begin
      value <= value;
    end

  end

endmodule

// Reads have precedence over writes
module mem #(parameter DATA = 8, ADDR = 16)(
  input  logic 	          clk,
  input  logic 	          rst_L,
  input  logic [DATA-1:0] data_in, 
  input  logic [ADDR-1:0] addr,
  input  logic            we, re,	   
  output logic [DATA-1:0] data_out);

  logic [2**ADDR-1:0][DATA-1:0] memory;

  // lol who need rst logic?
  always_ff @(posedge clk) begin
    if (re) data_out <= memory[addr]; 
    else begin
      data_out <= 8'bz; 
      if (we) memory[addr] <= data_in; 
    end
  end

endmodule
