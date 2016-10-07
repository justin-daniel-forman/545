`include "../z80_defines.vh"

module control_logic (

  input   logic       clk,
  input   logic       rst_L,

  //---------------------------------------------------------------------------
  //Bus Signals
  //  - data_in: The control segment only receives data from the bus
  //---------------------------------------------------------------------------
   input   logic [7:0]   data_in,

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
  output  logic [3:0]   alu_op,
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
  //  These registers sit on the addr bus
  //-----------------------------------
  output  logic         ld_MARH, //load upper byte of MAR
  output  logic         ld_MARL, //load lower byte of MAR
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

    //accumulator flags and loads
    .ld_A,
    .ld_F_data,
    .ld_F_addr,
    .drive_A,
    .drive_F,
    .alu_op,
    .drive_alu_data,
    .drive_alu_addr,

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
  //input logic [7:0] op0,
  //input logic [7:0] op1,
  //input logic [7:0] op2,

  //output logic      ld_op0,
  //output logic      ld_op1,
  //output logic      ld_op2,

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
  output  logic [3:0]   alu_op,
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
  //  These registers sit on the addr bus
  //-----------------------------------
  output  logic         ld_MARH, //load upper byte of MAR
  output  logic         ld_MARL, //load lower byte of MAR
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

  enum logic [15:0] {
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

    INC_0,
    INC_1,
    INC_2,

    LDI_0,
    LDI_1,
    LDI_2,
    LDI_3,
    LDI_4,
    LDI_5,
    LDI_6,
    LDI_7,

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
    LD_HL_nn_A,
    LD_HL_nn_B,

    //Multi-OCF Instructions
    //There is a difference between multi-ocf instructions and
    //instructions that require an operand data fetch. In an
    //odf, the fetched byte encodes parameters, not the instruction
    //to be performed. In a multi-ocf, any subsequent ocf fetches
    //another part of the opcode.
                //IX instructions Group
                //IX bit instructions Group
                //IY instructions Group
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
          `LD_r_r:    next_state = LD_r_r_0;
          `INC:       next_state = INC_0;
          `EXT_INST:  next_state = EXT_INST_0;

          default:    next_state = FETCH_3;
        endcase
      end

      //The instruction processed did nothing, so loop back and restart
      //unless it is proceeded by an operand data fetch
      FETCH_3: begin
        casex(op0)
          `LD_HL_nn:  next_state = LD_HL_nn_0;
          default:    next_state = FETCH_0;
        endcase
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
          `LDI:       next_state = LDI_0;
          default:    next_state = FETCH_0;
        endcase
      end

      //-----------------------------------------------------------------------
      //END Opcode fetch group
      //-----------------------------------------------------------------------

      //-----------------------------------------------------------------------
      //BEGIN 8-bit load group
      //-----------------------------------------------------------------------
      LD_r_r_0: next_state = FETCH_0;

      //-----------------------------------------------------------------------
      //END 8-bit load group
      //-----------------------------------------------------------------------


      //TODO: include support for INC
      INC_0: next_state = FETCH_0;

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
      LD_HL_nn_9: next_state = LD_HL_nn_A;
      LD_HL_nn_A: next_state = LD_HL_nn_B;
      LD_HL_nn_B: next_state = FETCH_0;


      //-----------------------------------------------------------------------
      //BEGIN Extended instructions group
      //-----------------------------------------------------------------------

      //We need to fetch another byte to figure out which op this is,
      //so go to the second op code fetch cycle
      EXT_INST_0: next_state = FETCH_4;

      //LDI
      LDI_0: next_state = LDI_1;
      LDI_1: next_state = LDI_2;
      LDI_2: next_state = LDI_3;
      LDI_3: next_state = LDI_4;
      LDI_4: next_state = LDI_5;
      LDI_5: next_state = LDI_6;
      LDI_6: next_state = LDI_7;
      LDI_7: next_state = FETCH_0;

      //-----------------------------------------------------------------------
      //END Extended instructions group
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

    //Accumulator and Flag loads
    //We can load the flags from either the 16-bit ALU or the
    //8-bit ALU
    ld_A = 0;
    ld_F_data = 0;
    ld_F_addr = 0;

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
        alu_op    = `INCR_A;
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
      end

      FETCH_3, FETCH_7: begin
        OCF_bus = 1;
      end

      LD_r_r_0: begin

        swap_reg = 1;

        //NOTE: There is a point to point connection between A and the
        //regfile that makes this all possible in a single cycle
        case(op0[5:3])
          //When A is selected, we need to drive the value of A on the
          //data bus in order for the regfile to read it. The other
          //direction is taken care of with a point-2-point connection.
          3'b111: begin //A
            ld_A    = 1;
            drive_A = 1;
            alu_op  = `ALU_NOP;
            drive_alu_data = 1;
          end

          //The drives are here so that the regfile out gives the
          //value of the register we might want to put into A
          //through that p2p connection. If we don't specify, we
          //get zz out
          3'b000: begin ld_B = 1; drive_B = 1; end//B
          3'b001: begin ld_C = 1; drive_C = 1; end//C
          3'b010: begin ld_D = 1; drive_D = 1; end//D
          3'b011: begin ld_E = 1; drive_E = 1; end//E
          3'b100: begin ld_H = 1; drive_H = 1; end//H
          3'b101: begin ld_L = 1; drive_L = 1; end//L
        endcase

        case(op0[2:0])
           3'b111: begin //A
            ld_A = 1;
            drive_A = 1;
            alu_op = `ALU_NOP;
            drive_alu_data = 1;
          end
          3'b000: begin ld_B = 1; drive_B = 1; end//B
          3'b001: begin ld_C = 1; drive_C = 1; end//C
          3'b010: begin ld_D = 1; drive_D = 1; end//D
          3'b011: begin ld_E = 1; drive_E = 1; end//E
          3'b100: begin ld_H = 1; drive_H = 1; end//H
          3'b101: begin ld_L = 1; drive_L = 1; end//L
        endcase

      end

      LDI_0: begin
        //MAR <- HL
        drive_H = 1;
        drive_L = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        ld_MARH = 1;
        ld_MARL = 1;

        //start a memory read from HL
        MRD_start = 1;
        MRD_bus   = 1;
        drive_MAR = 1;
      end

      LDI_1: begin
        //Nothing to do but continue the read
        MRD_bus  = 1;
        drive_MAR = 1;
      end

      LDI_2: begin
        //MDR1 <- (HL) (put contents of D_BUS into MDR1)
        ld_MDR1 = 1;
      end

      LDI_3: begin
        //MAR <- DE
        drive_D = 1;
        drive_E = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        alu_op = `ALU_NOP;
        ld_MARH = 1;
        ld_MARL = 1;

        //D_BUS <- MDR1
        drive_MDR1 = 1;

        //Start a write
        MWR_start = 1;
        MWR_bus   = 1;
        drive_MAR = 1;
      end

      LDI_4: begin
        //continue the write
        drive_MDR1 = 1;
        MWR_bus    = 1;
        drive_MAR  = 1;
      end

      LDI_5: begin
        //DE <- DE + 1
        drive_D = 1;
        drive_E = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_D = 1;
        ld_E = 1;
        alu_op = `INCR_A;
      end

      LDI_6: begin
        //HL <- HL + 1
        drive_H = 1;
        drive_L = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_H = 1;
        ld_L = 1;
        alu_op = `INCR_A;
      end

      LDI_7: begin
        //BC <- BC - 1
        drive_B = 1;
        drive_C = 1;
        drive_reg_addr = 1;
        drive_alu_addr = 1;
        ld_B    = 1;
        ld_C    = 1;
        alu_op  = `DECR_A;
      end

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
        alu_op  = `INCR_A;
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
        alu_op = `INCR_A;
        ld_MARL = 1;
        ld_MARH = 1;
      end

      LD_HL_nn_9: begin
        //start a read at nn+1
        MRD_start = 1;
        MRD_bus = 1;
        drive_MAR = 1;
      end

      LD_HL_nn_A: begin
        //continue the read
        MRD_bus = 1;
        drive_MAR = 1;
      end

      LD_HL_nn_B: begin
        //load the data into H
        ld_H = 1;
      end

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
