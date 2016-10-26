`include "../z80_defines.vh"

module control_logic (

  input   logic       clk,
  input   logic       rst_L,

  //---------------------------------------------------------------------------
  //Bus Signals
  //  - data_in: The control segment only receives data from the bus
  //---------------------------------------------------------------------------
  input   logic [7:0]   data_in,
  input   logic [7:0]   flags,

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
  output  logic         ld_B,
  output  logic         ld_C,
  output  logic         ld_D,
  output  logic         ld_E,
  output  logic         ld_H,
  output  logic         ld_L,
  output  logic         ld_IXH,
  output  logic         ld_IXL,
  output  logic         ld_IYH,
  output  logic         ld_IYL,
  output  logic         ld_SPH,
  output  logic         ld_SPL,
  output  logic         ld_PCH,
  output  logic         ld_PCL,
  output  logic         ld_STRH,
  output  logic         ld_STRL,

  //-----------------------------------
  //Regfile Drives
  //  Specifying 2 of these signals will cause a 16 bit drive onto the addr
  //  bus and specifying two of these signals will cause an 8-bit drive onto
  //  the data bus. We cannot do both simultaneously.
  //------------------------------------
  output  logic         drive_reg_data,
  output  logic         drive_reg_addr,
  output  logic         drive_B,
  output  logic         drive_C,
  output  logic         drive_D,
  output  logic         drive_E,
  output  logic         drive_H,
  output  logic         drive_L,
  output  logic         drive_IXH,
  output  logic         drive_IXL,
  output  logic         drive_IYH,
  output  logic         drive_IYL,
  output  logic         drive_SPH,
  output  logic         drive_SPL,
  output  logic         drive_PCH,
  output  logic         drive_PCL,
  output  logic         drive_STRH,
  output  logic         drive_STRL,

  //-----------------------------------
  //Accumulator and Flag loads
  //  The original system only had a single 8-bit ALU. As an optimization,
  //  we have put in a second 16-bit alu to make the control simpler. As
  //  A result, we must conditionally load from the ALU that performs
  //  arithmetic on the A register.
  //-----------------------------------
  output  logic         ld_A,
  output  logic         ld_F_data,      //8bit load
  output  logic         ld_F_addr,      //16bit load

  output  logic [1:0]   set_S,
  output  logic [1:0]   set_Z,
  output  logic [1:0]   set_H,
  output  logic [1:0]   set_PV,
  output  logic [1:0]   set_N,
  output  logic [1:0]   set_C,

  output  logic         drive_A,
  output  logic         drive_F,
  output  logic [5:0]   alu_op,
  output  logic         drive_alu_data, //8bit drive
  output  logic         drive_alu_addr, //16bit drive

  //-----------------------------------
  //Miscellaneous register controls
  // - switch_context: tells the registers to switch with their "not"
  //      counterparts. The ld signals determine which registers
  //      will switch contexts.
  // - swap_reg: tells the registers to swap contents in a single cycle
  //      The ld signals determine which registers will swap
  //-----------------------------------
  output  logic         switch_context,
  output  logic         swap_reg,

  //-----------------------------------
  //temporary data_bus registers
  //  These registers sit on the databus.
  //-----------------------------------
  output  logic         ld_MDR1,
  output  logic         ld_MDR2,
  output  logic         ld_TEMP,
  output  logic         drive_MDR1,
  output  logic         drive_MDR2,
  output  logic         drive_TEMP,

  //-----------------------------------
  //temporary addr_bus registers
  //  These registers sit on the addr bus, and can load
  //  data from the data bus if necessary
  //-----------------------------------
  output  logic         ld_MARH, //load upper byte of MAR
  output  logic         ld_MARL, //load lower byte of MAR
  output  logic         ld_MARH_data,
  output  logic         ld_MARL_data,
  output  logic         drive_MAR,

  //---------------------------------------------------------------------------
  //Top Level Signals
  //  These signals are detailed in z80_top. The control logic is directly
  //  responsible for generating these signals based on the state of the
  //  processor. They are top level inputs and outputs to the system.
  //---------------------------------------------------------------------------
  output  logic         M1_L,
  input   logic         INT_L,
  input   logic         NMI_L,

  input   logic         WAIT_L,
  output  logic         MREQ_L,
  output  logic         IORQ_L,
  output  logic         RD_L,
  output  logic         WR_L,

  output  logic         RFSH_L,
  output  logic         BUSACK_L,
  input   logic         BUSREQ_L,
  output  logic         HALT_L
);

  //---------------------------------------------------------------------------
  //OPCODE REGISTERS
  //  Latch in values that come off of the data bus so that we know what
  //  to do with them
  //---------------------------------------------------------------------------
  logic       ld_op0, ld_op1, ld_op2;
  logic [7:0] op0, op1, op2;
  register #(8) op0_reg(clk, rst_L, data_in, ld_op0, op0);
  register #(8) op1_reg(clk, rst_L, data_in, ld_op1, op1);
  register #(8) op2_reg(clk, rst_L, data_in, ld_op2, op2);

  //---------------------------------------------------------------------------
  //SUB FSM DECLARATIONS
  //---------------------------------------------------------------------------
  logic OCF_start;
  logic OCF_M1_L;
  logic OCF_MREQ_L;
  logic OCF_RD_L;
  logic OCF_RFSH_L;
  logic OCF_bus;

  logic MRD_start;
  logic MRD_MREQ_L;
  logic MRD_RD_L;
  logic MRD_bus;

  logic MWR_start;
  logic MWR_MREQ_L;
  logic MWR_WR_L;
  logic MWR_bus;

  OCF_fsm machine_fetch(
    .clk(clk),
    .rst_L(rst_L),
    .OCF_start(OCF_start),
    .WAIT_L(WAIT_L),

    .OCF_M1_L(OCF_M1_L),
    .OCF_MREQ_L(OCF_MREQ_L),
    .OCF_RD_L(OCF_RD_L),
    .OCF_RFSH_L(OCF_RFSH_L)
  );

  MRD_fsm memory_read(
    .clk,
    .rst_L,
    .MRD_start,

    .WAIT_L,
    .MRD_MREQ_L,
    .MRD_RD_L
  );

  MWR_fsm memory_write(
    .clk,
    .rst_L,
    .MWR_start,

    .WAIT_L,
    .MWR_MREQ_L,
    .MWR_WR_L
  );

  //---------------------------------------------------------------------------
  //DECODER
  //  Determines which instruction we are currently executing and who gets
  //  control of the bus.
  //---------------------------------------------------------------------------
  decoder DECODE(
    .clk(clk),
    .rst_L(rst_L),

    .WAIT_L,
    .data_in,
    .flags,

    //regfile loads
    .ld_B,
    .ld_C,
    .ld_D,
    .ld_E,
    .ld_H,
    .ld_L,
    .ld_IXH,
    .ld_IXL,
    .ld_IYH,
    .ld_IYL,
    .ld_SPH,
    .ld_SPL,
    .ld_PCH,
    .ld_PCL,
    .ld_STRH,
    .ld_STRL,

    //regfile drives
    .drive_reg_data,
    .drive_reg_addr,
    .drive_B,
    .drive_C,
    .drive_D,
    .drive_E,
    .drive_H,
    .drive_L,
    .drive_IXH,
    .drive_IXL,
    .drive_IYH,
    .drive_IYL,
    .drive_SPH,
    .drive_SPL,
    .drive_PCH,
    .drive_PCL,
    .drive_STRH,
    .drive_STRL,

    //accumulator flags and loads
    .ld_A,
    .ld_F_data,
    .ld_F_addr,
    .drive_A,
    .drive_F,
    .alu_op,
    .drive_alu_data,
    .drive_alu_addr,

    .set_S,
    .set_Z,
    .set_H,
    .set_PV,
    .set_N,
    .set_C,

    //misc register controls
    .switch_context,
    .swap_reg,

    //temp data bus regs
    .ld_MDR1,
    .ld_MDR2,
    .ld_TEMP,
    .drive_MDR1,
    .drive_MDR2,
    .drive_TEMP,

    //temp addr bus regs
    .ld_MARH,
    .ld_MARL,
    .ld_MARH_data,
    .ld_MARL_data,
    .drive_MAR,

    //Bus controls
    .OCF_start,
    .OCF_bus,
    .MWR_start,
    .MWR_bus,
    .MRD_start,
    .MRD_bus
  );

  //---------------------------------------------------------------------------
  //BUS LINES
  //  Arbitrate who gets to drive the actual bus lines between all of the
  //  sub-fsms.
  //---------------------------------------------------------------------------
  always_comb begin
    //default signals
    M1_L    = 1'b1;
    MREQ_L  = 1'b1;
    IORQ_L  = 1'b1;
    RD_L    = 1'b1;
    WR_L    = 1'b1;
    RFSH_L  = 1'b1;
    HALT_L  = 1'b1;
    BUSACK_L = 1'b1;

    if(OCF_bus) begin
      M1_L   = OCF_M1_L;
      MREQ_L = OCF_MREQ_L;
      RD_L   = OCF_RD_L;
      RFSH_L = OCF_RFSH_L;
    end

    else if(MRD_bus) begin
      MREQ_L = MRD_MREQ_L;
      RD_L   = MRD_RD_L;
    end

    else if(MWR_bus) begin
      MREQ_L = MWR_MREQ_L;
      WR_L   = MWR_WR_L;
    end

  end

endmodule: control_logic


//-----------------------------------------------------------------------------
//decoder
//  This module tells the control_fsm which macro state to progress to based
//  on the opcode that was fetched during the OCF stage. Then it will dispatch
//  the relevant macro stages in order before initiating another OCF.
//-----------------------------------------------------------------------------
module decoder (
  input logic clk,
  input logic rst_L,

  //---------------------------------------------------------------------------
  // - WAIT_L: This signal tells us if we need to stall our instruction fetch
  //           if the memory technology is not ready. Probably not needed.
  //---------------------------------------------------------------------------
  input logic WAIT_L,

  //---------------------------------------------------------------------------
  //
  // - opcode:    What instruction we should run, is defined in z80_defines.h
  //---------------------------------------------------------------------------
  input logic [7:0] data_in,
  input logic [7:0] flags,

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
  output  logic         ld_B,
  output  logic         ld_C,
  output  logic         ld_D,
  output  logic         ld_E,
  output  logic         ld_H,
  output  logic         ld_L,
  output  logic         ld_IXH,
  output  logic         ld_IXL,
  output  logic         ld_IYH,
  output  logic         ld_IYL,
  output  logic         ld_SPH,
  output  logic         ld_SPL,
  output  logic         ld_PCH,
  output  logic         ld_PCL,
  output  logic         ld_STRH,
  output  logic         ld_STRL,

  //-----------------------------------
  //Regfile Drives
  //  Specifying 2 of these signals will cause a 16 bit drive onto the addr
  //  bus and specifying two of these signals will cause an 8-bit drive onto
  //  the data bus. We cannot do both simultaneously.
  //------------------------------------
  output  logic         drive_reg_data,
  output  logic         drive_reg_addr,
  output  logic         drive_B,
  output  logic         drive_C,
  output  logic         drive_D,
  output  logic         drive_E,
  output  logic         drive_H,
  output  logic         drive_L,
  output  logic         drive_IXH,
  output  logic         drive_IXL,
  output  logic         drive_IYH,
  output  logic         drive_IYL,
  output  logic         drive_SPH,
  output  logic         drive_SPL,
  output  logic         drive_PCH,
  output  logic         drive_PCL,
  output  logic         drive_STRH,
  output  logic         drive_STRL,

  //-----------------------------------
  //Accumulator and Flag loads
  //  The original system only had a single 8-bit ALU. As an optimization,
  //  we have put in a second 16-bit alu to make the control simpler. As
  //  A result, we must conditionally load from the ALU that performs
  //  arithmetic on the A register.
  //-----------------------------------
  output  logic         ld_A,
  output  logic         ld_F_data,      //8bit load
  output  logic         ld_F_addr,      //16bit load
  output  logic         drive_A,
  output  logic         drive_F,
  output  logic [5:0]   alu_op,
  output  logic         drive_alu_data, //8bit drive
  output  logic         drive_alu_addr, //16bit drive
  output  logic [1:0]   set_S,
  output  logic [1:0]   set_Z,
  output  logic [1:0]   set_H,
  output  logic [1:0]   set_PV,
  output  logic [1:0]   set_N,
  output  logic [1:0]   set_C,

  //-----------------------------------
  //Miscellaneous register controls
  // - switch_context: tells the registers to switch with their "not"
  //      counterparts. The ld signals determine which registers
  //      will switch contexts.
  // - swap_reg: tells the registers to swap contents in a single cycle
  //      The ld signals determine which registers will swap
  //-----------------------------------
  output  logic         switch_context,
  output  logic         swap_reg,

  //-----------------------------------
  //temporary data_bus registers
  //  These registers sit on the databus.
  //-----------------------------------
  output  logic         ld_MDR1,
  output  logic         ld_MDR2,
  output  logic         ld_TEMP,
  output  logic         drive_MDR1,
  output  logic         drive_MDR2,
  output  logic         drive_TEMP,

  //-----------------------------------
  //temporary addr_bus registers
  //  These registers sit on the addr bus
  //-----------------------------------
  output  logic         ld_MARH, //load upper byte of MAR
  output  logic         ld_MARL, //load lower byte of MAR
  output  logic         ld_MARH_data,
  output  logic         ld_MARL_data,
  output  logic         drive_MAR,


  //---------------------------------------------------------------------------
  // - OCF_start: Kicks off the OCF_fsm which starts an opcode fetch
  //---------------------------------------------------------------------------
  output logic      OCF_start,
  output logic      OCF_bus,
  output logic      MRD_start,
  output logic      MRD_bus,
  output logic      MWR_start,
  output logic      MWR_bus
);

  enum logic [31:0] {
    START,

    FETCH_0,
    FETCH_1,
    FETCH_2,
    FETCH_3,
    FETCH_4,
    FETCH_5,
    FETCH_6,
    FETCH_7,

    LD_r_r_0,

    LD_r_n_0,
    LD_r_n_1,
    LD_r_n_2,

    LD_r_HL_0,
    LD_r_HL_1,
    LD_r_HL_2,

    LD_r_IX_d_0,
    LD_r_IX_d_1,
    LD_r_IX_d_2,
    LD_r_IX_d_3,
    LD_r_IX_d_4,
    LD_r_IX_d_5,
    LD_r_IX_d_6,
    LD_r_IX_d_7,
    LD_r_IX_d_8,
    LD_r_IX_d_9,
    LD_r_IX_d_10,

    LD_r_IY_d_0,
    LD_r_IY_d_1,
    LD_r_IY_d_2,
    LD_r_IY_d_3,
    LD_r_IY_d_4,
    LD_r_IY_d_5,
    LD_r_IY_d_6,
    LD_r_IY_d_7,
    LD_r_IY_d_8,
    LD_r_IY_d_9,
    LD_r_IY_d_10,

    LD_HL_r_0,
    LD_HL_r_1,
    LD_HL_r_2,

    LD_IX_d_r_0,
    LD_IX_d_r_1,
    LD_IX_d_r_2,
    LD_IX_d_r_3,
    LD_IX_d_r_4,
    LD_IX_d_r_5,
    LD_IX_d_r_6,
    LD_IX_d_r_7,
    LD_IX_d_r_8,
    LD_IX_d_r_9,
    LD_IX_d_r_10,

    LD_IY_d_r_0,
    LD_IY_d_r_1,
    LD_IY_d_r_2,
    LD_IY_d_r_3,
    LD_IY_d_r_4,
    LD_IY_d_r_5,
    LD_IY_d_r_6,
    LD_IY_d_r_7,
    LD_IY_d_r_8,
    LD_IY_d_r_9,
    LD_IY_d_r_10,

    LD_HL_n_0,
    LD_HL_n_1,
    LD_HL_n_2,
    LD_HL_n_3,
    LD_HL_n_4,
    LD_HL_n_5,

    LD_IX_d_n_0,
    LD_IX_d_n_1,
    LD_IX_d_n_2,
    LD_IX_d_n_3,
    LD_IX_d_n_4,
    LD_IX_d_n_5,
    LD_IX_d_n_6,
    LD_IX_d_n_7,
    LD_IX_d_n_8,
    LD_IX_d_n_9,
    LD_IX_d_n_10,

    LD_IY_d_n_0,
    LD_IY_d_n_1,
    LD_IY_d_n_2,
    LD_IY_d_n_3,
    LD_IY_d_n_4,
    LD_IY_d_n_5,
    LD_IY_d_n_6,
    LD_IY_d_n_7,
    LD_IY_d_n_8,
    LD_IY_d_n_9,
    LD_IY_d_n_10,

    LD_A_BC_0,
    LD_A_BC_1,
    LD_A_BC_2,

    LD_A_DE_0,
    LD_A_DE_1,
    LD_A_DE_2,

    LD_A_nn_0,
    LD_A_nn_1,
    LD_A_nn_2,
    LD_A_nn_3,
    LD_A_nn_4,
    LD_A_nn_5,
    LD_A_nn_6,
    LD_A_nn_7,
    LD_A_nn_8,

    LD_BC_A_0,
    LD_BC_A_1,
    LD_BC_A_2,

    LD_DE_A_0,
    LD_DE_A_1,
    LD_DE_A_2,

    LD_nn_A_0,
    LD_nn_A_1,
    LD_nn_A_2,
    LD_nn_A_3,
    LD_nn_A_4,
    LD_nn_A_5,
    LD_nn_A_6,
    LD_nn_A_7,
    LD_nn_A_8,

    LD_dd_nn_0,
    LD_dd_nn_1,
    LD_dd_nn_2,
    LD_dd_nn_3,
    LD_dd_nn_4,
    LD_dd_nn_5,

    LD_IX_nn_0,
    LD_IX_nn_1,
    LD_IX_nn_2,
    LD_IX_nn_3,
    LD_IX_nn_4,
    LD_IX_nn_5,

    LD_IY_nn_0,
    LD_IY_nn_1,
    LD_IY_nn_2,
    LD_IY_nn_3,
    LD_IY_nn_4,
    LD_IY_nn_5,

    LD_HL_nn_0,
    LD_HL_nn_1,
    LD_HL_nn_2,
    LD_HL_nn_3,
    LD_HL_nn_4,
    LD_HL_nn_5,
    LD_HL_nn_6,
    LD_HL_nn_7,
    LD_HL_nn_8,
    LD_HL_nn_9,
    LD_HL_nn_10,
    LD_HL_nn_11,

    LD_dd_nn_x_0,
    LD_dd_nn_x_1,
    LD_dd_nn_x_2,
    LD_dd_nn_x_3,
    LD_dd_nn_x_4,
    LD_dd_nn_x_5,
    LD_dd_nn_x_6,
    LD_dd_nn_x_7,
    LD_dd_nn_x_8,
    LD_dd_nn_x_9,
    LD_dd_nn_x_10,
    LD_dd_nn_x_11,

    LD_IX_nn_x_0,
    LD_IX_nn_x_1,
    LD_IX_nn_x_2,
    LD_IX_nn_x_3,
    LD_IX_nn_x_4,
    LD_IX_nn_x_5,
    LD_IX_nn_x_6,
    LD_IX_nn_x_7,
    LD_IX_nn_x_8,
    LD_IX_nn_x_9,
    LD_IX_nn_x_10,
    LD_IX_nn_x_11,

    LD_IY_nn_x_0,
    LD_IY_nn_x_1,
    LD_IY_nn_x_2,
    LD_IY_nn_x_3,
    LD_IY_nn_x_4,
    LD_IY_nn_x_5,
    LD_IY_nn_x_6,
    LD_IY_nn_x_7,
    LD_IY_nn_x_8,
    LD_IY_nn_x_9,
    LD_IY_nn_x_10,
    LD_IY_nn_x_11,

    LD_nn_x_HL_0,
    LD_nn_x_HL_1,
    LD_nn_x_HL_2,
    LD_nn_x_HL_3,
    LD_nn_x_HL_4,
    LD_nn_x_HL_5,
    LD_nn_x_HL_6,
    LD_nn_x_HL_7,
    LD_nn_x_HL_8,
    LD_nn_x_HL_9,
    LD_nn_x_HL_10,
    LD_nn_x_HL_11,

    LD_nn_x_dd_0,
    LD_nn_x_dd_1,
    LD_nn_x_dd_2,
    LD_nn_x_dd_3,
    LD_nn_x_dd_4,
    LD_nn_x_dd_5,
    LD_nn_x_dd_6,
    LD_nn_x_dd_7,
    LD_nn_x_dd_8,
    LD_nn_x_dd_9,
    LD_nn_x_dd_10,
    LD_nn_x_dd_11,

    LD_nn_x_IX_0,
    LD_nn_x_IX_1,
    LD_nn_x_IX_2,
    LD_nn_x_IX_3,
    LD_nn_x_IX_4,
    LD_nn_x_IX_5,
    LD_nn_x_IX_6,
    LD_nn_x_IX_7,
    LD_nn_x_IX_8,
    LD_nn_x_IX_9,
    LD_nn_x_IX_10,
    LD_nn_x_IX_11,

    LD_nn_x_IY_0,
    LD_nn_x_IY_1,
    LD_nn_x_IY_2,
    LD_nn_x_IY_3,
    LD_nn_x_IY_4,
    LD_nn_x_IY_5,
    LD_nn_x_IY_6,
    LD_nn_x_IY_7,
    LD_nn_x_IY_8,
    LD_nn_x_IY_9,
    LD_nn_x_IY_10,
    LD_nn_x_IY_11,

    LD_SP_HL_0,
    LD_SP_HL_1,

    LD_SP_IX_0,
    LD_SP_IX_1,

    LD_SP_IY_0,
    LD_SP_IY_1,

    PUSH_qq_0,
    PUSH_qq_1,
    PUSH_qq_2,
    PUSH_qq_3,
    PUSH_qq_4,
    PUSH_qq_5,
    PUSH_qq_6,

    PUSH_IX_0,
    PUSH_IX_1,
    PUSH_IX_2,
    PUSH_IX_3,
    PUSH_IX_4,
    PUSH_IX_5,
    PUSH_IX_6,

    PUSH_IY_0,
    PUSH_IY_1,
    PUSH_IY_2,
    PUSH_IY_3,
    PUSH_IY_4,
    PUSH_IY_5,
    PUSH_IY_6,

    POP_qq_0,
    POP_qq_1,
    POP_qq_2,
    POP_qq_3,
    POP_qq_4,
    POP_qq_5,

    POP_IX_0,
    POP_IX_1,
    POP_IX_2,
    POP_IX_3,
    POP_IX_4,
    POP_IX_5,

    POP_IY_0,
    POP_IY_1,
    POP_IY_2,
    POP_IY_3,
    POP_IY_4,
    POP_IY_5,

    EX_DE_HL_0,

    EX_AF_AF_0,

    EXX_0,

    EX_SP_HL_0,
    EX_SP_HL_1,
    EX_SP_HL_2,
    EX_SP_HL_3,
    EX_SP_HL_4,
    EX_SP_HL_5,
    EX_SP_HL_6,
    EX_SP_HL_7,
    EX_SP_HL_8,
    EX_SP_HL_9,
    EX_SP_HL_10,
    EX_SP_HL_11,
    EX_SP_HL_12,
    EX_SP_HL_13,
    EX_SP_HL_14,

    EX_SP_IX_0,
    EX_SP_IX_1,
    EX_SP_IX_2,
    EX_SP_IX_3,
    EX_SP_IX_4,
    EX_SP_IX_5,
    EX_SP_IX_6,
    EX_SP_IX_7,
    EX_SP_IX_8,
    EX_SP_IX_9,
    EX_SP_IX_10,
    EX_SP_IX_11,
    EX_SP_IX_12,
    EX_SP_IX_13,
    EX_SP_IX_14,

    EX_SP_IY_0,
    EX_SP_IY_1,
    EX_SP_IY_2,
    EX_SP_IY_3,
    EX_SP_IY_4,
    EX_SP_IY_5,
    EX_SP_IY_6,
    EX_SP_IY_7,
    EX_SP_IY_8,
    EX_SP_IY_9,
    EX_SP_IY_10,
    EX_SP_IY_11,
    EX_SP_IY_12,
    EX_SP_IY_13,
    EX_SP_IY_14,

    LDI_0,
    LDI_1,
    LDI_2,
    LDI_3,
    LDI_4,
    LDI_5,
    LDI_6,
    LDI_7,

    LDIR_0,
    LDIR_1,
    LDIR_2,
    LDIR_3,
    LDIR_4,
    LDIR_5,
    LDIR_6,
    LDIR_7,
    LDIR_8,
    LDIR_9,
    LDIR_10,
    LDIR_11,
    LDIR_12,

    LDD_0,
    LDD_1,
    LDD_2,
    LDD_3,
    LDD_4,
    LDD_5,
    LDD_6,
    LDD_7,

    LDDR_0,
    LDDR_1,
    LDDR_2,
    LDDR_3,
    LDDR_4,
    LDDR_5,
    LDDR_6,
    LDDR_7,
    LDDR_8,
    LDDR_9,
    LDDR_10,
    LDDR_11,
    LDDR_12,

    CPI_0,
    CPI_1,
    CPI_2,
    CPI_3,
    CPI_4,
    CPI_5,
    CPI_6,
    CPI_7,

    CPIR_0,
    CPIR_1,
    CPIR_2,
    CPIR_3,
    CPIR_4,
    CPIR_5,
    CPIR_6,
    CPIR_7,
    CPIR_8,
    CPIR_9,
    CPIR_10,
    CPIR_11,
    CPIR_12,

    CPD_0,
    CPD_1,
    CPD_2,
    CPD_3,
    CPD_4,
    CPD_5,
    CPD_6,
    CPD_7,

    CPDR_0,
    CPDR_1,
    CPDR_2,
    CPDR_3,
    CPDR_4,
    CPDR_5,
    CPDR_6,
    CPDR_7,
    CPDR_8,
    CPDR_9,
    CPDR_10,
    CPDR_11,
    CPDR_12,

    ADD_A_r_0,

    ADD_A_n_0,
    ADD_A_n_1,
    ADD_A_n_2,

    ADD_A_HL_0,
    ADD_A_HL_1,
    ADD_A_HL_2,

    ADD_A_IX_d_0,
    ADD_A_IX_d_1,
    ADD_A_IX_d_2,
    ADD_A_IX_d_3,
    ADD_A_IX_d_4,
    ADD_A_IX_d_5,
    ADD_A_IX_d_6,
    ADD_A_IX_d_7,
    ADD_A_IX_d_8,
    ADD_A_IX_d_9,
    ADD_A_IX_d_10,

    ADD_A_IY_d_0,
    ADD_A_IY_d_1,
    ADD_A_IY_d_2,
    ADD_A_IY_d_3,
    ADD_A_IY_d_4,
    ADD_A_IY_d_5,
    ADD_A_IY_d_6,
    ADD_A_IY_d_7,
    ADD_A_IY_d_8,
    ADD_A_IY_d_9,
    ADD_A_IY_d_10,

    ADC_A_r_0,

    ADC_A_n_0,
    ADC_A_n_1,
    ADC_A_n_2,

    ADC_A_HL_0,
    ADC_A_HL_1,
    ADC_A_HL_2,

    ADC_A_IX_d_0,
    ADC_A_IX_d_1,
    ADC_A_IX_d_2,
    ADC_A_IX_d_3,
    ADC_A_IX_d_4,
    ADC_A_IX_d_5,
    ADC_A_IX_d_6,
    ADC_A_IX_d_7,
    ADC_A_IX_d_8,
    ADC_A_IX_d_9,
    ADC_A_IX_d_10,

    ADC_A_IY_d_0,
    ADC_A_IY_d_1,
    ADC_A_IY_d_2,
    ADC_A_IY_d_3,
    ADC_A_IY_d_4,
    ADC_A_IY_d_5,
    ADC_A_IY_d_6,
    ADC_A_IY_d_7,
    ADC_A_IY_d_8,
    ADC_A_IY_d_9,
    ADC_A_IY_d_10,

    SUB_r_0,

    SUB_n_0,
    SUB_n_1,
    SUB_n_2,

    SUB_HL_0,
    SUB_HL_1,
    SUB_HL_2,

    SUB_IX_d_0,
    SUB_IX_d_1,
    SUB_IX_d_2,
    SUB_IX_d_3,
    SUB_IX_d_4,
    SUB_IX_d_5,
    SUB_IX_d_6,
    SUB_IX_d_7,
    SUB_IX_d_8,
    SUB_IX_d_9,
    SUB_IX_d_10,

    SUB_IY_d_0,
    SUB_IY_d_1,
    SUB_IY_d_2,
    SUB_IY_d_3,
    SUB_IY_d_4,
    SUB_IY_d_5,
    SUB_IY_d_6,
    SUB_IY_d_7,
    SUB_IY_d_8,
    SUB_IY_d_9,
    SUB_IY_d_10,

    SBC_r_0,

    SBC_n_0,
    SBC_n_1,
    SBC_n_2,

    SBC_HL_0,
    SBC_HL_1,
    SBC_HL_2,

    SBC_IX_d_0,
    SBC_IX_d_1,
    SBC_IX_d_2,
    SBC_IX_d_3,
    SBC_IX_d_4,
    SBC_IX_d_5,
    SBC_IX_d_6,
    SBC_IX_d_7,
    SBC_IX_d_8,
    SBC_IX_d_9,
    SBC_IX_d_10,

    SBC_IY_d_0,
    SBC_IY_d_1,
    SBC_IY_d_2,
    SBC_IY_d_3,
    SBC_IY_d_4,
    SBC_IY_d_5,
    SBC_IY_d_6,
    SBC_IY_d_7,
    SBC_IY_d_8,
    SBC_IY_d_9,
    SBC_IY_d_10,

    AND_r_0,

    AND_n_0,
    AND_n_1,
    AND_n_2,

    AND_HL_0,
    AND_HL_1,
    AND_HL_2,

    AND_IX_d_0,
    AND_IX_d_1,
    AND_IX_d_2,
    AND_IX_d_3,
    AND_IX_d_4,
    AND_IX_d_5,
    AND_IX_d_6,
    AND_IX_d_7,
    AND_IX_d_8,
    AND_IX_d_9,
    AND_IX_d_10,

    AND_IY_d_0,
    AND_IY_d_1,
    AND_IY_d_2,
    AND_IY_d_3,
    AND_IY_d_4,
    AND_IY_d_5,
    AND_IY_d_6,
    AND_IY_d_7,
    AND_IY_d_8,
    AND_IY_d_9,
    AND_IY_d_10,

    OR_r_0,

    OR_n_0,
    OR_n_1,
    OR_n_2,

    OR_HL_0,
    OR_HL_1,
    OR_HL_2,

    OR_IX_d_0,
    OR_IX_d_1,
    OR_IX_d_2,
    OR_IX_d_3,
    OR_IX_d_4,
    OR_IX_d_5,
    OR_IX_d_6,
    OR_IX_d_7,
    OR_IX_d_8,
    OR_IX_d_9,
    OR_IX_d_10,

    OR_IY_d_0,
    OR_IY_d_1,
    OR_IY_d_2,
    OR_IY_d_3,
    OR_IY_d_4,
    OR_IY_d_5,
    OR_IY_d_6,
    OR_IY_d_7,
    OR_IY_d_8,
    OR_IY_d_9,
    OR_IY_d_10,

    XOR_r_0,

    XOR_n_0,
    XOR_n_1,
    XOR_n_2,

    XOR_HL_0,
    XOR_HL_1,
    XOR_HL_2,

    XOR_IX_d_0,
    XOR_IX_d_1,
    XOR_IX_d_2,
    XOR_IX_d_3,
    XOR_IX_d_4,
    XOR_IX_d_5,
    XOR_IX_d_6,
    XOR_IX_d_7,
    XOR_IX_d_8,
    XOR_IX_d_9,
    XOR_IX_d_10,

    XOR_IY_d_0,
    XOR_IY_d_1,
    XOR_IY_d_2,
    XOR_IY_d_3,
    XOR_IY_d_4,
    XOR_IY_d_5,
    XOR_IY_d_6,
    XOR_IY_d_7,
    XOR_IY_d_8,
    XOR_IY_d_9,
    XOR_IY_d_10,

    CP_r_0,

    CP_n_0,
    CP_n_1,
    CP_n_2,

    CP_HL_0,
    CP_HL_1,
    CP_HL_2,

    CP_IX_d_0,
    CP_IX_d_1,
    CP_IX_d_2,
    CP_IX_d_3,
    CP_IX_d_4,
    CP_IX_d_5,
    CP_IX_d_6,
    CP_IX_d_7,
    CP_IX_d_8,
    CP_IX_d_9,
    CP_IX_d_10,

    CP_IY_d_0,
    CP_IY_d_1,
    CP_IY_d_2,
    CP_IY_d_3,
    CP_IY_d_4,
    CP_IY_d_5,
    CP_IY_d_6,
    CP_IY_d_7,
    CP_IY_d_8,
    CP_IY_d_9,
    CP_IY_d_10,

    INC_r_0,

    INC_HL_0,
    INC_HL_1,
    INC_HL_2,
    INC_HL_3,
    INC_HL_4,
    INC_HL_5,
    INC_HL_6,

    INC_IX_d_0,
    INC_IX_d_1,
    INC_IX_d_2,
    INC_IX_d_3,
    INC_IX_d_4,
    INC_IX_d_5,
    INC_IX_d_6,
    INC_IX_d_7,
    INC_IX_d_8,
    INC_IX_d_9,
    INC_IX_d_10,
    INC_IX_d_11,
    INC_IX_d_12,
    INC_IX_d_13,
    INC_IX_d_14,

    INC_IY_d_0,
    INC_IY_d_1,
    INC_IY_d_2,
    INC_IY_d_3,
    INC_IY_d_4,
    INC_IY_d_5,
    INC_IY_d_6,
    INC_IY_d_7,
    INC_IY_d_8,
    INC_IY_d_9,
    INC_IY_d_10,
    INC_IY_d_11,
    INC_IY_d_12,
    INC_IY_d_13,
    INC_IY_d_14,

    CPL_0,

    CCF_0,

    SCF_0,

    NOP_0,


    BIT_b_r_0,
    BIT_b_r_1,
    BIT_b_r_2,
    BIT_b_r_3,

    BIT_b_HL_x_0,
    BIT_b_HL_x_1,
    BIT_b_HL_x_2,
    BIT_b_HL_x_3,

    BIT_b_IX_d_x_0,
    BIT_b_IX_d_x_1,
    BIT_b_IX_d_x_2,
    BIT_b_IX_d_x_3,
    BIT_b_IX_d_x_4,
    BIT_b_IX_d_x_5,
    BIT_b_IX_d_x_6,
    BIT_b_IX_d_x_7,
    BIT_b_IX_d_x_8,
    BIT_b_IX_d_x_9,
    BIT_b_IX_d_x_10,
    BIT_b_IX_d_x_11,

    BIT_b_IY_d_x_0,
    BIT_b_IY_d_x_1,
    BIT_b_IY_d_x_2,
    BIT_b_IY_d_x_3,
    BIT_b_IY_d_x_4,
    BIT_b_IY_d_x_5,
    BIT_b_IY_d_x_6,
    BIT_b_IY_d_x_7,
    BIT_b_IY_d_x_8,
    BIT_b_IY_d_x_9,
    BIT_b_IY_d_x_10,
    BIT_b_IY_d_x_11,

    SET_b_HL_x_0,
    SET_b_HL_x_1,
    SET_b_HL_x_2,

    SET_b_IX_d_x_0,
    SET_b_IX_d_x_1,
    SET_b_IX_d_x_2,

    SET_b_IY_d_x_0,
    SET_b_IY_d_x_1,
    SET_b_IY_d_x_2,


    JP_nn_0,
    JP_nn_1,
    JP_nn_2,
    JP_nn_3,
    JP_nn_4,
    JP_nn_5,

    JP_cc_nn_0,
    JP_cc_nn_1,
    JP_cc_nn_2,
    JP_cc_nn_3,
    JP_cc_nn_4,
    JP_cc_nn_5,

    JR_e_0,
    JR_e_1,
    JR_e_2,
    JR_e_3,
    JR_e_4,
    JR_e_5,
    JR_e_6,
    JR_e_7,


    CALL_nn_0,
    CALL_nn_1,
    CALL_nn_2,
    CALL_nn_3,
    CALL_nn_4,
    CALL_nn_5,
    CALL_nn_6,
    CALL_nn_7,
    CALL_nn_8,
    CALL_nn_9,
    CALL_nn_10,
    CALL_nn_11,
    CALL_nn_12,

    CALL_cc_nn_0,
    CALL_cc_nn_1,
    CALL_cc_nn_2,
    CALL_cc_nn_3,
    CALL_cc_nn_4,
    CALL_cc_nn_5,
    CALL_cc_nn_6,
    CALL_cc_nn_7,
    CALL_cc_nn_8,
    CALL_cc_nn_9,
    CALL_cc_nn_10,
    CALL_cc_nn_11,
    CALL_cc_nn_12,

    RET_0,
    RET_1,
    RET_2,
    RET_3,
    RET_4,
    RET_5,

    RET_cc_0,
    RET_cc_1,
    RET_cc_2,
    RET_cc_3,
    RET_cc_4,
    RET_cc_5,
    RET_cc_6,

    RST_p_0,
    RST_p_1,
    RST_p_2,
    RST_p_3,
    RST_p_4,
    RST_p_5,
    RST_p_6,

    //Mult-OCF Instructions
    //There is a difference between multi-ocf instructions and
    //instructions that require an operand data fetch. In an
    //odf, the fetched byte encodes parameters, not the instruction
    //to be performed. In a multi-ocf, any subsequent ocf fetches
    //another part of the opcode.
    IX_INST_0,  //IX instructions Group
                //IX bit instructions Group
    IY_INST_0,  //IY instructions Group
                //IY bit instructions Group
                //Bit Instructions Group
    EXT_INST_0  //Extended Instructions Group
  } state, next_state;

  //Internal storage of opcode and operand data bytes that are
  //fetched as part of an execution
  logic [7:0] op0;
  logic [7:0] op1;
  logic [7:0] op2;
  logic [7:0] odf0;
  logic [7:0] odf1;

  always_ff @(posedge clk) begin
    if(~rst_L) begin
      state <= START;
      op0   <= 0;
      op1   <= 0;
      op2   <= 0;
    end

    else begin
      state <= next_state;
    end

    //Latch values on the clock edge for opcode and operand fetches
    case(state)
      FETCH_1: op0 <= data_in;
      FETCH_5: op1 <= data_in;
      BIT_b_r_2: op1 <= data_in;
      BIT_b_IX_d_x_5: op1 <= data_in;
      BIT_b_IY_d_x_5: op1 <= data_in;
    endcase
  end

  //next state logic
  always_comb begin
    case(state)

      //-----------------------------------------------------------------------
      //BEGIN Opcode Fetch Group
      //-----------------------------------------------------------------------

      //On processor restart, we want to access address 0, but FETCH0
      //automagically increments the PC for us, which we do not want
      //here
      START: next_state = FETCH_1;

      //An OCF takes 4 cycles in total, but only 2 of those cycles are needed
      //to retreive the opcode (which comes in on T2/T3). The other two
      //cycles are spent refreshing the DRAM.
      FETCH_0: next_state = FETCH_1;
      FETCH_1: next_state = FETCH_2;

      //This cycle is spent decoding the instruction, and the 4th cycle
      //is spent potentially dispatching part of the instruction
      FETCH_2: begin
        //TODO: might need to acknowledge a WAIT cycle
        casex(op0)
          //Because of don't cares, this opcode can match other opcodes
          //that have the last 3 bits as 110, which is not defined in
          //this opcode.
          `LD_r_r:    next_state =
            (op0[2:0] != 3'b110 && op0[5:3] != 3'b110) ? LD_r_r_0 : FETCH_3;
          `EX_DE_HL:  next_state = EX_DE_HL_0;
          `EX_AF_AF:  next_state = EX_AF_AF_0;
          `EXX:       next_state = EXX_0;
          `ADD_A_r:   next_state = (op0[2:0] != 3'b110) ? ADD_A_r_0 : FETCH_3;
          `ADC_A_r:   next_state = (op0[2:0] != 3'b110) ? ADC_A_r_0 : FETCH_3;
          `SUB_r:     next_state = (op0[2:0] != 3'b110) ? SUB_r_0   : FETCH_3;
          `SBC_r:     next_state = (op0[2:0] != 3'b110) ? SBC_r_0   : FETCH_3;
          `AND_r:     next_state = (op0[2:0] != 3'b110) ? AND_r_0   : FETCH_3;
          `OR_r:      next_state = (op0[2:0] != 3'b110) ? OR_r_0    : FETCH_3;
          `XOR_r:     next_state = (op0[2:0] != 3'b110) ? XOR_r_0   : FETCH_3;
          `CP_r:      next_state = (op0[2:0] != 3'b110) ? CP_r_0    : FETCH_3;
          `INC_r:     next_state = (op0[5:3] != 3'b110) ? INC_r_0   : FETCH_3;
          `CPL:       next_state = CPL_0;
          `CCF:       next_state = CCF_0;
          `SCF:       next_state = SCF_0;
          `NOP:       next_state = NOP_0;
          `EXT_INST:  next_state = EXT_INST_0;
          `IX_INST:   next_state = IX_INST_0;
          `IY_INST:   next_state = IY_INST_0;
          default:    next_state = FETCH_3;
        endcase
      end

      //The instruction processed did nothing, so loop back and restart
      //unless it is proceeded by an operand data fetch
      FETCH_3: begin

        //remove all opcodes with dont cares in 5:3
        if(op0[5:3] == 3'b110) begin
          casex(op0)
            `LD_HL_r:   next_state = LD_HL_r_0;
            `LD_HL_n:   next_state = LD_HL_n_0;
            `LD_nn_A:   next_state = LD_nn_A_0;
            `LD_dd_nn:  next_state = LD_dd_nn_0;
            `POP_qq:    next_state = POP_qq_0;
            `PUSH_qq:   next_state = PUSH_qq_0;
            `OR_n:      next_state = OR_n_0;
            `OR_HL:     next_state = OR_HL_0;
            `INC_HL:    next_state = INC_HL_0;
            default:    next_state = FETCH_0;
          endcase
        end

        //remove all opcodes with dont cares in 2:0
        else if(op0[2:0] == 3'b110) begin
          casex(op0)
            `LD_r_n:    next_state = LD_r_n_0;
            `LD_r_HL:   next_state = LD_r_HL_0;
            `LD_HL_n:   next_state = LD_HL_n_0;
            `LD_dd_nn:  next_state = LD_dd_nn_0;
            `ADD_A_n:   next_state = ADD_A_n_0;
            `ADD_A_HL:  next_state = ADD_A_HL_0;
            `ADC_A_n:   next_state = ADC_A_n_0;
            `ADC_A_HL:  next_state = ADC_A_HL_0;
            `SUB_n:     next_state = SUB_n_0;
            `SUB_HL:    next_state = SUB_HL_0;
            `SBC_n:     next_state = SBC_n_0;
            `SBC_HL:    next_state = SBC_HL_0;
            `AND_n:     next_state = AND_n_0;
            `AND_HL:    next_state = AND_HL_0;
            `OR_n:      next_state = OR_n_0;
            `OR_HL:     next_state = OR_HL_0;
            `XOR_n:     next_state = XOR_n_0;
            `XOR_HL:    next_state = XOR_HL_0;
            `CP_n:      next_state = CP_n_0;
            `CP_HL:     next_state = CP_HL_0;
            default:    next_state = FETCH_0;
          endcase
        end

        //case for all opcodes with both fields variable
        else begin
          casex(op0)
            `LD_A_BC:    next_state = LD_A_BC_0;
            `LD_A_DE:    next_state = LD_A_DE_0;
            `LD_A_nn:    next_state = LD_A_nn_0;
            `LD_BC_A:    next_state = LD_BC_A_0;
            `LD_DE_A:    next_state = LD_DE_A_0;
            `LD_HL_nn:   next_state = LD_HL_nn_0;
            `LD_dd_nn:   next_state = LD_dd_nn_0;
            `LD_nn_x_HL: next_state = LD_nn_x_HL_0;
            `LD_SP_HL:   next_state = LD_SP_HL_0;
            `EX_SP_HL:   next_state = EX_SP_HL_0;
            `PUSH_qq:    next_state = PUSH_qq_0;
            `POP_qq:     next_state = POP_qq_0;
            `BIT_b:    next_state = BIT_b_r_0;
            `JP_nn:      next_state = JP_nn_0;
            `JP_cc_nn:   next_state = JP_cc_nn_0;
            `JR_e:       next_state = JR_e_0;
            `JR_C_e:     next_state = JR_e_0;
            `JR_NC_e:    next_state = JR_e_0;
            `JR_Z_e:     next_state = JR_e_0;
            `JR_NZ_e:    next_state = JR_e_0;
            `CALL_nn:    next_state = CALL_nn_0;
            `CALL_cc_nn: next_state = CALL_cc_nn_0;
            `RET:        next_state = RET_0;
            `RET_cc:     next_state = RET_cc_0;
            `RST_p:      next_state = RST_p_0;
            default:     next_state = FETCH_0;
          endcase
        end

      end


      //These states represent a second OCF. They should operate almost
      //identically to the first OCF except they go to different states
      //based on op1
      FETCH_4: next_state = FETCH_5;
      FETCH_5: next_state = FETCH_6;

      FETCH_6: begin
        //TODO: might need to acknowledge a WAIT cycle
        casex(op1)
          default:    next_state = FETCH_7;
        endcase
      end

      //If we don't need to do anything in the second OCF, then case
      //in Fetch 7 to start performing logic next cycle
      FETCH_7: begin
        casex(op1)
          //Some cases are identical and are only different in the first byte
          `LD_r_IX_d:   next_state = (op0[7:4] == 4'hD) ?  LD_r_IX_d_0  : LD_r_IY_d_0;
          `LD_r_IY_d:   next_state = (op0[7:4] == 4'hF) ?  LD_r_IY_d_0  : LD_r_IX_d_0;
          `LD_IX_d_r: begin
              if     (op0[7:4] == 4'hF)  next_state = LD_IY_d_r_0;
              else if(op0[7:4] == 4'hD)  next_state = LD_IX_d_r_0;
              else if(op0[7:4] == 4'hE)  next_state = LD_nn_x_dd_0;
              else                       next_state = FETCH_0;
          end
          `LD_IY_d_r: begin
              if     (op0[7:4] == 4'hF)  next_state = LD_IY_d_r_0;
              else if(op0[7:4] == 4'hD)  next_state = LD_IX_d_r_0;
              else if(op0[7:4] == 4'hE)  next_state = LD_nn_x_dd_0;
              else                       next_state = FETCH_0;
          end
          `LD_IX_d_n:   next_state = (op0[7:4] == 4'hD) ?  LD_IX_d_n_0  : LD_IY_d_n_0;
          `LD_IY_d_n:   next_state = (op0[7:4] == 4'hF) ?  LD_IY_d_n_0  : LD_IX_d_n_0;
          `LD_IX_nn: 		next_state = (op0[7:4] == 4'hD) ?  LD_IX_nn_0   : LD_IY_nn_0;
          `LD_IY_nn:    next_state = (op0[7:4] == 4'hF) ?  LD_IY_nn_0   : LD_IX_nn_0;
          `LD_dd_nn_x:  next_state = LD_dd_nn_x_0;
          `LD_IX_nn_x:  next_state = (op0[7:4] == 4'hD) ?  LD_IX_nn_x_0 : LD_IY_nn_x_0;
          `LD_IY_nn_x:  next_state = (op0[7:4] == 4'hF) ?  LD_IY_nn_x_0 : LD_IX_nn_x_0;
          `LD_nn_x_dd:  next_state = LD_nn_x_dd_0;
          `LD_nn_x_IX:  next_state = (op0[7:4] == 4'hD) ?  LD_nn_x_IX_0 : LD_nn_x_IY_0;
          `LD_nn_x_IY:  next_state = (op0[7:4] == 4'hF) ?  LD_nn_x_IY_0 : LD_nn_x_IX_0;
          `LD_SP_IX:    next_state = (op0[7:4] == 4'hD) ?  LD_SP_IX_0   : LD_SP_IY_0;
          `LD_SP_IY:    next_state = (op0[7:4] == 4'hF) ?  LD_SP_IY_0   : LD_SP_IX_0;
          `LD_SP_IX:    next_state = LD_SP_IX_0;
          `EX_SP_IX:    next_state = (op0[7:4] == 4'hD) ?  EX_SP_IX_0   : EX_SP_IY_0;
          `EX_SP_IY:    next_state = (op0[7:4] == 4'hF) ?  EX_SP_IY_0   : EX_SP_IX_0;
          `PUSH_IX:     next_state = (op0[7:4] == 4'hD) ?  PUSH_IX_0    : PUSH_IY_0;
          `PUSH_IY:     next_state = (op0[7:4] == 4'hF) ?  PUSH_IY_0    : PUSH_IX_0;
          `LDI:         next_state = LDI_0;
          `LDIR:        next_state = LDIR_0;
          `LDD:         next_state = LDD_0;
          `LDDR:        next_state = LDDR_0;
          `CPI:         next_state = CPI_0;
          `CPIR:        next_state = CPIR_0;
          `CPD:         next_state = CPD_0;
          `CPDR:        next_state = CPDR_0;
          `POP_IX:      next_state = (op0[7:4] == 4'hD) ?  POP_IX_0   : POP_IY_0;
          `POP_IY:      next_state = (op0[7:4] == 4'hF) ?  POP_IY_0   : POP_IX_0;
          `ADD_A_IX_d:  next_state = (op0[7:4] == 4'hD) ?  ADD_A_IX_d_0 : ADD_A_IY_d_0;
          `ADD_A_IY_d:  next_state = (op0[7:4] == 4'hF) ?  ADD_A_IY_d_0 : ADD_A_IX_d_0;
          `ADC_A_IX_d:  next_state = (op0[7:4] == 4'hD) ?  ADC_A_IX_d_0 : ADC_A_IY_d_0;
          `ADC_A_IY_d:  next_state = (op0[7:4] == 4'hF) ?  ADC_A_IY_d_0 : ADC_A_IX_d_0;
          `SUB_IX_d:    next_state = (op0[7:4] == 4'hD) ?  SUB_IX_d_0   : SUB_IY_d_0;
          `SUB_IY_d:    next_state = (op0[7:4] == 4'hF) ?  SUB_IY_d_0   : SUB_IX_d_0;
          `SBC_IX_d:    next_state = (op0[7:4] == 4'hD) ?  SBC_IX_d_0   : SBC_IY_d_0;
          `SBC_IY_d:    next_state = (op0[7:4] == 4'hF) ?  SBC_IY_d_0   : SBC_IX_d_0;
          `AND_IX_d:    next_state = (op0[7:4] == 4'hD) ?  AND_IX_d_0 : AND_IY_d_0;
          `AND_IY_d:    next_state = (op0[7:4] == 4'hF) ?  AND_IY_d_0 : AND_IX_d_0;
          `OR_IX_d:     next_state = (op0[7:4] == 4'hD) ?  OR_IX_d_0  : OR_IY_d_0;
          `OR_IY_d:     next_state = (op0[7:4] == 4'hF) ?  OR_IY_d_0  : OR_IX_d_0;
          `XOR_IX_d:    next_state = (op0[7:4] == 4'hD) ?  XOR_IX_d_0 : XOR_IY_d_0;
          `XOR_IY_d:    next_state = (op0[7:4] == 4'hF) ?  XOR_IY_d_0 : XOR_IX_d_0;
          `CP_IX_d:     next_state = (op0[7:4] == 4'hD) ?  CP_IX_d_0 : CP_IY_d_0;
          `CP_IY_d:     next_state = (op0[7:4] == 4'hF) ?  CP_IY_d_0 : CP_IX_d_0;
          `INC_IX_d:    next_state = (op0[7:4] == 4'hD) ?  INC_IX_d_0 : INC_IY_d_0;
          `INC_IY_d:    next_state = (op0[7:4] == 4'hF) ?  INC_IY_d_0 : INC_IX_d_0;

          `BIT_b:       next_state = (op0[7:4] == 4'hD) ?  BIT_b_IX_d_x_0 : BIT_b_IY_d_x_0;

           default:     next_state = FETCH_0;
        endcase
      end

      //-----------------------------------------------------------------------
      //END Opcode fetch group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN 8-bit load group
      //-----------------------------------------------------------------------
      //LD_r_r
      LD_r_r_0: next_state = FETCH_0;

      //LD_r_n
      LD_r_n_0: next_state = LD_r_n_1;
      LD_r_n_1: next_state = LD_r_n_2;
      LD_r_n_2: next_state = FETCH_0;

      //LD_r_HL
      LD_r_HL_0: next_state = LD_r_HL_1;
      LD_r_HL_1: next_state = LD_r_HL_2;
      LD_r_HL_2: next_state = FETCH_0;

      //LD_r_IX_d
      LD_r_IX_d_0: next_state = LD_r_IX_d_1;
      LD_r_IX_d_1: next_state = LD_r_IX_d_2;
      LD_r_IX_d_2: next_state = LD_r_IX_d_3;
      LD_r_IX_d_3: next_state = LD_r_IX_d_4;
      LD_r_IX_d_4: next_state = LD_r_IX_d_5;
      LD_r_IX_d_5: next_state = LD_r_IX_d_6;
      LD_r_IX_d_6: next_state = LD_r_IX_d_7;
      LD_r_IX_d_7: next_state = LD_r_IX_d_8;
      LD_r_IX_d_8: next_state = LD_r_IX_d_9;
      LD_r_IX_d_9: next_state = LD_r_IX_d_10;
      LD_r_IX_d_10: next_state = FETCH_0;

      //LD_r_IY_d
      LD_r_IY_d_0: next_state = LD_r_IY_d_1;
      LD_r_IY_d_1: next_state = LD_r_IY_d_2;
      LD_r_IY_d_2: next_state = LD_r_IY_d_3;
      LD_r_IY_d_3: next_state = LD_r_IY_d_4;
      LD_r_IY_d_4: next_state = LD_r_IY_d_5;
      LD_r_IY_d_5: next_state = LD_r_IY_d_6;
      LD_r_IY_d_6: next_state = LD_r_IY_d_7;
      LD_r_IY_d_7: next_state = LD_r_IY_d_8;
      LD_r_IY_d_8: next_state = LD_r_IY_d_9;
      LD_r_IY_d_9: next_state = LD_r_IY_d_10;
      LD_r_IY_d_10: next_state = FETCH_0;

      //LD_HL_r
      LD_HL_r_0: next_state = LD_HL_r_1;
      LD_HL_r_1: next_state = LD_HL_r_2;
      LD_HL_r_2: next_state = FETCH_0;

      //LD_IX_d_r
      LD_IX_d_r_0: next_state = LD_IX_d_r_1;
      LD_IX_d_r_1: next_state = LD_IX_d_r_2;
      LD_IX_d_r_2: next_state = LD_IX_d_r_3;
      LD_IX_d_r_3: next_state = LD_IX_d_r_4;
      LD_IX_d_r_4: next_state = LD_IX_d_r_5;
      LD_IX_d_r_5: next_state = LD_IX_d_r_6;
      LD_IX_d_r_6: next_state = LD_IX_d_r_7;
      LD_IX_d_r_7: next_state = LD_IX_d_r_8;
      LD_IX_d_r_8: next_state = LD_IX_d_r_9;
      LD_IX_d_r_9: next_state = LD_IX_d_r_10;
      LD_IX_d_r_10: next_state = FETCH_0;

      //LD_IY_d_r
      LD_IY_d_r_0: next_state = LD_IY_d_r_1;
      LD_IY_d_r_1: next_state = LD_IY_d_r_2;
      LD_IY_d_r_2: next_state = LD_IY_d_r_3;
      LD_IY_d_r_3: next_state = LD_IY_d_r_4;
      LD_IY_d_r_4: next_state = LD_IY_d_r_5;
      LD_IY_d_r_5: next_state = LD_IY_d_r_6;
      LD_IY_d_r_6: next_state = LD_IY_d_r_7;
      LD_IY_d_r_7: next_state = LD_IY_d_r_8;
      LD_IY_d_r_8: next_state = LD_IY_d_r_9;
      LD_IY_d_r_9: next_state = LD_IY_d_r_10;
      LD_IY_d_r_10: next_state = FETCH_0;

      //LD_HL_n
      LD_HL_n_0: next_state = LD_HL_n_1;
      LD_HL_n_1: next_state = LD_HL_n_2;
      LD_HL_n_2: next_state = LD_HL_n_3;
      LD_HL_n_3: next_state = LD_HL_n_4;
      LD_HL_n_4: next_state = LD_HL_n_5;
      LD_HL_n_5: next_state = FETCH_0;

      //LD_IX_d_n
      LD_IX_d_n_0: next_state = LD_IX_d_n_1;
      LD_IX_d_n_1: next_state = LD_IX_d_n_2;
      LD_IX_d_n_2: next_state = LD_IX_d_n_3;
      LD_IX_d_n_3: next_state = LD_IX_d_n_4;
      LD_IX_d_n_4: next_state = LD_IX_d_n_5;
      LD_IX_d_n_5: next_state = LD_IX_d_n_6;
      LD_IX_d_n_6: next_state = LD_IX_d_n_7;
      LD_IX_d_n_7: next_state = LD_IX_d_n_8;
      LD_IX_d_n_8: next_state = LD_IX_d_n_9;
      LD_IX_d_n_9: next_state = LD_IX_d_n_10;
      LD_IX_d_n_10: next_state = FETCH_0;

      //LD_IY_d_n
      LD_IY_d_n_0: next_state = LD_IY_d_n_1;
      LD_IY_d_n_1: next_state = LD_IY_d_n_2;
      LD_IY_d_n_2: next_state = LD_IY_d_n_3;
      LD_IY_d_n_3: next_state = LD_IY_d_n_4;
      LD_IY_d_n_4: next_state = LD_IY_d_n_5;
      LD_IY_d_n_5: next_state = LD_IY_d_n_6;
      LD_IY_d_n_6: next_state = LD_IY_d_n_7;
      LD_IY_d_n_7: next_state = LD_IY_d_n_8;
      LD_IY_d_n_8: next_state = LD_IY_d_n_9;
      LD_IY_d_n_9: next_state = LD_IY_d_n_10;
      LD_IY_d_n_10: next_state = FETCH_0;

      //LD_A_BC
      LD_A_BC_0: next_state = LD_A_BC_1;
      LD_A_BC_1: next_state = LD_A_BC_2;
      LD_A_BC_2: next_state = FETCH_0;

      //LD_A_DE
      LD_A_DE_0: next_state = LD_A_DE_1;
      LD_A_DE_1: next_state = LD_A_DE_2;
      LD_A_DE_2: next_state = FETCH_0;

      //LD_A_nn
      LD_A_nn_0: next_state = LD_A_nn_1;
      LD_A_nn_1: next_state = LD_A_nn_2;
      LD_A_nn_2: next_state = LD_A_nn_3;
      LD_A_nn_3: next_state = LD_A_nn_4;
      LD_A_nn_4: next_state = LD_A_nn_5;
      LD_A_nn_5: next_state = LD_A_nn_6;
      LD_A_nn_6: next_state = LD_A_nn_7;
      LD_A_nn_7: next_state = LD_A_nn_8;
      LD_A_nn_8: next_state = FETCH_0;

      //LD_BC_A
      LD_BC_A_0: next_state = LD_BC_A_1;
      LD_BC_A_1: next_state = LD_BC_A_2;
      LD_BC_A_2: next_state = FETCH_0;

      //LD_DE_A
      LD_DE_A_0: next_state = LD_DE_A_1;
      LD_DE_A_1: next_state = LD_DE_A_2;
      LD_DE_A_2: next_state = FETCH_0;

      //LD_nn_A
      LD_nn_A_0: next_state = LD_nn_A_1;
      LD_nn_A_1: next_state = LD_nn_A_2;
      LD_nn_A_2: next_state = LD_nn_A_3;
      LD_nn_A_3: next_state = LD_nn_A_4;
      LD_nn_A_4: next_state = LD_nn_A_5;
      LD_nn_A_5: next_state = LD_nn_A_6;
      LD_nn_A_6: next_state = LD_nn_A_7;
      LD_nn_A_7: next_state = LD_nn_A_8;
      LD_nn_A_8: next_state = FETCH_0;

      //-----------------------------------------------------------------------
      //END 8-bit load group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN 16-bit load group
      //-----------------------------------------------------------------------

      //LD_dd_nn
      LD_dd_nn_0: next_state = LD_dd_nn_1;
      LD_dd_nn_1: next_state = LD_dd_nn_2;
      LD_dd_nn_2: next_state = LD_dd_nn_3;
      LD_dd_nn_3: next_state = LD_dd_nn_4;
      LD_dd_nn_4: next_state = LD_dd_nn_5;
      LD_dd_nn_5: next_state = FETCH_0;

      //LD_IX_nn
      LD_IX_nn_0: next_state = LD_IX_nn_1;
      LD_IX_nn_1: next_state = LD_IX_nn_2;
      LD_IX_nn_2: next_state = LD_IX_nn_3;
      LD_IX_nn_3: next_state = LD_IX_nn_4;
      LD_IX_nn_4: next_state = LD_IX_nn_5;
      LD_IX_nn_5: next_state = FETCH_0;

      //LD_IY_nn
      LD_IY_nn_0: next_state = LD_IY_nn_1;
      LD_IY_nn_1: next_state = LD_IY_nn_2;
      LD_IY_nn_2: next_state = LD_IY_nn_3;
      LD_IY_nn_3: next_state = LD_IY_nn_4;
      LD_IY_nn_4: next_state = LD_IY_nn_5;
      LD_IY_nn_5: next_state = FETCH_0;

      //LD_HL_nn
      LD_HL_nn_0: next_state = LD_HL_nn_1;
      LD_HL_nn_1: next_state = LD_HL_nn_2;
      LD_HL_nn_2: next_state = LD_HL_nn_3;
      LD_HL_nn_3: next_state = LD_HL_nn_4;
      LD_HL_nn_4: next_state = LD_HL_nn_5;
      LD_HL_nn_5: next_state = LD_HL_nn_6;
      LD_HL_nn_6: next_state = LD_HL_nn_7;
      LD_HL_nn_7: next_state = LD_HL_nn_8;
      LD_HL_nn_8: next_state = LD_HL_nn_9;
      LD_HL_nn_9: next_state = LD_HL_nn_10;
      LD_HL_nn_10: next_state = LD_HL_nn_11;
      LD_HL_nn_11: next_state = FETCH_0;

      //LD_dd_nn_x
      LD_dd_nn_x_0: next_state = LD_dd_nn_x_1;
      LD_dd_nn_x_1: next_state = LD_dd_nn_x_2;
      LD_dd_nn_x_2: next_state = LD_dd_nn_x_3;
      LD_dd_nn_x_3: next_state = LD_dd_nn_x_4;
      LD_dd_nn_x_4: next_state = LD_dd_nn_x_5;
      LD_dd_nn_x_5: next_state = LD_dd_nn_x_6;
      LD_dd_nn_x_6: next_state = LD_dd_nn_x_7;
      LD_dd_nn_x_7: next_state = LD_dd_nn_x_8;
      LD_dd_nn_x_8: next_state = LD_dd_nn_x_9;
      LD_dd_nn_x_9: next_state = LD_dd_nn_x_10;
      LD_dd_nn_x_10: next_state = LD_dd_nn_x_11;
      LD_dd_nn_x_11: next_state = FETCH_0;

      //LD_IX_nn_x
      LD_IX_nn_x_0: next_state = LD_IX_nn_x_1;
      LD_IX_nn_x_1: next_state = LD_IX_nn_x_2;
      LD_IX_nn_x_2: next_state = LD_IX_nn_x_3;
      LD_IX_nn_x_3: next_state = LD_IX_nn_x_4;
      LD_IX_nn_x_4: next_state = LD_IX_nn_x_5;
      LD_IX_nn_x_5: next_state = LD_IX_nn_x_6;
      LD_IX_nn_x_6: next_state = LD_IX_nn_x_7;
      LD_IX_nn_x_7: next_state = LD_IX_nn_x_8;
      LD_IX_nn_x_8: next_state = LD_IX_nn_x_9;
      LD_IX_nn_x_9: next_state = LD_IX_nn_x_10;
      LD_IX_nn_x_10: next_state = LD_IX_nn_x_11;
      LD_IX_nn_x_11: next_state = FETCH_0;

      //LD_IY_nn_x
      LD_IY_nn_x_0: next_state = LD_IY_nn_x_1;
      LD_IY_nn_x_1: next_state = LD_IY_nn_x_2;
      LD_IY_nn_x_2: next_state = LD_IY_nn_x_3;
      LD_IY_nn_x_3: next_state = LD_IY_nn_x_4;
      LD_IY_nn_x_4: next_state = LD_IY_nn_x_5;
      LD_IY_nn_x_5: next_state = LD_IY_nn_x_6;
      LD_IY_nn_x_6: next_state = LD_IY_nn_x_7;
      LD_IY_nn_x_7: next_state = LD_IY_nn_x_8;
      LD_IY_nn_x_8: next_state = LD_IY_nn_x_9;
      LD_IY_nn_x_9: next_state = LD_IY_nn_x_10;
      LD_IY_nn_x_10: next_state = LD_IY_nn_x_11;
      LD_IY_nn_x_11: next_state = FETCH_0;

      //LD_nn_x_HL
      LD_nn_x_HL_0: next_state = LD_nn_x_HL_1;
      LD_nn_x_HL_1: next_state = LD_nn_x_HL_2;
      LD_nn_x_HL_2: next_state = LD_nn_x_HL_3;
      LD_nn_x_HL_3: next_state = LD_nn_x_HL_4;
      LD_nn_x_HL_4: next_state = LD_nn_x_HL_5;
      LD_nn_x_HL_5: next_state = LD_nn_x_HL_6;
      LD_nn_x_HL_6: next_state = LD_nn_x_HL_7;
      LD_nn_x_HL_7: next_state = LD_nn_x_HL_8;
      LD_nn_x_HL_8: next_state = LD_nn_x_HL_9;
      LD_nn_x_HL_9: next_state = LD_nn_x_HL_10;
      LD_nn_x_HL_10: next_state = LD_nn_x_HL_11;
      LD_nn_x_HL_11: next_state = FETCH_0;

      //LD_nn_x_dd
      LD_nn_x_dd_0: next_state = LD_nn_x_dd_1;
      LD_nn_x_dd_1: next_state = LD_nn_x_dd_2;
      LD_nn_x_dd_2: next_state = LD_nn_x_dd_3;
      LD_nn_x_dd_3: next_state = LD_nn_x_dd_4;
      LD_nn_x_dd_4: next_state = LD_nn_x_dd_5;
      LD_nn_x_dd_5: next_state = LD_nn_x_dd_6;
      LD_nn_x_dd_6: next_state = LD_nn_x_dd_7;
      LD_nn_x_dd_7: next_state = LD_nn_x_dd_8;
      LD_nn_x_dd_8: next_state = LD_nn_x_dd_9;
      LD_nn_x_dd_9: next_state = LD_nn_x_dd_10;
      LD_nn_x_dd_10: next_state = LD_nn_x_dd_11;
      LD_nn_x_dd_11: next_state = FETCH_0;

      //LD_nn_x_IX
      LD_nn_x_IX_0: next_state = LD_nn_x_IX_1;
      LD_nn_x_IX_1: next_state = LD_nn_x_IX_2;
      LD_nn_x_IX_2: next_state = LD_nn_x_IX_3;
      LD_nn_x_IX_3: next_state = LD_nn_x_IX_4;
      LD_nn_x_IX_4: next_state = LD_nn_x_IX_5;
      LD_nn_x_IX_5: next_state = LD_nn_x_IX_6;
      LD_nn_x_IX_6: next_state = LD_nn_x_IX_7;
      LD_nn_x_IX_7: next_state = LD_nn_x_IX_8;
      LD_nn_x_IX_8: next_state = LD_nn_x_IX_9;
      LD_nn_x_IX_9: next_state = LD_nn_x_IX_10;
      LD_nn_x_IX_10: next_state = LD_nn_x_IX_11;
      LD_nn_x_IX_11: next_state = FETCH_0;

      //LD_nn_x_IY
      LD_nn_x_IY_0: next_state = LD_nn_x_IY_1;
      LD_nn_x_IY_1: next_state = LD_nn_x_IY_2;
      LD_nn_x_IY_2: next_state = LD_nn_x_IY_3;
      LD_nn_x_IY_3: next_state = LD_nn_x_IY_4;
      LD_nn_x_IY_4: next_state = LD_nn_x_IY_5;
      LD_nn_x_IY_5: next_state = LD_nn_x_IY_6;
      LD_nn_x_IY_6: next_state = LD_nn_x_IY_7;
      LD_nn_x_IY_7: next_state = LD_nn_x_IY_8;
      LD_nn_x_IY_8: next_state = LD_nn_x_IY_9;
      LD_nn_x_IY_9: next_state = LD_nn_x_IY_10;
      LD_nn_x_IY_10: next_state = LD_nn_x_IY_11;
      LD_nn_x_IY_11: next_state = FETCH_0;

      //LD_SP_HL
      LD_SP_HL_0: next_state = LD_SP_HL_1;
      LD_SP_HL_1: next_state = FETCH_0;

      //LD_SP_IX
      LD_SP_IX_0: next_state = LD_SP_IX_1;
      LD_SP_IX_1: next_state = FETCH_0;

      //LD_SP_IY
      LD_SP_IY_0: next_state = LD_SP_IY_1;
      LD_SP_IY_1: next_state = FETCH_0;

      //PUSH_qq
      PUSH_qq_0: next_state = PUSH_qq_1;
      PUSH_qq_1: next_state = PUSH_qq_2;
      PUSH_qq_2: next_state = PUSH_qq_3;
      PUSH_qq_3: next_state = PUSH_qq_4;
      PUSH_qq_4: next_state = PUSH_qq_5;
      PUSH_qq_5: next_state = PUSH_qq_6;
      PUSH_qq_6: next_state = FETCH_0;

      //PUSH_IX
      PUSH_IX_0: next_state = PUSH_IX_1;
      PUSH_IX_1: next_state = PUSH_IX_2;
      PUSH_IX_2: next_state = PUSH_IX_3;
      PUSH_IX_3: next_state = PUSH_IX_4;
      PUSH_IX_4: next_state = PUSH_IX_5;
      PUSH_IX_5: next_state = PUSH_IX_6;
      PUSH_IX_6: next_state = FETCH_0;

      //PUSH_IY
      PUSH_IY_0: next_state = PUSH_IY_1;
      PUSH_IY_1: next_state = PUSH_IY_2;
      PUSH_IY_2: next_state = PUSH_IY_3;
      PUSH_IY_3: next_state = PUSH_IY_4;
      PUSH_IY_4: next_state = PUSH_IY_5;
      PUSH_IY_5: next_state = PUSH_IY_6;
      PUSH_IY_6: next_state = FETCH_0;

      //POP_qq
      POP_qq_0: next_state = POP_qq_1;
      POP_qq_1: next_state = POP_qq_2;
      POP_qq_2: next_state = POP_qq_3;
      POP_qq_3: next_state = POP_qq_4;
      POP_qq_4: next_state = POP_qq_5;
      POP_qq_5: next_state = FETCH_0;

      //POP_IX
      POP_IX_0: next_state = POP_IX_1;
      POP_IX_1: next_state = POP_IX_2;
      POP_IX_2: next_state = POP_IX_3;
      POP_IX_3: next_state = POP_IX_4;
      POP_IX_4: next_state = POP_IX_5;
      POP_IX_5: next_state = FETCH_0;

      //POP_IY
      POP_IY_0: next_state = POP_IY_1;
      POP_IY_1: next_state = POP_IY_2;
      POP_IY_2: next_state = POP_IY_3;
      POP_IY_3: next_state = POP_IY_4;
      POP_IY_4: next_state = POP_IY_5;
      POP_IY_5: next_state = FETCH_0;

      //-----------------------------------------------------------------------
      //END 16-bit load group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN EXCHANGE, BLOCK TRANSFER GROUP
      //-----------------------------------------------------------------------

      //EX_DE_HL
      EX_DE_HL_0: next_state = FETCH_0;

      //EX_AF_AF
      EX_AF_AF_0: next_state = FETCH_0;

      //EXX
      EXX_0: next_state = FETCH_0;

      //EX_SP_HL
      EX_SP_HL_0: next_state = EX_SP_HL_1;
      EX_SP_HL_1: next_state = EX_SP_HL_2;
      EX_SP_HL_2: next_state = EX_SP_HL_3;
      EX_SP_HL_3: next_state = EX_SP_HL_4;
      EX_SP_HL_4: next_state = EX_SP_HL_5;
      EX_SP_HL_5: next_state = EX_SP_HL_6;
      EX_SP_HL_6: next_state = EX_SP_HL_7;
      EX_SP_HL_7: next_state = EX_SP_HL_8;
      EX_SP_HL_8: next_state = EX_SP_HL_9;
      EX_SP_HL_9: next_state = EX_SP_HL_10;
      EX_SP_HL_10: next_state = EX_SP_HL_11;
      EX_SP_HL_11: next_state = EX_SP_HL_12;
      EX_SP_HL_12: next_state = EX_SP_HL_13;
      EX_SP_HL_13: next_state = EX_SP_HL_14;
      EX_SP_HL_14: next_state = FETCH_0;

      //EX_SP_IX
      EX_SP_IX_0: next_state = EX_SP_IX_1;
      EX_SP_IX_1: next_state = EX_SP_IX_2;
      EX_SP_IX_2: next_state = EX_SP_IX_3;
      EX_SP_IX_3: next_state = EX_SP_IX_4;
      EX_SP_IX_4: next_state = EX_SP_IX_5;
      EX_SP_IX_5: next_state = EX_SP_IX_6;
      EX_SP_IX_6: next_state = EX_SP_IX_7;
      EX_SP_IX_7: next_state = EX_SP_IX_8;
      EX_SP_IX_8: next_state = EX_SP_IX_9;
      EX_SP_IX_9: next_state = EX_SP_IX_10;
      EX_SP_IX_10: next_state = EX_SP_IX_11;
      EX_SP_IX_11: next_state = EX_SP_IX_12;
      EX_SP_IX_12: next_state = EX_SP_IX_13;
      EX_SP_IX_13: next_state = EX_SP_IX_14;
      EX_SP_IX_14: next_state = FETCH_0;

      //EX_SP_IY
      EX_SP_IY_0: next_state = EX_SP_IY_1;
      EX_SP_IY_1: next_state = EX_SP_IY_2;
      EX_SP_IY_2: next_state = EX_SP_IY_3;
      EX_SP_IY_3: next_state = EX_SP_IY_4;
      EX_SP_IY_4: next_state = EX_SP_IY_5;
      EX_SP_IY_5: next_state = EX_SP_IY_6;
      EX_SP_IY_6: next_state = EX_SP_IY_7;
      EX_SP_IY_7: next_state = EX_SP_IY_8;
      EX_SP_IY_8: next_state = EX_SP_IY_9;
      EX_SP_IY_9: next_state = EX_SP_IY_10;
      EX_SP_IY_10: next_state = EX_SP_IY_11;
      EX_SP_IY_11: next_state = EX_SP_IY_12;
      EX_SP_IY_12: next_state = EX_SP_IY_13;
      EX_SP_IY_13: next_state = EX_SP_IY_14;
      EX_SP_IY_14: next_state = FETCH_0;

      //LDI
      LDI_0: next_state = LDI_1;
      LDI_1: next_state = LDI_2;
      LDI_2: next_state = LDI_3;
      LDI_3: next_state = LDI_4;
      LDI_4: next_state = LDI_5;
      LDI_5: next_state = LDI_6;
      LDI_6: next_state = LDI_7;
      LDI_7: next_state = FETCH_0;

      //LDIR
      LDIR_0: next_state = LDIR_1;
      LDIR_1: next_state = LDIR_2;
      LDIR_2: next_state = LDIR_3;
      LDIR_3: next_state = LDIR_4;
      LDIR_4: next_state = LDIR_5;
      LDIR_5: next_state = LDIR_6;
      LDIR_6: next_state = LDIR_7;
      LDIR_7: next_state  = (flags[ `PV_flag ] == 0) ? FETCH_0 : LDIR_8;
      LDIR_8: next_state  = LDIR_9;
      LDIR_9: next_state  = LDIR_10;
      LDIR_10: next_state = LDIR_11;
      LDIR_11: next_state = LDIR_12;
      LDIR_12: next_state = FETCH_0;

      //LDD
      LDD_0: next_state = LDD_1;
      LDD_1: next_state = LDD_2;
      LDD_2: next_state = LDD_3;
      LDD_3: next_state = LDD_4;
      LDD_4: next_state = LDD_5;
      LDD_5: next_state = LDD_6;
      LDD_6: next_state = LDD_7;
      LDD_7: next_state = FETCH_0;

      //LDDR
      LDDR_0: next_state = LDDR_1;
      LDDR_1: next_state = LDDR_2;
      LDDR_2: next_state = LDDR_3;
      LDDR_3: next_state = LDDR_4;
      LDDR_4: next_state = LDDR_5;
      LDDR_5: next_state = LDDR_6;
      LDDR_6: next_state = LDDR_7;
      LDDR_7: next_state  = (flags[ `PV_flag ] == 0) ? FETCH_0 : LDDR_8;
      LDDR_8: next_state  = LDDR_9;
      LDDR_9: next_state  = LDDR_10;
      LDDR_10: next_state = LDDR_11;
      LDDR_11: next_state = LDDR_12;
      LDDR_12: next_state = FETCH_0;

      //CPI
      CPI_0: next_state = CPI_1;
      CPI_1: next_state = CPI_2;
      CPI_2: next_state = CPI_3;
      CPI_3: next_state = CPI_4;
      CPI_4: next_state = CPI_5;
      CPI_5: next_state = CPI_6;
      CPI_6: next_state = CPI_7;
      CPI_7: next_state = FETCH_0;

      //CPIR
      CPIR_0: next_state = CPIR_1;
      CPIR_1: next_state = CPIR_2;
      CPIR_2: next_state = CPIR_3;
      CPIR_3: next_state = CPIR_4;
      CPIR_4: next_state = CPIR_5;
      CPIR_5: next_state = CPIR_6;
      CPIR_6: next_state = CPIR_7;
      CPIR_7: next_state  = (~flags[`PV_flag] == 0 | flags[`Z_flag]) ? FETCH_0 : CPIR_8;
      CPIR_8: next_state  = CPIR_9;
      CPIR_9: next_state  = CPIR_10;
      CPIR_10: next_state = CPIR_11;
      CPIR_11: next_state = CPIR_12;
      CPIR_12: next_state = FETCH_0;

      //CPD
      CPD_0: next_state = CPD_1;
      CPD_1: next_state = CPD_2;
      CPD_2: next_state = CPD_3;
      CPD_3: next_state = CPD_4;
      CPD_4: next_state = CPD_5;
      CPD_5: next_state = CPD_6;
      CPD_6: next_state = CPD_7;
      CPD_7: next_state = FETCH_0;

      //CPDR
      CPDR_0: next_state = CPDR_1;
      CPDR_1: next_state = CPDR_2;
      CPDR_2: next_state = CPDR_3;
      CPDR_3: next_state = CPDR_4;
      CPDR_4: next_state = CPDR_5;
      CPDR_5: next_state = CPDR_6;
      CPDR_6: next_state = CPDR_7;
      CPDR_7: next_state  = (~flags[`PV_flag] == 0 | flags[`Z_flag]) ? FETCH_0 : CPDR_8;
      CPDR_8: next_state  = CPDR_9;
      CPDR_9: next_state  = CPDR_10;
      CPDR_10: next_state = CPDR_11;
      CPDR_11: next_state = CPDR_12;
      CPDR_12: next_state = FETCH_0;

      //-----------------------------------------------------------------------
      //END EXCHANGE, BLOCK TRANSFER GROUP
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN 8-bit arithmetic group
      //-----------------------------------------------------------------------

      //ADD_A_r
      ADD_A_r_0: next_state = FETCH_0;

      //ADD_A_n
      ADD_A_n_0: next_state = ADD_A_n_1;
      ADD_A_n_1: next_state = ADD_A_n_2;
      ADD_A_n_2: next_state = FETCH_0;

      //ADD_A_HL
      ADD_A_HL_0: next_state = ADD_A_HL_1;
      ADD_A_HL_1: next_state = ADD_A_HL_2;
      ADD_A_HL_2: next_state = FETCH_0;

      //ADD_A_IX_d
      ADD_A_IX_d_0: next_state = ADD_A_IX_d_1;
      ADD_A_IX_d_1: next_state = ADD_A_IX_d_2;
      ADD_A_IX_d_2: next_state = ADD_A_IX_d_3;
      ADD_A_IX_d_3: next_state = ADD_A_IX_d_4;
      ADD_A_IX_d_4: next_state = ADD_A_IX_d_5;
      ADD_A_IX_d_5: next_state = ADD_A_IX_d_6;
      ADD_A_IX_d_6: next_state = ADD_A_IX_d_7;
      ADD_A_IX_d_7: next_state = ADD_A_IX_d_8;
      ADD_A_IX_d_8: next_state = ADD_A_IX_d_9;
      ADD_A_IX_d_9: next_state = ADD_A_IX_d_10;
      ADD_A_IX_d_10: next_state = FETCH_0;

      //ADD_A_IY_d
      ADD_A_IY_d_0: next_state = ADD_A_IY_d_1;
      ADD_A_IY_d_1: next_state = ADD_A_IY_d_2;
      ADD_A_IY_d_2: next_state = ADD_A_IY_d_3;
      ADD_A_IY_d_3: next_state = ADD_A_IY_d_4;
      ADD_A_IY_d_4: next_state = ADD_A_IY_d_5;
      ADD_A_IY_d_5: next_state = ADD_A_IY_d_6;
      ADD_A_IY_d_6: next_state = ADD_A_IY_d_7;
      ADD_A_IY_d_7: next_state = ADD_A_IY_d_8;
      ADD_A_IY_d_8: next_state = ADD_A_IY_d_9;
      ADD_A_IY_d_9: next_state = ADD_A_IY_d_10;
      ADD_A_IY_d_10: next_state = FETCH_0;

      //ADC_A_r
      ADC_A_r_0: next_state = FETCH_0;

      //ADC_A_n
      ADC_A_n_0: next_state = ADC_A_n_1;
      ADC_A_n_1: next_state = ADC_A_n_2;
      ADC_A_n_2: next_state = FETCH_0;

      //ADC_A_HL
      ADC_A_HL_0: next_state = ADC_A_HL_1;
      ADC_A_HL_1: next_state = ADC_A_HL_2;
      ADC_A_HL_2: next_state = FETCH_0;

      //ADC_A_IX_d
      ADC_A_IX_d_0: next_state = ADC_A_IX_d_1;
      ADC_A_IX_d_1: next_state = ADC_A_IX_d_2;
      ADC_A_IX_d_2: next_state = ADC_A_IX_d_3;
      ADC_A_IX_d_3: next_state = ADC_A_IX_d_4;
      ADC_A_IX_d_4: next_state = ADC_A_IX_d_5;
      ADC_A_IX_d_5: next_state = ADC_A_IX_d_6;
      ADC_A_IX_d_6: next_state = ADC_A_IX_d_7;
      ADC_A_IX_d_7: next_state = ADC_A_IX_d_8;
      ADC_A_IX_d_8: next_state = ADC_A_IX_d_9;
      ADC_A_IX_d_9: next_state = ADC_A_IX_d_10;
      ADC_A_IX_d_10: next_state = FETCH_0;

      //ADC_A_IY_d
      ADC_A_IY_d_0: next_state = ADC_A_IY_d_1;
      ADC_A_IY_d_1: next_state = ADC_A_IY_d_2;
      ADC_A_IY_d_2: next_state = ADC_A_IY_d_3;
      ADC_A_IY_d_3: next_state = ADC_A_IY_d_4;
      ADC_A_IY_d_4: next_state = ADC_A_IY_d_5;
      ADC_A_IY_d_5: next_state = ADC_A_IY_d_6;
      ADC_A_IY_d_6: next_state = ADC_A_IY_d_7;
      ADC_A_IY_d_7: next_state = ADC_A_IY_d_8;
      ADC_A_IY_d_8: next_state = ADC_A_IY_d_9;
      ADC_A_IY_d_9: next_state = ADC_A_IY_d_10;
      ADC_A_IY_d_10: next_state = FETCH_0;

      //SUB_r
      SUB_r_0: next_state = FETCH_0;

      //SUB_n
      SUB_n_0: next_state = SUB_n_1;
      SUB_n_1: next_state = SUB_n_2;
      SUB_n_2: next_state = FETCH_0;

      //SUB_HL
      SUB_HL_0: next_state = SUB_HL_1;
      SUB_HL_1: next_state = SUB_HL_2;
      SUB_HL_2: next_state = FETCH_0;

      //SUB_IX_d
      SUB_IX_d_0: next_state = SUB_IX_d_1;
      SUB_IX_d_1: next_state = SUB_IX_d_2;
      SUB_IX_d_2: next_state = SUB_IX_d_3;
      SUB_IX_d_3: next_state = SUB_IX_d_4;
      SUB_IX_d_4: next_state = SUB_IX_d_5;
      SUB_IX_d_5: next_state = SUB_IX_d_6;
      SUB_IX_d_6: next_state = SUB_IX_d_7;
      SUB_IX_d_7: next_state = SUB_IX_d_8;
      SUB_IX_d_8: next_state = SUB_IX_d_9;
      SUB_IX_d_9: next_state = SUB_IX_d_10;
      SUB_IX_d_10: next_state = FETCH_0;

      //SUB_IY_d
      SUB_IY_d_0: next_state = SUB_IY_d_1;
      SUB_IY_d_1: next_state = SUB_IY_d_2;
      SUB_IY_d_2: next_state = SUB_IY_d_3;
      SUB_IY_d_3: next_state = SUB_IY_d_4;
      SUB_IY_d_4: next_state = SUB_IY_d_5;
      SUB_IY_d_5: next_state = SUB_IY_d_6;
      SUB_IY_d_6: next_state = SUB_IY_d_7;
      SUB_IY_d_7: next_state = SUB_IY_d_8;
      SUB_IY_d_8: next_state = SUB_IY_d_9;
      SUB_IY_d_9: next_state = SUB_IY_d_10;
      SUB_IY_d_10: next_state = FETCH_0;

      //SBC_r
      SBC_r_0: next_state = FETCH_0;

      //SBC_n
      SBC_n_0: next_state = SBC_n_1;
      SBC_n_1: next_state = SBC_n_2;
      SBC_n_2: next_state = FETCH_0;

      //SBC_HL
      SBC_HL_0: next_state = SBC_HL_1;
      SBC_HL_1: next_state = SBC_HL_2;
      SBC_HL_2: next_state = FETCH_0;

      //SBC_IX_d
      SBC_IX_d_0: next_state = SBC_IX_d_1;
      SBC_IX_d_1: next_state = SBC_IX_d_2;
      SBC_IX_d_2: next_state = SBC_IX_d_3;
      SBC_IX_d_3: next_state = SBC_IX_d_4;
      SBC_IX_d_4: next_state = SBC_IX_d_5;
      SBC_IX_d_5: next_state = SBC_IX_d_6;
      SBC_IX_d_6: next_state = SBC_IX_d_7;
      SBC_IX_d_7: next_state = SBC_IX_d_8;
      SBC_IX_d_8: next_state = SBC_IX_d_9;
      SBC_IX_d_9: next_state = SBC_IX_d_10;
      SBC_IX_d_10: next_state = FETCH_0;

      //SBC_IY_d
      SBC_IY_d_0: next_state = SBC_IY_d_1;
      SBC_IY_d_1: next_state = SBC_IY_d_2;
      SBC_IY_d_2: next_state = SBC_IY_d_3;
      SBC_IY_d_3: next_state = SBC_IY_d_4;
      SBC_IY_d_4: next_state = SBC_IY_d_5;
      SBC_IY_d_5: next_state = SBC_IY_d_6;
      SBC_IY_d_6: next_state = SBC_IY_d_7;
      SBC_IY_d_7: next_state = SBC_IY_d_8;
      SBC_IY_d_8: next_state = SBC_IY_d_9;
      SBC_IY_d_9: next_state = SBC_IY_d_10;
      SBC_IY_d_10: next_state = FETCH_0;

      //AND_r
      AND_r_0: next_state = FETCH_0;

      //AND_n
      AND_n_0: next_state = AND_n_1;
      AND_n_1: next_state = AND_n_2;
      AND_n_2: next_state = FETCH_0;

      //AND_HL
      AND_HL_0: next_state = AND_HL_1;
      AND_HL_1: next_state = AND_HL_2;
      AND_HL_2: next_state = FETCH_0;

      //AND_IX_d
      AND_IX_d_0: next_state = AND_IX_d_1;
      AND_IX_d_1: next_state = AND_IX_d_2;
      AND_IX_d_2: next_state = AND_IX_d_3;
      AND_IX_d_3: next_state = AND_IX_d_4;
      AND_IX_d_4: next_state = AND_IX_d_5;
      AND_IX_d_5: next_state = AND_IX_d_6;
      AND_IX_d_6: next_state = AND_IX_d_7;
      AND_IX_d_7: next_state = AND_IX_d_8;
      AND_IX_d_8: next_state = AND_IX_d_9;
      AND_IX_d_9: next_state = AND_IX_d_10;
      AND_IX_d_10: next_state = FETCH_0;

      //AND_IY_d
      AND_IY_d_0: next_state = AND_IY_d_1;
      AND_IY_d_1: next_state = AND_IY_d_2;
      AND_IY_d_2: next_state = AND_IY_d_3;
      AND_IY_d_3: next_state = AND_IY_d_4;
      AND_IY_d_4: next_state = AND_IY_d_5;
      AND_IY_d_5: next_state = AND_IY_d_6;
      AND_IY_d_6: next_state = AND_IY_d_7;
      AND_IY_d_7: next_state = AND_IY_d_8;
      AND_IY_d_8: next_state = AND_IY_d_9;
      AND_IY_d_9: next_state = AND_IY_d_10;
      AND_IY_d_10: next_state = FETCH_0;

      //OR_r
      OR_r_0: next_state = FETCH_0;

      //OR_n
      OR_n_0: next_state = OR_n_1;
      OR_n_1: next_state = OR_n_2;
      OR_n_2: next_state = FETCH_0;

      //OR_HL
      OR_HL_0: next_state = OR_HL_1;
      OR_HL_1: next_state = OR_HL_2;
      OR_HL_2: next_state = FETCH_0;

      //OR_IX_d
      OR_IX_d_0: next_state = OR_IX_d_1;
      OR_IX_d_1: next_state = OR_IX_d_2;
      OR_IX_d_2: next_state = OR_IX_d_3;
      OR_IX_d_3: next_state = OR_IX_d_4;
      OR_IX_d_4: next_state = OR_IX_d_5;
      OR_IX_d_5: next_state = OR_IX_d_6;
      OR_IX_d_6: next_state = OR_IX_d_7;
      OR_IX_d_7: next_state = OR_IX_d_8;
      OR_IX_d_8: next_state = OR_IX_d_9;
      OR_IX_d_9: next_state = OR_IX_d_10;
      OR_IX_d_10: next_state = FETCH_0;

      //OR_IY_d
      OR_IY_d_0: next_state = OR_IY_d_1;
      OR_IY_d_1: next_state = OR_IY_d_2;
      OR_IY_d_2: next_state = OR_IY_d_3;
      OR_IY_d_3: next_state = OR_IY_d_4;
      OR_IY_d_4: next_state = OR_IY_d_5;
      OR_IY_d_5: next_state = OR_IY_d_6;
      OR_IY_d_6: next_state = OR_IY_d_7;
      OR_IY_d_7: next_state = OR_IY_d_8;
      OR_IY_d_8: next_state = OR_IY_d_9;
      OR_IY_d_9: next_state = OR_IY_d_10;
      OR_IY_d_10: next_state = FETCH_0;

      //XOR_r
      XOR_r_0: next_state = FETCH_0;

      //XOR_n
      XOR_n_0: next_state = XOR_n_1;
      XOR_n_1: next_state = XOR_n_2;
      XOR_n_2: next_state = FETCH_0;

      //XOR_HL
      XOR_HL_0: next_state = XOR_HL_1;
      XOR_HL_1: next_state = XOR_HL_2;
      XOR_HL_2: next_state = FETCH_0;

      //XOR_IX_d
      XOR_IX_d_0: next_state = XOR_IX_d_1;
      XOR_IX_d_1: next_state = XOR_IX_d_2;
      XOR_IX_d_2: next_state = XOR_IX_d_3;
      XOR_IX_d_3: next_state = XOR_IX_d_4;
      XOR_IX_d_4: next_state = XOR_IX_d_5;
      XOR_IX_d_5: next_state = XOR_IX_d_6;
      XOR_IX_d_6: next_state = XOR_IX_d_7;
      XOR_IX_d_7: next_state = XOR_IX_d_8;
      XOR_IX_d_8: next_state = XOR_IX_d_9;
      XOR_IX_d_9: next_state = XOR_IX_d_10;
      XOR_IX_d_10: next_state = FETCH_0;

      //XOR_IY_d
      XOR_IY_d_0: next_state = XOR_IY_d_1;
      XOR_IY_d_1: next_state = XOR_IY_d_2;
      XOR_IY_d_2: next_state = XOR_IY_d_3;
      XOR_IY_d_3: next_state = XOR_IY_d_4;
      XOR_IY_d_4: next_state = XOR_IY_d_5;
      XOR_IY_d_5: next_state = XOR_IY_d_6;
      XOR_IY_d_6: next_state = XOR_IY_d_7;
      XOR_IY_d_7: next_state = XOR_IY_d_8;
      XOR_IY_d_8: next_state = XOR_IY_d_9;
      XOR_IY_d_9: next_state = XOR_IY_d_10;
      XOR_IY_d_10: next_state = FETCH_0;

      //CP_r
      CP_r_0: next_state = FETCH_0;

      //CP_n
      CP_n_0: next_state = CP_n_1;
      CP_n_1: next_state = CP_n_2;
      CP_n_2: next_state = FETCH_0;

      //CP_HL
      CP_HL_0: next_state = CP_HL_1;
      CP_HL_1: next_state = CP_HL_2;
      CP_HL_2: next_state = FETCH_0;

      //CP_IX_d
      CP_IX_d_0: next_state = CP_IX_d_1;
      CP_IX_d_1: next_state = CP_IX_d_2;
      CP_IX_d_2: next_state = CP_IX_d_3;
      CP_IX_d_3: next_state = CP_IX_d_4;
      CP_IX_d_4: next_state = CP_IX_d_5;
      CP_IX_d_5: next_state = CP_IX_d_6;
      CP_IX_d_6: next_state = CP_IX_d_7;
      CP_IX_d_7: next_state = CP_IX_d_8;
      CP_IX_d_8: next_state = CP_IX_d_9;
      CP_IX_d_9: next_state = CP_IX_d_10;
      CP_IX_d_10: next_state = FETCH_0;

      //CP_IY_d
      CP_IY_d_0: next_state = CP_IY_d_1;
      CP_IY_d_1: next_state = CP_IY_d_2;
      CP_IY_d_2: next_state = CP_IY_d_3;
      CP_IY_d_3: next_state = CP_IY_d_4;
      CP_IY_d_4: next_state = CP_IY_d_5;
      CP_IY_d_5: next_state = CP_IY_d_6;
      CP_IY_d_6: next_state = CP_IY_d_7;
      CP_IY_d_7: next_state = CP_IY_d_8;
      CP_IY_d_8: next_state = CP_IY_d_9;
      CP_IY_d_9: next_state = CP_IY_d_10;
      CP_IY_d_10: next_state = FETCH_0;

      //INC_r
      INC_r_0: next_state = FETCH_0;

      //INC_HL
      INC_HL_0: next_state = INC_HL_1;
      INC_HL_1: next_state = INC_HL_2;
      INC_HL_2: next_state = INC_HL_3;
      INC_HL_3: next_state = INC_HL_4;
      INC_HL_4: next_state = INC_HL_5;
      INC_HL_5: next_state = INC_HL_6;
      INC_HL_6: next_state = FETCH_0;

      //INC_IX_d
      INC_IX_d_0: next_state = INC_IX_d_1;
      INC_IX_d_1: next_state = INC_IX_d_2;
      INC_IX_d_2: next_state = INC_IX_d_3;
      INC_IX_d_3: next_state = INC_IX_d_4;
      INC_IX_d_4: next_state = INC_IX_d_5;
      INC_IX_d_5: next_state = INC_IX_d_6;
      INC_IX_d_6: next_state = INC_IX_d_7;
      INC_IX_d_7: next_state = INC_IX_d_8;
      INC_IX_d_8: next_state = INC_IX_d_9;
      INC_IX_d_9: next_state = INC_IX_d_10;
      INC_IX_d_10: next_state = INC_IX_d_11;
      INC_IX_d_11: next_state = INC_IX_d_12;
      INC_IX_d_12: next_state = INC_IX_d_13;
      INC_IX_d_13: next_state = INC_IX_d_14;
      INC_IX_d_14: next_state = FETCH_0;

      //INC_IY_d
      INC_IY_d_0: next_state = INC_IY_d_1;
      INC_IY_d_1: next_state = INC_IY_d_2;
      INC_IY_d_2: next_state = INC_IY_d_3;
      INC_IY_d_3: next_state = INC_IY_d_4;
      INC_IY_d_4: next_state = INC_IY_d_5;
      INC_IY_d_5: next_state = INC_IY_d_6;
      INC_IY_d_6: next_state = INC_IY_d_7;
      INC_IY_d_7: next_state = INC_IY_d_8;
      INC_IY_d_8: next_state = INC_IY_d_9;
      INC_IY_d_9: next_state = INC_IY_d_10;
      INC_IY_d_10: next_state = INC_IY_d_11;
      INC_IY_d_11: next_state = INC_IY_d_12;
      INC_IY_d_12: next_state = INC_IY_d_13;
      INC_IY_d_13: next_state = INC_IY_d_14;
      INC_IY_d_14: next_state = FETCH_0;

      //-----------------------------------------------------------------------
      //END 8-bit arithmetic group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN 16-bit arithmetic group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //END 16-bit arithmetic group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN General Purpose Arith and CPU Control
      //-----------------------------------------------------------------------

      //CPL
      CPL_0: next_state = FETCH_0;

      //CCF
      CCF_0: next_state = FETCH_0;

      //SCF
      SCF_0: next_state = FETCH_0;

      //NOP
      NOP_0: next_state = FETCH_0;

      //-----------------------------------------------------------------------
      //END General Purpose Arith and CPU Control
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Bit Set, Rst, and Test group
      //-----------------------------------------------------------------------

      //BIT_b_r
      BIT_b_r_0: next_state = BIT_b_r_1;
      BIT_b_r_1: next_state = BIT_b_r_2;
      BIT_b_r_2: next_state = BIT_b_r_3;

      BIT_b_r_3: next_state = ((op1[2:0] == 3'b110) ? BIT_b_HL_x_0 : FETCH_0);

      //BIT_b_HL_x
      BIT_b_HL_x_0: next_state = BIT_b_HL_x_1;
      BIT_b_HL_x_1: next_state = BIT_b_HL_x_2;
      BIT_b_HL_x_2: next_state = BIT_b_HL_x_3;

      BIT_b_HL_x_3: next_state = ((op1[7:6] != 2'b01) ? SET_b_HL_x_0 : FETCH_0);

      //SET_b_HL_x
      SET_b_HL_x_0: next_state = SET_b_HL_x_1;
      SET_b_HL_x_1: next_state = SET_b_HL_x_2;
      SET_b_HL_x_2: next_state = FETCH_0;

      //BIT_b_IX_d_x
      BIT_b_IX_d_x_0: next_state = BIT_b_IX_d_x_1;
      BIT_b_IX_d_x_1: next_state = BIT_b_IX_d_x_2;
      BIT_b_IX_d_x_2: next_state = BIT_b_IX_d_x_3;
      BIT_b_IX_d_x_3: next_state = BIT_b_IX_d_x_4;
      BIT_b_IX_d_x_4: next_state = BIT_b_IX_d_x_5;
      BIT_b_IX_d_x_5: next_state = BIT_b_IX_d_x_6;
      BIT_b_IX_d_x_6: next_state = BIT_b_IX_d_x_7;
      BIT_b_IX_d_x_7: next_state = BIT_b_IX_d_x_8;
      BIT_b_IX_d_x_8: next_state = BIT_b_IX_d_x_9;
      BIT_b_IX_d_x_9: next_state = BIT_b_IX_d_x_10;
      BIT_b_IX_d_x_10: next_state = BIT_b_IX_d_x_11;

      BIT_b_IX_d_x_11: next_state = ((op1[7:6] != 2'b01) ? SET_b_IX_d_x_0 : FETCH_0);

      //SET_b_IX_d_x
      SET_b_IX_d_x_0: next_state = SET_b_IX_d_x_1;
      SET_b_IX_d_x_1: next_state = SET_b_IX_d_x_2;
      SET_b_IX_d_x_2: next_state = FETCH_0;

      //BIT_b_IY_d_x
      BIT_b_IY_d_x_0: next_state = BIT_b_IY_d_x_1;
      BIT_b_IY_d_x_1: next_state = BIT_b_IY_d_x_2;
      BIT_b_IY_d_x_2: next_state = BIT_b_IY_d_x_3;
      BIT_b_IY_d_x_3: next_state = BIT_b_IY_d_x_4;
      BIT_b_IY_d_x_4: next_state = BIT_b_IY_d_x_5;
      BIT_b_IY_d_x_5: next_state = BIT_b_IY_d_x_6;
      BIT_b_IY_d_x_6: next_state = BIT_b_IY_d_x_7;
      BIT_b_IY_d_x_7: next_state = BIT_b_IY_d_x_8;
      BIT_b_IY_d_x_8: next_state = BIT_b_IY_d_x_9;
      BIT_b_IY_d_x_9: next_state = BIT_b_IY_d_x_10;
      BIT_b_IY_d_x_10: next_state = BIT_b_IY_d_x_11;

      BIT_b_IY_d_x_11: next_state = ((op1[7:6] != 2'b01) ? SET_b_IY_d_x_0 : FETCH_0);

      //SET_b_IY_d_x
      SET_b_IY_d_x_0: next_state = SET_b_IY_d_x_1;
      SET_b_IY_d_x_1: next_state = SET_b_IY_d_x_2;
      SET_b_IY_d_x_2: next_state = FETCH_0;

      //-----------------------------------------------------------------------
      //END Bit Set, Rst, and Test group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Jump group
      //-----------------------------------------------------------------------

      //JP_nn
      JP_nn_0: next_state = JP_nn_1;
      JP_nn_1: next_state = JP_nn_2;
      JP_nn_2: next_state = JP_nn_3;
      JP_nn_3: next_state = JP_nn_4;
      JP_nn_4: next_state = JP_nn_5;
      JP_nn_5: next_state = FETCH_0;

      //JP_cc_nn
      JP_cc_nn_0: next_state = JP_cc_nn_1;
      JP_cc_nn_1: next_state = JP_cc_nn_2;
      JP_cc_nn_2: next_state = JP_cc_nn_3;
      JP_cc_nn_3: next_state = JP_cc_nn_4;
      JP_cc_nn_4: next_state = JP_cc_nn_5;
      JP_cc_nn_5: next_state = FETCH_0;

      //JR_e
      JR_e_0: next_state = JR_e_1;
      JR_e_1: next_state = JR_e_2;
      JR_e_2: next_state = JR_e_3;
      JR_e_3: next_state = JR_e_4;
      JR_e_4: next_state = JR_e_5;
      JR_e_5: next_state = JR_e_6;
      JR_e_6: next_state = JR_e_7;
      JR_e_7: next_state = FETCH_0;

      //-----------------------------------------------------------------------
      //END Jump group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Call and Return group
      //-----------------------------------------------------------------------

      //CALL_nn
      CALL_nn_0: next_state = CALL_nn_1;
      CALL_nn_1: next_state = CALL_nn_2;
      CALL_nn_2: next_state = CALL_nn_3;
      CALL_nn_3: next_state = CALL_nn_4;
      CALL_nn_4: next_state = CALL_nn_5;
      CALL_nn_5: next_state = CALL_nn_6;
      CALL_nn_6: next_state = CALL_nn_7;
      CALL_nn_7: next_state = CALL_nn_8;
      CALL_nn_8: next_state = CALL_nn_9;
      CALL_nn_9: next_state = CALL_nn_10;
      CALL_nn_10: next_state = CALL_nn_11;
      CALL_nn_11: next_state = CALL_nn_12;
      CALL_nn_12: next_state = FETCH_0;

      //CALL_cc_nn
      CALL_cc_nn_0: next_state = CALL_cc_nn_1;
      CALL_cc_nn_1: next_state = CALL_cc_nn_2;
      CALL_cc_nn_2: next_state = CALL_cc_nn_3;
      CALL_cc_nn_3: next_state = CALL_cc_nn_4;
      CALL_cc_nn_4: next_state = CALL_cc_nn_5;

      CALL_cc_nn_5: begin
        unique case(op0[5:3])
          3'b000: next_state = !flags[6] ? CALL_cc_nn_6 : FETCH_0;
          3'b001: next_state =  flags[6] ? CALL_cc_nn_6 : FETCH_0;
          3'b010: next_state = !flags[0] ? CALL_cc_nn_6 : FETCH_0;
          3'b011: next_state =  flags[0] ? CALL_cc_nn_6 : FETCH_0;
          3'b100: next_state = !flags[2] ? CALL_cc_nn_6 : FETCH_0;
          3'b101: next_state =  flags[2] ? CALL_cc_nn_6 : FETCH_0;
          3'b110: next_state = !flags[7] ? CALL_cc_nn_6 : FETCH_0;
          3'b111: next_state =  flags[7] ? CALL_cc_nn_6 : FETCH_0;
        endcase
      end

      CALL_cc_nn_6: next_state = CALL_cc_nn_7;
      CALL_cc_nn_7: next_state = CALL_cc_nn_8;
      CALL_cc_nn_8: next_state = CALL_cc_nn_9;
      CALL_cc_nn_9: next_state = CALL_cc_nn_10;
      CALL_cc_nn_10: next_state = CALL_cc_nn_11;
      CALL_cc_nn_11: next_state = CALL_cc_nn_12;
      CALL_cc_nn_12: next_state = FETCH_0;

      //RET
      RET_0: next_state = RET_1;
      RET_1: next_state = RET_2;
      RET_2: next_state = RET_3;
      RET_3: next_state = RET_4;
      RET_4: next_state = RET_5;
      RET_5: next_state = FETCH_0;

      RET_cc_0: begin
        unique case(op0[5:3])
          3'b000: next_state = !flags[6] ? RET_cc_1 : FETCH_0;
          3'b001: next_state =  flags[6] ? RET_cc_1 : FETCH_0;
          3'b010: next_state = !flags[0] ? RET_cc_1 : FETCH_0;
          3'b011: next_state =  flags[0] ? RET_cc_1 : FETCH_0;
          3'b100: next_state = !flags[2] ? RET_cc_1 : FETCH_0;
          3'b101: next_state =  flags[2] ? RET_cc_1 : FETCH_0;
          3'b110: next_state = !flags[7] ? RET_cc_1 : FETCH_0;
          3'b111: next_state =  flags[7] ? RET_cc_1 : FETCH_0;
        endcase
      end

      RET_cc_1: next_state = RET_cc_2;
      RET_cc_2: next_state = RET_cc_3;
      RET_cc_3: next_state = RET_cc_4;
      RET_cc_4: next_state = RET_cc_5;
      RET_cc_5: next_state = RET_cc_6;
      RET_cc_6: next_state = FETCH_0;

      //RST_p
      RST_p_0: next_state = RST_p_1;
      RST_p_1: next_state = RST_p_2;
      RST_p_2: next_state = RST_p_3;
      RST_p_3: next_state = RST_p_4;
      RST_p_4: next_state = RST_p_5;
      RST_p_5: next_state = RST_p_6;
      RST_p_6: next_state = FETCH_0;

      //-----------------------------------------------------------------------
      //END Call and Return group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Input and Output group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //END Input and Output group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Extended instructions group
      //-----------------------------------------------------------------------

      //We need to fetch another byte to figure out which op this is,
      //so go to the second op code fetch cycle
      EXT_INST_0: next_state = FETCH_4;

      //-----------------------------------------------------------------------
      //END Extended instructions group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN IX instructions group
      //-----------------------------------------------------------------------
      IX_INST_0: next_state = FETCH_4;
      //-----------------------------------------------------------------------
      //END IX instructions group
      //-----------------------------------------------------------------------


      //-----------------------------------------------------------------------
      //BEGIN IY instructions group
      //-----------------------------------------------------------------------
      IY_INST_0: next_state = FETCH_4;
      //-----------------------------------------------------------------------
      //END IY instructions group
      //-----------------------------------------------------------------------

    endcase
  end

  //output logic
  always_comb begin

    //defaults
    OCF_start = 0;
    OCF_bus   = 0;
    MRD_start = 0;
    MRD_bus   = 0;
    MWR_start = 0;
    MWR_bus   = 0;

    //Regfile loads
    ld_B = 0;
    ld_C = 0;
    ld_D = 0;
    ld_E = 0;
    ld_H = 0;
    ld_L = 0;
    ld_IXH = 0;
    ld_IXL = 0;
    ld_IYH = 0;
    ld_IYL = 0;
    ld_SPH = 0;
    ld_SPL = 0;
    ld_PCH = 0;
    ld_PCL = 0;
    ld_STRH = 0;
    ld_STRL = 0;

    //Regfile Drives
    //Specifying two of these will cause a 16 bit drive onto the
    //addr bus and specifying one will cause an 8 bit drive onto
    //the data bus
    drive_reg_data = 0;
    drive_reg_addr = 0;
    drive_B = 0;
    drive_C = 0;
    drive_D = 0;
    drive_E = 0;
    drive_H = 0;
    drive_L = 0;
    drive_IXH = 0;
    drive_IXL = 0;
    drive_IYH = 0;
    drive_IYL = 0;
    drive_SPH = 0;
    drive_SPL = 0;
    drive_PCH = 0;
    drive_PCL = 0;
    drive_STRH = 0;
    drive_STRL = 0;

    //Accumulator and Flag loads
    //We can load the flags from either the 16-bit ALU or the
    //8-bit ALU
    ld_A = 0;
    ld_F_data = 0;
    ld_F_addr = 0;
    set_S = 0;
    set_Z = 0;
    set_H = 0;
    set_PV = 0;
    set_N = 0;
    set_C = 0;

    //Accumulator and Flag drives
    drive_A = 0;
    drive_F = 0;

    //ALU drives and controls
    alu_op = `ALU_NOP;
    drive_alu_data = 0; //8bit drive
    drive_alu_addr = 0; //16bit drive

    //Miscellaneous register controls
    switch_context = 0;
    swap_reg = 0;

    //temporary data_bus registers
    ld_MDR1 = 0;
    ld_MDR2 = 0;
    ld_TEMP = 0;
    drive_MDR1 = 0;
    drive_MDR2 = 0;
    drive_TEMP = 0;

    //temporary addr_bus registers
    ld_MARH = 0; //load upper byte of MAR
    ld_MARL = 0; //load lower byte of MAR
    ld_MARH_data = 0;
    ld_MARL_data = 0;
    drive_MAR = 0;

    case(state)

      START: begin
        drive_PCH = 1;
        drive_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op    = `ALU_NOP;
        OCF_start = 1;
        OCF_bus   = 1;
      end

      FETCH_0, FETCH_4: begin
        ld_PCH = 1;
        ld_PCL = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op    = `INCR_A_16;
        OCF_start = 1;
        OCF_bus   = 1;
      end

      FETCH_1, FETCH_5: begin
        drive_PCH = 1;
        drive_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op    = `ALU_NOP;
        OCF_bus   = 1;
      end

      FETCH_2, FETCH_6: begin
        OCF_bus = 1;
        ld_TEMP = 1; //See RST p command. Need opcode in ALU for that command
      end

      FETCH_3, FETCH_7: begin
        OCF_bus = 1;
      end


      //-----------------------------------------------------------------------
      //BEGIN 8-bit load group
      //-----------------------------------------------------------------------
      LD_r_r_0: begin

        //This opcode is not a swap, it is just a simple load from one
        //register into another

        //Destination register
        case(op0[5:3])
          3'b111: ld_A = 1;
          3'b000: ld_B = 1;
          3'b001: ld_C = 1;
          3'b010: ld_D = 1;
          3'b011: ld_E = 1;
          3'b100: ld_H = 1;
          3'b101: ld_L = 1;
        endcase

        //source register
        case(op0[2:0])
          3'b111: drive_A = 1;
          3'b000: begin drive_B = 1; drive_reg_data = 1; end
          3'b001: begin drive_C = 1; drive_reg_data = 1; end
          3'b010: begin drive_D = 1; drive_reg_data = 1; end
          3'b011: begin drive_E = 1; drive_reg_data = 1; end
          3'b100: begin drive_H = 1; drive_reg_data = 1; end
          3'b101: begin drive_L = 1; drive_reg_data = 1; end
        endcase

      end

      LD_r_n_0: begin
        //start a read
        MRD_start = 1;
        MRD_bus   = 1;

        //increment the PC and use that as the address
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH = 1;
        ld_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_r_n_1, LD_r_HL_1: begin
        //continue the read
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LD_r_n_2, LD_r_HL_2: begin
        //latch the data into the selected reg
        case(op0[5:3])
          3'b111: ld_A = 1;
          3'b000: ld_B = 1;
          3'b001: ld_C = 1;
          3'b010: ld_D = 1;
          3'b011: ld_E = 1;
          3'b100: ld_H = 1;
          3'b101: ld_L = 1;
        endcase
      end

      LD_r_HL_0: begin
        //start a read
        MRD_start = 1;
        MRD_bus   = 1;

        //use HL as the address
        drive_H = 1;
        drive_L = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `ALU_NOP;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      //LD_r_HL_1 = LD_r_n_1
      //LD_r_HL_2 = LD_r_n_2


      //LD r (IX,d)
      LD_r_IX_d_0: begin
        //start a read
        MRD_start = 1;
        MRD_bus   = 1;

        //increment the PC and use that as the address
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH = 1;
        ld_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_r_IX_d_1: begin
        //continue the read
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LD_r_IX_d_2: begin
        //latch the data into the TEMP register of the 16 bit alu
        ld_TEMP = 1;
      end

      LD_r_IX_d_3: begin
        //add the d from the bus to the IX register and drive that as
        //an address
        alu_op         = `ADD_SE_B;
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        drive_IXH      = 1;
        drive_IXL      = 1;
        ld_MARL        = 1;
        ld_MARH        = 1;

        //start a read
        MRD_start = 1;
        MRD_bus   = 1;
      end

      LD_r_IX_d_4: begin
        //continue the read
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LD_r_IX_d_5: begin
        //latch the data into the selected reg
        case(op1[5:3])
          3'b111: ld_A = 1;
          3'b000: ld_B = 1;
          3'b001: ld_C = 1;
          3'b010: ld_D = 1;
          3'b011: ld_E = 1;
          3'b100: ld_H = 1;
          3'b101: ld_L = 1;
        endcase
      end

      //the rest of the states for this opcode do nothing, our implementation
      //is faster than the original

      //LD r (IY,d)
      LD_r_IY_d_0: begin
        //start a read
        MRD_start = 1;
        MRD_bus   = 1;

        //increment the PC and use that as the address
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH = 1;
        ld_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_r_IY_d_1: begin
        //continue the read
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LD_r_IY_d_2: begin
        //latch the data into the TEMP register of the 16 bit alu
        ld_TEMP = 1;
      end

      LD_r_IY_d_3: begin
        //add the d from the bus to the IX register and drive that as
        //an address
        alu_op         = `ADD_SE_B;
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        drive_IYH      = 1;
        drive_IYL      = 1;
        ld_MARL        = 1;
        ld_MARH        = 1;

        //start a read
        MRD_start = 1;
        MRD_bus   = 1;
      end

      LD_r_IY_d_4: begin
        //continue the read
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LD_r_IY_d_5: begin
        //latch the data into the selected reg
        case(op1[5:3])
          3'b111: ld_A = 1;
          3'b000: ld_B = 1;
          3'b001: ld_C = 1;
          3'b010: ld_D = 1;
          3'b011: ld_E = 1;
          3'b100: ld_H = 1;
          3'b101: ld_L = 1;
        endcase
      end

      //the rest of the states for this opcode do nothing, our implementation
      //is faster than the original

      //LD (HL), r
      LD_HL_r_0: begin
        //start a write
        MWR_start = 1;
        MWR_bus   = 1;

        //put HL out as the address
        drive_H = 1;
        drive_L = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op = `NOP;

        //move the address into MAR
        ld_MARH = 1;
        ld_MARL = 1;
      end

      LD_HL_r_1: begin
        //continue the write from MAR with r on the data line
        drive_MAR = 1;
        MWR_bus   = 1;

        case(op0[2:0])
          3'b111: drive_A = 1;
          3'b000: begin drive_B = 1; drive_reg_data = 1; end
          3'b001: begin drive_C = 1; drive_reg_data = 1; end
          3'b010: begin drive_D = 1; drive_reg_data = 1; end
          3'b011: begin drive_E = 1; drive_reg_data = 1; end
          3'b100: begin drive_H = 1; drive_reg_data = 1; end
          3'b101: begin drive_L = 1; drive_reg_data = 1; end
        endcase
      end

      //LD_IX_d_r, LD_IY_d_r
      LD_IX_d_r_0, LD_IY_d_r_0: begin
        //start a read
        MRD_start = 1;
        MRD_bus   = 1;

        //increment the PC and use that as the address
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH = 1;
        ld_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_IX_d_r_1, LD_IY_d_r_1: begin
        //continue the read
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LD_IX_d_r_2, LD_IY_d_r_2: begin
        //latch the data into TEMP
        ld_TEMP = 1;
      end

      LD_IX_d_r_3, LD_IY_d_r_3: begin
        //add IX + d in the 16 bit alu
        drive_IXH = 1;
        drive_IXL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op = `ADD_SE_B;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      //Do nothing for the rest of this machine cycle since we can do
      //that add in a single cycle

      LD_IX_d_r_8, LD_IY_d_r_8: begin
        //start a write
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;
      end

      LD_IX_d_r_9, LD_IY_d_r_9: begin
        //continue the write
        MWR_bus = 1;
        drive_MAR = 1;
        drive_MDR1 = 1;

        //put the right register out on the databus
        case(op1[2:0])
          3'b111: drive_A = 1;
          3'b000: begin drive_B = 1; drive_reg_data = 1; end
          3'b001: begin drive_C = 1; drive_reg_data = 1; end
          3'b010: begin drive_D = 1; drive_reg_data = 1; end
          3'b011: begin drive_E = 1; drive_reg_data = 1; end
          3'b100: begin drive_H = 1; drive_reg_data = 1; end
          3'b101: begin drive_L = 1; drive_reg_data = 1; end
        endcase

      end

      //LD (HL), n
      LD_HL_n_0: begin
        //start a read
        MRD_start = 1;
        MRD_bus   = 1;

        //increment the PC and use that as the address
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH = 1;
        ld_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_HL_n_1: begin
        //continue the read
        MRD_bus = 1;
        drive_MAR = 1;
      end

      LD_HL_n_2: begin
        //latch the data into MDR1
        ld_MDR1 = 1;
      end

      LD_HL_n_3: begin
        //start a write
        MWR_start = 1;
        MWR_bus   = 1;

        //use the address as HL
        drive_H = 1;
        drive_L = 1;
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        alu_op = `ALU_NOP;
        ld_MARL = 1;
        ld_MARH = 1;

        //use the data from MDR1
        drive_MDR1 = 1;
      end

      LD_HL_n_4: begin
        //continue the write
        MWR_bus     = 1;
        drive_MAR   = 1;
        drive_MDR1  = 1;
      end

      //LD_IX_d_n, LD_IY_d_n
      LD_IX_d_n_0, LD_IY_d_n_0, LD_IX_d_n_3, LD_IY_d_n_4: begin
        //start a read
        MRD_start = 1;
        MRD_bus   = 1;

        //increment the PC and use that as the address
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH = 1;
        ld_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_IX_d_n_1, LD_IY_d_n_1, LD_IX_d_n_4, LD_IY_d_n_4: begin
        //continue the read
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LD_IX_d_n_2, LD_IY_d_n_2: begin
        //latch the data into TEMP
        ld_TEMP = 1;
      end

      LD_IX_d_n_5, LD_IY_d_n_5: begin
        //latch data into MDR1
        ld_MDR1 = 1;
      end

      LD_IX_d_n_6, LD_IY_d_n_6: begin
        //add IX + d in the 16 bit alu
        drive_IXH = 1;
        drive_IXL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op = `ADD_SE_B;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      //Do nothing for the rest of this machine cycle since we can do
      //that add in a single cycle

      LD_IX_d_n_8, LD_IY_d_n_8: begin
        //start a write
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;
        drive_MDR1 = 1;
      end

      LD_IX_d_n_9, LD_IY_d_n_9: begin
        //continue the write
        MWR_bus = 1;
        drive_MAR = 1;
        drive_MDR1 = 1;
      end

      //LD A, (BC), LD A, (DE)
      LD_A_BC_0, LD_A_DE_0: begin
        //start a read
        MRD_start = 1;
        MRD_bus   = 1;

        drive_alu_addr = 1;
        drive_reg_addr = 1;
        alu_op = `ALU_NOP;

        drive_B = (state == LD_A_BC_0);
        drive_C = (state == LD_A_BC_0);
        drive_D = (state == LD_A_DE_0);
        drive_E = (state == LD_A_DE_0);

        ld_MARH = 1;
        ld_MARL = 1;
      end

      LD_A_BC_1, LD_A_DE_1: begin
        //continue the read
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LD_A_BC_2, LD_A_DE_2: begin
        //latch the data into A
        ld_A = 1;
      end

      //LD_A_nn
      LD_A_nn_0, LD_A_nn_3: begin
        //start a read
        MRD_start = 1;
        MRD_bus   = 1;

        //increment the PC and use that as the address
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH = 1;
        ld_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `INCR_A_16;
      end

      LD_A_nn_1, LD_A_nn_4: begin
        //continue the read
        MRD_bus = 1;

        //keep the PC the same and use that as an addr
        drive_PCH = 1;
        drive_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `ALU_NOP;
      end

      LD_A_nn_2: begin
        //put HL into MAR for storage
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        alu_op = `ALU_NOP;
        drive_H = 1;
        drive_L = 1;
        ld_MARL = 1;
        ld_MARH = 1;

        //load data into L
        ld_L = 1;
      end

      LD_A_nn_5: begin
        //load data into H
        ld_H = 1;
      end

      LD_A_nn_6: begin
        //start a read
        MRD_start = 1;
        MRD_bus = 1;

        //put HL out on the addr bus
        drive_H = 1;
        drive_L = 1;
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        alu_op = `ALU_NOP;
      end

      LD_A_nn_7: begin
        //continue the RD
        MRD_bus = 1;

        //put HL out on the addr bus
        drive_H = 1;
        drive_L = 1;
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        alu_op = `ALU_NOP;

      end

      LD_A_nn_8: begin
        //restore HL to original value
        drive_MAR = 1;
        ld_H = 1;
        ld_L = 1;

        //grab A off the data bus
        ld_A = 1;
      end

      //LD (BC), A and LD(DE), A
      LD_BC_A_0, LD_DE_A_0: begin
        //start a write
        MWR_start = 1;
        MWR_bus   = 1;

        //drive the address bus with the appropriate register
        drive_B = (state == LD_BC_A_0);
        drive_C = (state == LD_BC_A_0);
        drive_D = (state == LD_DE_A_0);
        drive_E = (state == LD_DE_A_0);

        alu_op = `NOP;
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        ld_MARL = 1;
        ld_MARH = 1;

        //drive the data from the A reg
        drive_A = 1;
      end

      LD_BC_A_1, LD_DE_A_1: begin
        //continue the write
        MWR_bus   = 1;
        drive_MAR = 1;
        drive_A   = 1;
      end

      //LD_A_nn
      LD_nn_A_0, LD_nn_A_3: begin
        //start a read
        MRD_start = 1;
        MRD_bus   = 1;

        //increment the PC and use that as the address
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH = 1;
        ld_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `INCR_A_16;
      end

      LD_nn_A_1, LD_nn_A_4: begin
        //continue the read
        MRD_bus = 1;

        //keep the PC the same and use that as an addr
        drive_PCH = 1;
        drive_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `ALU_NOP;
      end

      LD_nn_A_2: begin
        //put HL into MAR for storage
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        alu_op = `ALU_NOP;
        drive_H = 1;
        drive_L = 1;
        ld_MARL = 1;
        ld_MARH = 1;

        //load data into L
        ld_L = 1;
      end

      LD_nn_A_5: begin
        //load data into H
        ld_H = 1;
      end

      LD_nn_A_6: begin
        //start a write
        MWR_start = 1;
        MWR_bus = 1;

        //put HL out on the addr bus
        drive_H = 1;
        drive_L = 1;
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        alu_op = `ALU_NOP;

        //put A out on the data bus
        drive_A = 1;
      end

      LD_nn_A_7: begin
        //continue the write
        MWR_bus = 1;

        //put HL out on the addr bus
        drive_H = 1;
        drive_L = 1;
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        alu_op = `ALU_NOP;

        //put A out on the data bus
        drive_A = 1;
      end

      LD_nn_A_8: begin
        //restore HL to original value
        drive_MAR = 1;
        ld_H = 1;
        ld_L = 1;
      end

      //-----------------------------------------------------------------------
      //END 8-bit load group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN 16-bit load group
      //-----------------------------------------------------------------------

      //LD_dd_nn
      LD_dd_nn_0, LD_dd_nn_3: begin
        ld_PCH    = 1;
        ld_PCL    = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `INCR_A_16;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      LD_dd_nn_1, LD_dd_nn_4: begin
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `ALU_NOP;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_bus = 1;
      end

      LD_dd_nn_2: begin
        case(op0[5:4])
          2'b00: ld_C = 1;
          2'b01: ld_E = 1;
          2'b10: ld_L = 1;
          2'b11: ld_SPL = 1;
        endcase
      end

      LD_dd_nn_5: begin
        case(op0[5:4])
          2'b00: ld_B = 1;
          2'b01: ld_D = 1;
          2'b10: ld_H = 1;
          2'b11: ld_SPH = 1;
        endcase
      end

      //LD_IX_nn
      LD_IX_nn_0, LD_IX_nn_3: begin
        ld_PCH    = 1;
        ld_PCL    = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `INCR_A_16;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      LD_IX_nn_1, LD_IX_nn_4: begin
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `ALU_NOP;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_bus = 1;
			end

      LD_IX_nn_2: ld_IXL = 1;
      LD_IX_nn_5: ld_IXH = 1;

      //LD_IY_nn
      LD_IY_nn_0,LD_IY_nn_3: begin
        ld_PCH    = 1;
        ld_PCL    = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `INCR_A_16;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      LD_IY_nn_1,LD_IY_nn_4: begin
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `ALU_NOP;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_bus = 1;
      end

      LD_IY_nn_2: ld_IYL = 1;
      LD_IY_nn_5: ld_IYH = 1;

      //LD_HL_nn
      LD_HL_nn_0, LD_HL_nn_3: begin
        //start a read
        MRD_start = 1;
        MRD_bus   = 1;

        //increment the PC and use that as the address
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH = 1;
        ld_PCL = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op  = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_HL_nn_1, LD_HL_nn_4: begin
        //continue the read
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LD_HL_nn_2: begin
        //put the value from the read into L
        ld_L = 1;
      end


      LD_HL_nn_5: begin
        //put the value from the read into H
        ld_H = 1;
      end

      LD_HL_nn_6: begin
        //put HL into MAR
        ld_MARL = 1;
        ld_MARH = 1;
        drive_H = 1;
        drive_L = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op = `NOP;

        //start the read from (nn)
        MRD_start = 1;
        MRD_bus   = 1;
      end

      LD_HL_nn_7: begin
        //keep reading
        MRD_bus     = 1;
        drive_MAR   = 1;
      end

      LD_HL_nn_8: begin
        //load the data into L
        ld_L = 1;

        //put HL + 1 into MAR as we wipe out L
        drive_H = 1;
        drive_L = 1;
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        alu_op = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_HL_nn_9: begin
        //start a read at nn+1
        MRD_start = 1;
        MRD_bus = 1;
        drive_MAR = 1;
      end

      LD_HL_nn_10: begin
        //continue the read
        MRD_bus = 1;
        drive_MAR = 1;
      end

      LD_HL_nn_11: begin
        //load the data into H
        ld_H = 1;
      end

      //LD_dd_nn_x
      LD_dd_nn_x_0,LD_dd_nn_x_3: begin
        ld_PCH    = 1;
        ld_PCL    = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `INCR_A_16;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      LD_dd_nn_x_1, LD_dd_nn_x_4: begin
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `ALU_NOP;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_bus = 1;
			end

      LD_dd_nn_x_2: begin
        ld_STRL = 1;
      end

      LD_dd_nn_x_5: begin
        ld_STRH = 1;
      end

      LD_dd_nn_x_6, LD_dd_nn_x_9: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_STRH = 1;
        drive_STRL = 1;
      end

      LD_dd_nn_x_7, LD_dd_nn_x_10: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_STRH = 1;
        drive_STRL = 1;
      end

      LD_dd_nn_x_8: begin
        case(op1[5:4])
          2'b00: ld_C = 1;
          2'b01: ld_E = 1;
          2'b10: ld_L = 1;
          2'b11: ld_SPL = 1;
        endcase
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_STRH = 1;
        drive_STRL = 1;
        ld_STRH    = 1;
        ld_STRL    = 1;
      end

      LD_dd_nn_x_11: begin
        case(op1[5:4])
          2'b00: ld_B = 1;
          2'b01: ld_D = 1;
          2'b10: ld_H = 1;
          2'b11: ld_SPH = 1;
        endcase
      end

      //LD_IX_nn_x
      LD_IX_nn_x_0,LD_IX_nn_x_3: begin
        ld_PCH    = 1;
        ld_PCL    = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `INCR_A_16;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      LD_IX_nn_x_1,LD_IX_nn_x_4: begin
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `ALU_NOP;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_bus = 1;
      end

      LD_IX_nn_x_2: begin
        ld_IXL = 1;
      end

      LD_IX_nn_x_5: begin
        ld_IXH = 1;
      end

      LD_IX_nn_x_6: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_IXL = 1;
        drive_IXH = 1;
        MRD_start = 1;
        MRD_bus   = 1;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_IX_nn_x_7: begin
        drive_MAR = 1;
        MRD_bus = 1;
      end

      LD_IX_nn_x_8: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_IXL = 1;
        drive_IXH = 1;
        alu_op = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
        ld_IXL = 1;
      end

      LD_IX_nn_x_9: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LD_IX_nn_x_10: begin
        MRD_bus = 1;
        drive_MAR = 1;
      end

      LD_IX_nn_x_11: begin
        ld_IXH = 1;
      end

      //LD_IY_nn_x
      LD_IY_nn_x_0,LD_IY_nn_x_3: begin
        ld_PCH    = 1;
        ld_PCL    = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `INCR_A_16;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      LD_IY_nn_x_1,LD_IY_nn_x_4: begin
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `ALU_NOP;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        MRD_bus = 1;
      end

      LD_IY_nn_x_2: begin
        ld_IYL = 1;
      end

      LD_IY_nn_x_5: begin
        ld_IYH = 1;
      end

      LD_IY_nn_x_6: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_IYL = 1;
        drive_IYH = 1;
        MRD_start = 1;
        MRD_bus   = 1;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_IY_nn_x_7: begin
        drive_MAR = 1;
        MRD_bus = 1;
      end

      LD_IY_nn_x_8: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_IYL = 1;
        drive_IYH = 1;
        alu_op = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
        ld_IYL = 1;
      end

      LD_IY_nn_x_9: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LD_IY_nn_x_10: begin
        MRD_bus = 1;
        drive_MAR = 1;
      end

      LD_IY_nn_x_11: begin
        ld_IYH = 1;
      end

      //LD_nn_x_HL
      LD_nn_x_HL_0, LD_nn_x_HL_3: begin
        MRD_start = 1;
        MRD_bus   = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `INCR_A_16;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
      end

      LD_nn_x_HL_1, LD_nn_x_HL_4: begin
        MRD_bus = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `ALU_NOP;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
      end

      LD_nn_x_HL_2: begin
        ld_MARL_data = 1;
        ld_STRL      = 1;
      end

      LD_nn_x_HL_5: begin
        ld_MARH_data = 1;
        ld_STRH      = 1;
      end

      LD_nn_x_HL_6, LD_nn_x_HL_9: begin
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;

        if(state == LD_nn_x_HL_6) begin
          drive_L = 1;
          drive_reg_data = 1;
        end else begin
          drive_H = 1;
          drive_reg_data = 1;
        end
      end

      LD_nn_x_HL_7, LD_nn_x_HL_10: begin
        MWR_bus = 1;
        drive_MAR = 1;

        if(state == LD_nn_x_HL_7) begin
          drive_L = 1;
          drive_reg_data = 1;
        end else begin
          drive_H = 1;
          drive_reg_data = 1;
        end
      end

      LD_nn_x_HL_8: begin
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_STRH = 1;
        drive_STRL = 1;
        ld_STRH    = 1;
        ld_STRL    = 1;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      //LD_nn_dd
      LD_nn_x_dd_0, LD_nn_x_dd_3: begin
        MRD_start = 1;
        MRD_bus   = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `INCR_A_16;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
      end

      LD_nn_x_dd_1, LD_nn_x_dd_4: begin
        MRD_bus = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `ALU_NOP;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
      end

      LD_nn_x_dd_2: begin
        ld_MARL_data = 1;
        ld_STRL      = 1;
      end

      LD_nn_x_dd_5: begin
        ld_MARH_data = 1;
        ld_STRH      = 1;
      end

      LD_nn_x_dd_6, LD_nn_x_dd_9: begin
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;

        if(state == LD_nn_x_dd_6) begin
          case(op1[5:4])
            2'b00: begin
              drive_C = 1;
              drive_reg_data = 1;
            end
            2'b01: begin
              drive_E = 1;
              drive_reg_data = 1;
            end
            2'b10: begin
              drive_L = 1;
              drive_reg_data = 1;
            end
            2'b11: begin
              drive_SPL = 1;
              drive_reg_data = 1;
            end
            default: begin end
          endcase

        end else begin
          case(op1[5:4])
            2'b00: begin
              drive_B = 1;
              drive_reg_data = 1;
            end
            2'b01: begin
              drive_D = 1;
              drive_reg_data = 1;
            end
            2'b10: begin
              drive_H = 1;
              drive_reg_data = 1;
            end
            2'b11: begin
              drive_SPH = 1;
              drive_reg_data = 1;
            end
            default: begin end
          endcase
        end
      end

      LD_nn_x_dd_7, LD_nn_x_dd_10: begin
        MWR_bus = 1;
        drive_MAR = 1;

        if(state == LD_nn_x_dd_7) begin
          case(op1[5:4])
            2'b00: begin
              drive_C = 1;
              drive_reg_data = 1;
            end
            2'b01: begin
              drive_E = 1;
              drive_reg_data = 1;
            end
            2'b10: begin
              drive_L = 1;
              drive_reg_data = 1;
            end
            2'b11: begin
              drive_SPL = 1;
              drive_reg_data = 1;
            end
            default: begin end
          endcase

        end else begin
          case(op1[5:4])
            2'b00: begin
              drive_B = 1;
              drive_reg_data = 1;
            end
            2'b01: begin
              drive_D = 1;
              drive_reg_data = 1;
            end
            2'b10: begin
              drive_H = 1;
              drive_reg_data = 1;
            end
            2'b11: begin
              drive_SPH = 1;
              drive_reg_data = 1;
            end
            default: begin end
          endcase
        end
      end

      LD_nn_x_dd_8: begin
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_STRH = 1;
        drive_STRL = 1;
        ld_STRH    = 1;
        ld_STRL    = 1;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      //LD (nn), IX and LD (nn), IY
      LD_nn_x_IX_0, LD_nn_x_IX_3, LD_nn_x_IY_0, LD_nn_x_IY_3: begin
        MRD_start = 1;
        MRD_bus   = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `INCR_A_16;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
      end

      LD_nn_x_IX_1, LD_nn_x_IX_4, LD_nn_x_IY_1, LD_nn_x_IY_4: begin
        MRD_bus = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `ALU_NOP;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
      end

      LD_nn_x_IX_2, LD_nn_x_IY_2: begin
        ld_MARL_data = 1;
        ld_STRL      = 1;
      end

      LD_nn_x_IX_5, LD_nn_x_IY_5: begin
        ld_MARH_data = 1;
        ld_STRH      = 1;
      end

      LD_nn_x_IX_6, LD_nn_x_IX_9, LD_nn_x_IY_6, LD_nn_x_IY_9: begin
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;

        if(state == LD_nn_x_IX_6) begin
          drive_IXL = 1;
          drive_reg_data = 1;
        end else if(state == LD_nn_x_IY_6) begin
          drive_IYL = 1;
          drive_reg_data = 1;
        end else if(state == LD_nn_x_IY_9) begin
          drive_IYH = 1;
          drive_reg_data = 1;
        end else begin
          drive_IXH = 1;
          drive_reg_data = 1;
        end
      end

      LD_nn_x_IX_7, LD_nn_x_IX_10, LD_nn_x_IY_7, LD_nn_x_IY_10: begin
        MWR_bus = 1;
        drive_MAR = 1;

        if(state == LD_nn_x_IX_7) begin
          drive_IXL = 1;
          drive_reg_data = 1;
        end else if(state == LD_nn_x_IY_7) begin
          drive_IYL = 1;
          drive_reg_data = 1;
        end else if(state == LD_nn_x_IY_10) begin
          drive_IYH = 1;
          drive_reg_data = 1;
        end else begin
          drive_IXH = 1;
          drive_reg_data = 1;
        end
      end

      LD_nn_x_IX_8, LD_nn_x_IY_8: begin
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_STRH = 1;
        drive_STRL = 1;
        ld_STRH    = 1;
        ld_STRL    = 1;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      //LD_SP_HL
      LD_SP_HL_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        ld_SPL = 1;
        ld_SPH = 1;
      end

      //LD_SP_IX
      LD_SP_IX_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_IXL = 1;
        drive_IXH = 1;
        ld_SPL = 1;
        ld_SPH = 1;
      end

      //LD_SP_IY
      LD_SP_IY_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_IYL = 1;
        drive_IYH = 1;
        ld_SPL = 1;
        ld_SPH = 1;
      end

      //PUSH_qq
      PUSH_qq_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPL = 1;
        ld_SPH = 1;
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A;
      end

      PUSH_qq_1: begin
        drive_MAR = 1;
        MWR_start = 1;
        MWR_bus   = 1;
        case(op0[5:4])
          2'b00: begin
            drive_B = 1;
            drive_reg_data = 1;
          end
          2'b01: begin
            drive_D = 1;
            drive_reg_data = 1;
          end
          2'b10: begin
            drive_H = 1;
            drive_reg_data = 1;
          end
          2'b11: begin
            drive_A = 1;
            drive_reg_data = 1;
          end
        endcase
      end

      PUSH_qq_2: begin
        drive_MAR = 1;
        MWR_bus = 1;
        case(op0[5:4])
          2'b00: begin
            drive_B = 1;
            drive_reg_data = 1;
          end
          2'b01: begin
            drive_D = 1;
            drive_reg_data = 1;
          end
          2'b10: begin
            drive_H = 1;
            drive_reg_data = 1;
          end
          2'b11: begin
            drive_A = 1;
            drive_reg_data = 1;
          end
        endcase
      end

      PUSH_qq_3: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPL = 1;
        ld_SPH = 1;
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A;
      end

      PUSH_qq_4: begin
        drive_MAR = 1;
        MWR_start = 1;
        MWR_bus   = 1;
        case(op0[5:4])
          2'b00: begin
            drive_C = 1;
            drive_reg_data = 1;
          end
          2'b01: begin
            drive_E = 1;
            drive_reg_data = 1;
          end
          2'b10: begin
            drive_L = 1;
            drive_reg_data = 1;
          end
          2'b11: begin
            drive_F = 1;
            drive_reg_data = 1;
          end
        endcase
      end

      PUSH_qq_5: begin
        drive_MAR = 1;
        MWR_bus = 1;
        case(op0[5:4])
          2'b00: begin
            drive_C = 1;
            drive_reg_data = 1;
          end
          2'b01: begin
            drive_E = 1;
            drive_reg_data = 1;
          end
          2'b10: begin
            drive_L = 1;
            drive_reg_data = 1;
          end
          2'b11: begin
            drive_F = 1;
            drive_reg_data = 1;
          end
        endcase
      end

      //PUSH_IX
      PUSH_IX_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPL = 1;
        ld_SPH = 1;
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A;
      end

      PUSH_IX_1: begin
        drive_MAR = 1;
        MWR_start = 1;
        MWR_bus   = 1;
        drive_IXH = 1;
        drive_reg_data = 1;
      end

      PUSH_IX_2: begin
        drive_MAR = 1;
        MWR_bus = 1;
        drive_IXH = 1;
        drive_reg_data = 1;
      end

      PUSH_IX_3: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPL = 1;
        ld_SPH = 1;
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A;
      end

      PUSH_IX_4: begin
        drive_MAR = 1;
        MWR_start = 1;
        MWR_bus   = 1;
        drive_IXL = 1;
        drive_reg_data = 1;
      end

      PUSH_IX_5: begin
        drive_MAR = 1;
        MWR_bus = 1;
        drive_IXL = 1;
        drive_reg_data = 1;
      end

      //PUSH_IY
      PUSH_IY_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPL = 1;
        ld_SPH = 1;
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A;
      end

      PUSH_IY_1: begin
        drive_MAR = 1;
        MWR_start = 1;
        MWR_bus   = 1;
        drive_IYH = 1;
        drive_reg_data = 1;
      end

      PUSH_IY_2: begin
        drive_MAR = 1;
        MWR_bus = 1;
        drive_IYH = 1;
        drive_reg_data = 1;
      end

      PUSH_IY_3: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPL = 1;
        ld_SPH = 1;
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A;
      end

      PUSH_IY_4: begin
        drive_MAR = 1;
        MWR_start = 1;
        MWR_bus   = 1;
        drive_IYL = 1;
        drive_reg_data = 1;
      end

      PUSH_IY_5: begin
        drive_MAR = 1;
        MWR_bus = 1;
        drive_IYL = 1;
        drive_reg_data = 1;
      end

      //POP IX, IY, QQ
      POP_IX_0, POP_IY_0, POP_qq_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      POP_IX_1, POP_IY_1, POP_qq_1: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        MRD_bus = 1;
      end

      POP_IX_2: begin
        ld_IXL = 1;
      end
      POP_IY_2: begin
        ld_IYL = 1;
      end
      POP_qq_2: begin
        unique case(op0[5:4])
          2'b00: ld_C = 1;
          2'b01: ld_E = 1;
          2'b10: ld_L = 1;
          2'b11: begin
            ld_F_data = 1;
            alu_op    = `ALU_NOP;
          end
        endcase
      end

      POP_IX_3, POP_IY_3, POP_qq_3: begin
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPH    = 1;
        ld_SPL    = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      POP_IX_4, POP_IY_4, POP_qq_4: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        MRD_bus = 1;
      end

      POP_IX_5: begin
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPH    = 1;
        ld_SPL    = 1;
        ld_IXH = 1;
      end
      POP_IY_5: begin
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPH    = 1;
        ld_SPL    = 1;
        ld_IYH = 1;
      end
      POP_qq_5: begin
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPH    = 1;
        ld_SPL    = 1;

        unique case(op0[5:4])
          2'b00: ld_B = 1;
          2'b01: ld_D = 1;
          2'b10: ld_H = 1;
          2'b11: ld_A = 1;
        endcase
      end

      //-----------------------------------------------------------------------
      //END 16-bit load group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN EXCHANGE, BLOCK TRANSFER GROUP
      //-----------------------------------------------------------------------

      EX_DE_HL_0: begin
        //all of these registers have a point to point connection within the
        //register file which makes the swap possible in a single cycle
        swap_reg = 1;
        ld_H     = 1;
        ld_L     = 1;
        ld_D     = 1;
        ld_E     = 1;
      end

      EX_AF_AF_0: begin
        switch_context = 1;
        ld_F_addr = 1;
        ld_F_data = 1;
        ld_A = 1;
      end

      EXX_0: begin
        switch_context = 1;
        ld_B = 1;
        ld_C = 1;
        ld_D = 1;
        ld_E = 1;
        ld_H = 1;
        ld_L = 1;
      end

      //EX (SP), HL
      EX_SP_HL_0, EX_SP_IX_0, EX_SP_IY_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
      end

      EX_SP_HL_1, EX_SP_IX_1, EX_SP_IY_1: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
      end

      EX_SP_HL_2, EX_SP_IX_2, EX_SP_IY_2: begin
        ld_MDR1 = 1;
      end

      EX_SP_HL_3, EX_SP_IX_3, EX_SP_IY_3: begin
        MRD_start = 1;
        MRD_bus   = 1;

        //put the SP+1 into MAR
        drive_SPL = 1;
        drive_SPH = 1;
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        alu_op = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      EX_SP_HL_4, EX_SP_IX_4, EX_SP_IY_4: begin
        MRD_bus = 1;
        drive_MAR = 1;
      end

      EX_SP_HL_5, EX_SP_IX_5, EX_SP_IY_5: begin
        ld_MDR2 = 1;
      end

      EX_SP_HL_6, EX_SP_IX_6, EX_SP_IY_6: begin
        //now that SP+1 is in MAR, write H into (SP+1)
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;

        case(state)
          EX_SP_HL_6: begin
            drive_H = 1;
            drive_reg_data = 1;
          end
          EX_SP_IX_6: begin
            drive_IXH = 1;
            drive_reg_data = 1;
          end
          EX_SP_IY_6: begin
            drive_IYH = 1;
            drive_reg_data = 1;
          end
        endcase
      end


      EX_SP_HL_7, EX_SP_IX_7, EX_SP_IY_7: begin
        MWR_bus = 1;
        drive_MAR = 1;

        case(state)
          EX_SP_HL_7: begin
            drive_H = 1;
            drive_reg_data = 1;
          end
          EX_SP_IX_7: begin
            drive_IXH = 1;
            drive_reg_data = 1;
          end
          EX_SP_IY_7: begin
            drive_IYH = 1;
            drive_reg_data = 1;
          end
        endcase
      end

      EX_SP_HL_8, EX_SP_IX_8, EX_SP_IY_8: begin
        //put SP into MAR
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      EX_SP_HL_9, EX_SP_IX_9, EX_SP_IY_9: begin
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;

        case(state)
          EX_SP_HL_9: begin
            drive_L = 1;
            drive_reg_data = 1;
          end
          EX_SP_IX_9: begin
            drive_IXL = 1;
            drive_reg_data = 1;
          end
          EX_SP_IY_9: begin
            drive_IYL = 1;
            drive_reg_data = 1;
          end
        endcase
      end

      EX_SP_HL_10, EX_SP_IX_10, EX_SP_IY_10: begin
        MWR_bus = 1;
        drive_MAR = 1;

        case(state)
          EX_SP_HL_10: begin
            drive_L = 1;
            drive_reg_data = 1;
          end
          EX_SP_IX_10: begin
            drive_IXL = 1;
            drive_reg_data = 1;
          end
          EX_SP_IY_10: begin
            drive_IYL = 1;
            drive_reg_data = 1;
          end
        endcase
      end

      EX_SP_HL_11, EX_SP_IX_11, EX_SP_IY_11: begin
        drive_MDR2 = 1;

        case(state)
          EX_SP_HL_11: ld_H   = 1;
          EX_SP_IX_11: ld_IXH = 1;
          EX_SP_IY_11: ld_IYH = 1;
        endcase
      end

      EX_SP_HL_12, EX_SP_IX_12, EX_SP_IY_12: begin
        drive_MDR1 = 1;

        case(state)
          EX_SP_HL_12: ld_L   = 1;
          EX_SP_IX_12: ld_IXL = 1;
          EX_SP_IY_12: ld_IYL = 1;
        endcase
      end

      //LDI
      LDI_0, LDIR_0, LDD_0, LDDR_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      LDI_1, LDIR_1, LDD_1, LDDR_1: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_bus = 1;
      end

      LDI_2, LDIR_2, LDD_2, LDDR_2: begin
        //MDR1 <- (HL) (put contents of D_BUS into MDR1)
        ld_MDR1 = 1;
      end

      LDI_3, LDIR_3, LDD_3, LDDR_3: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_D = 1;
        drive_E = 1;
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MDR1 = 1;
      end

      LDI_4, LDIR_4, LDD_4, LDDR_4: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_D = 1;
        drive_E = 1;
        MWR_bus = 1;
        drive_MDR1 = 1;
      end

      LDI_5, LDIR_5: begin
        //DE <- DE + 1
        drive_D = 1;
        drive_E = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_D = 1;
        ld_E = 1;
        alu_op = `INCR_A_16;
      end

      LDD_5, LDDR_5: begin
        //DE <- DE - 1
        drive_D = 1;
        drive_E = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_D = 1;
        ld_E = 1;
        alu_op = `DECR_A;
      end

      LDI_6, LDIR_6, LDD_6, LDDR_6: begin
        //BC <- BC - 1
        drive_B = 1;
        drive_C = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_B    = 1;
        ld_C    = 1;
        alu_op  = `DECR_BC;

        //set the P/V flag if BC-1 != 0
        ld_F_addr = 1;

        set_H = 2'b10;
        set_N = 2'b10;
      end

      LDI_7, LDIR_7: begin
        //HL <- HL + 1
        drive_H = 1;
        drive_L = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_H = 1;
        ld_L = 1;
        alu_op = `INCR_A_16;
      end

      LDD_7, LDDR_7: begin
        //HL <- HL - 1
        drive_H = 1;
        drive_L = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_H = 1;
        ld_L = 1;
        alu_op = `DECR_A;
      end

      LDIR_8, LDIR_9, LDDR_8, LDDR_9: begin
        //Repeat the instruction if BC != 0
        if(flags[ `PV_flag ] == 1) begin
          ld_PCH    = 1;
          ld_PCL    = 1;
          drive_PCH = 1;
          drive_PCL = 1;
          alu_op    = `DECR_A;
          drive_reg_addr = 1;
          drive_alu_addr = 1;
        end
      end

      CPI_0, CPIR_0, CPD_0, CPDR_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      CPI_1, CPIR_1, CPD_1, CPDR_1: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_bus = 1;
      end

      CPI_2, CPIR_2, CPD_2, CPDR_2: begin
        ld_TEMP = 1;
      end

      CPI_3, CPIR_3, CPD_3, CPDR_3: begin
        alu_op = `SUB_EX;
        ld_F_data  = 1;
        drive_TEMP = 1;
      end

      CPI_4, CPIR_4, CPD_4, CPDR_4: begin
        //BC <- BC - 1
        drive_B = 1;
        drive_C = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_B    = 1;
        ld_C    = 1;
        alu_op  = `DECR_BC;

        //set the P/V flag if BC-1 != 0
        ld_F_addr = 1;

        set_N = 2'b11;
      end

      CPI_5, CPIR_5: begin
        //HL <- HL + 1
        drive_H = 1;
        drive_L = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_H = 1;
        ld_L = 1;
        alu_op = `INCR_A_16;
      end

      CPD_5, CPDR_5: begin
        //HL <- HL - 1
        drive_H = 1;
        drive_L = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_H = 1;
        ld_L = 1;
        alu_op = `DECR_A;
      end

      CPIR_8, CPIR_9, CPDR_8, CPDR_9: begin
        //Repeat the instruction if BC != 0 or if the compare succeeded
        if(flags[`PV_flag] & ~flags[`Z_flag]) begin
          ld_PCH    = 1;
          ld_PCL    = 1;
          drive_PCH = 1;
          drive_PCL = 1;
          alu_op    = `DECR_A;
          drive_reg_addr = 1;
          drive_alu_addr = 1;
        end
      end

      //-----------------------------------------------------------------------
      //END EXCHANGE, BLOCK TRANSFER GROUP
      //-----------------------------------------------------------------------


      //-----------------------------------------------------------------------
      //BEGIN 8-bit arithmetic group
      //-----------------------------------------------------------------------

      //ADD A, r
      ADD_A_r_0: begin

        case(op0[2:0])
          3'b111: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADD;
            drive_A        = 1;
          end
          3'b000: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADD;
            drive_B        = 1;
            drive_reg_data = 1;
          end
          3'b001: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADD;
            drive_C        = 1;
            drive_reg_data = 1;
          end
          3'b010: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADD;
            drive_D        = 1;
            drive_reg_data = 1;
          end
          3'b011: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADD;
            drive_E        = 1;
            drive_reg_data = 1;
          end
          3'b100: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADD;
            drive_H        = 1;
            drive_reg_data = 1;
          end
          3'b101: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADD;
            drive_L        = 1;
            drive_reg_data = 1;
          end
        endcase

        set_N = 2'b10;
      end

      //ADD A, n
      ADD_A_n_0, ADC_A_n_0: begin
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      ADD_A_n_1, ADC_A_n_1: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        MRD_bus = 1;
      end

      ADD_A_n_2, ADC_A_n_2: begin
        if(state == ADD_A_n_2) begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `ADD;
        end else begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `ADC;
        end
        set_N = 2'b10;
      end

      //ADD A, (HL)
      ADD_A_HL_0, ADC_A_HL_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      ADD_A_HL_1, ADC_A_HL_1: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_bus = 1;
      end

      ADD_A_HL_2, ADC_A_HL_2: begin
        if(state == ADD_A_HL_2) begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `ADD;
        end else begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `ADC;
        end
        set_N = 2'b10;
      end

      //ADD A, (IX+d), ADD A, (IY+d)
      ADD_A_IX_d_0, ADD_A_IY_d_0, ADC_A_IX_d_0, ADC_A_IY_d_0: begin
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      ADD_A_IX_d_1, ADD_A_IY_d_1, ADC_A_IX_d_1, ADC_A_IY_d_1: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        MRD_bus = 1;
      end

      ADD_A_IX_d_2, ADD_A_IY_d_2, ADC_A_IX_d_2, ADC_A_IY_d_2: begin
        ld_TEMP = 1;
      end

      ADD_A_IX_d_3, ADD_A_IY_d_3, ADC_A_IX_d_3, ADC_A_IY_d_3: begin
        alu_op         = `ADD_SE_B;
        drive_alu_addr = 1;
        drive_reg_addr = 1;
        drive_IXH      = (state == ADD_A_IX_d_3 || state == ADC_A_IX_d_3);
        drive_IXL      = (state == ADD_A_IX_d_3 || state == ADC_A_IX_d_3);
        drive_IYH      = (state == ADD_A_IY_d_3 || state == ADC_A_IY_d_3);
        drive_IYL      = (state == ADD_A_IY_d_3 || state == ADC_A_IY_d_3);
        ld_MARL        = 1;
        ld_MARH        = 1;
      end

      ADD_A_IX_d_8, ADD_A_IY_d_8, ADC_A_IX_d_8, ADC_A_IY_d_8: begin
        drive_MAR = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      ADD_A_IX_d_9, ADD_A_IY_d_9, ADC_A_IX_d_9, ADC_A_IY_d_9: begin
        drive_MAR = 1;
        MRD_bus = 1;
      end

      ADD_A_IX_d_10, ADD_A_IY_d_10, ADC_A_IX_d_10, ADC_A_IY_d_10: begin
        if(state == ADD_A_IX_d_10 || state == ADD_A_IY_d_10) begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `ADD;
        end else begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `ADC;
        end

        set_N = 2'b10;
      end

      //ADC A, r
      ADC_A_r_0: begin

        case(op0[2:0])
          3'b111: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADC;
            drive_A        = 1;
          end
          3'b000: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADC;
            drive_B        = 1;
            drive_reg_data = 1;
          end
          3'b001: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADC;
            drive_C        = 1;
            drive_reg_data = 1;
          end
          3'b010: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADC;
            drive_D        = 1;
            drive_reg_data = 1;
          end
          3'b011: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADC;
            drive_E        = 1;
            drive_reg_data = 1;
          end
          3'b100: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADC;
            drive_H        = 1;
            drive_reg_data = 1;
          end
          3'b101: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `ADC;
            drive_L        = 1;
            drive_reg_data = 1;
          end
        endcase

        set_N = 2'b10;
      end

      //SUB r
      SUB_r_0: begin
        ld_F_data = 1;
        set_N = 2'b11;

        unique case(op0[2:0])
          3'b111: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SUB;
            drive_A        = 1;
          end
          3'b000: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SUB;
            drive_B        = 1;
            drive_reg_data = 1;
          end
          3'b001: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SUB;
            drive_C        = 1;
            drive_reg_data = 1;
          end
          3'b010: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SUB;
            drive_D        = 1;
            drive_reg_data = 1;
          end
          3'b011: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SUB;
            drive_E        = 1;
            drive_reg_data = 1;
          end
          3'b100: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SUB;
            drive_H        = 1;
            drive_reg_data = 1;
          end
          3'b101: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SUB;
            drive_L        = 1;
            drive_reg_data = 1;
          end
        endcase

      end

      //SBC r
      SBC_r_0: begin
        ld_F_data = 1;
        set_N = 2'b11;

        unique case(op0[2:0])
          3'b111: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SBC;
            drive_A        = 1;
          end
          3'b000: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SBC;
            drive_B        = 1;
            drive_reg_data = 1;
          end
          3'b001: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SBC;
            drive_C        = 1;
            drive_reg_data = 1;
          end
          3'b010: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SBC;
            drive_D        = 1;
            drive_reg_data = 1;
          end
          3'b011: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SBC;
            drive_E        = 1;
            drive_reg_data = 1;
          end
          3'b100: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SBC;
            drive_H        = 1;
            drive_reg_data = 1;
          end
          3'b101: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `SBC;
            drive_L        = 1;
            drive_reg_data = 1;
          end
        endcase

      end

      //SUB n
      SUB_n_0, SBC_n_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      SUB_n_1, SBC_n_1: begin
        MRD_bus = 1;
        drive_MAR = 1;
      end

      SUB_n_2, SBC_n_2: begin
        ld_F_data = 1;
        set_N = 2'b11;

        if(state == SUB_n_2) begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `SUB;
        end else begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `SBC;
        end
      end

      //SUB (HL)
      SUB_HL_0, SBC_HL_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      SUB_HL_1, SBC_HL_1: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_bus = 1;
      end

      SUB_HL_2, SBC_HL_2: begin
        ld_F_data = 1;
        set_N = 2'b11;

        if(state == SUB_HL_2) begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `SUB;
        end else begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `SBC;
        end
      end

      //SUB (IX+d) SUB (IY+d)
      SUB_IX_d_0, SUB_IY_d_0, SBC_IX_d_0, SBC_IY_d_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
      end

      SUB_IX_d_1, SUB_IY_d_1, SBC_IX_d_1, SBC_IY_d_1: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
      end

      SUB_IX_d_2, SUB_IY_d_2, SBC_IX_d_2, SBC_IY_d_2: begin
        ld_TEMP = 1;
      end

      SUB_IX_d_3, SUB_IY_d_3, SBC_IX_d_3, SBC_IY_d_3: begin
        alu_op = `ADD_SE_B;
        drive_IXH = (op0[7:4] == 4'hD);
        drive_IXL = (op0[7:4] == 4'hD);
        drive_IYH = (op0[7:4] == 4'hF);
        drive_IYL = (op0[7:4] == 4'hF);
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      SUB_IX_d_8, SUB_IY_d_8, SBC_IX_d_8, SBC_IY_d_8: begin
        drive_MAR = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      SUB_IX_d_9, SUB_IY_d_9, SBC_IX_d_9, SBC_IY_d_9: begin
        drive_MAR = 1;
        MRD_bus = 1;
      end

      SUB_IX_d_10, SUB_IY_d_10, SBC_IX_d_10, SBC_IY_d_10: begin
        ld_F_data = 1;
        set_N = 2'b11;

        if(state == SUB_IX_d_10 || state == SUB_IY_d_10) begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `SUB;
        end else begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `SBC;
        end
      end

      //AND r
      AND_r_0: begin
        ld_F_data = 1;
        set_H = 2'b11;
        set_N = 2'b10;
        set_C = 2'b10;

        unique case(op0[2:0])
          3'b111: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `AND;
            drive_A        = 1;
          end
          3'b000: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `AND;
            drive_B        = 1;
            drive_reg_data = 1;
          end
          3'b001: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `AND;
            drive_C        = 1;
            drive_reg_data = 1;
          end
          3'b010: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `AND;
            drive_D        = 1;
            drive_reg_data = 1;
          end
          3'b011: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `AND;
            drive_E        = 1;
            drive_reg_data = 1;
          end
          3'b100: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `AND;
            drive_H        = 1;
            drive_reg_data = 1;
          end
          3'b101: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `AND;
            drive_L        = 1;
            drive_reg_data = 1;
          end

        endcase
      end

      //AND n
      AND_n_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      AND_n_1: begin
        MRD_bus = 1;
        drive_MAR = 1;
      end

      AND_n_2: begin
        ld_F_data = 1;
        set_H = 2'b11;
        set_N = 2'b10;
        set_C = 2'b10;
        ld_F_data      = 1;
        drive_alu_data = 1;
        ld_A           = 1;
        alu_op         = `AND;
      end

      //AND (HL)
      AND_HL_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      AND_HL_1: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_bus = 1;
      end

      AND_HL_2: begin
        ld_F_data = 1;
        set_H = 2'b11;
        set_N = 2'b10;
        set_C = 2'b10;
        ld_F_data      = 1;
        drive_alu_data = 1;
        ld_A           = 1;
        alu_op         = `AND;
      end

      //AND (IX+d) AND (IY+d)
      AND_IX_d_0, AND_IY_d_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
      end

      AND_IX_d_1, AND_IY_d_1: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
      end

      AND_IX_d_2, AND_IY_d_2: begin
        ld_TEMP = 1;
      end

      AND_IX_d_3, AND_IY_d_3: begin
        alu_op = `ADD_SE_B;
        drive_IXH = (state == AND_IX_d_3);
        drive_IXL = (state == AND_IX_d_3);
        drive_IYH = (state == AND_IY_d_3);
        drive_IYL = (state == AND_IY_d_3);
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      AND_IX_d_8, AND_IY_d_8: begin
        drive_MAR = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      AND_IX_d_9, AND_IY_d_9: begin
        drive_MAR = 1;
        MRD_bus = 1;
      end

      AND_IX_d_10, AND_IY_d_10: begin
        ld_F_data = 1;
        set_H = 2'b11;
        set_N = 2'b10;
        set_C = 2'b10;
        ld_F_data      = 1;
        drive_alu_data = 1;
        ld_A           = 1;
        alu_op         = `AND;
      end

      //OR r
      OR_r_0: begin
        ld_F_data = 1;
        set_H = 2'b10;
        set_N = 2'b10;
        set_C = 2'b10;

        unique case(op0[2:0])
          3'b111: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `OR;
            drive_A        = 1;
          end
          3'b000: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `OR;
            drive_B        = 1;
            drive_reg_data = 1;
          end
          3'b001: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `OR;
            drive_C        = 1;
            drive_reg_data = 1;
          end
          3'b010: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `OR;
            drive_D        = 1;
            drive_reg_data = 1;
          end
          3'b011: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `OR;
            drive_E        = 1;
            drive_reg_data = 1;
          end
          3'b100: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `OR;
            drive_H        = 1;
            drive_reg_data = 1;
          end
          3'b101: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `OR;
            drive_L        = 1;
            drive_reg_data = 1;
          end

        endcase
      end

      //XOR r
      XOR_r_0: begin
        ld_F_data = 1;
        set_H = 2'b10;
        set_N = 2'b10;
        set_C = 2'b10;

        unique case(op0[2:0])
          3'b111: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `XOR;
            drive_A        = 1;
          end
          3'b000: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `XOR;
            drive_B        = 1;
            drive_reg_data = 1;
          end
          3'b001: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `XOR;
            drive_C        = 1;
            drive_reg_data = 1;
          end
          3'b010: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `XOR;
            drive_D        = 1;
            drive_reg_data = 1;
          end
          3'b011: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `XOR;
            drive_E        = 1;
            drive_reg_data = 1;
          end
          3'b100: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `XOR;
            drive_H        = 1;
            drive_reg_data = 1;
          end
          3'b101: begin
            ld_F_data      = 1;
            drive_alu_data = 1;
            ld_A           = 1;
            alu_op         = `XOR;
            drive_L        = 1;
            drive_reg_data = 1;
          end

        endcase
      end

      //OR n, XOR n
      OR_n_0, XOR_n_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      OR_n_1, XOR_n_1: begin
        MRD_bus = 1;
        drive_MAR = 1;
      end

      OR_n_2, XOR_n_2: begin
        ld_F_data = 1;
        set_H = 2'b10;
        set_N = 2'b10;
        set_C = 2'b10;

        if(state == OR_n_2) begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `OR;
        end else begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `XOR;
        end
      end

      //OR (HL), XOR (HL)
      OR_HL_0, XOR_HL_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      OR_HL_1, XOR_HL_1: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_bus = 1;
      end

      OR_HL_2, XOR_HL_2: begin
        ld_F_data = 1;
        set_H = 2'b10;
        set_N = 2'b10;
        set_C = 2'b10;

        if(state == OR_HL_2) begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `OR;
        end else begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `XOR;
        end
      end

      //OR (IX+d) OR (IY+d) XOR (IX+d) XOR (IY+d)
      OR_IX_d_0, OR_IY_d_0, XOR_IX_d_0, XOR_IY_d_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
      end

      OR_IX_d_1, OR_IY_d_1, XOR_IX_d_1, XOR_IY_d_1: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
      end

      OR_IX_d_2, OR_IY_d_2, XOR_IX_d_2, XOR_IY_d_2: begin
        ld_TEMP = 1;
      end

      OR_IX_d_3, OR_IY_d_3, XOR_IX_d_3, XOR_IY_d_3: begin
        alu_op = `ADD_SE_B;
        drive_IXH = (op0[7:4] == 4'hD);
        drive_IXL = (op0[7:4] == 4'hD);
        drive_IYH = (op0[7:4] == 4'hF);
        drive_IYL = (op0[7:4] == 4'hF);
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      OR_IX_d_8, OR_IY_d_8, XOR_IX_d_8, XOR_IY_d_8: begin
        drive_MAR = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      OR_IX_d_9, OR_IY_d_9, XOR_IX_d_9, XOR_IY_d_9: begin
        drive_MAR = 1;
        MRD_bus = 1;
      end

      OR_IX_d_10, OR_IY_d_10, XOR_IX_d_10, XOR_IY_d_10: begin
        ld_F_data = 1;
        set_H = 2'b10;
        set_N = 2'b10;
        set_C = 2'b10;

        if(state == OR_IX_d_10 || state == OR_IY_d_10) begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `OR;
        end else begin
          ld_F_data      = 1;
          drive_alu_data = 1;
          ld_A           = 1;
          alu_op         = `XOR;
        end
      end

      //CP (HL)
      CP_HL_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      CP_HL_1: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_bus = 1;
      end

      CP_HL_2: begin
        ld_F_data = 1;
        set_N = 2'b11;
        ld_F_data      = 1;
        alu_op         = `SUB;
      end

      //CP (IX+d) CP (IY+d)
      CP_IX_d_0, CP_IY_d_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
      end

      CP_IX_d_1, CP_IY_d_1: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
      end

      CP_IX_d_2, CP_IY_d_2: begin
        ld_TEMP = 1;
      end

      CP_IX_d_3, CP_IY_d_3: begin
        alu_op = `ADD_SE_B;
        drive_IXH = (op0[7:4] == 4'hD);
        drive_IXL = (op0[7:4] == 4'hD);
        drive_IYH = (op0[7:4] == 4'hF);
        drive_IYL = (op0[7:4] == 4'hF);
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      CP_IX_d_8, CP_IY_d_8: begin
        drive_MAR = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      CP_IX_d_9, CP_IY_d_9: begin
        drive_MAR = 1;
        MRD_bus = 1;
      end

      CP_IX_d_10, CP_IY_d_10: begin
        ld_F_data = 1;
        set_N = 2'b11;
        ld_F_data      = 1;
        alu_op         = `SUB;
      end

      //CP r
      CP_r_0: begin
        ld_F_data = 1;
        set_N = 2'b11;

        unique case(op0[2:0])
          3'b111: begin
            ld_F_data      = 1;
            alu_op         = `SUB;
            drive_A        = 1;
          end
          3'b000: begin
            ld_F_data      = 1;
            alu_op         = `SUB;
            drive_B        = 1;
            drive_reg_data = 1;
          end
          3'b001: begin
            ld_F_data      = 1;
            alu_op         = `SUB;
            drive_C        = 1;
            drive_reg_data = 1;
          end
          3'b010: begin
            ld_F_data      = 1;
            alu_op         = `SUB;
            drive_D        = 1;
            drive_reg_data = 1;
          end
          3'b011: begin
            ld_F_data      = 1;
            alu_op         = `SUB;
            drive_E        = 1;
            drive_reg_data = 1;
          end
          3'b100: begin
            ld_F_data      = 1;
            alu_op         = `SUB;
            drive_H        = 1;
            drive_reg_data = 1;
          end
          3'b101: begin
            ld_F_data      = 1;
            alu_op         = `SUB;
            drive_L        = 1;
            drive_reg_data = 1;
          end

        endcase
      end

      //CP n
      CP_n_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      CP_n_1: begin
        MRD_bus = 1;
        drive_MAR = 1;
      end

      CP_n_2: begin
        ld_F_data = 1;
        set_N = 2'b11;
        ld_F_data      = 1;
        alu_op         = `SUB;
      end

      //INC r
      INC_r_0: begin
        ld_F_data = 1;
        set_N = 2'b10;

        unique case(op0[5:3])
          3'b111: begin
            drive_reg_data = 1;
            drive_alu_data = 1;
            drive_A = 1;
            ld_A    = 1;
            alu_op  = `INCR_A_8;
          end
          3'b000: begin
            drive_reg_data = 1;
            drive_alu_data = 1;
            drive_B = 1;
            ld_B    = 1;
            alu_op  = `INCR_B_8;
          end
          3'b001: begin
            drive_reg_data = 1;
            drive_alu_data = 1;
            drive_C = 1;
            ld_C    = 1;
            alu_op  = `INCR_B_8;
          end
          3'b010: begin
            drive_reg_data = 1;
            drive_alu_data = 1;
            drive_D = 1;
            ld_D    = 1;
            alu_op  = `INCR_B_8;
          end
          3'b011: begin
            drive_reg_data = 1;
            drive_alu_data = 1;
            drive_E = 1;
            ld_E    = 1;
            alu_op  = `INCR_B_8;
          end
          3'b100: begin
            drive_reg_data = 1;
            drive_alu_data = 1;
            drive_H = 1;
            ld_H    = 1;
            alu_op  = `INCR_B_8;
          end
          3'b101: begin
            drive_reg_data = 1;
            drive_alu_data = 1;
            drive_L = 1;
            ld_L    = 1;
            alu_op  = `INCR_B_8;
          end
        endcase
      end

      //INC (HL)
      INC_HL_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
        MRD_start = 1;
        MRD_bus   = 1;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      INC_HL_1: begin
        drive_MAR = 1;
        MRD_bus = 1;
      end

      INC_HL_2: begin
        ld_STRH = 1;
      end

      INC_HL_3: begin
        ld_F_data = 1;
        set_N = 2'b10;
        drive_reg_data = 1;
        drive_alu_data = 1;
        drive_STRH = 1;
        ld_STRH    = 1;
        alu_op     = `INCR_B_8;
      end

      INC_HL_4: begin
        drive_STRH = 1;
        drive_reg_data = 1;
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;
      end

      INC_HL_5: begin
        drive_STRH = 1;
        drive_reg_data = 1;
        MWR_bus = 1;
        drive_MAR = 1;
      end

      //INC (IX+d), INC (IY+d)
      INC_IX_d_0, INC_IY_d_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
      end

      INC_IX_d_1, INC_IY_d_1: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
      end

      INC_IX_d_2, INC_IY_d_2: begin
        ld_TEMP = 1;
      end

      INC_IX_d_3, INC_IY_d_3: begin
        alu_op = `ADD_SE_B;
        drive_IXH = (state == INC_IX_d_3);
        drive_IXL = (state == INC_IX_d_3);
        drive_IYH = (state == INC_IY_d_3);
        drive_IYL = (state == INC_IY_d_3);
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      INC_IX_d_8, INC_IY_d_8: begin
        drive_MAR = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      INC_IX_d_9, INC_IY_d_9: begin
        drive_MAR = 1;
        MRD_bus = 1;
      end

      INC_IX_d_10, INC_IY_d_10: begin
        ld_STRH = 1;
      end

      INC_IX_d_11, INC_IY_d_11: begin
        ld_F_data = 1;
        set_N = 2'b10;
        drive_reg_data = 1;
        drive_alu_data = 1;
        drive_STRH = 1;
        ld_STRH    = 1;
        alu_op     = `INCR_B_8;
      end

      INC_IX_d_12, INC_IY_d_12: begin
        drive_STRH = 1;
        drive_reg_data = 1;
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;
      end

      INC_IX_d_13, INC_IY_d_13: begin
        drive_STRH = 1;
        drive_reg_data = 1;
        MWR_bus = 1;
        drive_MAR = 1;
      end

      //-----------------------------------------------------------------------
      //END 8-bit arithmetic group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN 16-bit arithmetic group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //END 16-bit arithmetic group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN General Purpose Arith and CPU Control
      //-----------------------------------------------------------------------

      CPL_0: begin
        set_H = 2'b11;
        set_N = 2'b11;
        alu_op         = `ALU_CPL;
        drive_alu_data = 1;
        ld_A           = 1;
        drive_A        = 1;
      end

      CCF_0: begin
        ld_F_data = 1;
        alu_op    = `ALU_CCF;
        set_N = 2'b10;
      end

      SCF_0: begin
        set_C = 2'b11;
        set_H = 2'b10;
        set_N = 2'b10;
      end

      //-----------------------------------------------------------------------
      //END General Purpose Arith and CPU Control
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Bit Set, Rst, and Test group
      //-----------------------------------------------------------------------

      //BIT_b_r,SET_b_r,RES_b_r
      BIT_b_r_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
      end

      BIT_b_r_1: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
      end

      BIT_b_r_3: begin
        drive_alu_data = 1;
        alu_op = {op1[7:6],1'b0,op1[5:3]};
        ld_F_data = (op1[7:6] == 2'b01);
        unique case(op1[2:0])
          3'b000: begin
            drive_B = 1;
            drive_reg_data = 1;
            ld_B = (op1[7:6] != 2'b01);
          end
          3'b001: begin
            drive_C = 1;
            drive_reg_data = 1;
            ld_C = (op1[7:6] != 2'b01);
          end
          3'b010: begin
            drive_D = 1;
            drive_reg_data = 1;
            ld_D = (op1[7:6] != 2'b01);
          end
          3'b011: begin
            drive_E = 1;
            drive_reg_data = 1;
            ld_E = (op1[7:6] != 2'b01);
          end
          3'b100: begin
            drive_H = 1;
            drive_reg_data = 1;
            ld_H = (op1[7:6] != 2'b01);
          end
          3'b101: begin
            drive_L = 1;
            drive_reg_data = 1;
            ld_L = (op1[7:6] != 2'b01);
          end
          3'b110: begin
            drive_alu_data = 0;
            alu_op = `ALU_NOP;
            ld_F_data = 0;
            drive_alu_addr = 1;
            alu_op = `ALU_NOP;
            drive_reg_addr = 1;
            drive_H = 1;
            drive_L = 1;
            MRD_start = 1;
            MRD_bus   = 1;
            ld_MARL = 1;
            ld_MARH = 1;
          end
          3'b111: begin
            drive_A = 1;
            drive_reg_data = 1;
            ld_A = (op1[7:6] != 2'b01);
          end
        endcase
      end

      //BIT_b_HL_x
      BIT_b_HL_x_0: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_H = 1;
        drive_L = 1;
      end

      BIT_b_HL_x_1: begin
        alu_op = {op1[7:6],1'b0,op1[5:3]};
        drive_alu_data = (op1[7:6] != 2'b01);
        ld_F_data = (op1[7:6] == 2'b01);
        ld_L = (op1[7:6] != 2'b01);
      end

      BIT_b_HL_x_2: begin
        if(op1[7:6] != 2'b01) begin
          drive_L = 1;
          drive_reg_data = 1;
          drive_MAR = 1;
          MWR_start = 1;
          MWR_bus   = 1;
        end
      end

      BIT_b_HL_x_3: begin
        if(op1[7:6] != 2'b01) begin
          drive_L = 1;
          drive_reg_data = 1;
          drive_MAR = 1;
          MWR_bus = 1;
        end
      end

      SET_b_HL_x_0: begin
        drive_MAR = 1;
        ld_H = 1;
        ld_L = 1;
      end 

      //BIT_b_IX_d_x
      BIT_b_IX_d_x_0,BIT_b_IX_d_x_3: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
      end

      BIT_b_IX_d_x_1,BIT_b_IX_d_x_4: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
      end

      BIT_b_IX_d_x_2: begin
        ld_TEMP = 1;
      end

      BIT_b_IX_d_x_6: begin
        drive_TEMP = 1;
        drive_alu_addr = 1;
        alu_op         = `ADD_SE_B;
        drive_reg_addr = 1;
        drive_IXL        = 1;
        drive_IXH        = 1;
        ld_IXL           = 1;
        ld_IXH           = 1;
        ld_IXH = 0;
        ld_IXL = 0;
        ld_MARL = 1;
        ld_MARH = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      BIT_b_IX_d_x_7: begin
        MRD_bus = 1;
        drive_MAR = 1;
      end

      BIT_b_IX_d_x_8: begin
        alu_op = {op1[7:6],1'b0,op1[5:3]};
        drive_alu_data = (op1[7:6] != 2'b01);
        ld_F_data = (op1[7:6] == 2'b01);
        ld_STRL = (op1[7:6] != 2'b01);
      end

      SET_b_IX_d_x_0: begin
        drive_STRL = 1;
        drive_reg_data = 1;
        drive_MAR = 1;
        MWR_start = 1;
        MWR_bus   = 1;
      end

      SET_b_IX_d_x_1: begin
        drive_STRL = 1;
        drive_reg_data = 1;
        drive_MAR = 1;
        MWR_bus = 1;
      end
    
      //BIT_b_IY_d_x
      BIT_b_IY_d_x_0,BIT_b_IY_d_x_3: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
      end

      BIT_b_IY_d_x_1,BIT_b_IY_d_x_4: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
      end

      BIT_b_IY_d_x_2: begin
        ld_TEMP = 1;
      end

      BIT_b_IY_d_x_6: begin
        drive_TEMP = 1;
        drive_alu_addr = 1;
        alu_op         = `ADD_SE_B;
        drive_reg_addr = 1;
        drive_IYL        = 1;
        drive_IYH        = 1;
        ld_IYL           = 1;
        ld_IYH           = 1;
        ld_IYH = 0;
        ld_IYL = 0;
        ld_MARL = 1;
        ld_MARH = 1;
        MRD_start = 1;
        MRD_bus   = 1;
      end

      BIT_b_IY_d_x_7: begin
        MRD_bus = 1;
        drive_MAR = 1;
      end

      BIT_b_IY_d_x_8: begin
        alu_op = {2'b10,op1[5:3]};
        drive_alu_data = (op1[7:6] != 2'b01);
        ld_F_data = (op1[7:6] == 2'b01);
        ld_STRL = (op1[7:6] != 2'b01);
      end

      SET_b_IY_d_x_0: begin
        drive_STRL = 1;
        drive_reg_data = 1;
        drive_MAR = 1;
        MWR_start = 1;
        MWR_bus   = 1;
      end

      SET_b_IY_d_x_1: begin
        drive_STRL = 1;
        drive_reg_data = 1;
        drive_MAR = 1;
        MWR_bus = 1;
      end

      //-----------------------------------------------------------------------
      //END Bit Set, Rst, and Test group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Jump group
      //-----------------------------------------------------------------------

      //JP_nn
      JP_nn_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
      end

      JP_nn_1: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
      end

      JP_nn_2: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op = `INCR_A_16;
        ld_MARH = 1;
        ld_MARL = 1;
        ld_PCL = 1;
      end

      JP_nn_3: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      JP_nn_4: begin
        MRD_bus = 1;
        drive_MAR = 1;
      end

      JP_nn_5: begin
        ld_PCH = 1;
      end

      //JP_cc_nn
      JP_cc_nn_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
      end

      JP_cc_nn_1: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
      end

      JP_cc_nn_2: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op = `INCR_A_16;
        ld_MARH = 1;
        ld_MARL = 1;
        unique case(op0[5:3])
          3'b000: ld_PCL = !flags[6];
          3'b001: ld_PCL = flags[6];
          3'b010: ld_PCL = !flags[0];
          3'b011: ld_PCL = flags[0];
          3'b100: ld_PCL = !flags[2];
          3'b101: ld_PCL = flags[2];
          3'b110: ld_PCL = !flags[7];
          3'b111: ld_PCL = flags[7];
        endcase
      end

      JP_cc_nn_3: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      JP_cc_nn_4: begin
        MRD_bus = 1;
        drive_MAR = 1;
      end

      JP_cc_nn_5: begin
        unique case(op0[5:3])
          3'b000: ld_PCH = !flags[6];
          3'b001: ld_PCH = flags[6];
          3'b010: ld_PCH = !flags[0];
          3'b011: ld_PCH = flags[0];
          3'b100: ld_PCH = !flags[2];
          3'b101: ld_PCH = flags[2];
          3'b110: ld_PCH = !flags[7];
          3'b111: ld_PCH = flags[7];
        endcase
      end

      //JR_e,JR_C_e,JR_NC_e,JR_Z_e,JR_NZ_e
      JR_e_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
      end

      JR_e_1: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
      end

      JR_e_2: begin
        ld_TEMP = 1;
      end

      JR_e_3: begin
        drive_alu_addr = 1;
        alu_op         = `ADD_SE_B;
        drive_reg_addr = 1;
        drive_PCL        = 1;
        drive_PCH        = 1;
        ld_PCL           = 1;
        ld_PCH           = 1;
        ld_F_addr = 0;
        unique case(op0)
          8'h38: begin
            ld_PCH = flags[0];
            ld_PCL = flags[0];
          end
          8'h30: begin
            ld_PCH = !flags[0];
            ld_PCL = !flags[0];
          end
          8'h28: begin
            ld_PCH = flags[6];
            ld_PCL = flags[6];
          end
          8'h20: begin
            ld_PCH = !flags[6];
            ld_PCL = !flags[6];
          end
          8'h18: begin
            ld_PCH = 1;
            ld_PCL = 1;
          end
        endcase
      end

      //-----------------------------------------------------------------------
      //END Jump group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Call and Return group
      //-----------------------------------------------------------------------

      //CALL_nn
      CALL_nn_0,CALL_nn_3: begin
        MRD_start = 1;
        MRD_bus   = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `INCR_A_16;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
      end

      CALL_nn_1,CALL_nn_4: begin
        MRD_bus = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `ALU_NOP;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
      end

      CALL_nn_2: begin
        ld_MDR1 = 1;
      end

      CALL_nn_5: begin
        ld_MDR2 = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        alu_op = `DECR_A;
        ld_SPL = 1;
        ld_SPH = 1;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      CALL_nn_6: begin
        drive_MAR = 1;
        MWR_start = 1;
        MWR_bus   = 1;
        drive_PCH = 1;
        drive_reg_data = 1;
      end

      CALL_nn_7: begin
        drive_MAR = 1;
        MWR_bus = 1;
        drive_PCH = 1;
        drive_reg_data = 1;
      end

      CALL_nn_8: begin
        ld_PCH = 1;
        drive_MDR2 = 1;
      end

      CALL_nn_9: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        alu_op = `DECR_A;
        ld_SPL = 1;
        ld_SPH = 1;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      CALL_nn_10: begin
        MWR_start = 1;
        MWR_bus   = 1;
        drive_PCL = 1;
        drive_reg_data = 1;
        drive_MAR = 1;
      end

      CALL_nn_11: begin
        MWR_bus = 1;
        drive_PCL = 1;
        drive_reg_data = 1;
        drive_MAR = 1;
      end

      CALL_nn_12: begin
        ld_PCL = 1;
        drive_MDR1 = 1;
      end

      //CALL_cc_nn
      CALL_cc_nn_0,CALL_cc_nn_3: begin
        MRD_start = 1;
        MRD_bus   = 1;
        ld_PCH    = 1;
        ld_PCL    = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `INCR_A_16;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
      end

      CALL_cc_nn_1,CALL_cc_nn_4: begin
        MRD_bus = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        alu_op    = `ALU_NOP;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
      end

      CALL_cc_nn_2: begin
        ld_MDR1 = 1;
      end

      CALL_cc_nn_5: begin
        ld_MDR2 = 1;
        if(next_state == CALL_cc_nn_6) begin
          drive_alu_addr = 1;
          alu_op = `ALU_NOP;
          drive_reg_addr = 1;
          drive_SPL = 1;
          drive_SPH = 1;
          alu_op = `DECR_A;
          ld_SPL = 1;
          ld_SPH = 1;
          ld_MARH = 1;
          ld_MARL = 1;
        end
      end

      CALL_cc_nn_6: begin
        drive_MAR = 1;
        MWR_start = 1;
        MWR_bus   = 1;
        drive_PCH = 1;
        drive_reg_data = 1;
      end

      CALL_cc_nn_7: begin
        drive_MAR = 1;
        MWR_bus = 1;
        drive_PCH = 1;
        drive_reg_data = 1;
      end

      CALL_cc_nn_8: begin
        ld_PCH = 1;
        drive_MDR2 = 1;
      end

      CALL_cc_nn_9: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        alu_op = `DECR_A;
        ld_SPL = 1;
        ld_SPH = 1;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      CALL_cc_nn_10: begin
        MWR_start = 1;
        MWR_bus   = 1;
        drive_PCL = 1;
        drive_reg_data = 1;
        drive_MAR = 1;
      end

      CALL_cc_nn_11: begin
        MWR_bus = 1;
        drive_PCL = 1;
        drive_reg_data = 1;
        drive_MAR = 1;
      end

      CALL_cc_nn_12: begin
        ld_PCL = 1;
        drive_MDR1 = 1;
      end

      //RET
      RET_0: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
      end

      RET_1: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
      end

      RET_2: begin
        ld_PCL = 1;
      end

      RET_3: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPH    = 1;
        ld_SPL    = 1;
      end

      RET_4: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
      end

      RET_5: begin
        ld_PCH = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPH    = 1;
        ld_SPL    = 1;
      end

      //RET_cc
      RET_cc_1: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
      end

      RET_cc_2: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
      end

      RET_cc_3: begin
        ld_PCL = 1;
      end

      RET_cc_4: begin
        MRD_start = 1;
        MRD_bus   = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPH    = 1;
        ld_SPL    = 1;
      end

      RET_cc_5: begin
        MRD_bus = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
      end

      RET_cc_6: begin
        ld_PCH = 1;
        drive_alu_addr = 1;
        alu_op         = `INCR_A_16;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPH    = 1;
        ld_SPL    = 1;
      end

      RST_p_0: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPL = 1;
        ld_SPH = 1;
        alu_op = `DECR_A;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      RST_p_1: begin
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;
        drive_PCH = 1;
        drive_reg_data = 1;
      end

      RST_p_2: begin
        MWR_bus = 1;
        drive_MAR = 1;
        drive_PCH = 1;
        drive_reg_data = 1;
      end

      RST_p_3: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_SPL = 1;
        drive_SPH = 1;
        ld_SPL = 1;
        ld_SPH = 1;
        alu_op = `DECR_A;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      RST_p_4: begin
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;
        drive_PCL = 1;
        drive_reg_data = 1;
      end

      RST_p_5: begin
        MWR_bus = 1;
        drive_MAR = 1;
        drive_PCL = 1;
        drive_reg_data = 1;
      end

      RST_p_6: begin
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        drive_reg_addr = 1;
        drive_PCH = 1;
        drive_PCL = 1;
        ld_PCH = 1;
        ld_PCL = 1;
        drive_TEMP = 1;
        alu_op = `ALU_RST;
      end

      //-----------------------------------------------------------------------
      //END Call and Return group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Input and Output group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //END Input and Output group
      //-----------------------------------------------------------------------

    endcase
  end


endmodule: decoder

//-----------------------------------------------------------------------------
//NMI_fsm
//  This module generates the relevant bus signals for a non-maskable interrupt
//  subroutine.
//-----------------------------------------------------------------------------
module NMI_fsm(
  input   logic clk,
  input   logic rst_L,

  input   logic NMI_start,
  input   logic WAIT_L,

  output  logic NMI_M1_L,
  output  logic NMI_MREQ_L,
  output  logic NMI_IORQ_L
);

  //TODO: actually understand this portion of the code before trying to
  //      implement it

  //TODO: the processor automatically stacks the PC -- and it is up to the
  //      programmer to unstack the PC in the interrupt handler

  enum logic [3:0] {
    T1  = 4'b0000,
    T2  = 4'b0001,
    TW1 = 4'b0010,
    TW2 = 4'b0011,
    T3  = 4'b0100,
    T4  = 4'b0101
  }state, next_state;

  always_ff @(posedge clk) begin
    if(~rst_L) begin
      state <= T1;
    end

    else begin
      state <= next_state;
    end
  end

  //next state logic
  always_comb begin
    case(state)
      T1:   next_state = (NMI_start) ? T2 : T1;
      T2:   next_state = TW1;

      //TODO: might need wait state support for input WAIT_L
      TW1:  next_state = TW2;
      TW2:  next_state = T3;
      T3:   next_state = T4;
      T4:   next_state = T1;
    endcase
  end

  //output logic
  always_comb begin
    //defaults
    NMI_M1_L    = 1;
    NMI_MREQ_L  = 1;
    NMI_IORQ_L  = 1;

    case(state)
      T1: begin
        NMI_M1_L = (NMI_start) ? 0 : 1;
      end

      T2: begin
        NMI_M1_L = 0;
      end

      TW1: begin
        NMI_M1_L   = 0;
        NMI_IORQ_L = 0;
      end

      TW2: begin
        NMI_M1_L   = 0;
        NMI_IORQ_L = 0;
      end

    endcase
  end

endmodule: NMI_fsm

//-----------------------------------------------------------------------------
//MRD_fsm
//  This module generates the relevant bus signals for the memory read
//  macro state.
//-----------------------------------------------------------------------------
module MRD_fsm(
  input   logic clk,
  input   logic rst_L,

  input   logic WAIT_L,
  input   logic MRD_start,
  output  logic MRD_MREQ_L,
  output  logic MRD_RD_L
);

  enum logic [1:0] {
    T1,
    T2,
    T3
  } state, next_state;

  always @(posedge clk) begin
    if(~rst_L) begin
      state <= T1;
    end

    else begin
      state <= next_state;
    end
  end

  //next state logic
  always_comb begin
    case(state)
      T1: next_state = (MRD_start) ?  T2 : T1;
      T2: next_state = T3;
      T3: next_state = T1;
    endcase
  end

  //output logic
  always_comb begin
    MRD_MREQ_L = 1;
    MRD_RD_L   = 1;

    case(state)
      //TODO: Wait_L timing

      T1: begin
        if(MRD_start) begin
          MRD_MREQ_L = 0;
          MRD_RD_L   = 0;
        end
      end

      T2: begin
        MRD_MREQ_L = 0;
        MRD_RD_L   = 0;
      end
    endcase
  end

endmodule: MRD_fsm


//-----------------------------------------------------------------------------
//MWR_fsm
//  This module generates the relevant bus signals for the memory write
//  macro state.
//-----------------------------------------------------------------------------
module MWR_fsm(
  input   logic clk,
  input   logic rst_L,

  input   logic WAIT_L,
  input   logic MWR_start,
  output  logic MWR_MREQ_L,
  output  logic MWR_WR_L
);

  enum logic [1:0] {
    T1,
    T2,
    T3
  } state, next_state;

  always @(posedge clk) begin
    if(~rst_L) begin
      state <= T1;
    end

    else begin
      state <= next_state;
    end
  end

  //next state logic
  always_comb begin
    case(state)
      T1: next_state = (MWR_start) ?  T2 : T1;
      T2: next_state = T3;
      T3: next_state = T1;
    endcase
  end

  //output logic
  always_comb begin
    MWR_MREQ_L = 1;
    MWR_WR_L   = 1;

    case(state)
      //TODO: Wait_L timing

      T1: begin
        if(MWR_start) begin
          MWR_MREQ_L = 0;
          MWR_WR_L   = 0;
        end
      end

      T2: begin
        MWR_MREQ_L = 0;
        MWR_WR_L   = 0;
      end
    endcase
  end

endmodule: MWR_fsm


//-----------------------------------------------------------------------------
//OCF_fsm
//  This module generates the relevant bus signals for an instruction fetch
//  macro state.
//-----------------------------------------------------------------------------
module OCF_fsm(
  input   logic clk,
  input   logic rst_L,

  //---------------------------------------------------------------------------
  //Internal control signals
  //  These signals are used to control this fsm and only this fsm
  //---------------------------------------------------------------------------
  input   logic         OCF_start,

  //---------------------------------------------------------------------------
  //Inputs that come from the top level
  //  This FSM is the only one generating these signals, so they
  //  get the same names as the top level signals
  //---------------------------------------------------------------------------
  input   logic         WAIT_L,

  //---------------------------------------------------------------------------
  //Outputs that bubble up to top level
  //  This FSM isn't the only one that uses these signals, so they are
  //  prefaced with the name of the fsm
  //---------------------------------------------------------------------------
  output  logic         OCF_M1_L,
  output  logic         OCF_MREQ_L,
  output  logic         OCF_RD_L,
  output  logic         OCF_RFSH_L

);

  //microstates in time cycles
  enum logic [2:0] {
    T1   = 3'd0,
    T2   = 3'd1,
    T3   = 3'd2,
    T4   = 3'd3
  } state, next_state;

  always @(posedge clk) begin
    if(~rst_L) begin
      state <= T1;
    end
    else begin
      state <= next_state;
    end
  end

  //next state logic
  always_comb begin
    //wait for a start signal, then just step through the states
    case (state)

      T1: begin
        next_state = (OCF_start) ? T2 : T1;
      end

      //TODO: If a wait comes in during the T2 cycle, we might need to
      //acknowledge it
      T2: begin
        next_state = T3;
      end

      T3: begin
        next_state = T4;
      end

      //Go back to the beginning
      T4: begin
        next_state = T1;
      end

    endcase
  end

  //output logic
  always_comb begin

    //set defaults
    OCF_MREQ_L      = 1;
    OCF_RD_L        = 1;
    OCF_M1_L        = 1;
    OCF_RFSH_L      = 1;

    case(state)

      //start on the same clock cycle that we receive the start signal
      //so that the output is valid on clock edge T1/T2
      T1: begin
        if(OCF_start) begin
          OCF_MREQ_L   = 0;
          OCF_RD_L     = 0;
          OCF_M1_L     = 0;
        end
      end

      //It is in this cycle that we might potentially see a wait cycle
      //inserted. For now we are not going to do anything about the
      //wait cycle, but we can include extra logic to wait until the
      //signal has subsided.
      //TODO: Evaulate the necessity of WAIT_L support
      T2: begin
        OCF_MREQ_L   = 0;
        OCF_RD_L     = 0;
        OCF_M1_L     = 0;
      end

      //It is in this state and T4 that the refresh address is sent
      //out to the DRAM. We do not believe that we need to implement
      //support for this feature at this time.
      //TODO: Evalutate the necessity of RFSH_L support

      //It is also on the T2/T3 clock edge that valid data comes back
      //from the memory. We are assuming that the value was latched
      //in, and now it is safe for us to output the value from
      //the module.
      T3: begin
      end

      T4: begin
      end

    endcase
  end

endmodule: OCF_fsm
