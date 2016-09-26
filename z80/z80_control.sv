module control_logic (

  input   logic       clk,
  input   logic       rst_L,

  //---------------------------------------------------------------------------
  //Bus Signals
  //  - data_in: The control segment only receives data from the bus
  //  - addr_out: The control segment is responsible for generating the address
  //              line.
  //---------------------------------------------------------------------------
  input   logic [7:0] data_in,
  output  logic       addr_out,

  //---------------------------------------------------------------------------
  //Top Level Signals
  //  These signals are detailed in z80_top. The control logic is directly
  //  responsible for generating these signals based on the state of the
  //  processor. They are top level inputs and outputs to the system.
  //---------------------------------------------------------------------------
  input   logic         M1_L,
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

  //TODO: Tie together PC register and control FSM

endmodule: control_logic


//-----------------------------------------------------------------------------
//control_fsm
//  This module is repsonsible for stepping through the various machine cycles
//  as the processor progresses from Instruction Fetch to Decode, to Execute.
//  This module generates the relevant datapath controls based on the state
//  that the processor is in.
//-----------------------------------------------------------------------------
module control_fsm (
  input logic   clk,
  input logic   rst_L
);

  //Enumerate the possible machine cycles which are macro states
  //for our processor. Each macro state is made up of up to 6 micro
  //states to actually carry out the operations on the datapath.
  enum logic [9:0] {
    IO  = 10'd0, //internal cpu operation
    MR  = 10'd1, //memory read
    MRH = 10'd2, //memory read of high byte
    MRL = 10'd3, //memory read of low byte
    MW  = 10'd4, //memory write
    MWH = 10'd5, //memory write of high byte
    MWL = 10'd6, //memory write of low byte
    OCF = 10'd7, //op code fetch
    ODH = 10'd8, //operand data read of high byte
    ODL = 10'd9, //operand data read of low byte
    PR  = 10'd10,//port read
    PW  = 10'd11,//port write
    SRH = 10'd12,//stack read of high byte
    SRL = 10'd13,//stack read of low byte
    SWH = 10'd14,//stack write of high byte
    SWL = 10'd15 //stack write of low byte
  } state, next_state;

  //state register
  always @(posedge clk) begin
    if(~rst_L) begin
      //default to op code fetch to grab an instruction
      state <= OCF;
    end
    else begin
      state <= next_state;
    end
  end

  //next state logic
  always_comb begin
    //TODO: assign the next state to be whatever the decode module says it is
    //TODO: only update when one of the done signals is asserted
  end

  //output logic
  always_comb begin
    //TODO: assign the output based on which sub-fsm is in charge
  end

  //TODO: Instantiate a decode module that determines the next macro
  //      state based on the output of the OCF


  //TODO: Instantiate a sub-fsm foreach of the above machine cycles
  //      one by one in order to generate an instruction

endmodule: control_fsm


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
  // - prev_done: Has the previous macro_state finished running?
  // - opcode:    What instruction we should run, is defined in z80_defines.h
  //---------------------------------------------------------------------------
  input logic       prev_done,
  input logic [7:0] opcode,
  input logic       opcode_valid

  //---------------------------------------------------------------------------
  // - next_state: Which macro state runs next encoded as an [9:0] in the .h
  //---------------------------------------------------------------------------
  output logic [9:0] next_state
);

  //TODO: Change fetch to be 2 cycles and put in a rfsh/execute fsm
  enum logic [10:0] {
    FETCH,
    EX_RFSH,
    INC_0
  } state, next_state, encoded_state;

  always_ff @(posedge clk) begin
    if(~rst_L) begin
      state <= IDLE;
    end

    else begin
      state <= next_state;
    end
  end

  //next state logic
  always_comb begin
    case(state)
      FETCH: begin
        next_state = (prev_done) ? encoded_state : FETCH;
      end

      INC_0: begin
        next_state =
      end

    endcase
  end


endmodule: decoder

//TODO: NOP not needed since its just an IF that ends
//-----------------------------------------------------------------------------
//NOP_fsm
//  This module generates the relevant bus signals for a no operation macro
//  state.
//-----------------------------------------------------------------------------
module NOP_fsm(
  input   logic clk,
  input   logic rst_L,
  input   logic NOP_start,
  output  logic NOP_done
);

  enum logic [2:0] {
    T1,
    T2,
    T3,
    T4
  } state, next_state;

  always_ff @(posedge clk) begin
    if(~rst_L) begin
      state <= T1;
    end

    else begin
      state <= next_state;
    end
  end

  always_comb begin
    NOP_done = 0;

    case(state)
      T1: begin
        next_state = (NOP_start) ? T2 : T1;
      end

      T2: begin next_state = T3; end

      T3: begin next_state = T4; end

      T4: begin
        next_state = T1;
        NOP_done    = 1;
      end

    endcase
  end

endmodule NOP_fsm


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
  input   logic [15:0]  PC,
  input   logic         OCF_start,
  output  logic         OCF_done,
  output  logic [7:0]   OCF_opcode_out,
  output  logic         OCF_opcode_valid,

  //---------------------------------------------------------------------------
  //Inputs that come from the top level
  //  This FSM is the only one generating these signals, so they
  //  get the same names as the top level signals
  //---------------------------------------------------------------------------
  input   logic [7:0]   OCF_data_in,
  input   logic         INT_L,
  input   logic         NMI_L,
  input   logic         WAIT_L,

  //---------------------------------------------------------------------------
  //Outputs that bubble up to top level
  //  This FSM isn't the only one that uses these signals, so they are
  //  prefaced with the name of the fsm
  //---------------------------------------------------------------------------
  output  logic         OCF_M1_L,
  output  logic         OCF_MREQ_L,
  output  logic         OCF_RD_L,
  output  logic [15:0]  OCF_addr_out,
  output  logic         OCF_RFSH_L

);

  //microstates in time cycles
  enum logic [2:0] {
    T1   = 3'd0,
    T2   = 3'd1,
    T3   = 3'd2,
    T4   = 3'd3
  } state, next_state;

  //This value will be set on the T2/T3 edge
  logic [7:0] opcode_fetched;

  always @(posedge clk) begin
    if(~rst_L) begin
      state <= T1;
    end
    else begin
      state <= next_state;
    end

    //always read the data bus line
    opcode_fetched <= OCF_data_in;
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
    OCF_addr_out    = 0;
    OCF_MREQ_L      = 1;
    OCF_RD_L        = 1;
    OCF_M1_L        = 1;
    OCF_RFSH_L      = 1;
    OCF_done        = 0;
    OCF_opcode_out  = 0;
    OCF_opcode_valid = 0;

    case(state)

      //start on the same clock cycle that we receive the start signal
      //so that the output is valid on clock edge T1/T2
      T1: begin
        if(OCF_start) begin
          OCF_addr_out = PC;
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
        OCF_addr_out = PC;
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
        OCF_opcode_out   = opcode_fetched;
        OCF_opcode_valid = 1;
      end

      T4: begin
        OCF_done = 1;
      end

    endcase
  end

endmodule: OCF_fsm
