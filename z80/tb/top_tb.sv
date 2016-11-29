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
  logic [31:0]  curr_state;
  logic interrupt_mask;

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
    $monitor($stime,, "addr bus: %h, data bus: %h, state: %s, A: %h, F: %h, DE: %h, HL: %h, BC: %h, IX: %h, IY: %h, SP: %h, PC: %h, m_data:%h, z80_data: %h, state: %h, IFF1_out",
      addr_bus,
      m_DUT.out_value,
      DUT.CTRL.DECODE.state.name,
      DUT.DP.A_out,
      DUT.DP.F_out,
      {DUT.DP.RFILE.D_out, DUT.DP.RFILE.E_out},
      {DUT.DP.RFILE.H_out, DUT.DP.RFILE.L_out},
      {DUT.DP.RFILE.B_out, DUT.DP.RFILE.C_out},
      {DUT.DP.RFILE.IXH_out, DUT.DP.RFILE.IXL_out},
      {DUT.DP.RFILE.IYH_out, DUT.DP.RFILE.IYL_out},
      {DUT.DP.RFILE.SPH_out, DUT.DP.RFILE.SPL_out},
      {DUT.DP.RFILE.PCH_out, DUT.DP.RFILE.PCL_out},
      m_DUT.out_value,
      DUT.DP.data_out,
      INT_L,
      interrupt_mask 
    );
    end

    rst_L = 0;
    INT_L = 1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    rst_L <= 1;

    //START OF T1
    @(posedge clk);

    //currently our range for assembly programs is $51
    i = 0;
    while( {DUT.DP.RFILE.PCH_out, DUT.DP.RFILE.PCL_out} <= 16'h0050 ) begin
      @(posedge clk);

      /*if(i % 100 == 0) begin
        INT_L <= 0;
      end

      else if((INT_L == 0) && (i % 10 == 0)) begin
        INT_L <= 1;
      end

      if(i == 32'd100000) begin
        $finish;
      end*/

      i++;
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
