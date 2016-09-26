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
module control_fsm ();

  //Enumerate the possible machine cycles which are macro states
  //for our processor. Each macro state is made up of up to 6 micro
  //states to actually carry out the operations on the datapath.
  enum logic [10:0] {
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

  end

  //output logic
  always_comb begin

  end

  //TODO: Instantiate a decode module that determines the next macro
  //      state based on the output of the OCF


  //TODO: Instantiate a sub-fsm foreach of the above machine cycles
  //      one by one in order to generate an instruction

endmodule: control_fsm


module OCF_fsm(
  input   logic clk,
  input   logic rst_L,

  //---------------------------------------------------------------------------
  //Internal control signals
  //  These signals are used to control this fsm and only this fsm
  //---------------------------------------------------------------------------
  input   logic OCF_start,
  output  logic OCF_done,

  //---------------------------------------------------------------------------
  //Top level signals
  //  This FSM is the only one generating these signals, so they
  //  get the same names as the top level signals
  //---------------------------------------------------------------------------
  input   logic         M1_L,
  input   logic         INT_L,
  input   logic         NMI_L,
  input   logic         WAIT_L,
  output  logic         RFSH_L,

  //---------------------------------------------------------------------------
  //Shared Signals
  //  This FSM isn't the only one that uses these signals, so they are
  //  prefaced with the name of the fsm
  //---------------------------------------------------------------------------
  output  logic         OCF_MEMR_L,
  output  logic         OCF_RD_L,
  output  logic         OCF_WR_L
);

  //microstates in time cycles
  enum logic [2:0] {
    IDLE = 3'd0,
    T1   = 3'd1,
    T2   = 3'd2,
    T3   = 3'd3,
    T4   = 3'd4
  } state, next_state;

  always(@posedge clk) begin
    if(~rst_L) begin
      state <= Idle;
    end
    else begin
      state <= next_state;
    end
  end

  //next state logic
  always_comb begin
    case (state)
        //TODO: enumerate out these states

    endcase
  end

  //output logic
  always_comb begin
    case(state)

      IDLE: begin
        if(OCF_start) begin

        end

      end


    endcase
  end


endmodule: OCF_fsm
