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
  logic [31:0]  curr_state;

  z80 DUT(.*);
  memory #(65535) m_DUT(.*);
  ports          p_DUT(.*);

  //generate clock
  initial begin
    clk = 0;
    forever begin
      #10 clk = ~clk;
    end
  end

  //test bench
  logic [31:0] i, j;
  initial begin

    /*if($test$plusargs("DEBUG")) begin
    $monitor($stime,, "addr bus: %h, data bus: %h, state: %s, A: %h, F: %h, DE: %h, HL: %h, BC: %h, IX: %h, IY: %h, SP: %h, m_data:%h, z80_data: %h, MEM_VAL: %h, foo: %h",
      addr_bus,
      data_in,
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
      DUT.DP.alu_op
    );
    end*/

    rst_L = 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    rst_L <= 1;

    //START OF T1
    @(posedge clk);

    i = 0;
    j = 0;
    //currently our range for assembly programs is $51
    /*while(i < 1_000_000) begin
      @(posedge clk);
      i++;
    end*/

    //perform 100 steps after hitting an address
    while(1) begin


      //if ({DUT.DP.RFILE.PCH_out, DUT.DP.RFILE.PCL_out} != 16'h0105) begin
      if (!(~WR_L && addr_bus == 16'hCF00)) begin
        @(posedge clk);
      end else begin
        for(i = 0; i < 1000; i++) begin
          $display($stime,, "addr bus: %h, data bus: %h, state: %s, A: %h, F: %h, DE: %h, HL: %h, BC: %h, IX: %h, IY: %h, SP: %h, m_data:%h, z80_data: %h, MEM_VAL: %h, foo: %h",
            addr_bus,
            data_in,
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
            DUT.DP.alu_op
          );
          @(posedge clk);
        end
        break;
      end
    
      j++;
      if(j % 1000 == 0) begin
        $display("PC: %h", {DUT.DP.RFILE.PCH_out, DUT.DP.RFILE.PCL_out});
      end
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
