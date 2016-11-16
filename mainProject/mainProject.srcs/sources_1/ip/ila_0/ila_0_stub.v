// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Mon Nov 14 20:35:45 2016
// Host        : mittlefrueh.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
// Command     : write_verilog -force -mode synth_stub
//               /afs/ece.cmu.edu/usr/suyashb/Private/545/mainProject/mainProject.srcs/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2015.2" *)
module ila_0(clk, probe0, probe1, probe2, probe3, probe4, probe5, probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15, probe16, probe17, probe18, probe19)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[15:0],probe1[7:0],probe2[7:0],probe3[0:0],probe4[0:0],probe5[0:0],probe6[0:0],probe7[0:0],probe8[0:0],probe9[31:0],probe10[2:0],probe11[2:0],probe12[111:0],probe13[63:0],probe14[4:0],probe15[7:0],probe16[13:0],probe17[7:0],probe18[4:0],probe19[7:0]" */;
  input clk;
  input [15:0]probe0;
  input [7:0]probe1;
  input [7:0]probe2;
  input [0:0]probe3;
  input [0:0]probe4;
  input [0:0]probe5;
  input [0:0]probe6;
  input [0:0]probe7;
  input [0:0]probe8;
  input [31:0]probe9;
  input [2:0]probe10;
  input [2:0]probe11;
  input [111:0]probe12;
  input [63:0]probe13;
  input [4:0]probe14;
  input [7:0]probe15;
  input [13:0]probe16;
  input [7:0]probe17;
  input [4:0]probe18;
  input [7:0]probe19;
endmodule
