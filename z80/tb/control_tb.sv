module tb ();

  logic       clk;
  logic       rst_L;

  //---------------------------------------------------------------------------
  //Bus Signals
  //  - data_in: The control segment only receives data from the bus
  //---------------------------------------------------------------------------
  logic [7:0]   data_in;

  //---------------------------------------------------------------------------
  //Control Signals
  //  See subsections for details on these signals.
  //---------------------------------------------------------------------------

  //-----------------------------------
  //Regfile loads
  //  Specifying 2 of these signals at once will indicate a 16-bit load
  //  from the addr bus. Specifying only one will indicate an 8-bit load
  //  from the databus. We cannot do both simultaneously.
  //-----------------------------------
  logic         ld_B;
  logic         ld_C;
  logic         ld_D;
  logic         ld_E;
  logic         ld_H;
  logic         ld_L;
  logic         ld_IXH;
  logic         ld_IXL;
  logic         ld_IYH;
  logic         ld_IYL;
  logic         ld_SPH;
  logic         ld_SPL;
  logic         ld_PCH;
  logic         ld_PCL;

  //-----------------------------------
  //Regfile Drives
  //  Specifying 2 of these signals will cause a 16 bit drive onto the addr
  //  bus and specifying two of these signals will cause an 8-bit drive onto
  //  the data bus. We cannot do both simultaneously.
  //------------------------------------
  logic         drive_reg_data;
  logic         drive_reg_addr;
  logic         drive_B;
  logic         drive_C;
  logic         drive_D;
  logic         drive_E;
  logic         drive_H;
  logic         drive_L;
  logic         drive_IXH;
  logic         drive_IXL;
  logic         drive_IYH;
  logic         drive_IYL;
  logic         drive_SPH;
  logic         drive_SPL;
  logic         drive_PCH;
  logic         drive_PCL;

  //-----------------------------------
  //Accumulator and Flag loads
  //  The original system only had a single 8-bit ALU. As an optimization;
  //  we have put in a second 16-bit alu to make the control simpler. As
  //  A result; we must conditionally load from the ALU that performs
  //  arithmetic on the A register.
  //-----------------------------------
  logic         ld_A;
  logic         ld_F_data;      //8bit load
  logic         ld_F_addr;      //16bit load
  logic         drive_A;
  logic         drive_F;
  logic [3:0]   alu_op;
  logic         drive_alu_data; //8bit drive
  logic         drive_alu_addr; //16bit drive

  //-----------------------------------
  //Miscellaneous register controls
  // - switch_context: tells the registers to switch with their "not"
  //      counterparts. The ld signals determine which registers
  //      will switch contexts.
  // - swap_reg: tells the registers to swap contents in a single cycle
  //      The ld signals determine which registers will swap
  //-----------------------------------
  logic         switch_context;
  logic         swap_reg;

  //-----------------------------------
  //temporary data_bus registers
  //  These registers sit on the databus.
  //-----------------------------------
  logic         ld_MDR1;
  logic         ld_MDR2;
  logic         ld_TEMP;
  logic         drive_MDR1;
  logic         drive_MDR2;
  logic         drive_TEMP;

  //-----------------------------------
  //temporary addr_bus registers
  //  These registers sit on the addr bus
  //-----------------------------------
  logic         ld_MARH; //load upper byte of MAR
  logic         ld_MARL; //load lower byte of MAR
  logic         drive_MAR;

  //---------------------------------------------------------------------------
  //Top Level Signals
  //  These signals are detailed in z80_top. The control logic is directly
  //  responsible for generating these signals based on the state of the
  //  processor. They are top level s and s to the system.
  //---------------------------------------------------------------------------
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
    data_in  = 0;

    @(posedge clk);
    rst_L <= 1;
    @(posedge clk);

    /*for(i = 0; i < 100; i++) begin
      data_in <= i;
      @(posedge clk);
    end*/

    //T1
    @(posedge clk); //end T1

    //T2
    data_in <= 8'b00000100;
    @(posedge clk); //end T2

    //T3
    data_in <= 8'b0;
    @(posedge clk); //end T3

    //T4
    @(posedge clk); //end T4

    //T1
    @(posedge clk); //end T1

    $finish;
  end

endmodule: tb
