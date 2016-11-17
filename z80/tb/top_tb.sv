module tb ();

  logic clk, rst_L;

  wire [7:0]  data_in;
  wire [7:0]  data_out;
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
  logic interrupt_mask;
  logic [31:0] curr_state;

  z80 DUT(.*);
  memory m_DUT(.*);
  ports  p_DUT(.*);

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

    if($test$plusargs("DEBUG")) begin
    $monitor($stime,, "addr bus: %h, data bus: %h, state: %s, A: %h, F: %h, DE: %h, HL: %h, BC: %h, IX: %h, IY: %h, SP: %h, m_data:%h, z80_data: %h, MEM_VAL: %h, foo: %h",
      addr_bus,
      data_out,
      DUT.CTRL.DECODE.state.name,
      DUT.DP.A_out,
      DUT.DP.F_out,
      {DUT.DP.RFILE.D_out, DUT.DP.RFILE.E_out},
      {DUT.DP.RFILE.H_out, DUT.DP.RFILE.L_out},
      {DUT.DP.RFILE.B_out, DUT.DP.RFILE.C_out},
      {DUT.DP.RFILE.IXH_out, DUT.DP.RFILE.IXL_out},
      {DUT.DP.RFILE.IYH_out, DUT.DP.RFILE.IYL_out},
      {DUT.DP.RFILE.SPH_out, DUT.DP.RFILE.SPL_out},
      m_DUT.out_value,
      DUT.DP.data_out,
      m_DUT.Qs[97],
      DUT.CTRL.IN_start
    );
    end

    rst_L = 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    rst_L <= 1;

    //START OF T1
    @(posedge clk);

    //currently our range for assembly programs is $51
    while( {DUT.DP.RFILE.PCH_out, DUT.DP.RFILE.PCL_out} <= 16'h0050 ) begin
      @(posedge clk);
    end

    $display("\n\n\n");
    $display("A: %h\nF: %h\nBC: %h\nDE: %h\nHL: %h\nIX: %h\nIY: %h\nSP: %h\nPC: %h",
      DUT.DP.A_out,
      DUT.DP.F_out,
      {DUT.DP.RFILE.B_out, DUT.DP.RFILE.C_out},
      {DUT.DP.RFILE.D_out, DUT.DP.RFILE.E_out},
      {DUT.DP.RFILE.H_out, DUT.DP.RFILE.L_out},
      {DUT.DP.RFILE.IXH_out, DUT.DP.RFILE.IXL_out},
      {DUT.DP.RFILE.IYH_out, DUT.DP.RFILE.IYL_out},
      {DUT.DP.RFILE.SPH_out, DUT.DP.RFILE.SPL_out},
      {DUT.DP.RFILE.PCH_out, DUT.DP.RFILE.PCL_out}
    );

    $finish;
  end

endmodule: tb
