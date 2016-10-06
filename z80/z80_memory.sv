module memory (
  input logic clk,
  input logic rst_L,
  input logic MREQ_L,
  input logic RD_L,
  input logic WR_L,
  inout wire  [7:0]   data_bus,
  inout wire  [15:0]  addr_bus
);

  logic [1000:0] ens;
  logic [1000:0] [7:0] Qs, defs;

  genvar i;
  generate

    for(i = 0; i < 1000; i++) begin
      register_def #(8) foo (.clk, .rst_L, .D(data_bus), .Q(Qs[i]),
        .en(ens[i]),
        .def(defs[i])
      );
    end

  endgenerate

  logic [7:0] out_value;
  assign data_bus = out_value;

  always_comb begin
    defs = 0;
    defs[0]  = 8'h2A;
    defs[1]  = 8'hBB;
    defs[2]  = 8'h00;

    defs[188] = 8'hbe;
    defs[187] = 8'hef;

    defs[10] = 8'hED;
    defs[11] = 8'hA0;
  end

  always @(posedge clk) begin

    if(~rst_L) begin
      out_value <= 8'bz;
    end

    if(~RD_L) begin
      out_value <= Qs[addr_bus];
    end

    else if(~WR_L) begin
      ens[addr_bus] <= 1;
    end

    else begin
      out_value <= 8'bz;
      ens <= 0;
    end

  end

endmodule: memory
