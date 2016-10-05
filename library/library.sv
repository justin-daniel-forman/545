module register #(parameter w = 8) (
  input   logic     clk,
  input   logic     rst_L,
  input   logic [w] D,
  input   logic     en,
  output  logic [w] Q
);

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

endmodule
