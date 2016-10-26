`include "../z80_defines.vh"

//-----------------------------------------------------------------------------
//datapath
//  This module contains the main datapath for the system. It operates on
//  a shared internal databus that can drive the external data bus. Only
//  one component from the datapath can drive the databus at a given time.
//-----------------------------------------------------------------------------
module datapath (
  input  logic         clk,
  input  logic         rst_L,

  input  logic [7:0]   data_in,

  //Regfile loads
  input  logic         ld_B,
  input  logic         ld_C,
  input  logic         ld_D,
  input  logic         ld_E,
  input  logic         ld_H,
  input  logic         ld_L,
  input  logic         ld_IXH,
  input  logic         ld_IXL,
  input  logic         ld_IYH,
  input  logic         ld_IYL,
  input  logic         ld_SPH,
  input  logic         ld_SPL,
  input  logic         ld_PCH,
  input  logic         ld_PCL,
  input  logic         ld_STRH,
  input  logic         ld_STRL,

  //Regfile Drives
  //Specifying two of these will cause a 16 bit drive onto the
  //addr bus and specifying one will cause an 8 bit drive onto
  //the data bus
  input  logic         drive_reg_data,
  input  logic         drive_reg_addr,
  input  logic         drive_B,
  input  logic         drive_C,
  input  logic         drive_D,
  input  logic         drive_E,
  input  logic         drive_H,
  input  logic         drive_L,
  input  logic         drive_IXH,
  input  logic         drive_IXL,
  input  logic         drive_IYH,
  input  logic         drive_IYL,
  input  logic         drive_SPH,
  input  logic         drive_SPL,
  input  logic         drive_PCH,
  input  logic         drive_PCL,
  input  logic         drive_STRH,
  input  logic         drive_STRL,

  //Accumulator and Flag loads
  //We can load the flags from either the 16-bit ALU or the
  //8-bit ALU
  input  logic         ld_A,
  input  logic         ld_F_data,
  input  logic         ld_F_addr,
  input  logic [1:0]   set_S,
  input  logic [1:0]   set_Z,
  input  logic [1:0]   set_H,
  input  logic [1:0]   set_PV,
  input  logic [1:0]   set_N,
  input  logic [1:0]   set_C,

  //Accumulator and Flag drives
  input  logic         drive_A,
  input  logic         drive_F,

  //ALU drives and controls
  input  logic [5:0]   alu_op,
  input  logic         drive_alu_data, //8bit drive
  input  logic         drive_alu_addr, //16bit drive

  //Miscellaneous register controls
  input  logic         switch_context,
  input  logic         swap_reg,

  //temporary data_bus registers
  input  logic         ld_MDR1,
  input  logic         ld_MDR2,
  input  logic         ld_TEMP,
  input  logic         drive_MDR1,
  input  logic         drive_MDR2,
  input  logic         drive_TEMP,

  //temporary addr_bus registers
  input  logic         ld_MARH, //load upper byte of MAR
  input  logic         ld_MARL, //load lower byte of MAR
  input  logic         ld_MARH_data,
  input  logic         ld_MARL_data,
  input  logic         drive_MAR,

  //External bus outputs
  output logic [7:0]   data_out,
  output logic [15:0]  addr_out,

  //Flag outputs, the control module needs this information
  output logic [7:0]   flags
);

  //---------------------------------------------------------------------------
  //Internal Buslines
  //---------------------------------------------------------------------------
  wire [7:0]  internal_data;
  wire [15:0] internal_addr;

  //---------------------------------------------------------------------------
  //Flatly instantiate all of the non regfile registers and their context
  //  swappable counterparts. Sometimes simplicity and verbosity actually work.
  //  Plus this way, we can easily drive the internal busses.
  //---------------------------------------------------------------------------

  logic [7:0] A_in;
  logic [7:0] A_out;
  logic [7:0] A_not_in;
  logic [7:0] A_not_out;
  logic       A_en;
  logic       A_not_en;

  logic [7:0] F_in;
  logic [7:0] F_out;
  logic [7:0] F_not_out;
  logic [7:0] F_not_in;
  logic       F_en;
  logic       F_not_en;

  register #(8) A(
    .clk(clk),
    .rst_L(rst_L),
    .D(A_in),
    .en(A_en),
    .Q(A_out)
  );

  register #(8) A_not(
    .clk(clk),
    .rst_L(rst_L),
    .D(A_not_in),
    .en(A_not_en),
    .Q(A_not_out)
  );

  register #(8) F(
    .clk(clk),
    .rst_L(rst_L),
    .D(F_in),
    .en(F_en),
    .Q(F_out)
  );

  //Make flags visible to control unit
  assign flags = F_out;

  register #(8) F_not(
    .clk(clk),
    .rst_L(rst_L),
    .D(F_not_in),
    .en(F_not_en),
    .Q(F_not_out)
  );

  //8-bit temporary register instantiation
  logic [7:0]  MDR1_in;
  logic [7:0]  MDR1_out;
  logic        MDR1_en;

  logic [7:0]  MDR2_in;
  logic [7:0]  MDR2_out;
  logic        MDR2_en;

  logic [7:0]  TEMP_in;
  logic [7:0]  TEMP_out;
  logic        TEMP_en;

  register #(8) MDR1(
    .clk(clk),
    .rst_L(rst_L),
    .D(MDR1_in),
    .en(MDR1_en),
    .Q(MDR1_out)
  );

  register #(8) MDR2(
    .clk(clk),
    .rst_L(rst_L),
    .D(MDR2_in),
    .en(MDR2_en),
    .Q(MDR2_out)
  );

  register #(8) TEMP(
    .clk(clk),
    .rst_L(rst_L),
    .D(TEMP_in),
    .en(TEMP_en),
    .Q(TEMP_out)
  );

  //16-bit temporary register instatiation
  logic [15:0] MAR_in;
  logic [15:0] MAR_out;
  logic        MAR_en;

  register #(16) MAR(
    .clk(clk),
    .rst_L(rst_L),
    .D(MAR_in),
    .en(MAR_en),
    .Q(MAR_out)
  );

  //---------------------------------------------------------------------------
  //Register File instantiation
  //  You can either put out a value on the 16-bit bus or the 8-bit bus,
  //  but not both simultaneously from this module. Similarly, you can
  //  only load from the 8-bit bus or the 16-bit bus at any one time.
  //---------------------------------------------------------------------------
  logic [7:0]   reg_data_out;
  logic [15:0]  reg_addr_out;
  logic [7:0]   reg_data_in;

  regfile RFILE(
    .clk(clk),
    .rst_L(rst_L),

    .drive_B(drive_B),
    .drive_C(drive_C),
    .drive_D(drive_D),
    .drive_E(drive_E),
    .drive_H(drive_H),
    .drive_L(drive_L),
    .drive_IXH(drive_IXH),
    .drive_IXL(drive_IXL),
    .drive_IYH(drive_IYH),
    .drive_IYL(drive_IYL),
    .drive_SPH(drive_SPH),
    .drive_SPL(drive_SPL),
    .drive_PCH(drive_PCH),
    .drive_PCL(drive_PCL),
    .drive_STRH,
    .drive_STRL,

    .ld_B(ld_B),
    .ld_C(ld_C),
    .ld_D(ld_D),
    .ld_E(ld_E),
    .ld_H(ld_H),
    .ld_L(ld_L),
    .ld_IXH(ld_IXH),
    .ld_IXL(ld_IXL),
    .ld_IYH(ld_IYH),
    .ld_IYL(ld_IYL),
    .ld_SPH(ld_SPH),
    .ld_SPL(ld_SPL),
    .ld_PCH(ld_PCH),
    .ld_PCL(ld_PCL),
    .ld_STRH,
    .ld_STRL,

    .drive_single(drive_reg_data),
    .drive_double(drive_reg_addr),
    .switch_context(switch_context),
    .swap_reg(swap_reg),

    .D_BUS(reg_data_in),
    .A_BUS(internal_addr),

    .out_single(reg_data_out),
    .out_double(reg_addr_out)

  );

  //---------------------------------------------------------------------------
  //ALU
  // There are two ALUs in the system in order to simplify the datapath. There
  // is a 16-bit ALU and an 8-bit ALU. In the original design, there was a
  // single 8-bit alu that performed 16-bit arithmetic as a composition of
  // two 8-bit operations. We are going to simplify that a little bit in
  // our implemmentation by having a dedicated 16-bit ALU. This means that we
  // need to coalesce the flags into the F-register appropriately between the
  // two ALUs which might end up being more of a hassle than originally
  // anticipated.
  //--------------------------------------------------------------------------
  logic [7:0]   alu_out_data;
  logic [15:0]  alu_out_addr;
  logic [7:0]   alu_flag_data;
  logic [7:0]   alu_flag_addr;
  logic [7:0]   alu_b_in;

  //The hackiness continues with this line. Sometimes we will need to load
  //in B directly from the data bus, such as when we are driving from a register.
  //Othertimes, we want to latch the value that comes in from memory before
  //using it.
  //Make sure to drive TEMP when you want it to go into the ALU.
  assign alu_b_in = (drive_TEMP) ? TEMP_out : internal_data;

  //The output of this alu must directly be connected to the A register. Otherwise
  //otherwise, the results from this would fight with the argument being driven
  //on the data bus. There is no need to move this computation outside of the A
  //register, so this is fine.
  alu #(8) eightBit(
    .A(A_out),
    .B(alu_b_in),
    .op(alu_op),
    .C(alu_out_data),
    .F_in(F_out),
    .F_out(alu_flag_data)
  );

  alu #(16) sixteenBit(
    .A(reg_addr_out),
    .B({8'b0, TEMP_out}),
    .op(alu_op),
    .C(alu_out_addr),
    .F_in(F_out),
    .F_out(alu_flag_addr)
  );

  //---------------------------------------------------------------------------
  //Interpret control signals to determine enable lines and inputs
  //---------------------------------------------------------------------------
  always_comb begin
    //NOTE: I'm including a point to point connection between the A register
    //      and the other registers so that a swap operation can occur
    //      in a single clock cycle.
    if(switch_context & (ld_F_addr | ld_F_data) & ld_A) begin
      A_in = A_not_out;
      A_not_in = A_out;
      A_en = 1;
      A_not_en = 1;

      F_in = F_not_out;
      F_not_in = F_out;
      F_en = 1;
      F_not_en = 1;
    end

    else begin
      //These point to point connections are necessary since the A register
      //is only hooked to the data bus. Because of this, we can only read or
      //write to/from A in a cycle when nobody else wants the bus, which
      //is not the case when we want to perform arithmetic operations.
      //To this end, the output of the 8-bit alu is only connected to the A
      //register.
      if(swap_reg & ld_A) begin
        A_in = reg_data_out;
      end else if(drive_alu_data & ld_A) begin
        A_in = alu_out_data;
      end else begin
        A_in = internal_data;
      end

      A_en = ld_A;

      A_not_in = 0;
      A_not_en = 0;

      F_in = (ld_F_data) ? (alu_flag_data) : ((ld_F_addr) ? (alu_flag_addr) : F_out);
      F_en = ld_F_data | ld_F_addr;

      F_not_in = 0;
      F_not_en = 0;

      //set or unset flags based on global sets/resets on top of alu sets
      if     (set_S == 2'b11) begin F_in =  F_in  | 8'b1000_0000; F_en = 1; end
      else if(set_S == 2'b10) begin F_in =  F_in  & 8'b0111_1111; F_en = 1; end
      if     (set_Z == 2'b11) begin F_in[6] = 1; F_en = 1; end
      else if(set_Z == 2'b10) begin F_in[6] = 0; F_en = 1; end
      if     (set_H == 2'b11) begin F_in[4] = 1; F_en = 1; end
      else if(set_H == 2'b10) begin F_in[4] = 0; F_en = 1; end
      if     (set_PV == 2'b11)begin F_in[2] = 1; F_en = 1; end
      else if(set_PV == 2'b10)begin F_in[2] = 0; F_en = 1; end
      if     (set_N == 2'b11) begin F_in[1] = 1; F_en = 1; end
      else if(set_N == 2'b10) begin F_in[1] = 0; F_en = 1; end
      if     (set_C == 2'b11) begin F_in[0] = 1; F_en = 1; end
      else if(set_C == 2'b10) begin F_in[0] = 0; F_en = 1; end

    end

    //We are including a point to point connection between the 8-bit alu and
    //the register file because we sometimes need to increment 8-bit registers
    //in a single clock cycle. This means the reg data has to be output onto
    //the data bus. Therefore the 8-bit alu cannot put anything onto the dbus,
    //but must still communicate the incremented result to the register file.
    reg_data_in = (drive_alu_data) ? alu_out_data : internal_data;

    MDR1_in = internal_data;
    MDR2_in = internal_data;
    TEMP_in = internal_data;

    MDR1_en = ld_MDR1;
    MDR2_en = ld_MDR2;
    TEMP_en = ld_TEMP;

    //Sometimes we need to load the MAR from the databus, and other times
    //we need to load it from the addr bus. This is a desparate change
    //that is needed for some of the 16-bit loads.
    MAR_en = ld_MARH | ld_MARL | ld_MARH_data | ld_MARL_data;
    if     (ld_MARL_data & ~ld_MARH_data) MAR_in = {MAR_out[15:8], internal_data};
    else if(ld_MARH_data & ~ld_MARL_data) MAR_in = {internal_data, MAR_out[7:0]};
    else if(ld_MARH & ld_MARL)            MAR_in = internal_addr;
    else if(ld_MARH & ~ld_MARL)           MAR_in = {internal_addr[15:8], MAR_out[7:0]};
    else if(~ld_MARH & ld_MARL)           MAR_in = {MAR_out[15:8], internal_addr[7:0]};
    else MAR_in = internal_addr;
  end

  //---------------------------------------------------------------------------
  //Interpret control signals to determine who controls the busses
  //---------------------------------------------------------------------------
  logic         is_driven_data;
  logic         is_driven_addr;

  logic [7:0]   drive_value_data;
  logic [15:0]  drive_value_addr;

  assign is_driven_data = (drive_reg_data | drive_A | drive_F | drive_TEMP
                          | drive_MDR1 | drive_MDR2 );
  assign is_driven_addr = drive_MAR | drive_alu_addr;

  //Data Bus Arbitration
  always_comb begin
    if(drive_A)             drive_value_data = A_out;
    else if(drive_B & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_C & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_D & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_E & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_F & ~drive_reg_addr) drive_value_data = F_out;
    else if(drive_H & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_L & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_IXH & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_IXL & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_IYH & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_IYL & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_SPH & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_SPL & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_PCH & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_PCL & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_STRH & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_STRL & ~drive_reg_addr) drive_value_data = reg_data_out;
    else if(drive_TEMP)     drive_value_data = TEMP_out;
    else if(drive_MDR1)     drive_value_data = MDR1_out;
    else if(drive_MDR2)     drive_value_data = MDR2_out;
    else                    drive_value_data = 8'bz;
  end

  //Addr bus arbitration
  always_comb begin
    if(drive_MAR)                   drive_value_addr = MAR_out;
    else if (drive_alu_addr)        drive_value_addr = alu_out_addr;
    else                            drive_value_addr = 15'bz;
  end

  assign internal_data = (is_driven_data) ? drive_value_data : data_in;
  assign internal_addr = (is_driven_addr) ? drive_value_addr : 15'bz;

  //---------------------------------------------------------------------------
  //External Buslines
  //---------------------------------------------------------------------------
  assign data_out = (is_driven_data) ? internal_data : 8'bz;
  assign addr_out = (is_driven_addr) ? internal_addr : 15'bz;

endmodule: datapath

//-----------------------------------------------------------------------------
//alu
//  This module performs any arithmetic operation in the processor using the
//  data bus and the A register. These operations need only use one of the
//  two inputs to produce an output.
//-----------------------------------------------------------------------------
module alu #(parameter w = 8)(

  //---------------------------------------------------------------------------
  // - A: Register A input (can be A or A_not) depending on context
  // - B: Bus input
  // - op: defines the alu opcode
  // - C: Simply the output
  // - F_in: Contents of flag register before operation
  // - F_out: Contents of flag register after operation
  //---------------------------------------------------------------------------
  input   logic [w-1:0] A,
  input   logic [w-1:0] B, //B stands for Bus
  input   logic [5:0] op,
  input   logic [7:0] F_in,
  output  logic [w-1:0] C,
  output  logic [7:0] F_out
);

  logic [(w-1):(w/2)] lower_sum;
  logic [(w-1):(w/2)] upper_sum;
  logic               lower_carry_out;
  logic               upper_carry_out;
  logic [(w-1):0]     T;

  always_comb begin

    F_out = F_in;

    case(op)

      `INCR_A_8, `INCR_B_8: begin

        //choose which argument gets incremented
        if(op == `INCR_A_8) T = A;
        else                T = B;

        //perform the increment in a ripple carry fashion
        {lower_carry_out, lower_sum} = T[((w-1)/2):0] + 1;
        {upper_carry_out, upper_sum} = T[(w-1):(w/2)] + lower_carry_out;
        C = {upper_sum, lower_sum};

        //H flag is set when carry from bit 3
        F_out[`H_flag] = (lower_carry_out) ? 1 : 0;

        //S flag is set when result is negative, otherwise reset
        F_out[`S_flag] = C[(w-1)] ? 1 : 0;

        //Z flag is set when result is 0, otherwise reset
        F_out[`Z_flag] = (C == 0) ? 1 : 0;

        //PV flag is set when there is overflow, which occurs when
        //output changes the MSB of the accumulator
        F_out[`PV_flag] = (C[w-1] & ~T[w-1]) ? 1 : 0;

        //N is reset
        F_out[`N_flag] = 0;
      end

      //TODO:
      `INCR_A_16: begin
        C = A + 1;
      end

      //TODO: Distinguish this operation from the BC decrement operation
      `DECR_A: begin
        C = A - 1;
      end

      `DECR_BC: begin
        C = A - 1;

        //set the PV flag when ARG_A - 1 != 0, otherwise reset
        F_out[`PV_flag] = (C == 0) ? 0 : 1;

      end

      //Make the general add width agnostic
      `ADD, `ADC: begin

        //H flag is set when there is a carry from bit 3 into bit 4
        //C flag is set when there is a carry from bit 7 into bit 8
        //So we divide the addition into two stages in ripple carry fashion
        //For an ADC operation, add in the Carry-in
        if(op == `ADD) begin
          {lower_carry_out, lower_sum} = A[((w-1)/2):0] + B[((w-1)/2):0];
        end else begin
          {lower_carry_out, lower_sum} = A[((w-1)/2):0] + B[((w-1)/2):0] + F_in[`C_flag];
        end
        {upper_carry_out, upper_sum} = A[(w-1):(w/2)] + B[(w-1):(w/2)] + lower_carry_out;

        C = {upper_sum, lower_sum};

        F_out[`H_flag] = (lower_carry_out) ? 1 : 0;
        F_out[`C_flag] = (upper_carry_out) ? 1 : 0;

        //S flag is set when result is negative, otherwise reset
        F_out[`S_flag] = C[(w-1)] ? 1 : 0;

        //Z flag is set when result is 0, otherwise reset
        F_out[`Z_flag] = (C == 0) ? 1 : 0;

        //PV flag is set when there is overflow, which occurs when
        //output changes the MSB of the accumulator
        F_out[`PV_flag] = (C[7] & ~A[7]) ? 1 : 0;

      end

      `SUB, `SBC, `SUB_EX: begin

        if(op != `SBC) begin
          {upper_carry_out, C} = A[7:0] + {~B[7], ~B[6], ~B[5], ~B[4], ~B[3], ~B[2], ~B[1], ~B[0]} + 4'h1;
          {lower_carry_out, lower_sum} = A[3:0] + {~B[3], ~B[2], ~B[1], ~B[0]} + 4'h1;
        end else begin
          {upper_carry_out, C} = A[7:0] + {~B[7], ~B[6], ~B[5], ~B[4], ~B[3], ~B[2], ~B[1], ~B[0]} + 4'h1 - F_in[`C_flag];
          {lower_carry_out, lower_sum} = A[3:0] + {~B[3], ~B[2], ~B[1], ~B[0]} + 4'h1 - F_in[`C_flag];
        end

        F_out[`H_flag] = ~lower_carry_out;

        //We dont affect the carry flag for Exchange group instructions,
        //so leave the carry flag alone
        if(op != `SUB_EX) begin
          F_out[`C_flag] = (~upper_carry_out);
        end

        //S flag is set when result is negative, otherwise reset
        F_out[`S_flag] = C[(w-1)] ? 1 : 0;

        //Z flag is set when result is 0, otherwise reset
        F_out[`Z_flag] = (C == 0) ? 1 : 0;

        //PV flag is set when there is overflow, which occurs when
        //output changes the MSB of the accumulator
        F_out[`PV_flag] = (C[7] & ~A[7]) ? 1 : 0;

      end

      `AND: begin
        C = A & B;

        //set s flag when negative
        F_out[`S_flag] = C[w-1];

        //set z flag when zero
        F_out[`Z_flag] = (C == 0);

        //set PV flag when overflow
        F_out[`PV_flag] = (C[7] & ~A[7]) ? 1 : 0;

      end

      `OR, `XOR: begin
        if(op == `OR) begin
          C = A | B;
        end else begin
          C = A ^ B;
        end

        //set s flag when negative
        F_out[`S_flag] = C[w-1];

        //set z flag when zero
        F_out[`Z_flag] = (C == 0);

        //set PV flag when overflow for OR
        if(op == `OR) begin
          F_out[`PV_flag] = (C[7] & ~A[7]) ? 1 : 0;

        //set PV flag for parity for xor
        end else begin
          F_out[`PV_flag] = C[7] ^ C[6] ^ C[5] ^ C[4] ^ C[3] ^ C[2] ^ C[1] ^ C[0];
        end
      end

      `ALU_B: begin
        C = B;
      end

      `ADD_SE_B: begin
        if(w == 16) begin
          //16 bit A plus sign extended 8 bit B
          C = A + { {8{B[7]}}, B[7:0] };
        end

        else begin
          C = A + B;
        end
      end

      `ALU_CCF: begin
        C = A;
        //invert the carry bit
        F_out[`C_flag] = ~F_in[`C_flag];

        //the half carry is the previous carry
        F_out[`H_flag] = F_in[`C_flag];
      end

      `ALU_CPL: begin
        //take the ones complement of A
        C = ~A;
      end

      `ALU_NOP: begin
        C = A;

        //flags are loaded from the data bus
        F_out = B;
      end

      `ALU_RST: begin
        unique case(B[5:3])
          3'b000: C = 16'h0000;
          3'b001: C = 16'h0008;
          3'b010: C = 16'h0010;
          3'b011: C = 16'h0018;
          3'b100: C = 16'h0020;
          3'b101: C = 16'h0028;
          3'b110: C = 16'h0030;
          3'b111: C = 16'h0038;
        endcase
      end

      `BIT_TEST_0: begin
        F_out[`H_flag] = 1;
        F_out[`N_flag] = 0;
        F_out[`Z_flag] = !B[0];
        C = A;
      end

      `BIT_TEST_1: begin
        F_out[`H_flag] = 1;
        F_out[`N_flag] = 0;
        F_out[`Z_flag] = !B[1];
        C = A;
      end

      `BIT_TEST_2: begin
        F_out[`H_flag] = 1;
        F_out[`N_flag] = 0;
        F_out[`Z_flag] = !B[2];
        C = A;
      end

      `BIT_TEST_3: begin
        F_out[`H_flag] = 1;
        F_out[`N_flag] = 0;
        F_out[`Z_flag] = !B[3];
        C = A;
      end

      `BIT_TEST_4: begin
        F_out[`H_flag] = 1;
        F_out[`N_flag] = 0;
        F_out[`Z_flag] = !B[4];
        C = A;
      end

      `BIT_TEST_5: begin
        F_out[`H_flag] = 1;
        F_out[`N_flag] = 0;
        F_out[`Z_flag] = !B[5];
        C = A;
      end

      `BIT_TEST_6: begin
        F_out[`H_flag] = 1;
        F_out[`N_flag] = 0;
        F_out[`Z_flag] = !B[6];
        C = A;
      end

     `BIT_TEST_7: begin
        F_out[`H_flag] = 1;
        F_out[`N_flag] = 0;
        F_out[`Z_flag] = !B[7];
        C = A;
      end

      `BIT_SET_0: begin
        C = B | 8'h1;
      end

      `BIT_SET_1: begin
        C = B | 8'h2;
      end

      `BIT_SET_2: begin
        C = B | 8'h4;
      end

      `BIT_SET_3: begin
        C = B | 8'h8;
      end

      `BIT_SET_4: begin
        C = B | 8'h10;
      end

      `BIT_SET_5: begin
        C = B | 8'h20;
      end

      `BIT_SET_6: begin
        C = B | 8'h40;
      end

      `BIT_SET_7: begin
        C = B | 8'h80;
      end

      `BIT_RES_0: begin
        C = B & 8'hfe;
      end

      `BIT_RES_1: begin
        C = B & 8'hfd;
      end

      `BIT_RES_2: begin
        C = B & 8'hfb;
      end

      `BIT_RES_3: begin
        C = B & 8'hf7;
      end

      `BIT_RES_4: begin
        C = B & 8'hef;
      end

      `BIT_RES_5: begin
        C = B & 8'hdf;
      end

      `BIT_RES_6: begin
        C = B & 8'hbf;
      end

      `BIT_RES_7: begin
        C = B & 8'h7f;
      end

      default: begin
        C = A;
      end
    endcase
  end

endmodule: alu

//-----------------------------------------------------------------------------
//regfile
//  Based on the inputs, the register file can output a 16-bit composition
//  of two registers or a single 8-bit register output. It also provides
//  support for swapping any arbitrary 16-bit register with another 16-bit
//  register. It also supports context switching specific registers.
//-----------------------------------------------------------------------------
module regfile(
  input   logic clk,
  input   logic rst_L,

  input   logic drive_B,
  input   logic drive_C,
  input   logic drive_D,
  input   logic drive_E,
  input   logic drive_H,
  input   logic drive_L,
  input   logic drive_SPL,
  input   logic drive_SPH,
  input   logic drive_IXL,
  input   logic drive_IXH,
  input   logic drive_IYL,
  input   logic drive_IYH,
  input   logic drive_PCH,
  input   logic drive_PCL,
  input   logic drive_STRH,
  input   logic drive_STRL,

  input   logic ld_B,
  input   logic ld_C,
  input   logic ld_D,
  input   logic ld_E,
  input   logic ld_H,
  input   logic ld_L,
  input   logic ld_SPL,
  input   logic ld_SPH,
  input   logic ld_IXL,
  input   logic ld_IXH,
  input   logic ld_IYL,
  input   logic ld_IYH,
  input   logic ld_PCH,
  input   logic ld_PCL,
  input   logic ld_STRH,
  input   logic ld_STRL,

  input   logic drive_single,
  input   logic drive_double,

  input   logic switch_context,
  input   logic swap_reg,

  input   logic [7:0]   D_BUS,
  input   logic [15:0]  A_BUS,

  output  logic [7:0]   out_single,
  output  logic [15:0]  out_double

);

  //---------------------------------------------------------------------------
  //Register definitions
  //  Didn't use a generate block on this one just so that the naming of the
  //  registers is explicitly clear. In any case, you don't need to worry
  //  about that since I did it all for you anyway.
  //
  //  In this register file, the 16 bit registers are just compositions of the
  //  same kind of 8-bit registers we know and love. This way we can index
  //  by byte on the data bus without any additional logic and also index
  //  by word on the addr bus by composition.
  //---------------------------------------------------------------------------

  logic [7:0] B_in;
  logic [7:0] B_out;
  logic [7:0] B_not_in;
  logic [7:0] B_not_out;
  logic       B_en;
  logic       B_not_en;

  logic [7:0] C_in;
  logic [7:0] C_not_in;
  logic [7:0] C_out;
  logic [7:0] C_not_out;
  logic       C_en;
  logic       C_not_en;

  logic [7:0] D_in;
  logic [7:0] D_out;
  logic [7:0] D_not_in;
  logic [7:0] D_not_out;
  logic       D_en;
  logic       D_not_en;

  logic [7:0] E_in;
  logic [7:0] E_out;
  logic [7:0] E_not_in;
  logic [7:0] E_not_out;
  logic       E_en;
  logic       E_not_en;

  logic [7:0] H_in;
  logic [7:0] H_out;
  logic [7:0] H_not_in;
  logic [7:0] H_not_out;
  logic       H_en;
  logic       H_not_en;

  logic [7:0] L_in;
  logic [7:0] L_out;
  logic [7:0] L_not_in;
  logic [7:0] L_not_out;
  logic       L_en;
  logic       L_not_en;

  //---------------------------------------------------------------------------
  //The following registers are not context swappable
  //---------------------------------------------------------------------------
  logic [7:0] IXH_in;
  logic [7:0] IXH_out;
  logic       IXH_en;

  logic [7:0] IXL_in;
  logic [7:0] IXL_out;
  logic       IXL_en;

  logic [7:0] IYH_in;
  logic [7:0] IYH_out;
  logic       IYH_en;

  logic [7:0] IYL_in;
  logic [7:0] IYL_out;
  logic       IYL_en;

  logic [7:0] SPH_in;
  logic [7:0] SPH_out;
  logic       SPH_en;

  logic [7:0] SPL_in;
  logic [7:0] SPL_out;
  logic       SPL_en;

  logic [7:0] PCH_in;
  logic [7:0] PCH_out;
  logic       PCH_en;

  logic [7:0] PCL_in;
  logic [7:0] PCL_out;
  logic       PCL_en;

  logic [7:0] STRH_in;
  logic [7:0] STRH_out;
  logic       STRH_en;

  logic [7:0] STRL_in;
  logic [7:0] STRL_out;
  logic       STRL_en;

  //---------------------------------------------------------------------------
  //Register Output logic
  //---------------------------------------------------------------------------
  always_comb begin

    //In the case of a register swap with the A register, we need
    //to put out a value from the regfile, but not drive it on the
    //bus. This value will be propagated via a point-to-point
    //connection with the A register
    if(drive_single | swap_reg) begin
      out_double = 15'bz; //addr bus shouldn't be active now

      if(drive_B)       out_single = B_out;
      else if(drive_C)  out_single = C_out;
      else if(drive_D)  out_single = D_out;
      else if(drive_E)  out_single = E_out;
      else if(drive_H)  out_single = H_out;
      else if(drive_L)  out_single = L_out;
      else if(drive_IXH)out_single = IXH_out;
      else if(drive_IXL)out_single = IXL_out;
      else if(drive_IYH)out_single = IYH_out;
      else if(drive_IYL)out_single = IYL_out;
      else if(drive_SPH)out_single = SPH_out;
      else if(drive_SPL)out_single = SPL_out;
      else if(drive_PCH)out_single = PCH_out;
      else if(drive_PCL)out_single = PCL_out;
      else if(drive_STRL)out_single = STRL_out;
      else if(drive_STRH)out_single = STRH_out;
      else              out_single = 8'bz; //shouldn't ever go on the bus
    end

    else if (drive_double) begin
      out_single = 8'bz;  //data bus shouldnt be active now

      if(drive_B & drive_C)           out_double = {B_out, C_out};
      else if(drive_D & drive_E)      out_double = {D_out, E_out};
      else if(drive_H & drive_L)      out_double = {H_out, L_out};
      else if(drive_IXH & drive_IXL)  out_double = {IXH_out, IXL_out};
      else if(drive_IYH & drive_IYL)  out_double = {IYH_out, IYL_out};
      else if(drive_SPH & drive_SPL)  out_double = {SPH_out, SPL_out};
      else if(drive_PCH & drive_PCL)  out_double = {PCH_out, PCL_out};
      else if(drive_STRH & drive_STRL)out_double = {STRH_out, STRL_out};
      else                            out_double = 8'bz;
    end

    else begin
      out_single = 8'bz;
      out_double = 15'bz;
    end

  end

  //---------------------------------------------------------------------------
  //Register Input logic
  //
  //swap mode: In some cases, we need to exchange some of the 16-bit registers
  //  in a single cycle. For this reason, we need to have some point to
  //  point connections between those registers instead of setting the data
  //  into a temporary register over the datapath data bus.
  //
  //context swap mode: In some cases, we need to swap out the context
  //  swappable registers with their "not" counterparts in a single cycle.
  //  The rest of the processor has no notion of these registers, so
  //  we just switch their contents to "context swap".
  //
  //---------------------------------------------------------------------------
  always_comb begin

    //set default register inputs
    B_in = 0;
    C_in = 0;
    D_in = 0;
    E_in = 0;
    H_in = 0;
    L_in = 0;
    B_not_in = 0;
    C_not_in = 0;
    D_not_in = 0;
    E_not_in = 0;
    H_not_in = 0;
    L_not_in = 0;
    IXH_in = 0;
    IXL_in = 0;
    IYH_in = 0;
    IYL_in = 0;
    SPH_in = 0;
    SPL_in = 0;
    PCH_in = 0;
    PCL_in = 0;
    STRH_in = 0;
    STRL_in = 0;

    B_en = 0;
    C_en = 0;
    D_en = 0;
    E_en = 0;
    H_en = 0;
    L_en = 0;
    B_not_en = 0;
    C_not_en = 0;
    D_not_en = 0;
    E_not_en = 0;
    H_not_en = 0;
    L_not_en = 0;
    IXH_en = 0;
    IXL_en = 0;
    IYH_en = 0;
    IYL_en = 0;
    SPH_en = 0;
    SPL_en = 0;
    PCH_en = 0;
    PCL_en = 0;
    STRH_en = 0;
    STRL_en = 0;

    //context swap the specified register
    if(switch_context) begin
      if(ld_B) begin
        B_en      = 1;
        B_not_en  = 1;
        B_in      = B_not_out;
        B_not_in  = B_out;
      end

      if(ld_C) begin
        C_en      = 1;
        C_not_en  = 1;
        C_in      = C_not_out;
        C_not_in  = C_out;
      end

      if(ld_D) begin
        D_en      = 1;
        D_not_en  = 1;
        D_in      = D_not_out;
        D_not_in  = D_out;
      end

      if(ld_E) begin
        E_en      = 1;
        E_not_en  = 1;
        E_in      = E_not_out;
        E_not_in  = E_out;
      end

      if(ld_H) begin
        H_en      = 1;
        H_not_en  = 1;
        H_in      = H_not_out;
        H_not_in  = H_out;
      end

      if(ld_L) begin
        L_en      = 1;
        L_not_en  = 1;
        L_in      = L_not_out;
        L_not_in  = L_out;
      end
    end

    //switch the specified 16 bit registers
    else if(swap_reg) begin

      //TODO:
      //We need to be able to switch out all of the 8-bit registers
      //with eachother in a single clock cycle. This includes
      //the 8-bit A register which exists outside of the register file.
      //The A register has a point to point connection with the
      //8-bit output of the register file. So in order to swap the
      //A register, we output a value from the regfile without
      //driving on the bus, and we load from the 8-bit bus into
      //the other register.

      B_en = ld_B;
      C_en = ld_C;
      D_en = ld_D;
      E_en = ld_E;
      H_en = ld_H;
      L_en = ld_L;
      IXH_en = ld_IXH;
      IXL_en = ld_IXL;
      IYH_en = ld_IYH;
      IYL_en = ld_IYL;
      SPH_en = ld_SPH;
      SPL_en = ld_SPL;
      PCH_en = ld_PCH;
      PCL_en = ld_PCL;

      case({ld_B, ld_C, ld_D, ld_E, ld_H, ld_L})

        //8-bit swaps
        //Any one hot combination implies a swap with the A register
        6'b000_001: B_in = D_BUS;
        6'b000_010: C_in = D_BUS;
        6'b000_100: D_in = D_BUS;
        6'b001_000: E_in = D_BUS;
        6'b010_000: H_in = D_BUS;
        6'b100_000: L_in = D_BUS;

        //16-bit swaps
        6'b001111: begin
          H_in = D_out;
          L_in = E_out;
          D_in = H_out;
          E_in = L_out;
        end

        //any two hot combo implies two reg swap
        default: begin
          if(ld_B & ld_C)      begin B_in = C_out; C_in = B_out; end
          else if(ld_B & ld_D) begin B_in = D_out; D_in = B_out; end
          else if(ld_B & ld_E) begin B_in = E_out; E_in = B_out; end
          else if(ld_B & ld_H) begin B_in = H_out; H_in = B_out; end
          else if(ld_B & ld_L) begin B_in = L_out; L_in = B_out; end

          else if(ld_C & ld_D) begin C_in = D_out; D_in = C_out; end
          else if(ld_C & ld_E) begin C_in = E_out; E_in = C_out; end
          else if(ld_C & ld_H) begin C_in = H_out; H_in = C_out; end
          else if(ld_C & ld_L) begin C_in = L_out; L_in = C_out; end

          else if(ld_D & ld_E) begin D_in = E_out; E_in = D_out; end
          else if(ld_D & ld_H) begin D_in = H_out; H_in = D_out; end
          else if(ld_D & ld_L) begin D_in = L_out; L_in = D_out; end

          else if(ld_E & ld_H) begin E_in = H_out; H_in = E_out; end
          else if(ld_E & ld_L) begin E_in = L_out; L_in = E_out; end

          else if(ld_H & ld_L) begin H_in = L_out; L_in = H_out; end
        end

      endcase


    end

    //load the specified register with the value from the appropriate bus
    //If both bytes of a 16-bit register are enabled, use the value from
    //the addr bus, otherwise use the value from the databus
    else begin
      B_en = ld_B;
      C_en = ld_C;
      D_en = ld_D;
      E_en = ld_E;
      H_en = ld_H;
      L_en = ld_L;
      IXH_en = ld_IXH;
      IXL_en = ld_IXL;
      IYH_en = ld_IYH;
      IYL_en = ld_IYL;
      SPH_en = ld_SPH;
      SPL_en = ld_SPL;
      PCH_en = ld_PCH;
      PCL_en = ld_PCL;
      STRH_en = ld_STRH;
      STRL_en = ld_STRL;

      //addr bus cases
      if( (ld_B & ld_C)
         |(ld_D & ld_E)
         |(ld_H & ld_L)
         |(ld_IXH & ld_IXL)
         |(ld_IYH & ld_IYL)
         |(ld_SPH & ld_SPL)
         |(ld_PCH & ld_PCL)
         |(ld_STRH & ld_STRL)
        ) begin

        //We can load in these registers with the databus in parallel
        //as the add bus load, or we can load them like an address
        B_in = (ld_B & ld_C) ? A_BUS[15:8] : D_BUS;
        C_in = (ld_B & ld_C) ? A_BUS[7:0]  : D_BUS;
        D_in = (ld_D & ld_E) ? A_BUS[15:8] : D_BUS;
        E_in = (ld_D & ld_E) ? A_BUS[7:0]  : D_BUS;
        H_in = (ld_H & ld_L) ? A_BUS[15:8] : D_BUS;
        L_in = (ld_H & ld_L) ? A_BUS[7:0]  : D_BUS;
        IXH_in = (ld_IXH & ld_IXL) ? A_BUS[15:8] : D_BUS;
        IXL_in = (ld_IXH & ld_IXL) ? A_BUS[7:0]  : D_BUS;
        IYH_in = (ld_IYH & ld_IYL) ? A_BUS[15:8] : D_BUS;
        IYL_in = (ld_IYH & ld_IYL) ? A_BUS[7:0]  : D_BUS;
        SPH_in = (ld_SPH & ld_SPL) ? A_BUS[15:8] : D_BUS;
        SPL_in = (ld_SPH & ld_SPL) ? A_BUS[7:0]  : D_BUS;
        PCH_in = (ld_PCH & ld_PCL) ? A_BUS[15:8] : D_BUS;
        PCL_in = (ld_PCH & ld_PCL) ? A_BUS[7:0]  : D_BUS;
        STRH_in = (ld_STRH & ld_STRL) ? A_BUS[15:8] : D_BUS;
        STRL_in = (ld_STRH & ld_STRL) ? A_BUS[7:0]  : D_BUS;
      end

      //data bus cases
      else begin
        B_in = D_BUS;
        C_in = D_BUS;
        D_in = D_BUS;
        E_in = D_BUS;
        H_in = D_BUS;
        L_in = D_BUS;
        IXH_in = D_BUS;
        IXL_in = D_BUS;
        IYH_in = D_BUS;
        IYL_in = D_BUS;
        SPH_in = D_BUS;
        SPL_in = D_BUS;
        PCH_in = D_BUS;
        PCL_in = D_BUS;
        STRH_in = D_BUS;
        STRL_in = D_BUS;
      end

    end

  end

  register #(8) B(
    .clk(clk),
    .rst_L(rst_L),
    .D(B_in),
    .en(B_en),
    .Q(B_out)
  );

  register #(8) B_not(
    .clk(clk),
    .rst_L(rst_L),
    .D(B_not_in),
    .en(B_not_en),
    .Q(B_not_out)
  );

  register #(8) C(
    .clk(clk),
    .rst_L(rst_L),
    .D(C_in),
    .en(C_en),
    .Q(C_out)
  );

  register #(8) C_not(
    .clk(clk),
    .rst_L(rst_L),
    .D(C_not_in),
    .en(C_not_en),
    .Q(C_not_out)
  );

  register #(8) D(
    .clk(clk),
    .rst_L(rst_L),
    .D(D_in),
    .en(D_en),
    .Q(D_out)
  );

  register #(8) D_not(
    .clk(clk),
    .rst_L(rst_L),
    .D(D_not_in),
    .en(D_not_en),
    .Q(D_not_out)
  );

  register #(8) E(
    .clk(clk),
    .rst_L(rst_L),
    .D(E_in),
    .en(E_en),
    .Q(E_out)
  );

  register #(8) E_not(
    .clk(clk),
    .rst_L(rst_L),
    .D(E_not_in),
    .en(E_not_en),
    .Q(E_not_out)
  );

 register #(8) H(
    .clk(clk),
    .rst_L(rst_L),
    .D(H_in),
    .en(H_en),
    .Q(H_out)
  );

 register #(8) H_not(
    .clk(clk),
    .rst_L(rst_L),
    .D(H_not_in),
    .en(H_not_en),
    .Q(H_not_out)
  );

 register #(8) L(
    .clk(clk),
    .rst_L(rst_L),
    .D(L_in),
    .en(L_en),
    .Q(L_out)
  );

 register #(8) L_not(
    .clk(clk),
    .rst_L(rst_L),
    .D(L_not_in),
    .en(L_not_en),
    .Q(L_not_out)
  );

 register #(8) IXH(
    .clk(clk),
    .rst_L(rst_L),
    .D(IXH_in),
    .en(IXH_en),
    .Q(IXH_out)
  );

 register #(8) IXL(
    .clk(clk),
    .rst_L(rst_L),
    .D(IXL_in),
    .en(IXL_en),
    .Q(IXL_out)
  );

 register #(8) IYL(
    .clk(clk),
    .rst_L(rst_L),
    .D(IYL_in),
    .en(IYL_en),
    .Q(IYL_out)
  );

 register #(8) IYH(
    .clk(clk),
    .rst_L(rst_L),
    .D(IYH_in),
    .en(IYH_en),
    .Q(IYH_out)
  );

  register #(8) SPH(
    .clk(clk),
    .rst_L(rst_L),
    .D(SPH_in),
    .en(SPH_en),
    .Q(SPH_out)
  );

  register #(8) SPL(
    .clk(clk),
    .rst_L(rst_L),
    .D(SPL_in),
    .en(SPL_en),
    .Q(SPL_out)
  );

  register #(8) PCH(
    .clk(clk),
    .rst_L(rst_L),
    .D(PCH_in),
    .en(PCH_en),
    .Q(PCH_out)
  );

  register #(8) PCL(
    .clk(clk),
    .rst_L(rst_L),
    .D(PCL_in),
    .en(PCL_en),
    .Q(PCL_out)
  );

  register #(8) STRH(
    .clk(clk),
    .rst_L(rst_L),
    .D(STRH_in),
    .en(STRH_en),
    .Q(STRH_out)
  );

  register #(8) STRL(
    .clk(clk),
    .rst_L(rst_L),
    .D(STRL_in),
    .en(STRL_en),
    .Q(STRL_out)
  );


endmodule: regfile
