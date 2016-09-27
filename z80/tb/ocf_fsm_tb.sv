module tb ();


  logic clk, rst_L;

  logic [15:0]  PC;
  logic         OCF_start;
  logic         OCF_done;
  logic [7:0]   OCF_opcode_out;
  logic         OCF_opcode_valid;

  logic [7:0]   OCF_data_in;
  logic         INT_L;
  logic         NMI_L;
  logic         WAIT_L;

  logic         OCF_M1_L;
  logic         OCF_MREQ_L;
  logic         OCF_RD_L;
  logic [15:0]  OCF_addr_out;
  logic         OCF_RFSH_L;

  OCF_fsm DUT(.*);

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
    PC    = 16'hbeef;
    OCF_start = 0;

    OCF_data_in = 8'bz;
    INT_L       = 1;
    NMI_L       = 1;
    WAIT_L      = 1;

    @(posedge clk);
    rst_L <= 1;
    @(posedge clk);

    OCF_start <= 1;

    for(i = 0; i < 20; i++) begin
      if(i % 3 == 0) begin OCF_data_in <= i; end
      $display("%s\n", DUT.state.name);
      @(posedge clk);
    end


    $finish;
  end

endmodule: tb
