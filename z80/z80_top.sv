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

  //TODO instantiate control path (drives addr bus when enabled by itself)
  //TODO instantiate datapath     (drives data bus when enabled by control_logic)

  logic [7:0]   datapath_data_out;
  logic [15:0]  datapath_addr_out;
  logic [3:0]   alu_op;
  logic         switch_context;
  logic         ld_a;

  logic [15:0]  control_addr_out;
  logic         control_drive_addr;
  logic         datapath_drive_addr;
  logic         datapath_drive_data;

  datapath DP (
    .clk(clk),
    .rst_L(rst_L),
    .data_in(data_bus),
    .ld_a(ld_a),
    .alu_op(alu_op),
    .switch_context(switch_context),
    .data_out(datapath_data_out),
    .addr_out(datapath_addr_out)
  );

  control_logic CTRL(
    .clk(clk),
    .rst_L(rst_L),
    .data_in(data_bus),
    .addr_out(control_addr_out),

    .control_drive_addr(control_drive_addr),
    .datapath_drive_addr(datapath_drive_addr),
    .datapath_drive_data(datapath_drive_data),

    .ld_a(ld_a),
    .alu_op(alu_op),
    .switch_context(switch_context),

    .M1_L(M1_L),
    .INT_L(INT_L),
    .NMI_L(NMI_L),
    .WAIT_L(WAIT_L),
    .MREQ_L(MREQ_L),
    .IORQ_L(IORQ_L),
    .RD_L(RD_L),
    .WR_L(WR_L),
    .RFSH_L(RFSH_L),
    .BUSACK_L(BUSACK_L),
    .BUSREQ_L(BUSREQ_L),
    .HALT_L(HALT_L)

  );

  assign data_bus = 8'bz;
  assign addr_bus = control_addr_out;

  //assign data_bus = (datapath_drive_data) ? datapath_data_out : 8'bz;
  //assign addr_bus = (datapath_drive_addr) ? datapath_addr_out : (
  //                      (control_drive_addr) ? control_addr_out : 15'bz);

endmodule: z80
