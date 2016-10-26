`default_nettype none

module z80(

  //---------------------------------------------------------------------------
  //Clock and Reset Interface
  //  - CLK:  Sources differ about actual clock rate, but it seems to be about
  //          3.5 MHz.
  //  - RESET_L: Needs to be asserted for 3 clock cycles before the chip is
  //          fully reset. Starts fetching instructions from location 0x0000
  //          on reset.
  //---------------------------------------------------------------------------
  input   logic         clk,
  input   logic         rst_L,

  //---------------------------------------------------------------------------
  //Bus Interface
  //  We are ignoring DMA interface and bus arbitration logic because we do not
  //  anticipate the need for any slave device to take control of the bus
  //---------------------------------------------------------------------------
  inout   wire  [7:0]   data_bus,
  inout   wire  [15:0]  addr_bus,

  //---------------------------------------------------------------------------
  //Interrupt Interface
  //  - M1_L:
  //  - INT_L:  Maskable interrupt
  //  - NMI_L:  Non-Maskable Interrupt
  //---------------------------------------------------------------------------
  output  logic         M1_L,
  input   logic         INT_L,
  input   logic         NMI_L,

  //---------------------------------------------------------------------------
  //Memory read/write Interface
  //  - WAIT_L: Used to synchronize CPU and memory by inserting extra cycles
  //            into memory read/write to allow mem access to complete.
  //  - MREQ_L: Used to indicate that a memory request is being made as opposed
  //            to an I/O request. Indicates that the addr bus holds a valid
  //            memory address.
  //  - IORQ_L: Used to indicate that an I/O request is being made. Indicates
  //            that the lower half of the addr bus contains a valid I/O port.
  //  - RD_L:   Used to indicate that CPU is ready for memory data to be
  //            placed onto the data bus.
  //  - WR_L:   Used to indicate that the CPU is placing valid data onto the
  //            data bus for memory write
  //---------------------------------------------------------------------------
  input   logic         WAIT_L,
  output  logic         MREQ_L,
  output  logic         IORQ_L,
  output  logic         RD_L,
  output  logic         WR_L,

  //---------------------------------------------------------------------------
  //Other Signals
  //  - RFSH_L: Used to indicated that memory r/w is part of a dynamic ram
  //            refresh cycle. Not used in our design
  //  - BUSACK_L: Used to let the DMA engine know that it has control of the
  //            bus. Not used in our design since there is no DMA engine
  //  - BUSREQ_L: Used to request access to the bus for DMA. Not used in our
  //            design since there is no DMA engine.
  //  - HALT_L: Used to indicate that the CPU has seen a halt instruction and
  //            is now in sleep mode until an interrupt wakes it up. Not sure
  //            if this signal is necessary for the design or not.
  //---------------------------------------------------------------------------
  output  logic         RFSH_L,
  output  logic         BUSACK_L,
  input   logic         BUSREQ_L,
  output  logic         HALT_L
);

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
  logic         ld_STRH;
  logic         ld_STRL;

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
  logic         drive_STRH;
  logic         drive_STRL;

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
  logic [5:0]   alu_op;
  logic         drive_alu_data; //8bit drive
  logic         drive_alu_addr; //16bit drive
  logic [1:0]   set_S;
  logic [1:0]   set_Z;
  logic [1:0]   set_H;
  logic [1:0]   set_PV;
  logic [1:0]   set_N;
  logic [1:0]   set_C;


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
  //  These registers sit on the addr bus, but can load
  //  data from the D-Bus when necessary
  //-----------------------------------
  logic         ld_MARH; //load upper byte of MAR
  logic         ld_MARL; //load lower byte of MAR
  logic         ld_MARH_data;
  logic         ld_MARL_data;
  logic         drive_MAR;

  //External bus outputs
  logic [7:0]   data_in;
  logic [7:0]   data_out;
  logic [15:0]  addr_out;

  //Datapath flags that the control module ueses
  logic [7:0]   flags;

  datapath DP (.*);

  control_logic CTRL(.*);

  assign data_in  = data_bus;
  assign data_bus = data_out;
  assign addr_bus = addr_out;


endmodule: z80
