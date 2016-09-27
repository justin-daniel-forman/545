module tb ();

  logic clk;
  logic rst_L;
  logic [7:0]   data_in;
  logic [15:0]  addr_out;
  logic         M1_L;
  logic         INT_L;
  logic         NMI_L;
  logic         WAIT_L;
  logic         MREQ_L;
  logic         IORQ_L;
  logic         RD_L;
  logic         WR_L;
  logic         RFSH_L;
  logic         BUSACK_L;
  logic         BUSREQ_L;
  logic         HALT_L;

  control_logic DUT(.*);

  //generate clock
  initial begin
    clk = 0;
    forever begin
      #10 clk = ~clk;
    end
  end

  //test bench
  logic [31:0] i;
  initial begin
    rst_L = 0;
    INT_L = 1;
    NMI_L = 1;
    WAIT_L = 1;
    BUSREQ_L = 1;

    @(posedge clk);
    rst_L <= 1;
    @(posedge clk);

    for(i = 0; i < 100; i++) begin
      data_in <= i;
      @(posedge clk);
    end


    $finish;
  end

endmodule: tb
