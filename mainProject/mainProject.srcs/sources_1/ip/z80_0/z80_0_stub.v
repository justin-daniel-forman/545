// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Tue Nov 29 16:06:46 2016
// Host        : mittlefrueh.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
// Command     : write_verilog -force -mode synth_stub
//               /afs/ece.cmu.edu/usr/suyashb/Private/545/mainProject/mainProject.srcs/sources_1/ip/z80_0/z80_0_stub.v
// Design      : z80_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "z80,Vivado 2015.2" *)
module z80_0(clk, rst_L, data_in, data_out, addr_bus, M1_L, INT_L, NMI_L, WAIT_L, MREQ_L, IORQ_L, RD_L, WR_L, RFSH_L, BUSACK_L, BUSREQ_L, HALT_L, interrupt_mask, curr_state)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_L,data_in[7:0],data_out[7:0],addr_bus[15:0],M1_L,INT_L,NMI_L,WAIT_L,MREQ_L,IORQ_L,RD_L,WR_L,RFSH_L,BUSACK_L,BUSREQ_L,HALT_L,interrupt_mask,curr_state[31:0]" */;
  input clk;
  input rst_L;
  input [7:0]data_in;
  output [7:0]data_out;
  inout [15:0]addr_bus;
  output M1_L;
  input INT_L;
  input NMI_L;
  input WAIT_L;
  output MREQ_L;
  output IORQ_L;
  output RD_L;
  output WR_L;
  output RFSH_L;
  output BUSACK_L;
  input BUSREQ_L;
  output HALT_L;
  output interrupt_mask;
  output [31:0]curr_state;
endmodule
