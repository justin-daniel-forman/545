// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Wed Oct 19 12:24:12 2016
// Host        : mittlefrueh.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
// Command     : write_verilog -force -mode synth_stub
//               /afs/ece.cmu.edu/usr/suyashb/Private/545/psg/audioSys_0/audioSys_0_stub.v
// Design      : audioSys_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "audioSys,Vivado 2015.2" *)
module audioSys_0(addr, clk, reset, MREQ_N, WR_N, data, SDA, SCL, MCLK, BCLK, LRCLK, SDATA)
/* synthesis syn_black_box black_box_pad_pin="addr[15:0],clk,reset,MREQ_N,WR_N,data[7:0],SDA,SCL,MCLK,BCLK,LRCLK,SDATA" */;
  input [15:0]addr;
  input clk;
  input reset;
  input MREQ_N;
  input WR_N;
  input [7:0]data;
  inout SDA;
  output SCL;
  output MCLK;
  output BCLK;
  output LRCLK;
  output SDATA;
endmodule
