module ports (
  input logic clk,
  input logic rst_L,
  input logic IORQ_L,
  input logic RD_L,
  input logic WR_L,
  input wire  [7:0]   data_out,
  output wire [7:0]   data_in,
  inout wire  [15:0]  addr_bus
);

  logic [255:0] ens;
  logic [255:0] [7:0] Qs, defs;

  //Put out the memory contents into our "register interpretation" of memory
  //Each IO port will originally contain the data that is its address
  genvar i;
  generate
    for(i = 0; i < 256; i++) begin
      register_def #(8) foo (.clk, .rst_L, .D(data_out), .Q(Qs[i]),
        .en(ens[i]),
        .def(i[7:0])
      );
    end
  endgenerate

  //Write a memory controller to output the memory values on the bus
  //at the right time
  logic [7:0] out_value;
  assign data_in = out_value;

  always @(posedge clk) begin

    if(~rst_L) begin
      out_value <= 8'bz;
    end

    //reads appear at the next clock cycle
    if(~RD_L & ~IORQ_L) begin
      out_value <= Qs[addr_bus[7:0]];
    end

    //writes take the present value on the data bus
    else if(~WR_L & ~IORQ_L) begin
      ens[addr_bus[7:0]] = 1;
    end

    else begin
      out_value <= 8'bz;
      ens = 0;
    end

  end

endmodule: ports
