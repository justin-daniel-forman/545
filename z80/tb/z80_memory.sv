module memory #(parameter w = 200)(
  input logic clk,
  input logic rst_L,
  input logic MREQ_L,
  input logic RD_L,
  input logic WR_L,
  input wire  [7:0]   data_out,
  output wire [7:0]   data_in,
  inout wire  [15:0]  addr_bus
);

  logic [w-1:0] ens;
  logic [w-1:0] [7:0] Qs, defs;

  //Read out our memory contents from a textfile
  logic [7:0] memory [w-1:0];
  initial begin
    if(w > 1000) begin
      $readmemb("bios/DUT.raw", memory);
    end else begin
      $readmemb("traces/DUT.raw", memory);
    end
  end

  //Put out the memory contents into our "register interpretation" of memory
  genvar i;
  generate
    for(i = 0; i < w; i++) begin
      register_def #(8) foo (.clk, .rst_L, .D(data_out), .Q(Qs[i]),
        .en(ens[i]),
        .def(memory[i])
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
    if(~RD_L & ~MREQ_L) begin
      out_value <= Qs[addr_bus];
    end

    //writes take the present value on the data bus
    else if(~WR_L & ~MREQ_L) begin
      ens[addr_bus] = 1;
    end

    else begin
      out_value <= 8'bz;
      ens = 0;
    end

  end

endmodule: memory
