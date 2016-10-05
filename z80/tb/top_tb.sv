module tb ();


  logic clk, rst_L;

  wire [7:0]  data_bus;
  wire [15:0] addr_bus;

  logic M1_L;
  logic INT_L;
  logic NMI_L;
  logic WAIT_L;
  logic MREQ_L;
  logic IORQ_L;
  logic RD_L;
  logic WR_L;
  logic RFSH_L;
  logic BUSACK_L;
  logic BUSREQ_L;
  logic HALT_L;

  z80 DUT(.*);

  //generate clock
  initial begin
    clk = 0;
    forever begin
      #10 clk = ~clk;
    end
  end

  assign data_bus = 0;

  //test bench
  logic [31:0] i;
  initial begin
    rst_L = 0;
    @(posedge clk);
    rst_L <= 1;
    @(posedge clk);

    for(i = 0; i < 100; i++) begin
      @(posedge clk);
    end


    $finish;
  end

endmodule: tb
