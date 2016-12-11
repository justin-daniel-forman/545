module tb ();


  logic clk, rst_L;
  logic WAIT_L;
  logic prev_done;
  logic [7:0] opcode;
  logic OCF_start;
  logic OCF_done;
  logic OCF_bus;
  logic inc_PC;

  decoder DUT(.*);

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
    prev_done = 0;
    opcode    = 0;
    WAIT_L    = 1;

    @(posedge clk);
    rst_L <= 1;
    @(posedge clk);

    for(i = 0; i < 100; i++) begin
      @(posedge clk);
    end


    $finish;
  end

endmodule: tb
