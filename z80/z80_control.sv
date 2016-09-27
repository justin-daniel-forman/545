`include "../z80_defines.vh"

module control_logic (

  input   logic       clk,
  input   logic       rst_L,

  //---------------------------------------------------------------------------
  //Bus Signals
  //  - data_in: The control segment only receives data from the bus
  //  - addr_out: The control segment is responsible for generating the address
  //              line.
  //---------------------------------------------------------------------------
  input   logic [7:0]   data_in,
  output  logic [15:0]  addr_out,

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
  //PROGRAM COUNTER
  //TODO: Include support for branching
  //---------------------------------------------------------------------------
  logic [15:0] next_PC;
  logic [15:0] curr_PC;
  logic        inc_PC;
  register #(16) PC_reg(clk, rst_L, next_PC, inc_PC, curr_PC);
  assign next_PC = curr_PC + 1;

  //---------------------------------------------------------------------------
  //DATA REGISTER
  //  Latch in values that come off of the data bus so that we know what
  //  to do with them
  //---------------------------------------------------------------------------
  logic       data_valid;
  logic [7:0] bus_data;
  register #(8) DATA_reg(clk, rst_L, data_in, data_valid, bus_data);

  //---------------------------------------------------------------------------
  //DECODER
  //  Determines which instruction we are currently executing and who gets
  //  control of the bus.
  //---------------------------------------------------------------------------
  logic OCF_start;
  logic OCF_bus;
  logic OCF_done;

  decoder DECODE(
    .clk(clk),
    .rst_L(rst_L),
    .prev_done(OCF_done),
    //give the raw data_in to the decoder because it is time sensitive
    //and needs to know when the data appears on the bus, not after
    //we have saved it.
    .opcode(data_in),
    .WAIT_L(WAIT_L),

    //outputs
    .OCF_start(OCF_start),
    .OCF_bus(OCF_bus),
    .inc_PC(inc_PC)
  );

  //---------------------------------------------------------------------------
  //BUS LINES
  //  Arbitrate who gets to drive the actual bus lines between all of the
  //  sub-fsms.
  //---------------------------------------------------------------------------
  logic         OCF_M1_L;
  logic         OCF_MREQ_L;
  logic         OCF_RD_L;
  logic         OCF_RFSH_L;
  logic [15:0]  OCF_addr_out;

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
    addr_out = 8'bz;

    if(OCF_bus) begin
      M1_L   = OCF_M1_L;
      MREQ_L = OCF_MREQ_L;
      RD_L   = OCF_RD_L;
      RFSH_L = OCF_RFSH_L;
      addr_out = OCF_addr_out;
    end

  end

  //---------------------------------------------------------------------------
  //SUB FSM DECLARATIONS
  //---------------------------------------------------------------------------
  OCF_fsm machine_fetch(
    .clk(clk),
    .rst_L(rst_L),
    .PC(curr_PC),
    .OCF_start(OCF_start),
    .OCF_done(OCF_done),
    .OCF_opcode_valid(data_valid),
    .WAIT_L(WAIT_L),

    .OCF_M1_L(OCF_M1_L),
    .OCF_MREQ_L(OCF_MREQ_L),
    .OCF_RD_L(OCF_RD_L),
    .OCF_addr_out(OCF_addr_out),
    .OCF_RFSH_L(OCF_RFSH_L)
  );

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
  // - prev_done: Has the previous macro_state finished running?
  // - opcode:    What instruction we should run, is defined in z80_defines.h
  //---------------------------------------------------------------------------
  input logic       prev_done,
  input logic [7:0] opcode,

  //---------------------------------------------------------------------------
  // - OCF_start: Kicks off the OCF_fsm which starts an opcode fetch
  //---------------------------------------------------------------------------
  output logic      OCF_start,
  output logic      OCF_bus,
  output logic      inc_PC
);

  enum logic [7:0] {
    FETCH_0,
    FETCH_1,
    FETCH_2,
    INC_0,
    INC_1,
    INC_2,
    NOP_0
  } state, next_state;

  always_ff @(posedge clk) begin
    if(~rst_L) begin
      state <= FETCH_0;
    end

    else begin
      state <= next_state;
    end
  end

  //next state logic
  always_comb begin
    case(state)

      //An OCF takes 4 cycles in total, but only 2 of those cycles are needed
      //to retreive the opcode (which comes in on T2/T3). The other two
      //cycles are spent refreshing the DRAM.
      FETCH_0: next_state = FETCH_1;
      FETCH_1: next_state = FETCH_2;

      //This cycle is spent decoding the instruction, and the 4th cycle
      //is spent potentially dispatching part of the instruction
      FETCH_2: begin
        //TODO: might need to acknowledge a WAIT cycle
        $display ("op: %h, inc: %b", opcode, `INC);
        casex(opcode)
          `INC: next_state = INC_0;
          default: next_state = NOP_0;
        endcase
      end

      //The instruction processed did nothing, so loop back and restart
      //the instruction fetch
      NOP_0: next_state = FETCH_0;

      //TODO: include support for INC
      INC_0: next_state = FETCH_0;

    endcase
  end

  //output logic
  always_comb begin
    //set defaults
    OCF_start = 0;
    OCF_bus   = 0;
    inc_PC    = 0;

    case(state)
      FETCH_0: begin
        OCF_start = 1;
        OCF_bus   = 1;
      end

      FETCH_1: begin
        OCF_bus = 1;
      end

      FETCH_2: begin
        inc_PC  = 1;
        OCF_bus = 1;
      end

    endcase
  end


endmodule: decoder

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
  output  logic         OCF_opcode_valid,

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
    OCF_addr_out    = 0;
    OCF_MREQ_L      = 1;
    OCF_RD_L        = 1;
    OCF_M1_L        = 1;
    OCF_RFSH_L      = 1;
    OCF_done        = 0;
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
        OCF_opcode_valid = 1;
      end

      T4: begin
        OCF_done = 1;
      end

    endcase
  end

endmodule: OCF_fsm
