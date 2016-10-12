module tb ();


  logic clk, rst_L;

  logic         MRD_start;

  logic         WAIT_L;
  logic         MRD_MREQ_L;
  logic         MRD_RD_L;
  MRD_fsm DUT(.*);

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
    MRD_start = 0;
    WAIT_L      = 1;

    @(posedge clk);
    rst_L <= 1;
    @(posedge clk);

    MRD_start <= 1;

    for(i = 0; i < 20; i++) begin
      $display("%s, %b, %b\n", DUT.state.name, MRD_RD_L, MRD_MREQ_L);
      @(posedge clk);
    end


    $finish;
  end

endmodule: tb
