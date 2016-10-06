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
  memory m_DUT(.*);

  //generate clock
  initial begin
    clk = 0;
    forever begin
      #10 clk = ~clk;
    end
  end

  logic [7:0] data_val;
  //assign data_bus = data_val;

  //test bench
  logic [31:0] i;
  initial begin

    $monitor($stime,, "addr bus: %h, data bus: %h, state: %s, DE: %h, HL: %h, BC: %h, m_data:%h, z80_data: %h, RD_L: , state: %b",
      addr_bus,
      data_bus,
      DUT.CTRL.DECODE.state.name,
      {DUT.DP.RFILE.D_out, DUT.DP.RFILE.E_out},
      {DUT.DP.RFILE.H_out, DUT.DP.RFILE.L_out},
      {DUT.DP.RFILE.B_out, DUT.DP.RFILE.C_out},
      m_DUT.out_value,
      DUT.DP.data_out,

      DUT.CTRL.memory_read.MRD_RD_L

    );


    rst_L = 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    rst_L <= 1;

    //START OF T1
    data_val = 8'bz;
    @(posedge clk);

    //T2
    #5 data_val = `EXT_INST;
    @(posedge clk);

    //T3
    #5 data_val = 8'bz;
    @(posedge clk);

    //T4
    @(posedge clk);

    //T5
    @(posedge clk);

    //T6
    #5 data_val = `LDI;
    @(posedge clk);

    //T7
    #5 data_val = 8'bz;
    @(posedge clk);

    //T8
    @(posedge clk);

    //T1

    //T2
    #5 data_val = 8'hff;
    @(posedge clk);

    //T3
    #5 data_val = 8'bz;
    @(posedge clk);

    //T4
    @(posedge clk);


    for(i = 0; i < 100; i++) begin
      @(posedge clk);
    end

    $finish;
  end

endmodule: tb
