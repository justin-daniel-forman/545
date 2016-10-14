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

  //Read out our memory contents from a textfile
  logic [7:0] memory [150:0];
  logic [50:0] j;
  initial begin
    $readmemb("traces/DUT.raw", memory);
  end

  //Put out the memory contents into our "register interpretation" of memory
  genvar i;
  generate
    for(i = 0; i < 150; i++) begin
      register_def #(8) foo (.clk, .rst_L, .D(data_bus), .Q(Qs[i]),
        .en(ens[i]),
        .def(memory[i])
      );
    end
  endgenerate

  //Write a memory controller to output the memory values on the bus
  //at the right time
  logic [7:0] out_value;
  assign data_bus = out_value;

  always @(posedge clk) begin

    if(~rst_L) begin
      out_value <= 8'bz;
    end

    //reads appear at the next clock cycle
    if(~RD_L) begin
      out_value <= Qs[addr_bus];
    end

    //writes take the present value on the data bus
    else if(~WR_L) begin
      ens[addr_bus] = 1;
    end

    else begin
      out_value <= 8'bz;
      ens = 0;
    end

  end

endmodule: memory
