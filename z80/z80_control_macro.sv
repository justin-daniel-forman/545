`include "../z80_defines.vh"

module control_logic (

  input   logic       clk,
  input   logic       rst_L,

  output  logic [31:0] curr_state,

  //---------------------------------------------------------------------------
  //Bus Signals
  //  - data_in: The control segment only receives data from the bus
  //---------------------------------------------------------------------------
  input   logic [7:0]   data_in,
  input   logic [7:0]   flags,

  //---------------------------------------------------------------------------
  //Maskable interrupt control signals
  //---------------------------------------------------------------------------
  output logic          enable_interrupts,
  output logic          disable_interrupts,
  output logic          push_interrupts,
  output logic          pop_interrupts,
  input  logic          IFF1_out,

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

  logic IN_start;
  logic IN_IORQ_L;
  logic IN_RD_L;
  logic IN_bus;

  logic OUT_start;
  logic OUT_IORQ_L;
  logic OUT_WR_L;
  logic OUT_bus;

  logic INT_start;
  logic INT_IORQ_L;
  logic INT_M1_L;
  logic INT_bus;

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

  IN_fsm port_in(
    .clk,
    .rst_L,
    .IN_start,

    .WAIT_L,
    .IN_IORQ_L,
    .IN_RD_L
  );

  OUT_fsm port_out(
    .clk,
    .rst_L,
    .OUT_start,

    .WAIT_L,
    .OUT_IORQ_L,
    .OUT_WR_L
  );

  INT_fsm interrupt_ack(
    .clk,
    .rst_L,
    .INT_start,

    .WAIT_L,
    .INT_IORQ_L,
    .INT_M1_L
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
    .INT_L,
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
    .MRD_bus,
    .IN_start,
    .IN_bus,
    .OUT_start,
    .OUT_bus,
    .INT_start,
    .INT_bus,

    //Interrupt controls
    .enable_interrupts,
    .disable_interrupts,
    .push_interrupts,
    .pop_interrupts,
    .IFF1_out,

    //debug
    .curr_state
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

    else if(IN_bus) begin
      RD_L   = IN_RD_L;
      IORQ_L = IN_IORQ_L;
    end

    else if(OUT_bus) begin
      WR_L   = OUT_WR_L;
      IORQ_L = OUT_IORQ_L;
    end

    else if(INT_bus) begin
      IORQ_L = INT_IORQ_L;
      M1_L   = INT_M1_L;
    end

    else begin
      //default signals
      M1_L    = 1'b1;
      MREQ_L  = 1'b1;
      IORQ_L  = 1'b1;
      RD_L    = 1'b1;
      WR_L    = 1'b1;
      RFSH_L  = 1'b1;
      HALT_L  = 1'b1;
      BUSACK_L = 1'b1;
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
  input logic INT_L,

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
  output logic      MWR_bus,
  output logic      IN_start,
  output logic      IN_bus,
  output logic      OUT_start,
  output logic      OUT_bus,
  output logic      INT_start,
  output logic      INT_bus,

  //---------------------------------------------------------------------------
  // Maskable interrupt controls
  //---------------------------------------------------------------------------
  output logic      enable_interrupts,
  output logic      disable_interrupts,
  output logic      push_interrupts,
  output logic      pop_interrupts,
  input  logic      IFF1_out,

  output logic [31:0] curr_state
);

  enum logic [31:0] {
    START,

    MACRO_DEFINE_STATES FETCH 8

    MACRO_DEFINE_STATES INT 9

    MACRO_DEFINE_STATES LD_r_r 1

    MACRO_DEFINE_STATES LD_r_n 3

    MACRO_DEFINE_STATES LD_r_HL 3

    MACRO_DEFINE_STATES LD_r_IX_d 11

    MACRO_DEFINE_STATES LD_r_IY_d 11

    MACRO_DEFINE_STATES LD_HL_r 3

    MACRO_DEFINE_STATES LD_IX_d_r 11

    MACRO_DEFINE_STATES LD_IY_d_r 11

    MACRO_DEFINE_STATES LD_HL_n 6

    MACRO_DEFINE_STATES LD_IX_d_n 11

    MACRO_DEFINE_STATES LD_IY_d_n 11

    MACRO_DEFINE_STATES LD_A_BC 3

    MACRO_DEFINE_STATES LD_A_DE 3

    MACRO_DEFINE_STATES LD_A_nn 9

    MACRO_DEFINE_STATES LD_BC_A 3

    MACRO_DEFINE_STATES LD_DE_A 3

    MACRO_DEFINE_STATES LD_nn_A 9

    MACRO_DEFINE_STATES LD_dd_nn 6

    MACRO_DEFINE_STATES LD_IX_nn 6

    MACRO_DEFINE_STATES LD_IY_nn 6

    MACRO_DEFINE_STATES LD_HL_nn 12

    MACRO_DEFINE_STATES LD_dd_nn_x 12

    MACRO_DEFINE_STATES LD_IX_nn_x 12

    MACRO_DEFINE_STATES LD_IY_nn_x 12

    MACRO_DEFINE_STATES LD_nn_x_HL 12

    MACRO_DEFINE_STATES LD_nn_x_dd 12

    MACRO_DEFINE_STATES LD_nn_x_IX 12

    MACRO_DEFINE_STATES LD_nn_x_IY 12

    MACRO_DEFINE_STATES LD_SP_HL 2

    MACRO_DEFINE_STATES LD_SP_IX 2

    MACRO_DEFINE_STATES LD_SP_IY 2

    MACRO_DEFINE_STATES PUSH_qq 7

    MACRO_DEFINE_STATES PUSH_IX 7

    MACRO_DEFINE_STATES PUSH_IY 7

    MACRO_DEFINE_STATES POP_qq 6

    MACRO_DEFINE_STATES POP_IX 6

    MACRO_DEFINE_STATES POP_IY 6

    MACRO_DEFINE_STATES EX_DE_HL 1

    MACRO_DEFINE_STATES EX_AF_AF 1

    MACRO_DEFINE_STATES EXX 1

    MACRO_DEFINE_STATES EX_SP_HL 15

    MACRO_DEFINE_STATES EX_SP_IX 15

    MACRO_DEFINE_STATES EX_SP_IY 15

    MACRO_DEFINE_STATES LDI 8

    MACRO_DEFINE_STATES LDIR 13

    MACRO_DEFINE_STATES LDD 8

    MACRO_DEFINE_STATES LDDR 13

    MACRO_DEFINE_STATES CPI 8

    MACRO_DEFINE_STATES CPIR 13

    MACRO_DEFINE_STATES CPD 8

    MACRO_DEFINE_STATES CPDR 13

    MACRO_DEFINE_STATES ADD_A_r 1

    MACRO_DEFINE_STATES ADD_A_n 3

    MACRO_DEFINE_STATES ADD_A_HL 3

    MACRO_DEFINE_STATES ADD_A_IX_d 11

    MACRO_DEFINE_STATES ADD_A_IY_d 11

    MACRO_DEFINE_STATES ADC_A_r 1

    MACRO_DEFINE_STATES ADC_A_n 3

    MACRO_DEFINE_STATES ADC_A_HL 3

    MACRO_DEFINE_STATES ADC_A_IX_d 11

    MACRO_DEFINE_STATES ADC_A_IY_d 11

    MACRO_DEFINE_STATES SUB_r 1

    MACRO_DEFINE_STATES SUB_n 3

    MACRO_DEFINE_STATES SUB_HL 3

    MACRO_DEFINE_STATES SUB_IX_d 11

    MACRO_DEFINE_STATES SUB_IY_d 11

    MACRO_DEFINE_STATES SBC_r 1

    MACRO_DEFINE_STATES SBC_n 3

    MACRO_DEFINE_STATES SBC_HL 3

    MACRO_DEFINE_STATES SBC_IX_d 11

    MACRO_DEFINE_STATES SBC_IY_d 11

    MACRO_DEFINE_STATES AND_r 1

    MACRO_DEFINE_STATES AND_n 3

    MACRO_DEFINE_STATES AND_HL 3

    MACRO_DEFINE_STATES AND_IX_d 11

    MACRO_DEFINE_STATES AND_IY_d 11

    MACRO_DEFINE_STATES OR_r 1

    MACRO_DEFINE_STATES OR_n 3

    MACRO_DEFINE_STATES OR_HL 3

    MACRO_DEFINE_STATES OR_IX_d 11

    MACRO_DEFINE_STATES OR_IY_d 11

    MACRO_DEFINE_STATES XOR_r 1

    MACRO_DEFINE_STATES XOR_n 3

    MACRO_DEFINE_STATES XOR_HL 3

    MACRO_DEFINE_STATES XOR_IX_d 11

    MACRO_DEFINE_STATES XOR_IY_d 11

    MACRO_DEFINE_STATES CP_r 1

    MACRO_DEFINE_STATES CP_n 3

    MACRO_DEFINE_STATES CP_HL 3

    MACRO_DEFINE_STATES CP_IX_d 11

    MACRO_DEFINE_STATES CP_IY_d 11

    MACRO_DEFINE_STATES INC_r 1

    MACRO_DEFINE_STATES INC_HL 7

    MACRO_DEFINE_STATES INC_IX_d 15

    MACRO_DEFINE_STATES INC_IY_d 15

    MACRO_DEFINE_STATES DEC_r 1

    MACRO_DEFINE_STATES DEC_HL 7

    MACRO_DEFINE_STATES DEC_IX_d 15

    MACRO_DEFINE_STATES DEC_IY_d 15

    MACRO_DEFINE_STATES DAA 1

    MACRO_DEFINE_STATES CPL 1

    MACRO_DEFINE_STATES NEG 1

    MACRO_DEFINE_STATES CCF 1

    MACRO_DEFINE_STATES SCF 1

    MACRO_DEFINE_STATES NOP 1

    MACRO_DEFINE_STATES DI 1

    MACRO_DEFINE_STATES EI 1

    MACRO_DEFINE_STATES ADD_HL_ss 7

    MACRO_DEFINE_STATES ADC_HL_ss 7

    MACRO_DEFINE_STATES SBC_HL_ss 7

    MACRO_DEFINE_STATES ADD_IX_pp 7

    MACRO_DEFINE_STATES ADD_IY_rr 7

    MACRO_DEFINE_STATES INC_ss 2

    MACRO_DEFINE_STATES INC_IX 2

    MACRO_DEFINE_STATES INC_IY 2

    MACRO_DEFINE_STATES DEC_ss 2

    MACRO_DEFINE_STATES DEC_IX 2

    MACRO_DEFINE_STATES DEC_IY 2

    MACRO_DEFINE_STATES RLD 10

    MACRO_DEFINE_STATES RRD 10

    MACRO_DEFINE_STATES BIT_b_r 4

    MACRO_DEFINE_STATES BIT_b_HL_x 4

    MACRO_DEFINE_STATES BIT_b_IX_d_x 12

    MACRO_DEFINE_STATES BIT_b_IY_d_x 12

    MACRO_DEFINE_STATES SET_b_HL_x 3

    MACRO_DEFINE_STATES SET_b_IX_d_x 3

    MACRO_DEFINE_STATES SET_b_IY_d_x 3


    MACRO_DEFINE_STATES JP_nn 6

    MACRO_DEFINE_STATES JP_cc_nn 6

    MACRO_DEFINE_STATES JR_e 8

    MACRO_DEFINE_STATES JP_HL 1

    MACRO_DEFINE_STATES JP_IX 1

    MACRO_DEFINE_STATES JP_IY 1

    MACRO_DEFINE_STATES DJNZ_e 11

    MACRO_DEFINE_STATES CALL_nn 13

    MACRO_DEFINE_STATES CALL_cc_nn 13

    MACRO_DEFINE_STATES RET 6

    MACRO_DEFINE_STATES RET_cc 7

    MACRO_DEFINE_STATES RST_p 7

    MACRO_DEFINE_STATES IN_A_n 7

    MACRO_DEFINE_STATES IN_r_C 4

    MACRO_DEFINE_STATES INI 8

    MACRO_DEFINE_STATES INIR 13

    MACRO_DEFINE_STATES IND 8

    MACRO_DEFINE_STATES INDR 13

    MACRO_DEFINE_STATES OUT_n_A 7

    MACRO_DEFINE_STATES OUT_C_r 4

    MACRO_DEFINE_STATES OUTI 8

    MACRO_DEFINE_STATES OTIR 13

    MACRO_DEFINE_STATES OUTD 8

    MACRO_DEFINE_STATES OTDR 13

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

  assign curr_state = state;

  //Internal storage of opcode and operand data bytes that are
  //fetched as part of an execution
  logic [7:0] op0;
  logic [7:0] op1;
  logic [7:0] op2;

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
      FETCH_2: op1 <= op0;
      FETCH_5: op1 <= data_in;
      BIT_b_r_2: op1 <= data_in;
      BIT_b_IX_d_x_5: op1 <= data_in;
      BIT_b_IY_d_x_5: op1 <= data_in;
      default: begin end
    endcase
  end

  //next state logic
  always_comb begin
    case(state)

      //-----------------------------------------------------------------------
      //BEGIN Opcode Fetch Group
      //-----------------------------------------------------------------------

      //We are also going to sample the interrupt line at this point in time
      //which is one cycle later than the original z80 processor, but should
      //have the same functional effect. If an INT is received, we will
      //function in z80 mode 1 and jump to address 038 before restarting
      //our instruction fetch.

      //On processor restart, we want to access address 0, but FETCH0
      //automagically increments the PC for us, which we do not want
      //here
      START: next_state   = (~INT_L & IFF1_out) ? INT_0 : FETCH_1;

      //An OCF takes 4 cycles in total, but only 2 of those cycles are needed
      //to retreive the opcode (which comes in on T2/T3). The other two
      //cycles are spent refreshing the DRAM.
      FETCH_0: next_state = (~INT_L & IFF1_out) ? INT_0 : FETCH_1;
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
          `DEC_r:     next_state = (op0[5:3] != 3'b110) ? DEC_r_0   : FETCH_3;
          `DAA:       next_state = DAA_0;
          `CPL:       next_state = CPL_0;
          `CCF:       next_state = CCF_0;
          `SCF:       next_state = SCF_0;
          `NOP:       next_state = NOP_0;
          `EXT_INST:  next_state = EXT_INST_0;
          `IX_INST:   next_state = IX_INST_0;
          `IY_INST:   next_state = IY_INST_0;
          `RS_A:      next_state = BIT_b_r_3;
          `JP_HL:     next_state = JP_HL_0;
          `DJNZ_e:    next_state = DJNZ_e_0;
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
            `DEC_HL:    next_state = DEC_HL_0;
            `INC_ss:    next_state = INC_ss_0;
            `DEC_ss:    next_state = DEC_ss_0;
            `RST_p:     next_state = RST_p_0;
            `DI:        next_state = DI_0;
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
            `ADD_HL_ss:  next_state = ADD_HL_ss_0;
            `INC_ss:     next_state = INC_ss_0;
            `DEC_ss:     next_state = DEC_ss_0;
            `BIT_b:      next_state = BIT_b_r_0;
            `JP_nn:      next_state = JP_nn_0;
            `JP_cc_nn:   next_state = JP_cc_nn_0;
            `JR_e:       next_state = JR_e_0;
            `JR_C_e:     next_state = JR_e_0;
            `JR_NC_e:    next_state = JR_e_0;
            `JR_Z_e:     next_state = JR_e_0;
            `JR_NZ_e:    next_state = JR_e_0;
            `DJNZ_e:     next_state = DJNZ_e_0;
            `CALL_nn:    next_state = CALL_nn_0;
            `CALL_cc_nn: next_state = CALL_cc_nn_0;
            `RET:        next_state = RET_0;
            `RET_cc:     next_state = RET_cc_0;
            `RST_p:      next_state = RST_p_0;
            `IN_A_n:     next_state = IN_A_n_0;
            `OUT_n_A:    next_state = OUT_n_A_0;
            `DI:         next_state = DI_0;
            `EI:         next_state = EI_0;
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
          `JP_IX:     next_state = (op0[7:4] == 4'hD) ? JP_IX_0 : JP_IY_0;
          `JP_IY:     next_state = (op0[7:4] == 4'hF) ? JP_IY_0 : JP_IX_0;
          default:    next_state = FETCH_7;
        endcase
      end

      //If we don't need to do anything in the second OCF, then case
      //in Fetch 7 to start performing logic next cycle
      FETCH_7: begin
        casex(op1)
          //Some cases are identical and are only different in the first byte
          `LD_r_IX_d: begin
            if       (op0[7:4] == 4'hF) next_state = LD_r_IY_d_0;
            else if  (op0[7:4] == 4'hD) next_state = LD_r_IX_d_0;
            else                        next_state = FETCH_0;
          end
          `LD_r_IY_d: begin
            if       (op0[7:4] == 4'hF) next_state = LD_r_IY_d_0;
            else if  (op0[7:4] == 4'hD) next_state = LD_r_IX_d_0;
            else                        next_state = FETCH_0;
          end
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
          `DEC_IX_d:    next_state = (op0[7:4] == 4'hD) ?  DEC_IX_d_0 : DEC_IY_d_0;
          `DEC_IY_d:    next_state = (op0[7:4] == 4'hF) ?  DEC_IY_d_0 : DEC_IX_d_0;
          `NEG:         next_state = NEG_0;
          `INC_IX:      next_state = (op0[7:4] == 4'hD) ?  INC_IX_0   : INC_IY_0;
          `INC_IY:      next_state = (op0[7:4] == 4'hF) ?  INC_IY_0   : INC_IX_0;
          `DEC_IX:      next_state = (op0[7:4] == 4'hD) ?  DEC_IX_0   : DEC_IY_0;
          `DEC_IY:      next_state = (op0[7:4] == 4'hF) ?  DEC_IY_0   : DEC_IX_0;
          `ADC_HL_ss:   next_state = ADC_HL_ss_0;
          `SBC_HL_ss:   next_state = SBC_HL_ss_0;
          `ADD_IX_pp:   next_state = (op0[7:4]  == 4'hD) ?  ADD_IX_pp_0: ADD_IY_rr_0;
          `ADD_IY_rr:   next_state = (op0[7:4]  == 4'hF) ?  ADD_IY_rr_0: ADD_IX_pp_0;
          `BIT_b:       next_state = (op0[7:4] == 4'hD) ?  BIT_b_IX_d_x_0 : BIT_b_IY_d_x_0;
          `RLD:       next_state = RLD_0;
          `RRD:       next_state = RRD_0;
          `BIT_b:       next_state = (op0[7:4] == 4'hD) ?  BIT_b_IX_d_x_0 :BIT_b_IY_d_x_0;
          `IN_r_C:      next_state = IN_r_C_0;
          `OUT_C_r:     next_state = OUT_C_r_0;
          `INI:         next_state = INI_0;
          `INIR:        next_state = INIR_0;
          `IND:         next_state = IND_0;
          `INDR:        next_state = INDR_0;
          `OUTI:        next_state = OUTI_0;
          `OTIR:        next_state = OTIR_0;
          `OUTD:        next_state = OUTD_0;
          `OTDR:        next_state = OTDR_0;
           default:     next_state = FETCH_0;
        endcase
      end

      //Interrupt response returns to a fetch cycle when it is finished,
      //but it does not increment the PC then
      MACRO_ENUM_STATES_NR INT 9
      INT_8: next_state = START;

      //-----------------------------------------------------------------------
      //END Opcode fetch group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN 8-bit load group
      //-----------------------------------------------------------------------
      MACRO_ENUM_STATES LD_r_r 1

      MACRO_ENUM_STATES LD_r_n 3

      MACRO_ENUM_STATES LD_r_HL 3

      MACRO_ENUM_STATES LD_r_IX_d 11

      MACRO_ENUM_STATES LD_r_IY_d 11

      MACRO_ENUM_STATES LD_HL_r 3

      MACRO_ENUM_STATES LD_IX_d_r 11

      MACRO_ENUM_STATES LD_IY_d_r 11

      MACRO_ENUM_STATES LD_HL_n 6

      MACRO_ENUM_STATES LD_IX_d_n 11

      MACRO_ENUM_STATES LD_IY_d_n 11

      MACRO_ENUM_STATES LD_A_BC 3

      MACRO_ENUM_STATES LD_A_DE 3

      MACRO_ENUM_STATES LD_A_nn 9

      MACRO_ENUM_STATES LD_BC_A 3

      MACRO_ENUM_STATES LD_DE_A 3

      MACRO_ENUM_STATES LD_nn_A 9

      //-----------------------------------------------------------------------
      //END 8-bit load group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN 16-bit load group
      //-----------------------------------------------------------------------

      MACRO_ENUM_STATES LD_dd_nn 6

      MACRO_ENUM_STATES LD_IX_nn 6

      MACRO_ENUM_STATES LD_IY_nn 6

      MACRO_ENUM_STATES LD_HL_nn 12

      MACRO_ENUM_STATES LD_dd_nn_x 12

      MACRO_ENUM_STATES LD_IX_nn_x 12

      MACRO_ENUM_STATES LD_IY_nn_x 12

      MACRO_ENUM_STATES LD_nn_x_HL 12

      MACRO_ENUM_STATES LD_nn_x_dd 12

      MACRO_ENUM_STATES LD_nn_x_IX 12

      MACRO_ENUM_STATES LD_nn_x_IY 12

      MACRO_ENUM_STATES LD_SP_HL 2

      MACRO_ENUM_STATES LD_SP_IX 2

      MACRO_ENUM_STATES LD_SP_IY 2

      MACRO_ENUM_STATES PUSH_qq 7

      MACRO_ENUM_STATES PUSH_IX 7

      MACRO_ENUM_STATES PUSH_IY 7

      MACRO_ENUM_STATES POP_qq 6

      MACRO_ENUM_STATES POP_IX 6

      MACRO_ENUM_STATES POP_IY 6

      //-----------------------------------------------------------------------
      //END 16-bit load group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN EXCHANGE, BLOCK TRANSFER GROUP
      //-----------------------------------------------------------------------

      MACRO_ENUM_STATES EX_DE_HL 1

      MACRO_ENUM_STATES EX_AF_AF 1

      MACRO_ENUM_STATES EXX 1

      MACRO_ENUM_STATES EX_SP_HL 15

      MACRO_ENUM_STATES EX_SP_IX 15

      MACRO_ENUM_STATES EX_SP_IY 15

      MACRO_ENUM_STATES LDI 8

      MACRO_ENUM_STATES_NR LDIR 8
      LDIR_7: next_state  = (flags[ `PV_flag ] == 0) ? FETCH_0 : LDIR_8;
      LDIR_8: next_state  = LDIR_9;
      LDIR_9: next_state  = LDIR_10;
      LDIR_10: next_state = LDIR_11;
      LDIR_11: next_state = LDIR_12;
      LDIR_12: next_state = FETCH_0;

      MACRO_ENUM_STATES LDD 8

      MACRO_ENUM_STATES_NR LDDR 8
      LDDR_7: next_state  = (flags[ `PV_flag ] == 0) ? FETCH_0 : LDDR_8;
      LDDR_8: next_state  = LDDR_9;
      LDDR_9: next_state  = LDDR_10;
      LDDR_10: next_state = LDDR_11;
      LDDR_11: next_state = LDDR_12;
      LDDR_12: next_state = FETCH_0;

      MACRO_ENUM_STATES CPI 8

      MACRO_ENUM_STATES_NR CPIR 8
      CPIR_7: next_state  = (~flags[`PV_flag] == 0 | flags[`Z_flag]) ? FETCH_0 : CPIR_8;
      CPIR_8: next_state  = CPIR_9;
      CPIR_9: next_state  = CPIR_10;
      CPIR_10: next_state = CPIR_11;
      CPIR_11: next_state = CPIR_12;
      CPIR_12: next_state = FETCH_0;

      MACRO_ENUM_STATES CPD 8

      MACRO_ENUM_STATES_NR CPDR 8
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

      MACRO_ENUM_STATES ADD_A_r 1

      MACRO_ENUM_STATES ADD_A_n 3

      MACRO_ENUM_STATES ADD_A_HL 3

      MACRO_ENUM_STATES ADD_A_IX_d 11

      MACRO_ENUM_STATES ADD_A_IY_d 11

      MACRO_ENUM_STATES ADC_A_r 1

      MACRO_ENUM_STATES ADC_A_n 3

      MACRO_ENUM_STATES ADC_A_HL 3

      MACRO_ENUM_STATES ADC_A_IX_d 11

      MACRO_ENUM_STATES ADC_A_IY_d 11

      MACRO_ENUM_STATES SUB_r 1

      MACRO_ENUM_STATES SUB_n 3

      MACRO_ENUM_STATES SUB_HL 3

      MACRO_ENUM_STATES SUB_IX_d 11

      MACRO_ENUM_STATES SUB_IY_d 11

      MACRO_ENUM_STATES SBC_r 1

      MACRO_ENUM_STATES SBC_n 3

      MACRO_ENUM_STATES SBC_HL 3

      MACRO_ENUM_STATES SBC_IX_d 11

      MACRO_ENUM_STATES SBC_IY_d 11

      MACRO_ENUM_STATES AND_r 1

      MACRO_ENUM_STATES AND_n 3

      MACRO_ENUM_STATES AND_HL 3

      MACRO_ENUM_STATES AND_IX_d 11

      MACRO_ENUM_STATES AND_IY_d 11

      MACRO_ENUM_STATES OR_r 1

      MACRO_ENUM_STATES OR_n 3

      MACRO_ENUM_STATES OR_HL 3

      MACRO_ENUM_STATES OR_IX_d 11

      MACRO_ENUM_STATES OR_IY_d 11

      MACRO_ENUM_STATES XOR_r 1

      MACRO_ENUM_STATES XOR_n 3

      MACRO_ENUM_STATES XOR_HL 3

      MACRO_ENUM_STATES XOR_IX_d 11

      MACRO_ENUM_STATES XOR_IY_d 11

      MACRO_ENUM_STATES CP_r 1

      MACRO_ENUM_STATES CP_n 3

      MACRO_ENUM_STATES CP_HL 3

      MACRO_ENUM_STATES CP_IX_d 11

      MACRO_ENUM_STATES CP_IY_d 11

      MACRO_ENUM_STATES INC_r 1

      MACRO_ENUM_STATES INC_HL 7

      MACRO_ENUM_STATES INC_IX_d 15

      MACRO_ENUM_STATES INC_IY_d 15

      MACRO_ENUM_STATES DEC_r 1

      MACRO_ENUM_STATES DEC_HL 7

      MACRO_ENUM_STATES DEC_IX_d 15

      MACRO_ENUM_STATES DEC_IY_d 15

      //-----------------------------------------------------------------------
      //END 8-bit arithmetic group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN 16-bit arithmetic group
      //-----------------------------------------------------------------------

      MACRO_ENUM_STATES ADD_HL_ss 7

      MACRO_ENUM_STATES ADC_HL_ss 7

      MACRO_ENUM_STATES SBC_HL_ss 7

      MACRO_ENUM_STATES ADD_IX_pp 7

      MACRO_ENUM_STATES ADD_IY_rr 7

      MACRO_ENUM_STATES INC_ss 2

      MACRO_ENUM_STATES INC_IX 2

      MACRO_ENUM_STATES INC_IY 2

      MACRO_ENUM_STATES DEC_ss 2

      MACRO_ENUM_STATES DEC_IX 2

      MACRO_ENUM_STATES DEC_IY 2

      //-----------------------------------------------------------------------
      //END 16-bit arithmetic group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN General Purpose Arith and CPU Control
      //-----------------------------------------------------------------------

      MACRO_ENUM_STATES DAA 1

      MACRO_ENUM_STATES CPL 1

      MACRO_ENUM_STATES NEG 1

      MACRO_ENUM_STATES CCF 1

      MACRO_ENUM_STATES SCF 1

      MACRO_ENUM_STATES NOP 1

      MACRO_ENUM_STATES DI 1

      MACRO_ENUM_STATES EI 1

      //-----------------------------------------------------------------------
      //END General Purpose Arith and CPU Control
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Rotate and Shift Group
      //-----------------------------------------------------------------------

      MACRO_ENUM_STATES RLD 10

      MACRO_ENUM_STATES RRD 10

      //-----------------------------------------------------------------------
      //END Rotate and Shift Group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Bit Set, Rst, and Test group
      //-----------------------------------------------------------------------

      MACRO_ENUM_STATES_NR BIT_b_r 4

      BIT_b_r_3: next_state = ((op1[2:0] == 3'b110) ? BIT_b_HL_x_0 : FETCH_0);

      MACRO_ENUM_STATES_NR BIT_b_HL_x 4

      BIT_b_HL_x_3: next_state = ((op1[7:6] != 2'b01) ? SET_b_HL_x_0 : FETCH_0);

      MACRO_ENUM_STATES SET_b_HL_x 3

      MACRO_ENUM_STATES_NR BIT_b_IX_d_x 12

      BIT_b_IX_d_x_11: next_state = ((op1[7:6] != 2'b01) ? SET_b_IX_d_x_0 : FETCH_0);

      MACRO_ENUM_STATES SET_b_IX_d_x 3

      MACRO_ENUM_STATES_NR BIT_b_IY_d_x 12

      BIT_b_IY_d_x_11: next_state = ((op1[7:6] != 2'b01) ? SET_b_IY_d_x_0 : FETCH_0);

      MACRO_ENUM_STATES SET_b_IY_d_x 3

      //-----------------------------------------------------------------------
      //END Bit Set, Rst, and Test group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Jump group
      //-----------------------------------------------------------------------

      //All of the absolute jumps should go to START since that state does not
      //inc the pc when fetching the next instruction. IF we inc the PC right
      //away we miss a byte
      MACRO_ENUM_STATES_NR JP_nn 6
      JP_nn_5: next_state = START;

      MACRO_ENUM_STATES_NR JP_cc_nn 6
      JP_cc_nn_5: begin
        //Increment the PC when the jump is not taken
        unique case(op0[5:3])
          3'b000: next_state = (!flags[6]) ? START : FETCH_0;
          3'b001: next_state = ( flags[6]) ? START : FETCH_0;
          3'b010: next_state = (!flags[0]) ? START : FETCH_0;
          3'b011: next_state = ( flags[0]) ? START : FETCH_0;
          3'b100: next_state = (!flags[2]) ? START : FETCH_0;
          3'b101: next_state = ( flags[2]) ? START : FETCH_0;
          3'b110: next_state = ( flags[7]) ? START : FETCH_0;
          3'b111: next_state = ( flags[7]) ? START : FETCH_0;
        endcase
      end

      //Always inc pc immediately after a relative jump
      MACRO_ENUM_STATES JR_e 8

      MACRO_ENUM_STATES_NR JP_HL 1
      JP_HL_0: next_state = START;

      MACRO_ENUM_STATES_NR JP_IX 1
      JP_IX_0: next_state = START;

      MACRO_ENUM_STATES_NR JP_IY 1
      JP_IY_0: next_state = START;

      MACRO_ENUM_STATES_NR DJNZ_e 6
      DJNZ_e_5: next_state = (flags[`Z_flag]) ? FETCH_0 : DJNZ_e_6;
      DJNZ_e_6: next_state = DJNZ_e_7;
      DJNZ_e_7: next_state = DJNZ_e_8;
      DJNZ_e_8: next_state = DJNZ_e_9;
      DJNZ_e_9: next_state = DJNZ_e_10;
      DJNZ_e_10: next_state = FETCH_0; //don't fetch the next pc after the jump

      //-----------------------------------------------------------------------
      //END Jump group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Call and Return group
      //-----------------------------------------------------------------------

      MACRO_ENUM_STATES_NR CALL_nn 13
      CALL_nn_12: next_state = START; //do not increment PC in next fetch

      MACRO_ENUM_STATES_NR CALL_cc_nn 6

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
      CALL_cc_nn_12: next_state = START; //do not increment PC in next fetch

      MACRO_ENUM_STATES RET 6

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

      //Dont increment the PC after going to a RST
      MACRO_ENUM_STATES_NR RST_p 7
      RST_p_6: next_state = FETCH_0;

      //-----------------------------------------------------------------------
      //END Call and Return group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Input and Output group
      //-----------------------------------------------------------------------
      MACRO_ENUM_STATES IN_A_n 7

      MACRO_ENUM_STATES IN_r_C 4

      MACRO_ENUM_STATES INI 8

      MACRO_ENUM_STATES_NR INIR 8
      INIR_7: next_state = (flags[`Z_flag]) ? FETCH_0 : INIR_8;
      INIR_8: next_state = INIR_9;
      INIR_9: next_state = INIR_10;
      INIR_10: next_state = INIR_11;
      INIR_11: next_state = INIR_12;
      INIR_12: next_state = FETCH_0;

      MACRO_ENUM_STATES IND 8

      MACRO_ENUM_STATES_NR INDR 8
      INDR_7: next_state = (flags[`Z_flag]) ? FETCH_0 : INDR_8;
      INDR_8: next_state = INDR_9;
      INDR_9: next_state = INDR_10;
      INDR_10: next_state = INDR_11;
      INDR_11: next_state = INDR_12;
      INDR_12: next_state = FETCH_0;

      MACRO_ENUM_STATES OUT_n_A 7

      MACRO_ENUM_STATES OUT_C_r 4

      MACRO_ENUM_STATES OUTI 8

      MACRO_ENUM_STATES_NR OTIR 8
      OTIR_7: next_state = (flags[`Z_flag]) ? FETCH_0 : OTIR_8;
      OTIR_8: next_state = OTIR_9;
      OTIR_9: next_state = OTIR_10;
      OTIR_10: next_state = OTIR_11;
      OTIR_11: next_state = OTIR_12;
      OTIR_12: next_state = FETCH_0;

      MACRO_ENUM_STATES OUTD 8

      MACRO_ENUM_STATES_NR OTDR 8
      OTDR_7: next_state = (flags[`Z_flag]) ? FETCH_0 : OTDR_8;
      OTDR_8: next_state = OTDR_9;
      OTDR_9: next_state = OTDR_10;
      OTDR_10: next_state = OTDR_11;
      OTDR_11: next_state = OTDR_12;
      OTDR_12: next_state = FETCH_0;

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

      default: next_state = FETCH_0;

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
    IN_start  = 0;
    IN_bus    = 0;
    OUT_start = 0;
    OUT_bus   = 0;
    INT_start = 0;
    INT_bus   = 0;

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

    //maskable interrupt controls
    enable_interrupts  = 0;
    disable_interrupts = 0;
    push_interrupts    = 0;
    pop_interrupts     = 0;

    case(state)

      START: begin
        //Handle an interrupt by starting an interrupt ack cycle
        if(~INT_L & IFF1_out) begin
          MACRO_16_DRIVE PC
          INT_start = 1;
          INT_bus   = 1;

        //When there is normal behavior, drive the PC and begin a fetch
        end else begin
          drive_PCH = 1;
          drive_PCL = 1;
          drive_reg_addr = 1;
          drive_alu_addr = 1;
          alu_op    = `ALU_NOP;
          OCF_start = 1;
          OCF_bus   = 1;
        end
      end

      FETCH_0: begin
        //Handle an intterrupt by starting an interrupt ack cycle
        if(~INT_L & IFF1_out) begin
          MACRO_16_INC PC
          INT_start = 1;
          INT_bus   = 1;

        //When there is normal behavior, inc the PC and begin a fetch
        end else begin
          MACRO_16_INC PC
          OCF_start = 1;
          OCF_bus   = 1;
        end
      end

      FETCH_4: begin
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

      //Maskable Interrupt Handler
      //Spend these two cycles acknowledging the interrupt
      //We also want to decrement the PC by one while we are here.
      //A normal CALL instruction stacks the PC of the next instruction
      //minus 1 because that is the PC when that instruction executes. Any
      //instruction following the RET instruction will increment the PC
      //restored to so that we continue execution at the proper instruction.
      //As a result, in order for the interrupt to restore execution to
      //the instruction it suspended, we need to stack PC-1 such that the
      //fetch following the return puts the PC where it needs to be.
      INT_0: begin
        INT_bus = 1;
        MACRO_16_DEC PC
      end

      INT_1: begin
        INT_bus = 1;

        //Disable interrupts, but store the mask state in IFF2
        push_interrupts = 1;
      end

      //Start reseting the address to 16'h0038
      INT_2: begin
        MACRO_16_DRIVE SP
        MACRO_16_LOAD SP
        alu_op = `DECR_A_16;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      INT_3: begin
        MACRO_WRITE_0
        drive_MAR = 1;
        MACRO_8_DRIVE PCH
      end

      INT_4: begin
        MACRO_WRITE_1
        drive_MAR = 1;
        MACRO_8_DRIVE PCH
      end

      INT_5: begin
        MACRO_16_DRIVE SP
        MACRO_16_LOAD SP
        alu_op = `DECR_A_16;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      INT_6: begin
        MACRO_WRITE_0
        drive_MAR = 1;
        MACRO_8_DRIVE PCL
      end

      INT_7: begin
        MACRO_WRITE_1
        drive_MAR = 1;
        MACRO_8_DRIVE PCL
      end

      INT_8: begin
        MACRO_16_DRIVE PC
        MACRO_16_LOAD PC
        alu_op = `ALU_INT;
      end

      //-----------------------------------------------------------------------
      //BEGIN 8-bit load group
      //-----------------------------------------------------------------------
      LD_r_r_0: begin

        //This opcode is not a swap, it is just a simple load from one
        //register into another

        //Destination register
        unique case(op0[5:3])
          3'b111: ld_A = 1;
          3'b000: ld_B = 1;
          3'b001: ld_C = 1;
          3'b010: ld_D = 1;
          3'b011: ld_E = 1;
          3'b100: ld_H = 1;
          3'b101: ld_L = 1;
        endcase

        //source register
        unique case(op0[2:0])
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
        unique case(op0[5:3])
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
        unique case(op1[5:3])
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
        unique case(op1[5:3])
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

        unique case(op0[2:0])
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
        unique case(op1[2:0])
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
        MACRO_INC_PC
        MACRO_READ_0
      end

      LD_dd_nn_1, LD_dd_nn_4: begin
        MACRO_DRIVE_PC
        MACRO_READ_1
      end

      LD_dd_nn_2: begin
        unique case(op0[5:4])
          2'b00: ld_C = 1;
          2'b01: ld_E = 1;
          2'b10: ld_L = 1;
          2'b11: ld_SPL = 1;
        endcase
      end

      LD_dd_nn_5: begin
        unique case(op0[5:4])
          2'b00: ld_B = 1;
          2'b01: ld_D = 1;
          2'b10: ld_H = 1;
          2'b11: ld_SPH = 1;
        endcase
      end

      //LD_IX_nn
      LD_IX_nn_0, LD_IX_nn_3: begin
        MACRO_INC_PC
        MACRO_READ_0
      end

      LD_IX_nn_1, LD_IX_nn_4: begin
        MACRO_DRIVE_PC
        MACRO_READ_1
			end

      LD_IX_nn_2: ld_IXL = 1;
      LD_IX_nn_5: ld_IXH = 1;

      //LD_IY_nn
      LD_IY_nn_0,LD_IY_nn_3: begin
        MACRO_INC_PC
        MACRO_READ_0
      end

      LD_IY_nn_1,LD_IY_nn_4: begin
        MACRO_DRIVE_PC
        MACRO_READ_1
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
        MACRO_INC_PC
        MACRO_READ_0
      end

      LD_dd_nn_x_1, LD_dd_nn_x_4: begin
        MACRO_DRIVE_PC
        MACRO_READ_1
			end

      LD_dd_nn_x_2: begin
        ld_STRL = 1;
      end

      LD_dd_nn_x_5: begin
        ld_STRH = 1;
      end

      LD_dd_nn_x_6, LD_dd_nn_x_9: begin
        MACRO_READ_0
        MACRO_16_DRIVE STR
      end

      LD_dd_nn_x_7, LD_dd_nn_x_10: begin
        MACRO_READ_1
        MACRO_16_DRIVE STR
      end

      LD_dd_nn_x_8: begin
        unique case(op1[5:4])
          2'b00: ld_C = 1;
          2'b01: ld_E = 1;
          2'b10: ld_L = 1;
          2'b11: ld_SPL = 1;
        endcase
        MACRO_16_INC STR
      end

      LD_dd_nn_x_11: begin
        unique case(op1[5:4])
          2'b00: ld_B = 1;
          2'b01: ld_D = 1;
          2'b10: ld_H = 1;
          2'b11: ld_SPH = 1;
        endcase
      end

      //LD_IX_nn_x
      LD_IX_nn_x_0,LD_IX_nn_x_3: begin
        MACRO_INC_PC
        MACRO_READ_0
      end

      LD_IX_nn_x_1,LD_IX_nn_x_4: begin
        MACRO_DRIVE_PC
        MACRO_READ_1
      end

      LD_IX_nn_x_2: begin
        ld_IXL = 1;
      end

      LD_IX_nn_x_5: begin
        ld_IXH = 1;
      end

      LD_IX_nn_x_6: begin
        MACRO_16_DRIVE IX
        MACRO_READ_0
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_IX_nn_x_7: begin
        drive_MAR = 1;
        MACRO_READ_1
      end

      LD_IX_nn_x_8: begin
        MACRO_16_DRIVE IX
        alu_op = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
        ld_IXL = 1;
      end

      LD_IX_nn_x_9: begin
        MACRO_READ_0
        drive_MAR = 1;
      end

      LD_IX_nn_x_10: begin
        MACRO_READ_1
        drive_MAR = 1;
      end

      LD_IX_nn_x_11: begin
        ld_IXH = 1;
      end

      //LD_IY_nn_x
      LD_IY_nn_x_0,LD_IY_nn_x_3: begin
        MACRO_INC_PC
        MACRO_READ_0
      end

      LD_IY_nn_x_1,LD_IY_nn_x_4: begin
        MACRO_DRIVE_PC
        MACRO_READ_1
      end

      LD_IY_nn_x_2: begin
        ld_IYL = 1;
      end

      LD_IY_nn_x_5: begin
        ld_IYH = 1;
      end

      LD_IY_nn_x_6: begin
        MACRO_16_DRIVE IY
        MACRO_READ_0
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_IY_nn_x_7: begin
        drive_MAR = 1;
        MACRO_READ_1
      end

      LD_IY_nn_x_8: begin
        MACRO_16_DRIVE IY
        alu_op = `INCR_A_16;
        ld_MARL = 1;
        ld_MARH = 1;
        ld_IYL = 1;
      end

      LD_IY_nn_x_9: begin
        MACRO_READ_0
        drive_MAR = 1;
      end

      LD_IY_nn_x_10: begin
        MACRO_READ_1
        drive_MAR = 1;
      end

      LD_IY_nn_x_11: begin
        ld_IYH = 1;
      end

      //LD_nn_x_HL
      LD_nn_x_HL_0, LD_nn_x_HL_3: begin
        MACRO_READ_0
        MACRO_INC_PC
      end

      LD_nn_x_HL_1, LD_nn_x_HL_4: begin
        MACRO_READ_1
        MACRO_DRIVE_PC
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
        MACRO_WRITE_0
        drive_MAR = 1;

        if(state == LD_nn_x_HL_6) begin
          MACRO_8_DRIVE L
        end else begin
          MACRO_8_DRIVE H
        end
      end

      LD_nn_x_HL_7, LD_nn_x_HL_10: begin
        MACRO_WRITE_1
        drive_MAR = 1;

        if(state == LD_nn_x_HL_7) begin
          MACRO_8_DRIVE L
        end else begin
          MACRO_8_DRIVE H
        end
      end

      LD_nn_x_HL_8: begin
        MACRO_16_INC STR
        ld_MARL = 1;
        ld_MARH = 1;
      end

      //LD_nn_dd
      LD_nn_x_dd_0, LD_nn_x_dd_3: begin
        MACRO_READ_0
        MACRO_INC_PC
      end

      LD_nn_x_dd_1, LD_nn_x_dd_4: begin
        MACRO_READ_1
        MACRO_DRIVE_PC
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
        MACRO_WRITE_0
        drive_MAR = 1;

        if(state == LD_nn_x_dd_6) begin
          unique case(op1[5:4])
            2'b00: begin
              MACRO_8_DRIVE C
            end
            2'b01: begin
              MACRO_8_DRIVE E
            end
            2'b10: begin
              MACRO_8_DRIVE L
            end
            2'b11: begin
              MACRO_8_DRIVE SPL
            end
            default: begin end
          endcase

        end else begin
          unique case(op1[5:4])
            2'b00: begin
              MACRO_8_DRIVE B
            end
            2'b01: begin
              MACRO_8_DRIVE D
            end
            2'b10: begin
              MACRO_8_DRIVE H
            end
            2'b11: begin
              MACRO_8_DRIVE SPH
            end
            default: begin end
          endcase
        end
      end

      LD_nn_x_dd_7, LD_nn_x_dd_10: begin
        MACRO_WRITE_1
        drive_MAR = 1;

        if(state == LD_nn_x_dd_7) begin
          unique case(op1[5:4])
            2'b00: begin
              MACRO_8_DRIVE C
            end
            2'b01: begin
              MACRO_8_DRIVE E
            end
            2'b10: begin
              MACRO_8_DRIVE L
            end
            2'b11: begin
              MACRO_8_DRIVE SPL
            end
            default: begin end
          endcase

        end else begin
          unique case(op1[5:4])
            2'b00: begin
              MACRO_8_DRIVE B
            end
            2'b01: begin
              MACRO_8_DRIVE D
            end
            2'b10: begin
              MACRO_8_DRIVE H
            end
            2'b11: begin
              MACRO_8_DRIVE SPH
            end
            default: begin end
          endcase
        end
      end

      LD_nn_x_dd_8: begin
        MACRO_16_INC STR
        ld_MARL = 1;
        ld_MARH = 1;
      end

      //LD (nn), IX and LD (nn), IY
      LD_nn_x_IX_0, LD_nn_x_IX_3, LD_nn_x_IY_0, LD_nn_x_IY_3: begin
        MACRO_READ_0
        MACRO_INC_PC
      end

      LD_nn_x_IX_1, LD_nn_x_IX_4, LD_nn_x_IY_1, LD_nn_x_IY_4: begin
        MACRO_READ_1
        MACRO_DRIVE_PC
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
        MACRO_WRITE_0
        drive_MAR = 1;

        if(state == LD_nn_x_IX_6) begin
          MACRO_8_DRIVE IXL
        end else if(state == LD_nn_x_IY_6) begin
          MACRO_8_DRIVE IYL
        end else if(state == LD_nn_x_IY_9) begin
          MACRO_8_DRIVE IYH
        end else begin
          MACRO_8_DRIVE IXH
        end
      end

      LD_nn_x_IX_7, LD_nn_x_IX_10, LD_nn_x_IY_7, LD_nn_x_IY_10: begin
        MACRO_WRITE_1
        drive_MAR = 1;

        if(state == LD_nn_x_IX_7) begin
          MACRO_8_DRIVE IXL
        end else if(state == LD_nn_x_IY_7) begin
          MACRO_8_DRIVE IYL
        end else if(state == LD_nn_x_IY_10) begin
          MACRO_8_DRIVE IYH
        end else begin
          MACRO_8_DRIVE IXH
        end
      end

      LD_nn_x_IX_8, LD_nn_x_IY_8: begin
        MACRO_16_INC STR
        ld_MARL = 1;
        ld_MARH = 1;
      end

      //LD_SP_HL
      LD_SP_HL_0: begin
        MACRO_16_DRIVE HL
        MACRO_16_LOAD SP
      end

      //LD_SP_IX
      LD_SP_IX_0: begin
        MACRO_16_DRIVE IX
        MACRO_16_LOAD SP
      end

      //LD_SP_IY
      LD_SP_IY_0: begin
        MACRO_16_DRIVE IY
        MACRO_16_LOAD SP
      end

      //PUSH_qq
      PUSH_qq_0: begin
        MACRO_16_DRIVE SP
        MACRO_16_LOAD SP
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A_16;
      end

      PUSH_qq_1: begin
        drive_MAR = 1;
        MACRO_WRITE_0
        unique case(op0[5:4])
          2'b00: begin
            MACRO_8_DRIVE B
          end
          2'b01: begin
            MACRO_8_DRIVE D
          end
          2'b10: begin
            MACRO_8_DRIVE H
          end
          2'b11: begin
            MACRO_8_DRIVE A
          end
        endcase
      end

      PUSH_qq_2: begin
        drive_MAR = 1;
        MACRO_WRITE_1
        unique case(op0[5:4])
          2'b00: begin
            MACRO_8_DRIVE B
          end
          2'b01: begin
            MACRO_8_DRIVE D
          end
          2'b10: begin
            MACRO_8_DRIVE H
          end
          2'b11: begin
            MACRO_8_DRIVE A
          end
        endcase
      end

      PUSH_qq_3: begin
        MACRO_16_DRIVE SP
        MACRO_16_LOAD SP
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A_16;
      end

      PUSH_qq_4: begin
        drive_MAR = 1;
        MACRO_WRITE_0
        unique case(op0[5:4])
          2'b00: begin
            MACRO_8_DRIVE C
          end
          2'b01: begin
            MACRO_8_DRIVE E
          end
          2'b10: begin
            MACRO_8_DRIVE L
          end
          2'b11: begin
            MACRO_8_DRIVE F
          end
        endcase
      end

      PUSH_qq_5: begin
        drive_MAR = 1;
        MACRO_WRITE_1
        unique case(op0[5:4])
          2'b00: begin
            MACRO_8_DRIVE C
          end
          2'b01: begin
            MACRO_8_DRIVE E
          end
          2'b10: begin
            MACRO_8_DRIVE L
          end
          2'b11: begin
            MACRO_8_DRIVE F
          end
        endcase
      end

      //PUSH_IX
      PUSH_IX_0: begin
        MACRO_16_DRIVE SP
        MACRO_16_LOAD SP
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A_16;
      end

      PUSH_IX_1: begin
        drive_MAR = 1;
        MACRO_WRITE_0
        MACRO_8_DRIVE IXH
      end

      PUSH_IX_2: begin
        drive_MAR = 1;
        MACRO_WRITE_1
        MACRO_8_DRIVE IXH
      end

      PUSH_IX_3: begin
        MACRO_16_DRIVE SP
        MACRO_16_LOAD SP
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A_16;
      end

      PUSH_IX_4: begin
        drive_MAR = 1;
        MACRO_WRITE_0
        MACRO_8_DRIVE IXL
      end

      PUSH_IX_5: begin
        drive_MAR = 1;
        MACRO_WRITE_1
        MACRO_8_DRIVE IXL
      end

      //PUSH_IY
      PUSH_IY_0: begin
        MACRO_16_DRIVE SP
        MACRO_16_LOAD SP
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A_16;
      end

      PUSH_IY_1: begin
        drive_MAR = 1;
        MACRO_WRITE_0
        MACRO_8_DRIVE IYH
      end

      PUSH_IY_2: begin
        drive_MAR = 1;
        MACRO_WRITE_1
        MACRO_8_DRIVE IYH
      end

      PUSH_IY_3: begin
        MACRO_16_DRIVE SP
        MACRO_16_LOAD SP
        ld_MARH = 1;
        ld_MARL = 1;
        alu_op = `DECR_A_16;
      end

      PUSH_IY_4: begin
        drive_MAR = 1;
        MACRO_WRITE_0
        MACRO_8_DRIVE IYL
      end

      PUSH_IY_5: begin
        drive_MAR = 1;
        MACRO_WRITE_1
        MACRO_8_DRIVE IYL
      end

      //POP IX, IY, QQ
      POP_IX_0, POP_IY_0, POP_qq_0: begin
        MACRO_16_DRIVE SP
        MACRO_READ_0
      end

      POP_IX_1, POP_IY_1, POP_qq_1: begin
        MACRO_16_DRIVE SP
        MACRO_READ_1
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
        MACRO_16_INC SP
        MACRO_READ_0
      end

      POP_IX_4, POP_IY_4, POP_qq_4: begin
        MACRO_16_DRIVE SP
        MACRO_READ_1
      end

      POP_IX_5: begin
        MACRO_16_INC SP
        ld_IXH = 1;
      end
      POP_IY_5: begin
        MACRO_16_INC SP
        ld_IYH = 1;
      end
      POP_qq_5: begin
        MACRO_16_INC SP

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
        MACRO_READ_0
        MACRO_16_DRIVE SP
      end

      EX_SP_HL_1, EX_SP_IX_1, EX_SP_IY_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE SP
      end

      EX_SP_HL_2, EX_SP_IX_2, EX_SP_IY_2: begin
        ld_MDR1 = 1;
      end

      EX_SP_HL_3, EX_SP_IX_3, EX_SP_IY_3: begin
        MACRO_READ_0

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
        MACRO_READ_1
        drive_MAR = 1;
      end

      EX_SP_HL_5, EX_SP_IX_5, EX_SP_IY_5: begin
        ld_MDR2 = 1;
      end

      EX_SP_HL_6, EX_SP_IX_6, EX_SP_IY_6: begin
        //now that SP+1 is in MAR, write H into (SP+1)
        MACRO_WRITE_0;
        drive_MAR = 1;

        unique case(state)
          EX_SP_HL_6: begin
            MACRO_8_DRIVE H
          end
          EX_SP_IX_6: begin
            MACRO_8_DRIVE IXH
          end
          EX_SP_IY_6: begin
            MACRO_8_DRIVE IYH
          end
        endcase
      end


      EX_SP_HL_7, EX_SP_IX_7, EX_SP_IY_7: begin
        MACRO_WRITE_1;
        drive_MAR = 1;

        unique case(state)
          EX_SP_HL_7: begin
            MACRO_8_DRIVE H
          end
          EX_SP_IX_7: begin
            MACRO_8_DRIVE IXH
          end
          EX_SP_IY_7: begin
            MACRO_8_DRIVE IYH
          end
        endcase
      end

      EX_SP_HL_8, EX_SP_IX_8, EX_SP_IY_8: begin
        //put SP into MAR
        MACRO_16_DRIVE SP
        ld_MARL = 1;
        ld_MARH = 1;
      end

      EX_SP_HL_9, EX_SP_IX_9, EX_SP_IY_9: begin
        MACRO_WRITE_0;
        drive_MAR = 1;

        unique case(state)
          EX_SP_HL_9: begin
            MACRO_8_DRIVE L
          end
          EX_SP_IX_9: begin
            MACRO_8_DRIVE IXL
          end
          EX_SP_IY_9: begin
            MACRO_8_DRIVE IYL
          end
        endcase
      end

      EX_SP_HL_10, EX_SP_IX_10, EX_SP_IY_10: begin
        MACRO_WRITE_1;
        drive_MAR = 1;

        unique case(state)
          EX_SP_HL_10: begin
            MACRO_8_DRIVE L
          end
          EX_SP_IX_10: begin
            MACRO_8_DRIVE IXL
          end
          EX_SP_IY_10: begin
            MACRO_8_DRIVE IYL
          end
        endcase
      end

      EX_SP_HL_11, EX_SP_IX_11, EX_SP_IY_11: begin
        drive_MDR2 = 1;

        unique case(state)
          EX_SP_HL_11: ld_H   = 1;
          EX_SP_IX_11: ld_IXH = 1;
          EX_SP_IY_11: ld_IYH = 1;
        endcase
      end

      EX_SP_HL_12, EX_SP_IX_12, EX_SP_IY_12: begin
        drive_MDR1 = 1;

        unique case(state)
          EX_SP_HL_12: ld_L   = 1;
          EX_SP_IX_12: ld_IXL = 1;
          EX_SP_IY_12: ld_IYL = 1;
        endcase
      end

      //LDI
      LDI_0, LDIR_0, LDD_0, LDDR_0: begin
        MACRO_16_DRIVE HL
        MACRO_READ_0
      end

      LDI_1, LDIR_1, LDD_1, LDDR_1: begin
        MACRO_16_DRIVE HL
        MACRO_READ_1
      end

      LDI_2, LDIR_2, LDD_2, LDDR_2: begin
        //MDR1 <- (HL) (put contents of D_BUS into MDR1)
        ld_MDR1 = 1;
      end

      LDI_3, LDIR_3, LDD_3, LDDR_3: begin
        MACRO_16_DRIVE DE
        MACRO_WRITE_0
        drive_MDR1 = 1;
      end

      LDI_4, LDIR_4, LDD_4, LDDR_4: begin
        MACRO_16_DRIVE DE
        MACRO_WRITE_1
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
        alu_op = `DECR_A_16;
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

        MACRO_RESET H
        MACRO_RESET N
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
        alu_op = `DECR_A_16;
      end

      LDIR_8, LDIR_9, LDDR_8, LDDR_9: begin
        //Repeat the instruction if BC != 0
        if(flags[ `PV_flag ] == 1) begin
          MACRO_DEC_PC
        end else begin
        end
      end

      CPI_0, CPIR_0, CPD_0, CPDR_0: begin
        MACRO_16_DRIVE HL
        MACRO_READ_0
      end

      CPI_1, CPIR_1, CPD_1, CPDR_1: begin
        MACRO_16_DRIVE HL
        MACRO_READ_1
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

        MACRO_SET N
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
        alu_op = `DECR_A_16;
      end

      CPIR_8, CPIR_9, CPDR_8, CPDR_9: begin
        //Repeat the instruction if BC != 0 or if the compare succeeded
        if(flags[`PV_flag] & ~flags[`Z_flag]) begin
          MACRO_DEC_PC
        end else begin

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

        unique case(op0[2:0])
          3'b111: begin
            MACRO_8_ADD A
          end
          3'b000: begin
            MACRO_8_ADD B
          end
          3'b001: begin
            MACRO_8_ADD C
          end
          3'b010: begin
            MACRO_8_ADD D
          end
          3'b011: begin
            MACRO_8_ADD E
          end
          3'b100: begin
            MACRO_8_ADD H
          end
          3'b101: begin
            MACRO_8_ADD L
          end
        endcase

        MACRO_RESET N
      end

      //ADD A, n
      ADD_A_n_0, ADC_A_n_0: begin
        MACRO_16_INC PC
        MACRO_READ_0
      end

      ADD_A_n_1, ADC_A_n_1: begin
        MACRO_16_DRIVE PC
        MACRO_READ_1
      end

      ADD_A_n_2, ADC_A_n_2: begin
        if(state == ADD_A_n_2) begin
          MACRO_8_ADD Z
        end else begin
          MACRO_8_ADC Z
        end
        MACRO_RESET N
      end

      //ADD A, (HL)
      ADD_A_HL_0, ADC_A_HL_0: begin
        MACRO_16_DRIVE HL
        MACRO_READ_0
      end

      ADD_A_HL_1, ADC_A_HL_1: begin
        MACRO_16_DRIVE HL
        MACRO_READ_1
      end

      ADD_A_HL_2, ADC_A_HL_2: begin
        if(state == ADD_A_HL_2) begin
          MACRO_8_ADD Z
        end else begin
          MACRO_8_ADC Z
        end
        MACRO_RESET N
      end

      //ADD A, (IX+d), ADD A, (IY+d)
      ADD_A_IX_d_0, ADD_A_IY_d_0, ADC_A_IX_d_0, ADC_A_IY_d_0: begin
        MACRO_16_INC PC
        MACRO_READ_0
      end

      ADD_A_IX_d_1, ADD_A_IY_d_1, ADC_A_IX_d_1, ADC_A_IY_d_1: begin
        MACRO_16_DRIVE PC
        MACRO_READ_1
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
        MACRO_READ_0
      end

      ADD_A_IX_d_9, ADD_A_IY_d_9, ADC_A_IX_d_9, ADC_A_IY_d_9: begin
        drive_MAR = 1;
        MACRO_READ_1
      end

      ADD_A_IX_d_10, ADD_A_IY_d_10, ADC_A_IX_d_10, ADC_A_IY_d_10: begin
        if(state == ADD_A_IX_d_10 || state == ADD_A_IY_d_10) begin
          MACRO_8_ADD Z
        end else begin
          MACRO_8_ADC Z
        end

        MACRO_RESET N
      end

      //ADC A, r
      ADC_A_r_0: begin

        unique case(op0[2:0])
          3'b111: begin
            MACRO_8_ADC A
          end
          3'b000: begin
            MACRO_8_ADC B
          end
          3'b001: begin
            MACRO_8_ADC C
          end
          3'b010: begin
            MACRO_8_ADC D
          end
          3'b011: begin
            MACRO_8_ADC E
          end
          3'b100: begin
            MACRO_8_ADC H
          end
          3'b101: begin
            MACRO_8_ADC L
          end
        endcase

        MACRO_RESET N
      end

      //SUB r
      SUB_r_0: begin
        ld_F_data = 1;
        MACRO_SET N

        unique case(op0[2:0])
          3'b111: begin
            MACRO_8_SUB A
          end
          3'b000: begin
            MACRO_8_SUB B
          end
          3'b001: begin
            MACRO_8_SUB C
          end
          3'b010: begin
            MACRO_8_SUB D
          end
          3'b011: begin
            MACRO_8_SUB E
          end
          3'b100: begin
            MACRO_8_SUB H
          end
          3'b101: begin
            MACRO_8_SUB L
          end
        endcase

      end

      //SBC r
      SBC_r_0: begin
        ld_F_data = 1;
        MACRO_SET N

        unique case(op0[2:0])
          3'b111: begin
            MACRO_8_SBC A
          end
          3'b000: begin
            MACRO_8_SBC B
          end
          3'b001: begin
            MACRO_8_SBC C
          end
          3'b010: begin
            MACRO_8_SBC D
          end
          3'b011: begin
            MACRO_8_SBC E
          end
          3'b100: begin
            MACRO_8_SBC H
          end
          3'b101: begin
            MACRO_8_SBC L
          end
        endcase

      end

      //SUB n
      SUB_n_0, SBC_n_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
        ld_MARL = 1;
        ld_MARH = 1;
      end

      SUB_n_1, SBC_n_1: begin
        MACRO_READ_1
        drive_MAR = 1;
      end

      SUB_n_2, SBC_n_2: begin
        ld_F_data = 1;
        MACRO_SET N

        if(state == SUB_n_2) begin
          MACRO_8_SUB Z
        end else begin
          MACRO_8_SBC Z
        end
      end

      //SUB (HL)
      SUB_HL_0, SBC_HL_0: begin
        MACRO_16_DRIVE HL
        MACRO_READ_0
      end

      SUB_HL_1, SBC_HL_1: begin
        MACRO_16_DRIVE HL
        MACRO_READ_1
      end

      SUB_HL_2, SBC_HL_2: begin
        ld_F_data = 1;
        MACRO_SET N

        if(state == SUB_HL_2) begin
          MACRO_8_SUB Z
        end else begin
          MACRO_8_SBC Z
        end
      end

      //SUB (IX+d) SUB (IY+d)
      SUB_IX_d_0, SUB_IY_d_0, SBC_IX_d_0, SBC_IY_d_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
      end

      SUB_IX_d_1, SUB_IY_d_1, SBC_IX_d_1, SBC_IY_d_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
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
        MACRO_READ_0
      end

      SUB_IX_d_9, SUB_IY_d_9, SBC_IX_d_9, SBC_IY_d_9: begin
        drive_MAR = 1;
        MACRO_READ_1
      end

      SUB_IX_d_10, SUB_IY_d_10, SBC_IX_d_10, SBC_IY_d_10: begin
        ld_F_data = 1;
        MACRO_SET N

        if(state == SUB_IX_d_10 || state == SUB_IY_d_10) begin
          MACRO_8_SUB Z
        end else begin
          MACRO_8_SBC Z
        end
      end

      //AND r
      AND_r_0: begin
        ld_F_data = 1;
        MACRO_SET H
        MACRO_RESET N
        MACRO_RESET C

        unique case(op0[2:0])
          3'b111: begin
            MACRO_8_AND A
          end
          3'b000: begin
            MACRO_8_AND B
          end
          3'b001: begin
            MACRO_8_AND C
          end
          3'b010: begin
            MACRO_8_AND D
          end
          3'b011: begin
            MACRO_8_AND E
          end
          3'b100: begin
            MACRO_8_AND H
          end
          3'b101: begin
            MACRO_8_AND L
          end

        endcase
      end

      //AND n
      AND_n_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
        ld_MARL = 1;
        ld_MARH = 1;
      end

      AND_n_1: begin
        MACRO_READ_1
        drive_MAR = 1;
      end

      AND_n_2: begin
        ld_F_data = 1;
        MACRO_SET H
        MACRO_RESET N
        MACRO_RESET C
        MACRO_8_AND Z
      end

      //AND (HL)
      AND_HL_0: begin
        MACRO_16_DRIVE HL
        MACRO_READ_0
      end

      AND_HL_1: begin
        MACRO_16_DRIVE HL
        MACRO_READ_1
      end

      AND_HL_2: begin
        ld_F_data = 1;
        MACRO_SET H
        MACRO_RESET N
        MACRO_RESET C
        MACRO_8_AND Z
      end

      //AND (IX+d) AND (IY+d)
      AND_IX_d_0, AND_IY_d_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
      end

      AND_IX_d_1, AND_IY_d_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
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
        MACRO_READ_0
      end

      AND_IX_d_9, AND_IY_d_9: begin
        drive_MAR = 1;
        MACRO_READ_1
      end

      AND_IX_d_10, AND_IY_d_10: begin
        ld_F_data = 1;
        MACRO_SET H
        MACRO_RESET N
        MACRO_RESET C
        MACRO_8_AND Z
      end

      //OR r
      OR_r_0: begin
        ld_F_data = 1;
        MACRO_RESET H
        MACRO_RESET N
        MACRO_RESET C

        unique case(op0[2:0])
          3'b111: begin
            MACRO_8_OR A
          end
          3'b000: begin
            MACRO_8_OR B
          end
          3'b001: begin
            MACRO_8_OR C
          end
          3'b010: begin
            MACRO_8_OR D
          end
          3'b011: begin
            MACRO_8_OR E
          end
          3'b100: begin
            MACRO_8_OR H
          end
          3'b101: begin
            MACRO_8_OR L
          end

        endcase
      end

      //XOR r
      XOR_r_0: begin
        ld_F_data = 1;
        MACRO_RESET H
        MACRO_RESET N
        MACRO_RESET C

        unique case(op0[2:0])
          3'b111: begin
            MACRO_8_XOR A
          end
          3'b000: begin
            MACRO_8_XOR B
          end
          3'b001: begin
            MACRO_8_XOR C
          end
          3'b010: begin
            MACRO_8_XOR D
          end
          3'b011: begin
            MACRO_8_XOR E
          end
          3'b100: begin
            MACRO_8_XOR H
          end
          3'b101: begin
            MACRO_8_XOR L
          end

        endcase
      end

      //OR n, XOR n
      OR_n_0, XOR_n_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
        ld_MARL = 1;
        ld_MARH = 1;
      end

      OR_n_1, XOR_n_1: begin
        MACRO_READ_1
        drive_MAR = 1;
      end

      OR_n_2, XOR_n_2: begin
        ld_F_data = 1;
        MACRO_RESET H
        MACRO_RESET N
        MACRO_RESET C

        if(state == OR_n_2) begin
          MACRO_8_OR Z
        end else begin
          MACRO_8_XOR Z
        end
      end

      //OR (HL), XOR (HL)
      OR_HL_0, XOR_HL_0: begin
        MACRO_16_DRIVE HL
        MACRO_READ_0
      end

      OR_HL_1, XOR_HL_1: begin
        MACRO_16_DRIVE HL
        MACRO_READ_1
      end

      OR_HL_2, XOR_HL_2: begin
        ld_F_data = 1;
        MACRO_RESET H
        MACRO_RESET N
        MACRO_RESET C

        if(state == OR_HL_2) begin
          MACRO_8_OR Z
        end else begin
          MACRO_8_XOR Z
        end
      end

      //OR (IX+d) OR (IY+d) XOR (IX+d) XOR (IY+d)
      OR_IX_d_0, OR_IY_d_0, XOR_IX_d_0, XOR_IY_d_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
      end

      OR_IX_d_1, OR_IY_d_1, XOR_IX_d_1, XOR_IY_d_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
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
        MACRO_READ_0
      end

      OR_IX_d_9, OR_IY_d_9, XOR_IX_d_9, XOR_IY_d_9: begin
        drive_MAR = 1;
        MACRO_READ_1
      end

      OR_IX_d_10, OR_IY_d_10, XOR_IX_d_10, XOR_IY_d_10: begin
        ld_F_data = 1;
        MACRO_RESET H
        MACRO_RESET N
        MACRO_RESET C

        if(state == OR_IX_d_10 || state == OR_IY_d_10) begin
          MACRO_8_OR Z
        end else begin
          MACRO_8_XOR Z
        end
      end

      //CP (HL)
      CP_HL_0: begin
        MACRO_16_DRIVE HL
        MACRO_READ_0
      end

      CP_HL_1: begin
        MACRO_16_DRIVE HL
        MACRO_READ_1
      end

      CP_HL_2: begin
        ld_F_data = 1;
        MACRO_SET N
        MACRO_8_CP Z
      end

      //CP (IX+d) CP (IY+d)
      CP_IX_d_0, CP_IY_d_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
      end

      CP_IX_d_1, CP_IY_d_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
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
        MACRO_READ_0
      end

      CP_IX_d_9, CP_IY_d_9: begin
        drive_MAR = 1;
        MACRO_READ_1
      end

      CP_IX_d_10, CP_IY_d_10: begin
        ld_F_data = 1;
        MACRO_SET N
        MACRO_8_CP Z
      end

      //CP r
      CP_r_0: begin
        ld_F_data = 1;
        MACRO_SET N

        unique case(op0[2:0])
          3'b111: begin
            MACRO_8_CP A
          end
          3'b000: begin
            MACRO_8_CP B
          end
          3'b001: begin
            MACRO_8_CP C
          end
          3'b010: begin
            MACRO_8_CP D
          end
          3'b011: begin
            MACRO_8_CP E
          end
          3'b100: begin
            MACRO_8_CP H
          end
          3'b101: begin
            MACRO_8_CP L
          end

        endcase
      end

      //CP n
      CP_n_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
        ld_MARL = 1;
        ld_MARH = 1;
      end

      CP_n_1: begin
        MACRO_READ_1
        drive_MAR = 1;
      end

      CP_n_2: begin
        ld_F_data = 1;
        MACRO_SET N
        MACRO_8_CP Z
      end

      //INC r
      INC_r_0: begin
        ld_F_data = 1;
        MACRO_RESET N

        unique case(op0[5:3])
          3'b111: begin
            MACRO_8_INC A
          end
          3'b000: begin
            MACRO_8_INC B
          end
          3'b001: begin
            MACRO_8_INC C
          end
          3'b010: begin
            MACRO_8_INC D
          end
          3'b011: begin
            MACRO_8_INC E
          end
          3'b100: begin
            MACRO_8_INC H
          end
          3'b101: begin
            MACRO_8_INC L
          end
        endcase
      end

      //DEC r
      DEC_r_0: begin
        ld_F_data = 1;
        MACRO_SET N

        unique case(op0[5:3])
          3'b111: begin
            MACRO_8_DEC A
          end
          3'b000: begin
            MACRO_8_DEC B
          end
          3'b001: begin
            MACRO_8_DEC C
          end
          3'b010: begin
            MACRO_8_DEC D
          end
          3'b011: begin
            MACRO_8_DEC E
          end
          3'b100: begin
            MACRO_8_DEC H
          end
          3'b101: begin
            MACRO_8_DEC L
          end
        endcase
      end



      //INC (HL)
      INC_HL_0, DEC_HL_0: begin
        MACRO_16_DRIVE HL
        MACRO_READ_0
        ld_MARL = 1;
        ld_MARH = 1;
      end

      INC_HL_1, DEC_HL_1: begin
        drive_MAR = 1;
        MACRO_READ_1
      end

      INC_HL_2, DEC_HL_2: begin
        ld_STRH = 1;
      end

      INC_HL_3, DEC_HL_3: begin
        ld_F_data = 1;

        if(state == INC_HL_3) begin
          MACRO_RESET N
          MACRO_8_INC STRH
        end else begin
          MACRO_SET N
          MACRO_8_DEC STRH
        end
      end

      INC_HL_4, DEC_HL_4: begin
        MACRO_8_DRIVE STRH
        MACRO_WRITE_0
        drive_MAR = 1;
      end

      INC_HL_5, DEC_HL_5: begin
        MACRO_8_DRIVE STRH
        MACRO_WRITE_1
        drive_MAR = 1;
      end

      //INC (IX+d), INC (IY+d)
      INC_IX_d_0, INC_IY_d_0, DEC_IX_d_0, DEC_IY_d_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
      end

      INC_IX_d_1, INC_IY_d_1, DEC_IX_d_1, DEC_IY_d_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
      end

      INC_IX_d_2, INC_IY_d_2, DEC_IX_d_2, DEC_IY_d_2: begin
        ld_TEMP = 1;
      end

      INC_IX_d_3, INC_IY_d_3, DEC_IX_d_3, DEC_IY_d_3: begin
        alu_op = `ADD_SE_B;
        drive_IXH = (op0[7:4] == 4'hd);
        drive_IXL = (op0[7:4] == 4'hd);
        drive_IYH = (op0[7:4] == 4'hf);
        drive_IYL = (op0[7:4] == 4'hf);
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      INC_IX_d_8, INC_IY_d_8, DEC_IX_d_8, DEC_IY_d_8: begin
        drive_MAR = 1;
        MACRO_READ_0
      end

      INC_IX_d_9, INC_IY_d_9, DEC_IX_d_9, DEC_IY_d_9: begin
        drive_MAR = 1;
        MACRO_READ_1
      end

      INC_IX_d_10, INC_IY_d_10, DEC_IX_d_10, DEC_IY_d_10: begin
        ld_STRH = 1;
      end

      INC_IX_d_11, INC_IY_d_11, DEC_IX_d_11, DEC_IY_d_11: begin
        ld_F_data = 1;
        if(state == INC_IX_d_11 || state == INC_IY_d_11) begin
          MACRO_RESET N
          MACRO_8_INC STRH
        end else begin
          MACRO_SET N
          MACRO_8_DEC STRH
        end
      end

      INC_IX_d_12, INC_IY_d_12, DEC_IX_d_12, DEC_IY_d_12: begin
        MACRO_8_DRIVE STRH
        MACRO_WRITE_0
        drive_MAR = 1;
      end

      INC_IX_d_13, INC_IY_d_13: begin
        MACRO_8_DRIVE STRH
        MACRO_WRITE_1
        drive_MAR = 1;
      end

      //-----------------------------------------------------------------------
      //END 8-bit arithmetic group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN 16-bit arithmetic group
      //-----------------------------------------------------------------------

      ADD_HL_ss_0, ADD_IX_pp_0, ADD_IY_rr_0, ADC_HL_ss_0: begin
        //move A to MDR1
        drive_A = 1;
        ld_MDR1 = 1;
      end

      ADD_HL_ss_1, ADD_IX_pp_1, ADD_IY_rr_1, ADC_HL_ss_1: begin
        //load A with lower byte
        ld_A = 1;

        if(state == ADD_HL_ss_1 || state == ADC_HL_ss_1) begin
          MACRO_8_DRIVE L
        end else if (state == ADD_IX_pp_1) begin
          MACRO_8_DRIVE IXL
        end else begin
          MACRO_8_DRIVE IYL
        end
      end

      ADD_HL_ss_2, ADD_IX_pp_2, ADD_IY_rr_2, ADC_HL_ss_2: begin
        //add the lower bytes together and set carry flags
        ld_F_data      = 1;
        alu_op         = (state == ADC_HL_ss_2) ? `ADC_16 : `ADD_16;
        drive_alu_data = 1;

        //destination register
        if(state == ADD_HL_ss_2 || state == ADC_HL_ss_2) begin
          ld_L = 1;
        end else if (state == ADD_IX_pp_2) begin
          ld_IXL = 1;
        end else begin
          ld_IYL = 1;
        end

        //source register
        //ADC uses op1, ADD uses op0
        if(state == ADD_HL_ss_2) begin

          //case on op0 for ADD
          unique case(op0[5:4])
            2'b00: begin
              MACRO_8_DRIVE C
            end
            2'b01: begin
              MACRO_8_DRIVE E
            end
            2'b10: begin
              if(state == ADD_HL_ss_2) begin
                MACRO_8_DRIVE L
              end else if (state == ADD_IX_pp_2) begin
                MACRO_8_DRIVE IXL
              end else begin
                MACRO_8_DRIVE IYL
              end
            end
            2'b11: begin
              MACRO_8_DRIVE SPL
            end
          endcase

        end else begin

          //case on op1 for ADC
          unique case(op1[5:4])
            2'b00: begin
              MACRO_8_DRIVE C
            end
            2'b01: begin
              MACRO_8_DRIVE E
            end
            2'b10: begin
              if(state == ADC_HL_ss_2) begin
                MACRO_8_DRIVE L
              end else if (state == ADD_IX_pp_2) begin
                MACRO_8_DRIVE IXL
              end else begin
                MACRO_8_DRIVE IYL
              end
            end
            2'b11: begin
              MACRO_8_DRIVE SPL
            end
          endcase

        end

     end

      ADD_HL_ss_3, ADD_IX_pp_3, ADD_IY_rr_3, ADC_HL_ss_3: begin
        //load the upper byte into A
        if(state == ADD_HL_ss_3 || state == ADC_HL_ss_3) begin
          MACRO_8_DRIVE H
        end else if (state == ADD_IX_pp_3) begin
          MACRO_8_DRIVE IXH
        end else begin
          MACRO_8_DRIVE IYH
        end

        ld_A = 1;
      end

      ADD_HL_ss_5, ADD_IX_pp_5, ADD_IY_rr_5, ADC_HL_ss_5: begin
        //add the upper bytes together and set the carry flags
        ld_F_data      = 1;
        //an ADC operation sets all of the flags, not just the C/H
        alu_op         = (state == ADC_HL_ss_5) ? `ADC : `ADC_16;
        drive_alu_data = 1;
        MACRO_RESET N

        //destination register
        if(state == ADD_HL_ss_5 || state == ADC_HL_ss_5) begin
          ld_H = 1;
        end else if (state == ADD_IX_pp_5) begin
          ld_IXH = 1;
        end else begin
          ld_IYH = 1;
        end

        //source register
        //ADC uses op1, ADD uses op0
        if(state == ADD_HL_ss_5) begin

          //case on op0 for ADD
          unique case(op0[5:4])
            2'b00: begin
              MACRO_8_DRIVE B
            end
            2'b01: begin
              MACRO_8_DRIVE D
            end
            2'b10: begin
              if(state == ADD_HL_ss_5) begin
                MACRO_8_DRIVE H
              end else if (state == ADD_IX_pp_5) begin
                MACRO_8_DRIVE IXH
              end else begin
                MACRO_8_DRIVE IYH
              end
            end
            2'b11: begin
              MACRO_8_DRIVE SPH
            end
          endcase

        end else begin

          //case on op1 for ADC
          unique case(op1[5:4])
            2'b00: begin
              MACRO_8_DRIVE B
            end
            2'b01: begin
              MACRO_8_DRIVE D
            end
            2'b10: begin
              if(state == ADC_HL_ss_5) begin
                MACRO_8_DRIVE H
              end else if (state == ADD_IX_pp_5) begin
                MACRO_8_DRIVE IXH
              end else begin
                MACRO_8_DRIVE IYH
              end
            end
            2'b11: begin
              MACRO_8_DRIVE SPH
            end
          endcase

        end

      end

      ADD_HL_ss_6, ADD_IX_pp_6, ADD_IY_rr_6, ADC_HL_ss_6: begin
        //restore the accumulator
        ld_A       = 1;
        drive_MDR1 = 1;

        if(state == ADC_HL_ss_6) begin

          ld_F_addr      = 1;
          alu_op         = `Z_TEST;
          drive_reg_addr = 1;

          //case on op1 for ADC
          unique case(op1[5:4])
            2'b00: begin drive_B = 1; drive_C = 1; end
            2'b01: begin drive_D = 1; drive_E = 1; end
            2'b10: begin
              if(state == ADC_HL_ss_6) begin drive_H = 1; drive_L = 1;
              end else if (state == ADD_IX_pp_6) begin drive_IXH = 1; drive_IXL = 1;
              end else begin drive_IYH = 1; drive_IYL = 1;
              end
            end
            2'b11: begin drive_SPH = 1; drive_SPL = 1; end
          endcase
        end
      end

      SBC_HL_ss_0: begin
        //move A to MDR1
        drive_A = 1;
        ld_MDR1 = 1;
      end

      SBC_HL_ss_1: begin
        //load A with lower byte
        ld_A = 1;
        MACRO_8_DRIVE L
      end

      SBC_HL_ss_2: begin
        //add the lower bytes together and set carry flags
        ld_F_data      = 1;
        alu_op         = `SBC;
        drive_alu_data = 1;

        //destination register
        ld_L = 1;

        //source register
        unique case(op1[5:4])
          2'b00: begin
            MACRO_8_DRIVE C
          end
          2'b01: begin
            MACRO_8_DRIVE E
          end
          2'b10: begin
            MACRO_8_DRIVE L
          end
          2'b11: begin
            MACRO_8_DRIVE SPL
          end
        endcase

      end

      SBC_HL_ss_3: begin
        //load the upper byte into A
        MACRO_8_DRIVE H
        ld_A = 1;
      end

      SBC_HL_ss_5: begin

        //add the upper bytes together and set the carry flags
        ld_F_data      = 1;
        alu_op         = `SBC;
        drive_alu_data = 1;
        MACRO_SET N

        //destination register
        ld_H = 1;

        //source register
        unique case(op1[5:4])
          2'b00: begin
            MACRO_8_DRIVE B
          end
          2'b01: begin
            MACRO_8_DRIVE D
          end
          2'b10: begin
            MACRO_8_DRIVE H
          end
          2'b11: begin
            MACRO_8_DRIVE SPH
          end
        endcase

      end

      SBC_HL_ss_6: begin
        //restore the accumulator
        ld_A       = 1;
        drive_MDR1 = 1;
      end

      INC_ss_0: begin
        unique case(op0[5:4])
          2'b00: begin
            MACRO_16_INC BC
          end
          2'b01: begin
            MACRO_16_INC DE
          end
          2'b10: begin
            MACRO_16_INC HL
          end
          2'b11: begin
            MACRO_16_INC SP
          end
        endcase
      end

      INC_IX_0: begin
        MACRO_16_INC IX
      end

      INC_IY_0: begin
        MACRO_16_INC IY
      end

      DEC_ss_0: begin
        unique case(op0[5:4])
          2'b00: begin
            MACRO_16_DEC BC
          end
          2'b01: begin
            MACRO_16_DEC DE
          end
          2'b10: begin
            MACRO_16_DEC HL
          end
          2'b11: begin
            MACRO_16_DEC SP
          end
        endcase
      end

      DEC_IX_0: begin
        MACRO_16_DEC IX
      end

      DEC_IY_0: begin
        MACRO_16_DEC IY
      end

      //-----------------------------------------------------------------------
      //END 16-bit arithmetic group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN General Purpose Arith and CPU Control
      //-----------------------------------------------------------------------

      DAA_0: begin
        ld_A           = 1;
        drive_alu_data = 1;
        alu_op         = `ALU_DAA;
      end

      CPL_0: begin
        MACRO_SET H
        MACRO_SET N
        alu_op         = `ALU_CPL;
        drive_alu_data = 1;
        ld_A           = 1;
        drive_A        = 1;
      end

      NEG_0: begin
        MACRO_SET N
        alu_op         = `ALU_NEG;
        drive_alu_data = 1;
        ld_A           = 1;
        ld_F_data      = 1;
      end

      CCF_0: begin
        ld_F_data = 1;
        alu_op    = `ALU_CCF;
        MACRO_RESET N
      end

      SCF_0: begin
        MACRO_SET C
        MACRO_RESET H
        MACRO_RESET N
      end

      EI_0: begin
        enable_interrupts = 1;
      end

      DI_0: begin
        disable_interrupts = 1;
      end

      //-----------------------------------------------------------------------
      //END General Purpose Arith and CPU Control
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Bit Set, Rst, and Test group
      //-----------------------------------------------------------------------

      //BIT_b_r,SET_b_r,RES_b_r
      BIT_b_r_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
      end

      BIT_b_r_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
      end

      BIT_b_r_3: begin
        drive_alu_data = 1;
        case(op1[7:3])
          `RLC_op: alu_op = `RLC;
          `RL_op:  alu_op = `RL;
          `RRC_op: alu_op = `RRC;
          `RR_op:  alu_op = `RR;
          `SLA_op: alu_op = `SLA;
          `SRA_op: alu_op = `SRA;
          `SRL_op: alu_op = `SRL;
          default: alu_op = {op1[7:6],1'b0,op1[5:3]};
        endcase
        ld_F_data = 1;
        unique case(op1[2:0])
          3'b000: begin
            MACRO_8_DRIVE B
            ld_B = 1;
          end
          3'b001: begin
            MACRO_8_DRIVE C
            ld_C = 1;
          end
          3'b010: begin
            MACRO_8_DRIVE D
            ld_D = 1;
          end
          3'b011: begin
            MACRO_8_DRIVE E
            ld_E = 1;
          end
          3'b100: begin
            MACRO_8_DRIVE H
            ld_H = 1;
          end
          3'b101: begin
            MACRO_8_DRIVE L
            ld_L = 1;
          end
          3'b110: begin
            drive_alu_data = 0;
            alu_op = `ALU_NOP;
            ld_F_data = 0;
            MACRO_16_DRIVE HL
            MACRO_READ_0
            ld_MARL = 1;
            ld_MARH = 1;
          end
          3'b111: begin
            MACRO_8_DRIVE A
            ld_A = 1;
          end
        endcase
      end

      //BIT_b_HL_x
      BIT_b_HL_x_0: begin
        MACRO_READ_1
        MACRO_16_DRIVE HL
      end

      BIT_b_HL_x_1: begin
        case(op1[7:3])
          `RLC_op: alu_op = `RLC;
          `RL_op:  alu_op = `RL;
          `RRC_op: alu_op = `RRC;
          `RR_op:  alu_op = `RR;
          `SLA_op: alu_op = `SLA;
          `SRA_op: alu_op = `SRA;
          `SRL_op: alu_op = `SRL;
          default: alu_op = {op1[7:6],1'b0,op1[5:3]};
        endcase
        drive_alu_data = 1;
        ld_F_data = 1;
        ld_L = (op1[7:6] != 2'b01);
      end

      BIT_b_HL_x_2: begin
        if(op1[7:6] != 2'b01) begin
          MACRO_8_DRIVE L
          drive_MAR = 1;
          MACRO_WRITE_0
        end else begin

        end
      end

      BIT_b_HL_x_3: begin
        if(op1[7:6] != 2'b01) begin
          MACRO_8_DRIVE L
          drive_MAR = 1;
          MACRO_WRITE_1
        end else begin

        end
      end

      SET_b_HL_x_0: begin
        drive_MAR = 1;
        MACRO_16_LOAD HL
      end

      //BIT_b_IX_d_x
      BIT_b_IX_d_x_0,BIT_b_IX_d_x_3: begin
        MACRO_READ_0
        MACRO_16_INC PC
      end

      BIT_b_IX_d_x_1,BIT_b_IX_d_x_4: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
      end

      BIT_b_IX_d_x_2: begin
        ld_TEMP = 1;
      end

      BIT_b_IX_d_x_6: begin
        drive_TEMP = 1;
        MACRO_16_ADD_SE_B IX
        ld_IXH = 0;
        ld_IXL = 0;
        ld_MARL = 1;
        ld_MARH = 1;
        MACRO_READ_0
      end

      BIT_b_IX_d_x_7: begin
        MACRO_READ_1
        drive_MAR = 1;
      end

      BIT_b_IX_d_x_8: begin
        case(op1[7:3])
          `RLC_op: alu_op = `RLC;
          `RL_op:  alu_op = `RL;
          `RRC_op: alu_op = `RRC;
          `RR_op:  alu_op = `RR;
          `SLA_op: alu_op = `SLA;
          `SRA_op: alu_op = `SRA;
          `SRL_op: alu_op = `SRL;
          default: alu_op = {op1[7:6],1'b0,op1[5:3]};
        endcase
        drive_alu_data = 1;
        ld_F_data = 1;
        ld_STRL = 1;
      end

      SET_b_IX_d_x_0: begin
        MACRO_8_DRIVE STRL
        drive_MAR = 1;
        MACRO_WRITE_0
      end

      SET_b_IX_d_x_1: begin
        MACRO_8_DRIVE STRL
        drive_MAR = 1;
        MACRO_WRITE_1
      end

      //BIT_b_IY_d_x
      BIT_b_IY_d_x_0,BIT_b_IY_d_x_3: begin
        MACRO_READ_0
        MACRO_16_INC PC
      end

      BIT_b_IY_d_x_1,BIT_b_IY_d_x_4: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
      end

      BIT_b_IY_d_x_2: begin
        ld_TEMP = 1;
      end

      BIT_b_IY_d_x_6: begin
        drive_TEMP = 1;
        MACRO_16_ADD_SE_B IY
        ld_IYH = 0;
        ld_IYL = 0;
        ld_MARL = 1;
        ld_MARH = 1;
        MACRO_READ_0
      end

      BIT_b_IY_d_x_7: begin
        MACRO_READ_1
        drive_MAR = 1;
      end

      BIT_b_IY_d_x_8: begin
        case(op1[7:3])
          `RLC_op: alu_op = `RLC;
          `RL_op:  alu_op = `RL;
          `RRC_op: alu_op = `RRC;
          `RR_op:  alu_op = `RR;
          `SLA_op: alu_op = `SLA;
          `SRA_op: alu_op = `SRA;
          `SRL_op: alu_op = `SRL;
          default: alu_op = {op1[7:6],1'b0,op1[5:3]};
        endcase
        drive_alu_data = 1;
        ld_F_data = 1;
        ld_STRL = 1;
      end

      SET_b_IY_d_x_0: begin
        MACRO_8_DRIVE STRL
        drive_MAR = 1;
        MACRO_WRITE_0
      end

      SET_b_IY_d_x_1: begin
        MACRO_8_DRIVE STRL
        drive_MAR = 1;
        MACRO_WRITE_1
      end

      RLD_0: begin
        MACRO_READ_0
        MACRO_16_DRIVE HL
        ld_MARH = 1;
        ld_MARL = 1;
      end

      //RLD
      RLD_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE HL
      end

      RLD_2: begin
        alu_op = `ALU_RLD;
        drive_alu_data = 1;
        ld_STRL = 1;
        ld_MDR1 = 1;
      end

      RLD_3: begin
        MACRO_WRITE_0
        drive_MAR = 1;
        MACRO_8_DRIVE STRL
      end

      RLD_4: begin
        MACRO_WRITE_1
        drive_MAR = 1;
        MACRO_8_DRIVE STRL
      end

      RLD_5: begin
        drive_MDR1 = 1;
        alu_op = `ALU_RLD_ACC;
        ld_F_data = 1;
        drive_alu_data = 1;
        ld_A = 1;
      end

      //RRD
      RRD_0: begin
        MACRO_READ_0
        MACRO_16_DRIVE HL
        ld_MARH = 1;
        ld_MARL = 1;
      end

      RRD_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE HL
      end

      RRD_2: begin
        alu_op = `ALU_RRD;
        drive_alu_data = 1;
        ld_STRL = 1;
        ld_MDR1 = 1;
      end

      RRD_3: begin
        MACRO_WRITE_0
        drive_MAR = 1;
        MACRO_8_DRIVE STRL
      end

      RRD_4: begin
        MACRO_WRITE_1
        drive_MAR = 1;
        MACRO_8_DRIVE STRL
      end

      RRD_5: begin
        drive_MDR1 = 1;
        alu_op = `ALU_RRD_ACC;
        ld_F_data = 1;
        drive_alu_data = 1;
        ld_A = 1;
      end

      //-----------------------------------------------------------------------
      //END Bit Set, Rst, and Test group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Jump group
      //-----------------------------------------------------------------------

      //JP_nn
      JP_nn_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
      end

      JP_nn_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
      end

      JP_nn_2: begin
        MACRO_16_DRIVE PC
        alu_op = `INCR_A_16;
        ld_MARH = 1;
        ld_MARL = 1;
        ld_PCL = 1;
      end

      JP_nn_3: begin
        MACRO_READ_0
        drive_MAR = 1;
      end

      JP_nn_4: begin
        MACRO_READ_1
        drive_MAR = 1;
      end

      JP_nn_5: begin
        ld_PCH = 1;
      end

      //JP_cc_nn
      JP_cc_nn_0: begin
        MACRO_READ_0
        MACRO_16_INC PC
      end

      JP_cc_nn_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
      end

      JP_cc_nn_2: begin
        MACRO_16_DRIVE PC
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
        MACRO_READ_0
        drive_MAR = 1;
      end

      JP_cc_nn_4: begin
        MACRO_READ_1
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
        MACRO_READ_0
        MACRO_16_INC PC
      end

      JR_e_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
      end

      JR_e_2: begin
        ld_TEMP = 1;
      end

      JR_e_3: begin
        MACRO_16_ADD_SE_B PC
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

      //JP (HL)
      JP_HL_0: begin
        MACRO_16_DRIVE HL
        ld_PCH = 1;
        ld_PCL = 1;
      end

      //JP (IX)
      JP_IX_0: begin
        MACRO_16_DRIVE IX
        ld_PCH = 1;
        ld_PCL = 1;
      end

      //JP (IY)
      JP_IY_0: begin
        MACRO_16_DRIVE IY
        ld_PCH = 1;
        ld_PCL = 1;
      end

      //DJNZ_e
      DJNZ_e_0: begin
        //store the flags
        drive_F = 1;
        ld_MDR1 = 1;
      end

      DJNZ_e_1: begin
        //decrement B
        ld_F_data = 1;
        MACRO_8_DEC B
      end

      DJNZ_e_2: begin
        //start fetching the offset
        MACRO_READ_0
        MACRO_INC_PC
      end

      DJNZ_e_3: begin
        //continue fetching the offset
        MACRO_16_DRIVE PC
        MACRO_READ_1
      end

      DJNZ_e_4: begin
        //load the offset from the bus
        ld_TEMP = 1;
      end

      DJNZ_e_5: begin
        //restore the flags in the next cycle as the processor
        //jumps conditional to the current value of the flags
        drive_MDR1 = 1;
        ld_F_data  = 1;
        alu_op     = `ALU_NOP;
      end

      DJNZ_e_6: begin
        //we only reach this point if we were not zero
        //add the offset to the current pc
        MACRO_16_ADD_SE_B PC
      end

      //-----------------------------------------------------------------------
      //END Jump group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Call and Return group
      //-----------------------------------------------------------------------

      //CALL_nn
      CALL_nn_0,CALL_nn_3: begin
        MACRO_READ_0
        MACRO_INC_PC
      end

      CALL_nn_1,CALL_nn_4: begin
        MACRO_READ_1
        MACRO_DRIVE_PC
      end

      CALL_nn_2: begin
        ld_MDR1 = 1;
      end

      CALL_nn_5: begin
        ld_MDR2 = 1;
        MACRO_16_DRIVE SP
        alu_op = `DECR_A_16;
        MACRO_16_LOAD SP
        ld_MARH = 1;
        ld_MARL = 1;
      end

      CALL_nn_6: begin
        drive_MAR = 1;
        MACRO_WRITE_0
        MACRO_8_DRIVE PCH
      end

      CALL_nn_7: begin
        drive_MAR = 1;
        MACRO_WRITE_1
        MACRO_8_DRIVE PCH
      end

      CALL_nn_8: begin
        ld_PCH = 1;
        drive_MDR2 = 1;
      end

      CALL_nn_9: begin
        MACRO_16_DRIVE SP
        alu_op = `DECR_A_16;
        MACRO_16_LOAD SP
        ld_MARH = 1;
        ld_MARL = 1;
      end

      CALL_nn_10: begin
        MACRO_WRITE_0
        MACRO_8_DRIVE PCL
        drive_MAR = 1;
      end

      CALL_nn_11: begin
        MACRO_WRITE_1
        MACRO_8_DRIVE PCL
        drive_MAR = 1;
      end

      CALL_nn_12: begin
        ld_PCL = 1;
        drive_MDR1 = 1;
      end

      //CALL_cc_nn
      CALL_cc_nn_0,CALL_cc_nn_3: begin
        MACRO_READ_0
        MACRO_INC_PC
      end

      CALL_cc_nn_1,CALL_cc_nn_4: begin
        MACRO_READ_1
        MACRO_DRIVE_PC
      end

      CALL_cc_nn_2: begin
        ld_MDR1 = 1;
      end

      CALL_cc_nn_5: begin
        ld_MDR2 = 1;
        if(next_state == CALL_cc_nn_6) begin
          MACRO_16_DRIVE SP
          alu_op = `DECR_A_16;
          MACRO_16_LOAD SP
          ld_MARH = 1;
          ld_MARL = 1;
        end else begin

        end
      end

      CALL_cc_nn_6: begin
        drive_MAR = 1;
        MACRO_WRITE_0
        MACRO_8_DRIVE PCH
      end

      CALL_cc_nn_7: begin
        drive_MAR = 1;
        MACRO_WRITE_1
        MACRO_8_DRIVE PCH
      end

      CALL_cc_nn_8: begin
        ld_PCH = 1;
        drive_MDR2 = 1;
      end

      CALL_cc_nn_9: begin
        MACRO_16_DRIVE SP
        alu_op = `DECR_A_16;
        MACRO_16_LOAD SP
        ld_MARH = 1;
        ld_MARL = 1;
      end

      CALL_cc_nn_10: begin
        MACRO_WRITE_0
        MACRO_8_DRIVE PCL
        drive_MAR = 1;
      end

      CALL_cc_nn_11: begin
        MACRO_WRITE_1
        MACRO_8_DRIVE PCL
        drive_MAR = 1;
      end

      CALL_cc_nn_12: begin
        ld_PCL = 1;
        drive_MDR1 = 1;
      end

      //RET
      RET_0: begin
        MACRO_READ_0
        MACRO_16_DRIVE SP
      end

      RET_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE SP
      end

      RET_2: begin
        ld_PCL = 1;
      end

      RET_3: begin
        MACRO_READ_0
        MACRO_16_INC SP
      end

      RET_4: begin
        MACRO_READ_1
        MACRO_16_DRIVE SP
      end

      RET_5: begin
        ld_PCH = 1;
        MACRO_16_INC SP
      end

      //RET_cc
      RET_cc_1: begin
        MACRO_READ_0
        MACRO_16_DRIVE SP
      end

      RET_cc_2: begin
        MACRO_READ_1
        MACRO_16_DRIVE SP
      end

      RET_cc_3: begin
        ld_PCL = 1;
      end

      RET_cc_4: begin
        MACRO_READ_0
        MACRO_16_INC SP
      end

      RET_cc_5: begin
        MACRO_READ_1
        MACRO_16_DRIVE SP
      end

      RET_cc_6: begin
        ld_PCH = 1;
        MACRO_16_INC SP
      end

      RST_p_0: begin
        MACRO_16_DRIVE SP
        MACRO_16_LOAD SP
        alu_op = `DECR_A_16;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      RST_p_1: begin
        MACRO_WRITE_0
        drive_MAR = 1;
        MACRO_8_DRIVE PCH
      end

      RST_p_2: begin
        MACRO_WRITE_1
        drive_MAR = 1;
        MACRO_8_DRIVE PCH
      end

      RST_p_3: begin
        MACRO_16_DRIVE SP
        MACRO_16_LOAD SP
        alu_op = `DECR_A_16;
        ld_MARH = 1;
        ld_MARL = 1;
      end

      RST_p_4: begin
        MACRO_WRITE_0
        drive_MAR = 1;
        MACRO_8_DRIVE PCL
      end

      RST_p_5: begin
        MACRO_WRITE_1
        drive_MAR = 1;
        MACRO_8_DRIVE PCL
      end

      RST_p_6: begin
        MACRO_16_DRIVE PC
        MACRO_16_LOAD PC
        drive_TEMP = 1;
        alu_op = `ALU_RST;
      end

      //-----------------------------------------------------------------------
      //END Call and Return group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN Input and Output group
      //-----------------------------------------------------------------------

      //BASIC IN AND OUT
      IN_A_n_0, OUT_n_A_0: begin
        MACRO_READ_0
        MACRO_16_INC PC

        //Start constructing an address with A as the high byte
        MACRO_8_DRIVE A
        ld_STRH = 1;
      end

      IN_A_n_1, OUT_n_A_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE PC
      end

      IN_A_n_2, OUT_n_A_2: begin
        //Finish constructing an address with the odf byte as the low byte
        ld_STRL = 1;
      end

      IN_A_n_3: begin
        MACRO_IN_0
        MACRO_16_DRIVE STR
      end

      IN_A_n_4, IN_A_n_5: begin
        MACRO_IN_1
        MACRO_16_DRIVE STR
      end

      IN_A_n_6: begin
        ld_A = 1;
      end

      OUT_n_A_3: begin
        MACRO_OUT_0
        MACRO_16_DRIVE STR
        drive_A = 1;
      end

      OUT_n_A_4, OUT_n_A_5: begin
        MACRO_OUT_1
        MACRO_16_DRIVE STR
        drive_A = 1;
      end

      //IN r (C)
      IN_r_C_0: begin
        MACRO_IN_0
        MACRO_16_DRIVE BC
      end

      IN_r_C_1, IN_r_C_2: begin
        MACRO_IN_1
        MACRO_16_DRIVE BC
      end

      IN_r_C_3: begin
        //send the data through the 8-bit alu from the bus
        ld_F_data    = 1;
        alu_op       = `ALU_B;

        MACRO_RESET H
        MACRO_RESET N

        unique case(op1[5:3])
          3'b111: ld_A = 1;
          3'b000: ld_B = 1;
          3'b001: ld_C = 1;
          3'b010: ld_D = 1;
          3'b011: ld_E = 1;
          3'b100: ld_H = 1;
          3'b101: ld_L = 1;
        endcase
      end

      //OUT (C), r
      OUT_C_r_0: begin
        MACRO_OUT_0
        MACRO_16_DRIVE BC
        ld_MARL = 1;
        ld_MARH = 1;
      end

      OUT_C_r_1, OUT_C_r_2: begin

        MACRO_OUT_1
        drive_MAR = 1;

        unique case(op1[5:3])
          3'b000: begin
            MACRO_8_DRIVE B
          end
          3'b001: begin
            MACRO_8_DRIVE C
          end
          3'b010: begin
            MACRO_8_DRIVE D
          end
          3'b011: begin
            MACRO_8_DRIVE E
          end
          3'b100: begin
            MACRO_8_DRIVE H
          end
          3'b101: begin
            MACRO_8_DRIVE L
          end
          3'b111: begin
            MACRO_8_DRIVE A
          end
        endcase
      end

      INI_0, INIR_0, IND_0, INDR_0: begin
        MACRO_IN_0
        MACRO_16_DRIVE BC
      end

      INI_1, INI_2, INIR_1, INIR_2, IND_1, IND_2, INDR_1, INDR_2: begin
        MACRO_IN_1
        MACRO_16_DRIVE BC
      end

      INI_3, INIR_3, IND_3, INDR_3: begin
        //load the byte from the I/O port
        ld_MDR1 = 1;
      end

      INI_4, INIR_4, IND_4, INDR_4: begin
        MACRO_WRITE_0
        MACRO_16_DRIVE HL
        drive_MDR1 = 1;
      end

      INI_5, INIR_5, IND_5, INDR_5: begin
        MACRO_WRITE_1
        MACRO_16_DRIVE HL
        drive_MDR1 = 1;
      end

      INI_6, INIR_6, IND_6, INDR_6: begin
        ld_F_data = 1;
        MACRO_8_DEC B
        MACRO_SET N
      end

      INI_7, INIR_7, IND_7, INDR_7: begin
        if(state == INI_7 || state == INIR_7) begin
          MACRO_16_INC HL
        end else begin
          MACRO_16_DEC HL
        end
      end

      INIR_8, INDR_8: begin
        MACRO_DEC_PC
      end

      INIR_9, INDR_9: begin
        MACRO_DEC_PC
      end

      //OUTI
      OUTI_0, OTIR_0, OUTD_0, OTDR_0: begin
        MACRO_READ_0
        MACRO_16_DRIVE HL
      end

      OUTI_1, OTIR_1, OUTD_1, OTDR_1: begin
        MACRO_READ_1
        MACRO_16_DRIVE HL
      end

      OUTI_2, OTIR_2, OUTD_2, OTDR_2: begin
        ld_MDR1 = 1;
      end

      OUTI_3, OTIR_3, OUTD_3, OTDR_3: begin
        MACRO_OUT_0
        MACRO_16_DRIVE BC
        drive_MDR1 = 1;
      end

      OUTI_4, OTIR_4, OUTD_4, OTDR_4: begin
        MACRO_OUT_1
        MACRO_16_DRIVE BC
        drive_MDR1 = 1;
      end

      OUTI_5, OTIR_5, OUTD_5, OTDR_5: begin
        MACRO_OUT_2
        MACRO_16_DRIVE BC
        drive_MDR1 = 1;
      end

      OUTI_6, OTIR_6, OUTD_6, OTDR_6: begin
        MACRO_SET N
        MACRO_8_DEC B
        ld_F_data = 1;
      end

      OUTI_7, OTIR_7, OUTD_7, OTDR_7: begin
        if(state == OUTI_7 || state == OTIR_7) begin
          MACRO_16_INC HL
        end else begin
          MACRO_16_DEC HL
        end
      end

      OTIR_8, OTDR_8: begin
        MACRO_DEC_PC
      end

      OTIR_9, OTDR_9: begin
        MACRO_DEC_PC
      end

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
      default: next_state = T1;
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

      default: begin end

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
      default: next_state = T1;
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

      default: begin end
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
      default: next_state = T1;
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

      default: begin end

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

      default: begin next_state = T1; end

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

      default: begin end


    endcase
  end

endmodule: OCF_fsm

//-----------------------------------------------------------------------------
//IN_fsm
//  This module generates the relevant bus signals for the IN
//  macro state.
//-----------------------------------------------------------------------------
module IN_fsm(
  input   logic clk,
  input   logic rst_L,

  input   logic WAIT_L,
  input   logic IN_start,
  output  logic IN_IORQ_L,
  output  logic IN_RD_L
);

  enum logic [1:0] {
    T1,
    T2,
    TW,
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
      T1: next_state = (IN_start) ?  T2 : T1;
      T2: next_state = TW;
      TW: next_state = T3;
      T3: next_state = T1;
      default: next_state = T1;
    endcase
  end

  //output logic
  always_comb begin
    IN_IORQ_L = 1;
    IN_RD_L   = 1;

    case(state)
      //TODO: Wait_L timing

      T1: begin
        if(IN_start) begin
          IN_IORQ_L = 0;
          IN_RD_L   = 0;
        end
      end

      T2: begin
        IN_IORQ_L = 0;
        IN_RD_L   = 0;
      end

      TW: begin
        IN_IORQ_L = 0;
        IN_RD_L   = 0;
      end

      default: begin end

    endcase
  end

endmodule: IN_fsm

//-----------------------------------------------------------------------------
//OUT_fsm
//  This module generates the relevant bus signals for the OUT
//  macro state.
//-----------------------------------------------------------------------------
module OUT_fsm(
  input   logic clk,
  input   logic rst_L,

  input   logic WAIT_L,
  input   logic OUT_start,
  output  logic OUT_IORQ_L,
  output  logic OUT_WR_L
);

  enum logic [1:0] {
    T1,
    T2,
    TW,
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
      T1: next_state = (OUT_start) ?  T2 : T1;
      T2: next_state = TW;
      TW: next_state = T3;
      T3: next_state = T1;
      default: next_state = T1;
    endcase
  end

  //output logic
  always_comb begin
    OUT_IORQ_L = 1;
    OUT_WR_L   = 1;

    case(state)
      //TODO: Wait_L timing

      T1: begin
        if(OUT_start) begin
          OUT_IORQ_L = 0;
          OUT_WR_L   = 0;
        end
      end

      T2: begin
        OUT_IORQ_L = 0;
        OUT_WR_L   = 0;
      end

      TW: begin
        OUT_IORQ_L = 0;
        OUT_WR_L   = 0;
      end

      default: begin end

    endcase
  end

endmodule: OUT_fsm

//-----------------------------------------------------------------------------
//INT_fsm
//  This module generates the relevant bus signals for a maskable interrupt
//  subroutine.
//-----------------------------------------------------------------------------
module INT_fsm(
  input   logic clk,
  input   logic rst_L,

  input   logic INT_start,
  input   logic WAIT_L,

  output  logic INT_M1_L,
  output  logic INT_IORQ_L
);

  enum logic [3:0] {
    T1  = 4'b0000,
    T2  = 4'b0001,
    T3  = 4'b0010
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
      T1: next_state = (INT_start) ? T2 : T1;
      T2: next_state = T3;
      T3: next_state = T1;
      default: next_state = T1;
    endcase
  end

  //output logic
  always_comb begin
    //defaults
    INT_M1_L    = 1;
    INT_IORQ_L  = 1;

    case(state)
      T1: begin
        INT_M1_L   = (INT_start) ? 0 : 1;
        INT_IORQ_L = (INT_start) ? 0 : 1;
      end

      T2: begin
        INT_M1_L   = 0;
        INT_IORQ_L = 0;
      end

      T3: begin
        INT_M1_L   = 0;
        INT_IORQ_L = 0;
      end

      default: begin end

    endcase
  end

endmodule: INT_fsm


