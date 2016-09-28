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
  input  logic         ld_a,
  input  logic [3:0]   alu_op,
  input  logic         switch_context,

  output logic [7:0]   data_out,
  output logic [15:0]  addr_out
);


  logic [7:0] A_in;
  logic [7:0] A_out;
  logic [7:0] A_not_in;
  logic [7:0] A_not_out;
  logic       A_en;
  logic       A_not_en;

  logic [7:0] alu_out;


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

  alu(
    .A(A_out),
    .B(data_in),
    .op(alu_op),
    .C(alu_out)
  );

  always_comb begin

    //defaults
    data_out = alu_out;
    addr_out = alu_out;
    A_en     = 0;
    A_not_en = 0;
    A_in     = A_out;
    A_not_in = A_not_out;


    if(switch_context) begin
      A_in      = A_not_out;
      A_not_in  = A_out;
      A_en      = 1;
      A_not_en  = 1;
    end

    if(ld_a) begin
      A_en = 1;
      A_in = alu_out;
    end

  end


endmodule: datapath

//-----------------------------------------------------------------------------
//alu
//  This module performs any arithmetic operation in the processor using the
//  data bus and the A register. These operations need only use one of the
//  two inputs to produce an output.
//-----------------------------------------------------------------------------
module alu (

  //---------------------------------------------------------------------------
  // - A: Register A input (can be A or A_not) depending on context
  // - B: Bus input
  // - op: defines the alu opcode
  // - C: Simply the output
  //---------------------------------------------------------------------------
  input   logic [7:0] A,
  input   logic [7:0] B, //B stands for Bus
  input   logic [3:0] op,
  output  logic [7:0] C
);

  always_comb begin
    case(op)

      `INCR_A: begin
        C = A + 1;
      end

      default: begin
        C = 0;
      end
    endcase
  end

endmodule: alu
