module register #(parameter w = 8) (
  input logic      clk,
  input logic      rst_L,
  input logic [w]  D,
  input logic      en,
  output logic [w] Q);

  logic [w] value;

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

module register_def #(parameter w = 8) (
  input   logic     clk,
  input   logic     rst_L,
  input   logic [w] D,
  input   logic     en,
  input   logic [w] def,
  output  logic [w] Q
);

  logic [w] value;

  assign Q = value;

  always @(posedge clk) begin
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
module mem #(parameter DATA = 8, ADDR = 16, NUMREAD = 8)(
  input  logic 	                       a_clk, b_clk, rst_L,
  input  logic [DATA-1:0]              data_in,
  input  logic [ADDR-1:0]              a_addr,
  input  logic [NUMREAD-1:0][ADDR-1:0] b_addr,
  input  logic                         a_we, a_re,
  input  logic [NUMREAD-1:0]           b_re,       // NUMREAD read ports
  output logic [DATA-1:0]              a_data_out,
  output logic [NUMREAD-1:0][DATA-1:0] b_data_out);

  logic [2**ADDR-1:0][DATA-1:0] memory;

  // A-port
  always_ff @(posedge a_clk, negedge rst_L) begin
    if (a_we) memory[a_addr] <= data_in;
    if (a_re) a_data_out <= memory[a_addr];
    else      a_data_out <= 'bz;
  end

  // B-port
  generate
    genvar i;
    for (i = 0; i < NUMREAD; i++) begin
      always_ff @(posedge b_clk, negedge rst_L) begin
        if (b_re[i]) b_data_out[i] <= memory[b_addr[i]];
        else         b_data_out[i] <= 'bz;
      end
    end
  endgenerate
>>>>>>> 7f814a21581c6e36a83a6a99488dbc7d71f30849

endmodule
