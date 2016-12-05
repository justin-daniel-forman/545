module register #(parameter w = 8) (
  input logic          clk,
  input logic          rst_L,
  input logic [w-1:0]  D,
  input logic          en,
  output logic [w-1:0] Q);

  logic [w-1:0] value;

  assign Q = value;
  
  always @(posedge clk, negedge rst_L) begin
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

module register_clr #(parameter w = 8) (
  input logic          clk,
  input logic          rst_L,
  input logic          clr,
  input logic [w-1:0]  D,
  input logic          en,
  output logic [w-1:0] Q);

  logic [w-1:0] value;

  assign Q = value;
  
  always @(posedge clk, negedge rst_L) begin
    if(~rst_L) begin
      value <= 0;
    end
    else if(clr) begin
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

module register_def #(parameter w = 8) (
  input   logic         clk,
  input   logic         rst_L,
  input   logic [w-1:0] D,
  input   logic         en,
  input   logic [w-1:0] def,
  output  logic [w-1:0] Q
);

  logic [w-1:0] value;

  assign Q = value;

  always @(posedge clk, negedge rst_L) begin
    if(~rst_L) begin
      value <= def;
    end

    else if(en) begin
      value <= D;
    end

    else begin
      value <= value;
    end

  end

endmodule

module counter #(parameter W = 8) (
  input  logic         clk, rst_L,
  input  logic         clear, en,
  output logic [W-1:0] count);

  logic [W-1:0] countIn, countOut;

  assign countIn = (clear) ? 0 : countOut + 1;
  assign count = countOut;

  register #(W) countReg(
    .clk(clk),
    .rst_L(rst_L),
    .D(countIn),
    .en(en),
    .Q(countOut)
  );

endmodule

// A memory with 2 ports:
// 1 port clocked at 4MHz to interface with z80:
//   -- 1 Write Port
//   -- 1 Read Port
// 1 read-only port clocked at 100MHz to interface with VGA:
//   -- NUMREAD Read Ports (Combinational)
//
module mem #(parameter DATA = 8, ADDR = 16)(
  input  logic 	          clka, clkb,
  input  logic [DATA-1:0] dina,
  input  logic [DATA-1:0] dinb,
  input  logic [ADDR-1:0] addra,
  input  logic [ADDR-1:0] addrb,
  input  logic            wea, web,      
  output logic [DATA-1:0] douta,
  output logic [DATA-1:0] doutb);

  logic [DATA-1:0] memory [2**ADDR-1:0];
  
  always @(posedge clka) begin
    if (wea) begin
      memory[addra] <= dina;
      douta <= dina;
    end
    else douta <= memory[addra];
  end 

  always @(posedge clkb) begin
    doutb <= memory[addrb];
  end
    
endmodule

module comparator #(parameter w = 8) (
  input  logic [w-1:0] A, B,
  output logic         AgtB, AltB, AeqB
);

  assign AgtB = (A > B);
  assign AltB = (A < B);
  assign AeqB = (A == B);

endmodule

module inRange #(parameter w = 8) (
  input  logic [w-1:0] IN, hi, lo,
  output logic         inRange
);

  assign inRange = (IN <= hi) && (IN >= lo);

endmodule
