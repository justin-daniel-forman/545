// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Mon Oct 31 16:30:59 2016
// Host        : mittlefrueh.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
// Command     : write_verilog -force -mode funcsim
//               /afs/ece.cmu.edu/usr/suyashb/Private/545/psg/audioSys_0/audioSys_0_funcsim.v
// Design      : audioSys_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "audioSys_0,audioSys,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "audioSys,Vivado 2015.2" *) 
(* NotValidForBitStream *)
module audioSys_0
   (addr,
    clk,
    reset,
    MREQ_N,
    WR_N,
    data,
    SDA,
    SCL,
    MCLK,
    BCLK,
    LRCLK,
    SDATA);
  input [15:0]addr;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) input reset;
  input MREQ_N;
  input WR_N;
  input [7:0]data;
  inout SDA;
  output SCL;
  output MCLK;
  output BCLK;
  output LRCLK;
  output SDATA;

  wire BCLK;
  wire LRCLK;
  wire MCLK;
  wire MREQ_N;
  wire SCL;
  wire SDA;
  wire SDATA;
  wire WR_N;
  wire [15:0]addr;
  (* IBUF_LOW_PWR *) wire clk;
  wire [7:0]data;
  wire reset;

  audioSys_0_audioSys inst
       (.CLK(BCLK),
        .LRCLK(LRCLK),
        .MCLK(MCLK),
        .MREQ_N(MREQ_N),
        .SCL(SCL),
        .SDA(SDA),
        .SDATA(SDATA),
        .WR_N(WR_N),
        .addr(addr[15:6]),
        .clk(clk),
        .data(data),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "BCLKGen" *) 
module audioSys_0_BCLKGen
   (BCLK,
    MCLK,
    reset,
    locked);
  output BCLK;
  input MCLK;
  input reset;
  input locked;

  wire BCLK;
  wire BCLK_i_1_n_0;
  wire MCLK;
  wire locked;
  wire reset;

  LUT2 #(
    .INIT(4'h6)) 
    BCLK_i_1
       (.I0(locked),
        .I1(BCLK),
        .O(BCLK_i_1_n_0));
  FDPE BCLK_reg
       (.C(MCLK),
        .CE(1'b1),
        .D(BCLK_i_1_n_0),
        .PRE(reset),
        .Q(BCLK));
endmodule

(* ORIG_REF_NAME = "I2C" *) 
module audioSys_0_I2C
   (sent_reg,
    SCL,
    E,
    SDA,
    clk,
    reset,
    sent_reg_0,
    Q,
    \cs_reg[1]_0 );
  output sent_reg;
  output SCL;
  output [0:0]E;
  inout SDA;
  input clk;
  input reset;
  input sent_reg_0;
  input [4:0]Q;
  input [1:0]\cs_reg[1]_0 ;

  wire [0:0]E;
  wire [4:0]Q;
  wire SCL;
  wire SCLCount_n_0;
  wire SCLCount_n_1;
  wire SCLCount_n_2;
  wire SCLCount_n_6;
  wire SCLCount_n_7;
  wire SCLCount_n_8;
  wire SCLCount_n_9;
  wire SDA;
  wire SDA_INST_0_i_10_n_0;
  wire SDA_INST_0_i_11_n_0;
  wire SDA_INST_0_i_12_n_0;
  wire SDA_INST_0_i_13_n_0;
  wire SDA_INST_0_i_14_n_0;
  wire SDA_INST_0_i_15_n_0;
  wire SDA_INST_0_i_16_n_0;
  wire SDA_INST_0_i_17_n_0;
  wire SDA_INST_0_i_18_n_0;
  wire SDA_INST_0_i_19_n_0;
  wire SDA_INST_0_i_20_n_0;
  wire SDA_INST_0_i_21_n_0;
  wire SDA_INST_0_i_22_n_0;
  wire SDA_INST_0_i_23_n_0;
  wire SDA_INST_0_i_24_n_0;
  wire SDA_INST_0_i_25_n_0;
  wire SDA_INST_0_i_26_n_0;
  wire SDA_INST_0_i_27_n_0;
  wire SDA_INST_0_i_28_n_0;
  wire SDA_INST_0_i_29_n_0;
  wire SDA_INST_0_i_2_n_0;
  wire SDA_INST_0_i_30_n_0;
  wire SDA_INST_0_i_31_n_0;
  wire SDA_INST_0_i_32_n_0;
  wire SDA_INST_0_i_33_n_0;
  wire SDA_INST_0_i_34_n_0;
  wire SDA_INST_0_i_35_n_0;
  wire SDA_INST_0_i_36_n_0;
  wire SDA_INST_0_i_5_n_0;
  wire SDA_INST_0_i_6_n_0;
  wire SDA_INST_0_i_7_n_0;
  wire SDA_INST_0_i_8_n_0;
  wire SDA_INST_0_i_9_n_0;
  wire \bitCount[0]_i_1__0_n_0 ;
  wire \bitCount[1]_i_1__0_n_0 ;
  wire \bitCount[2]_i_1__0_n_0 ;
  wire \bitCount[3]_i_2__0_n_0 ;
  wire \bitCount[3]_i_4_n_0 ;
  wire \bitCount_reg_n_0_[0] ;
  wire \bitCount_reg_n_0_[1] ;
  wire \bitCount_reg_n_0_[2] ;
  wire byteAck_i_5_n_0;
  wire byteAck_reg_n_0;
  wire \byteCount_reg_n_0_[0] ;
  wire \byteCount_reg_n_0_[1] ;
  wire byteDone;
  wire clk;
  wire [1:0]cs;
  wire [1:0]\cs_reg[1]_0 ;
  wire reset;
  wire sent_reg;
  wire sent_reg_0;

  audioSys_0_counterSCL SCLCount
       (.D({SCLCount_n_0,SCLCount_n_1}),
        .E(E),
        .Q(cs),
        .SCL(SCL),
        .SDA(SDA),
        .\bitCount_reg[0] (SCLCount_n_6),
        .\bitCount_reg[2] (SDA_INST_0_i_5_n_0),
        .\bitCount_reg[3] (byteDone),
        .byteAck_reg(SCLCount_n_7),
        .byteAck_reg_0(byteAck_reg_n_0),
        .\byteCount_reg[0] (SCLCount_n_9),
        .\byteCount_reg[0]_0 (\byteCount_reg_n_0_[0] ),
        .\byteCount_reg[1] (SCLCount_n_8),
        .\byteCount_reg[1]_0 (\byteCount_reg_n_0_[1] ),
        .clk(clk),
        .\count_reg[4]_0 (Q[4:1]),
        .\cs_reg[0] (SCLCount_n_2),
        .\cs_reg[0]_0 (SDA_INST_0_i_2_n_0),
        .\cs_reg[1] (\cs_reg[1]_0 ),
        .\cs_reg[1]_0 (byteAck_i_5_n_0),
        .reset(reset),
        .sent_reg(sent_reg),
        .sent_reg_0(sent_reg_0));
  LUT6 #(
    .INIT(64'h0000560000000000)) 
    SDA_INST_0_i_10
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(SDA_INST_0_i_23_n_0),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(SDA_INST_0_i_10_n_0));
  LUT6 #(
    .INIT(64'h0000000020310C36)) 
    SDA_INST_0_i_11
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[4]),
        .I4(Q[2]),
        .I5(SDA_INST_0_i_24_n_0),
        .O(SDA_INST_0_i_11_n_0));
  LUT6 #(
    .INIT(64'hCCAAC0FF00AAC0FF)) 
    SDA_INST_0_i_12
       (.I0(SCLCount_n_2),
        .I1(SDA_INST_0_i_23_n_0),
        .I2(SDA_INST_0_i_25_n_0),
        .I3(\byteCount_reg_n_0_[1] ),
        .I4(\byteCount_reg_n_0_[0] ),
        .I5(SDA_INST_0_i_26_n_0),
        .O(SDA_INST_0_i_12_n_0));
  LUT6 #(
    .INIT(64'hFCFCFCFC4C7CFCFC)) 
    SDA_INST_0_i_13
       (.I0(SDA_INST_0_i_27_n_0),
        .I1(\byteCount_reg_n_0_[0] ),
        .I2(\byteCount_reg_n_0_[1] ),
        .I3(SDA_INST_0_i_28_n_0),
        .I4(\cs_reg[1]_0 [0]),
        .I5(\cs_reg[1]_0 [1]),
        .O(SDA_INST_0_i_13_n_0));
  LUT5 #(
    .INIT(32'hAAAAAAEA)) 
    SDA_INST_0_i_14
       (.I0(\bitCount_reg_n_0_[0] ),
        .I1(SDA_INST_0_i_29_n_0),
        .I2(\byteCount_reg_n_0_[1] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(SDA_INST_0_i_14_n_0));
  LUT6 #(
    .INIT(64'h05F481B600000000)) 
    SDA_INST_0_i_15
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[4]),
        .I4(Q[3]),
        .I5(SDA_INST_0_i_23_n_0),
        .O(SDA_INST_0_i_15_n_0));
  LUT5 #(
    .INIT(32'h00001011)) 
    SDA_INST_0_i_16
       (.I0(Q[2]),
        .I1(\cs_reg[1]_0 [1]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(SDA_INST_0_i_30_n_0),
        .O(SDA_INST_0_i_16_n_0));
  LUT6 #(
    .INIT(64'h88AAAA8208802880)) 
    SDA_INST_0_i_17
       (.I0(SDA_INST_0_i_31_n_0),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[4]),
        .I5(Q[3]),
        .O(SDA_INST_0_i_17_n_0));
  LUT6 #(
    .INIT(64'h000000008CBCFCFC)) 
    SDA_INST_0_i_18
       (.I0(SDA_INST_0_i_32_n_0),
        .I1(\byteCount_reg_n_0_[0] ),
        .I2(\byteCount_reg_n_0_[1] ),
        .I3(SDA_INST_0_i_33_n_0),
        .I4(SDA_INST_0_i_23_n_0),
        .I5(\bitCount_reg_n_0_[0] ),
        .O(SDA_INST_0_i_18_n_0));
  LUT6 #(
    .INIT(64'h7FF070F07FF07FF0)) 
    SDA_INST_0_i_19
       (.I0(SDA_INST_0_i_34_n_0),
        .I1(SDA_INST_0_i_23_n_0),
        .I2(\byteCount_reg_n_0_[0] ),
        .I3(\byteCount_reg_n_0_[1] ),
        .I4(SDA_INST_0_i_35_n_0),
        .I5(SDA_INST_0_i_36_n_0),
        .O(SDA_INST_0_i_19_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    SDA_INST_0_i_2
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(byteDone),
        .O(SDA_INST_0_i_2_n_0));
  LUT6 #(
    .INIT(64'h0033332303323023)) 
    SDA_INST_0_i_20
       (.I0(Q[0]),
        .I1(SDA_INST_0_i_24_n_0),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[4]),
        .I5(Q[1]),
        .O(SDA_INST_0_i_20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hC1F1FDFD)) 
    SDA_INST_0_i_21
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(SDA_INST_0_i_21_n_0));
  LUT6 #(
    .INIT(64'hF5D5F5DFFFFFFFFF)) 
    SDA_INST_0_i_22
       (.I0(SDA_INST_0_i_23_n_0),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .I5(\byteCount_reg_n_0_[1] ),
        .O(SDA_INST_0_i_22_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    SDA_INST_0_i_23
       (.I0(\cs_reg[1]_0 [0]),
        .I1(\cs_reg[1]_0 [1]),
        .O(SDA_INST_0_i_23_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    SDA_INST_0_i_24
       (.I0(\cs_reg[1]_0 [1]),
        .I1(\cs_reg[1]_0 [0]),
        .I2(\byteCount_reg_n_0_[1] ),
        .O(SDA_INST_0_i_24_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h04B10532)) 
    SDA_INST_0_i_25
       (.I0(Q[2]),
        .I1(Q[4]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[0]),
        .O(SDA_INST_0_i_25_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h14101060)) 
    SDA_INST_0_i_26
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[4]),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(SDA_INST_0_i_26_n_0));
  LUT5 #(
    .INIT(32'h001014E0)) 
    SDA_INST_0_i_27
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(Q[2]),
        .O(SDA_INST_0_i_27_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h1145FEFE)) 
    SDA_INST_0_i_28
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[4]),
        .I4(Q[3]),
        .O(SDA_INST_0_i_28_n_0));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    SDA_INST_0_i_29
       (.I0(\cs_reg[1]_0 [0]),
        .I1(\byteCount_reg_n_0_[0] ),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(\cs_reg[1]_0 [1]),
        .I5(Q[2]),
        .O(SDA_INST_0_i_29_n_0));
  LUT5 #(
    .INIT(32'hDBFFFFFF)) 
    SDA_INST_0_i_30
       (.I0(Q[1]),
        .I1(Q[4]),
        .I2(Q[0]),
        .I3(\byteCount_reg_n_0_[1] ),
        .I4(\cs_reg[1]_0 [0]),
        .O(SDA_INST_0_i_30_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h07000000)) 
    SDA_INST_0_i_31
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(\cs_reg[1]_0 [1]),
        .I3(\cs_reg[1]_0 [0]),
        .I4(\byteCount_reg_n_0_[1] ),
        .O(SDA_INST_0_i_31_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hFFEBED17)) 
    SDA_INST_0_i_32
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(Q[2]),
        .O(SDA_INST_0_i_32_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h454B4432)) 
    SDA_INST_0_i_33
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(SDA_INST_0_i_33_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h15561E40)) 
    SDA_INST_0_i_34
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[4]),
        .O(SDA_INST_0_i_34_n_0));
  LUT6 #(
    .INIT(64'hFFFFB800FFFFFFFF)) 
    SDA_INST_0_i_35
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[4]),
        .I4(\cs_reg[1]_0 [1]),
        .I5(\cs_reg[1]_0 [0]),
        .O(SDA_INST_0_i_35_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hF5EFFFA4)) 
    SDA_INST_0_i_36
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(SDA_INST_0_i_36_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    SDA_INST_0_i_5
       (.I0(SDA_INST_0_i_6_n_0),
        .I1(SDA_INST_0_i_7_n_0),
        .I2(\bitCount_reg_n_0_[2] ),
        .I3(SDA_INST_0_i_8_n_0),
        .I4(\bitCount_reg_n_0_[1] ),
        .I5(SDA_INST_0_i_9_n_0),
        .O(SDA_INST_0_i_5_n_0));
  LUT6 #(
    .INIT(64'h8F80FFFF8F800000)) 
    SDA_INST_0_i_6
       (.I0(\byteCount_reg_n_0_[1] ),
        .I1(SDA_INST_0_i_10_n_0),
        .I2(\byteCount_reg_n_0_[0] ),
        .I3(SDA_INST_0_i_11_n_0),
        .I4(\bitCount_reg_n_0_[0] ),
        .I5(SDA_INST_0_i_12_n_0),
        .O(SDA_INST_0_i_6_n_0));
  LUT6 #(
    .INIT(64'h7070777070707777)) 
    SDA_INST_0_i_7
       (.I0(\bitCount_reg_n_0_[0] ),
        .I1(SDA_INST_0_i_13_n_0),
        .I2(SDA_INST_0_i_14_n_0),
        .I3(SDA_INST_0_i_15_n_0),
        .I4(\byteCount_reg_n_0_[0] ),
        .I5(\byteCount_reg_n_0_[1] ),
        .O(SDA_INST_0_i_7_n_0));
  LUT5 #(
    .INIT(32'h0000DFD5)) 
    SDA_INST_0_i_8
       (.I0(\bitCount_reg_n_0_[0] ),
        .I1(SDA_INST_0_i_16_n_0),
        .I2(\byteCount_reg_n_0_[0] ),
        .I3(SDA_INST_0_i_17_n_0),
        .I4(SDA_INST_0_i_18_n_0),
        .O(SDA_INST_0_i_8_n_0));
  LUT6 #(
    .INIT(64'h7444744474777444)) 
    SDA_INST_0_i_9
       (.I0(SDA_INST_0_i_19_n_0),
        .I1(\bitCount_reg_n_0_[0] ),
        .I2(SDA_INST_0_i_20_n_0),
        .I3(\byteCount_reg_n_0_[0] ),
        .I4(SDA_INST_0_i_21_n_0),
        .I5(SDA_INST_0_i_22_n_0),
        .O(SDA_INST_0_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \bitCount[0]_i_1__0 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(byteAck_reg_n_0),
        .I3(\bitCount_reg_n_0_[0] ),
        .O(\bitCount[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hFFFDFDFF)) 
    \bitCount[1]_i_1__0 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(byteAck_reg_n_0),
        .I3(\bitCount_reg_n_0_[1] ),
        .I4(\bitCount_reg_n_0_[0] ),
        .O(\bitCount[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDFFFDFFFDFDFF)) 
    \bitCount[2]_i_1__0 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(byteAck_reg_n_0),
        .I3(\bitCount_reg_n_0_[2] ),
        .I4(\bitCount_reg_n_0_[0] ),
        .I5(\bitCount_reg_n_0_[1] ),
        .O(\bitCount[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000044410000)) 
    \bitCount[3]_i_2__0 
       (.I0(byteAck_reg_n_0),
        .I1(byteDone),
        .I2(\bitCount[3]_i_4_n_0 ),
        .I3(\bitCount_reg_n_0_[2] ),
        .I4(cs[0]),
        .I5(cs[1]),
        .O(\bitCount[3]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \bitCount[3]_i_4 
       (.I0(\bitCount_reg_n_0_[0] ),
        .I1(\bitCount_reg_n_0_[1] ),
        .O(\bitCount[3]_i_4_n_0 ));
  FDPE \bitCount_reg[0] 
       (.C(clk),
        .CE(SCLCount_n_6),
        .D(\bitCount[0]_i_1__0_n_0 ),
        .PRE(reset),
        .Q(\bitCount_reg_n_0_[0] ));
  FDPE \bitCount_reg[1] 
       (.C(clk),
        .CE(SCLCount_n_6),
        .D(\bitCount[1]_i_1__0_n_0 ),
        .PRE(reset),
        .Q(\bitCount_reg_n_0_[1] ));
  FDPE \bitCount_reg[2] 
       (.C(clk),
        .CE(SCLCount_n_6),
        .D(\bitCount[2]_i_1__0_n_0 ),
        .PRE(reset),
        .Q(\bitCount_reg_n_0_[2] ));
  FDCE \bitCount_reg[3] 
       (.C(clk),
        .CE(SCLCount_n_6),
        .CLR(reset),
        .D(\bitCount[3]_i_2__0_n_0 ),
        .Q(byteDone));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'hB)) 
    byteAck_i_5
       (.I0(cs[1]),
        .I1(cs[0]),
        .O(byteAck_i_5_n_0));
  FDCE byteAck_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(SCLCount_n_7),
        .Q(byteAck_reg_n_0));
  FDCE \byteCount_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(SCLCount_n_9),
        .Q(\byteCount_reg_n_0_[0] ));
  FDCE \byteCount_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(SCLCount_n_8),
        .Q(\byteCount_reg_n_0_[1] ));
  FDCE \cs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(SCLCount_n_1),
        .Q(cs[0]));
  FDCE \cs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(SCLCount_n_0),
        .Q(cs[1]));
endmodule

(* ORIG_REF_NAME = "audioSys" *) 
module audioSys_0_audioSys
   (SDATA,
    CLK,
    MCLK,
    SCL,
    LRCLK,
    SDA,
    reset,
    MREQ_N,
    WR_N,
    addr,
    data,
    clk);
  output SDATA;
  output CLK;
  output MCLK;
  output SCL;
  output LRCLK;
  inout SDA;
  input reset;
  input MREQ_N;
  input WR_N;
  input [9:0]addr;
  input [7:0]data;
  input clk;

  wire CLK;
  wire LRCLK;
  wire MCLK;
  wire MREQ_N;
  wire SCL;
  wire SDA;
  wire SDATA;
  wire WR_N;
  wire [2:0]acquire;
  wire [9:0]addr;
  wire [2:0]atten_enable;
  wire [3:0]atten_mag;
  wire \atten_n_0_[0] ;
  wire \atten_n_0_[1] ;
  wire \atten_n_1_[2] ;
  wire \atten_n_2_[1] ;
  wire \atten_n_2_[2] ;
  wire \atten_n_3_[0] ;
  wire \atten_n_4_[1] ;
  wire \atten_n_6_[2] ;
  wire \atten_n_7_[2] ;
  wire atten_valid;
  wire [2:0]atten_valid_freq;
  wire clk;
  wire cpuInterface_n_0;
  wire cpuInterface_n_1;
  wire cpuInterface_n_2;
  wire [0:0]\dacVal/count_reg ;
  wire [7:0]data;
  wire div_done;
  wire div_done_2;
  wire div_done_3;
  wire div_en0;
  wire div_en0_0;
  wire div_en0_1;
  wire [9:0]freq;
  wire reset;
  wire sent;
  wire step;
  wire \tone_n_0_[0] ;
  wire \tone_n_0_[1] ;
  wire \tone_n_0_[2] ;
  wire \tone_n_1_[0] ;
  wire \tone_n_2_[0] ;
  wire \tone_n_3_[0] ;
  wire \tone_n_4_[0] ;
  wire \tone_n_5_[0] ;
  wire \tone_n_6_[0] ;
  wire \tone_n_7_[0] ;
  wire \tone_n_8_[0] ;
  wire \tone_n_9_[0] ;
  wire [15:7]\waveform[1]_1 ;
  wire [15:7]\waveform[2]_0 ;

  audioSys_0_freqAttenuatorSingle__xdcDup__1 \atten[0] 
       (.E(acquire[0]),
        .atten_mag(atten_mag),
        .atten_valid_freq(atten_valid_freq[0]),
        .clk(clk),
        .\received_byte_reg[7] (atten_enable[0]),
        .reset(reset),
        .sent(sent),
        .sent_reg(\atten_n_2_[2] ),
        .\status_reg[0] (\atten_n_3_[0] ),
        .step(step),
        .waveform({\tone_n_1_[0] ,\tone_n_2_[0] ,\tone_n_3_[0] ,\tone_n_4_[0] ,\tone_n_5_[0] ,\tone_n_6_[0] ,\tone_n_7_[0] ,\tone_n_8_[0] ,\tone_n_9_[0] }),
        .\waveform_atten_freq_reg[0]_0 (\atten_n_0_[0] ));
  audioSys_0_freqAttenuatorSingle__xdcDup__2 \atten[1] 
       (.D(\atten_n_2_[1] ),
        .E(acquire[1]),
        .Q(\dacVal/count_reg ),
        .atten_mag(atten_mag),
        .atten_valid_freq(atten_valid_freq[1]),
        .atten_valid_freq_reg_0({atten_valid_freq[2],atten_valid_freq[0]}),
        .clk(clk),
        .\received_byte_reg[7] (atten_enable[1]),
        .reset(reset),
        .sent(sent),
        .sent_reg(\atten_n_1_[2] ),
        .\status_reg[0] (\atten_n_4_[1] ),
        .step(step),
        .waveform(\waveform[1]_1 ),
        .\waveform_atten_freq_reg[0]_0 (\atten_n_0_[1] ));
  audioSys_0_freqAttenuatorSingle \atten[2] 
       (.E(acquire[2]),
        .atten_mag(atten_mag),
        .atten_valid(atten_valid),
        .atten_valid_freq(atten_valid_freq[1:0]),
        .atten_valid_freq_reg_0(\atten_n_1_[2] ),
        .atten_valid_freq_reg_1(\atten_n_2_[2] ),
        .atten_valid_freq_reg_2(atten_valid_freq[2]),
        .clk(clk),
        .\received_byte_reg[6] (atten_enable[2]),
        .reset(reset),
        .sent(sent),
        .\status_reg[0] (\atten_n_6_[2] ),
        .step(step),
        .waveform(\waveform[2]_0 ),
        .\waveform_atten_freq_reg[0]_0 (\atten_n_7_[2] ));
  audioSys_0_comInterface cpuInterface
       (.E(div_done_3),
        .MREQ_N(MREQ_N),
        .Q({freq[9:8],atten_mag}),
        .WR_N(WR_N),
        .addr(addr),
        .atten_enable(atten_enable),
        .clk(clk),
        .\count_reg[4] (div_done_2),
        .\count_reg[4]_0 (div_done),
        .data(data),
        .\data_reg[3] (freq[3:0]),
        .\data_reg[9] (div_en0_1),
        .\data_reg[9]_0 (div_en0_0),
        .\data_reg[9]_1 (div_en0),
        .div_en_reg(cpuInterface_n_0),
        .div_en_reg_0(cpuInterface_n_1),
        .div_en_reg_1(cpuInterface_n_2),
        .div_en_reg_2(\tone_n_0_[2] ),
        .div_en_reg_3(\tone_n_0_[1] ),
        .div_en_reg_4(\tone_n_0_[0] ),
        .reset(reset));
  audioSys_0_dacInterface interfaceTest
       (.BCLK(CLK),
        .D(\atten_n_2_[1] ),
        .LRCLK(LRCLK),
        .MCLK(MCLK),
        .Q(\dacVal/count_reg ),
        .SCL(SCL),
        .SDA(SDA),
        .SDATA(SDATA),
        .atten_valid(atten_valid),
        .atten_valid_freq(atten_valid_freq),
        .clk(clk),
        .reset(reset),
        .step(step),
        .\waveform_atten_freq_reg[0] (\atten_n_7_[2] ),
        .\waveform_atten_freq_reg[0]_0 (\atten_n_0_[1] ),
        .\waveform_atten_freq_reg[0]_1 (\atten_n_0_[0] ));
  audioSys_0_freqSynth \tone[0] 
       (.D({freq[9:8],atten_mag,freq[3:0]}),
        .E(div_done),
        .Q({\tone_n_1_[0] ,\tone_n_2_[0] ,\tone_n_3_[0] ,\tone_n_4_[0] ,\tone_n_5_[0] ,\tone_n_6_[0] ,\tone_n_7_[0] ,\tone_n_8_[0] ,\tone_n_9_[0] }),
        .clk(clk),
        .\cs_reg[0] (acquire[0]),
        .\cs_reg[1] (\atten_n_3_[0] ),
        .\first_byte_reg[6] (cpuInterface_n_2),
        .\first_byte_reg[6]_0 (div_en0),
        .\remainder_reg[0] (\tone_n_0_[0] ),
        .reset(reset));
  audioSys_0_freqSynth_0 \tone[1] 
       (.D({freq[9:8],atten_mag,freq[3:0]}),
        .E(div_done_2),
        .Q(\waveform[1]_1 ),
        .clk(clk),
        .\cs_reg[0] (acquire[1]),
        .\cs_reg[1] (\atten_n_4_[1] ),
        .\first_byte_reg[6] (cpuInterface_n_1),
        .\first_byte_reg[6]_0 (div_en0_0),
        .\remainder_reg[0] (\tone_n_0_[1] ),
        .reset(reset));
  audioSys_0_freqSynth_1 \tone[2] 
       (.D({freq[9:8],atten_mag,freq[3:0]}),
        .E(div_done_3),
        .Q(\waveform[2]_0 ),
        .clk(clk),
        .\cs_reg[0] (acquire[2]),
        .\cs_reg[1] (\atten_n_6_[2] ),
        .\first_byte_reg[7] (cpuInterface_n_0),
        .\first_byte_reg[7]_0 (div_en0_1),
        .\remainder_reg[0] (\tone_n_0_[2] ),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "baseReg" *) 
module audioSys_0_baseReg
   (\waveform_atten_freq_reg[0] ,
    Q,
    multVal,
    step,
    sent_reg,
    \waveform_atten_freq_reg[0]_0 ,
    E,
    waveform,
    clk,
    reset,
    \received_byte_reg[6] ,
    atten_mag,
    P);
  output \waveform_atten_freq_reg[0] ;
  output [8:0]Q;
  output [5:0]multVal;
  input step;
  input sent_reg;
  input \waveform_atten_freq_reg[0]_0 ;
  input [0:0]E;
  input [8:0]waveform;
  input clk;
  input reset;
  input [0:0]\received_byte_reg[6] ;
  input [3:0]atten_mag;
  input [2:0]P;

  wire [0:0]E;
  wire [2:0]P;
  wire [8:0]Q;
  wire [3:0]atten_mag;
  wire [3:0]atten_mag_stored;
  wire clk;
  wire [5:0]multVal;
  wire [0:0]\received_byte_reg[6] ;
  wire reset;
  wire sent_reg;
  wire [0:0]shifted_val;
  wire step;
  wire [8:0]waveform;
  wire \waveform_atten_freq[0]_i_3_n_0 ;
  wire \waveform_atten_freq_reg[0] ;
  wire \waveform_atten_freq_reg[0]_0 ;

  FDPE \atten_mag_stored_reg[0] 
       (.C(clk),
        .CE(\received_byte_reg[6] ),
        .D(atten_mag[0]),
        .PRE(reset),
        .Q(atten_mag_stored[0]));
  FDPE \atten_mag_stored_reg[1] 
       (.C(clk),
        .CE(\received_byte_reg[6] ),
        .D(atten_mag[1]),
        .PRE(reset),
        .Q(atten_mag_stored[1]));
  FDPE \atten_mag_stored_reg[2] 
       (.C(clk),
        .CE(\received_byte_reg[6] ),
        .D(atten_mag[2]),
        .PRE(reset),
        .Q(atten_mag_stored[2]));
  FDPE \atten_mag_stored_reg[3] 
       (.C(clk),
        .CE(\received_byte_reg[6] ),
        .D(atten_mag[3]),
        .PRE(reset),
        .Q(atten_mag_stored[3]));
  LUT4 #(
    .INIT(16'h0001)) 
    waveMult_i_1
       (.I0(atten_mag_stored[3]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[0]),
        .I3(atten_mag_stored[1]),
        .O(multVal[5]));
  LUT4 #(
    .INIT(16'h0056)) 
    waveMult_i_2
       (.I0(atten_mag_stored[2]),
        .I1(atten_mag_stored[1]),
        .I2(atten_mag_stored[0]),
        .I3(atten_mag_stored[3]),
        .O(multVal[4]));
  LUT4 #(
    .INIT(16'h002E)) 
    waveMult_i_3
       (.I0(atten_mag_stored[2]),
        .I1(atten_mag_stored[0]),
        .I2(atten_mag_stored[1]),
        .I3(atten_mag_stored[3]),
        .O(multVal[3]));
  LUT4 #(
    .INIT(16'h6922)) 
    waveMult_i_4
       (.I0(atten_mag_stored[3]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[0]),
        .I3(atten_mag_stored[1]),
        .O(multVal[2]));
  LUT4 #(
    .INIT(16'h18A8)) 
    waveMult_i_5
       (.I0(atten_mag_stored[2]),
        .I1(atten_mag_stored[0]),
        .I2(atten_mag_stored[3]),
        .I3(atten_mag_stored[1]),
        .O(multVal[1]));
  LUT4 #(
    .INIT(16'hA9A6)) 
    waveMult_i_6
       (.I0(atten_mag_stored[3]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[1]),
        .I3(atten_mag_stored[0]),
        .O(multVal[0]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \waveform_atten_freq[0]_i_1 
       (.I0(shifted_val),
        .I1(step),
        .I2(sent_reg),
        .I3(\waveform_atten_freq_reg[0]_0 ),
        .O(\waveform_atten_freq_reg[0] ));
  LUT6 #(
    .INIT(64'hFFFFFFFF9F7B0000)) 
    \waveform_atten_freq[0]_i_2 
       (.I0(atten_mag_stored[0]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[3]),
        .I3(atten_mag_stored[1]),
        .I4(P[0]),
        .I5(\waveform_atten_freq[0]_i_3_n_0 ),
        .O(shifted_val));
  LUT6 #(
    .INIT(64'h6084400020840000)) 
    \waveform_atten_freq[0]_i_3 
       (.I0(atten_mag_stored[0]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[3]),
        .I3(atten_mag_stored[1]),
        .I4(P[1]),
        .I5(P[2]),
        .O(\waveform_atten_freq[0]_i_3_n_0 ));
  FDCE \waveform_base_reg[0] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[0]),
        .Q(Q[0]));
  FDCE \waveform_base_reg[15] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[8]),
        .Q(Q[8]));
  FDCE \waveform_base_reg[1] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[1]),
        .Q(Q[1]));
  FDCE \waveform_base_reg[2] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[2]),
        .Q(Q[2]));
  FDCE \waveform_base_reg[3] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[3]),
        .Q(Q[3]));
  FDCE \waveform_base_reg[4] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[4]),
        .Q(Q[4]));
  FDCE \waveform_base_reg[5] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[5]),
        .Q(Q[5]));
  FDCE \waveform_base_reg[6] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[6]),
        .Q(Q[6]));
  FDCE \waveform_base_reg[7] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[7]),
        .Q(Q[7]));
endmodule

(* ORIG_REF_NAME = "baseReg" *) 
module audioSys_0_baseReg_10
   (\waveform_atten_freq_reg[0] ,
    Q,
    multVal,
    step,
    sent,
    \waveform_atten_freq_reg[0]_0 ,
    E,
    waveform,
    clk,
    reset,
    \received_byte_reg[7] ,
    atten_mag,
    P);
  output \waveform_atten_freq_reg[0] ;
  output [8:0]Q;
  output [5:0]multVal;
  input step;
  input sent;
  input \waveform_atten_freq_reg[0]_0 ;
  input [0:0]E;
  input [8:0]waveform;
  input clk;
  input reset;
  input [0:0]\received_byte_reg[7] ;
  input [3:0]atten_mag;
  input [2:0]P;

  wire [0:0]E;
  wire [2:0]P;
  wire [8:0]Q;
  wire [3:0]atten_mag;
  wire [3:0]atten_mag_stored;
  wire clk;
  wire [5:0]multVal;
  wire [0:0]\received_byte_reg[7] ;
  wire reset;
  wire sent;
  wire [0:0]shifted_val;
  wire step;
  wire [8:0]waveform;
  wire \waveform_atten_freq[0]_i_3__1_n_0 ;
  wire \waveform_atten_freq_reg[0] ;
  wire \waveform_atten_freq_reg[0]_0 ;

  FDPE \atten_mag_stored_reg[0] 
       (.C(clk),
        .CE(\received_byte_reg[7] ),
        .D(atten_mag[0]),
        .PRE(reset),
        .Q(atten_mag_stored[0]));
  FDPE \atten_mag_stored_reg[1] 
       (.C(clk),
        .CE(\received_byte_reg[7] ),
        .D(atten_mag[1]),
        .PRE(reset),
        .Q(atten_mag_stored[1]));
  FDPE \atten_mag_stored_reg[2] 
       (.C(clk),
        .CE(\received_byte_reg[7] ),
        .D(atten_mag[2]),
        .PRE(reset),
        .Q(atten_mag_stored[2]));
  FDPE \atten_mag_stored_reg[3] 
       (.C(clk),
        .CE(\received_byte_reg[7] ),
        .D(atten_mag[3]),
        .PRE(reset),
        .Q(atten_mag_stored[3]));
  LUT4 #(
    .INIT(16'h0001)) 
    waveMult_i_1__1
       (.I0(atten_mag_stored[3]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[0]),
        .I3(atten_mag_stored[1]),
        .O(multVal[5]));
  LUT4 #(
    .INIT(16'h0056)) 
    waveMult_i_2__1
       (.I0(atten_mag_stored[2]),
        .I1(atten_mag_stored[1]),
        .I2(atten_mag_stored[0]),
        .I3(atten_mag_stored[3]),
        .O(multVal[4]));
  LUT4 #(
    .INIT(16'h002E)) 
    waveMult_i_3__1
       (.I0(atten_mag_stored[2]),
        .I1(atten_mag_stored[0]),
        .I2(atten_mag_stored[1]),
        .I3(atten_mag_stored[3]),
        .O(multVal[3]));
  LUT4 #(
    .INIT(16'h6922)) 
    waveMult_i_4__1
       (.I0(atten_mag_stored[3]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[0]),
        .I3(atten_mag_stored[1]),
        .O(multVal[2]));
  LUT4 #(
    .INIT(16'h18A8)) 
    waveMult_i_5__1
       (.I0(atten_mag_stored[2]),
        .I1(atten_mag_stored[0]),
        .I2(atten_mag_stored[3]),
        .I3(atten_mag_stored[1]),
        .O(multVal[1]));
  LUT4 #(
    .INIT(16'hA9A6)) 
    waveMult_i_6__1
       (.I0(atten_mag_stored[3]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[1]),
        .I3(atten_mag_stored[0]),
        .O(multVal[0]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \waveform_atten_freq[0]_i_1__1 
       (.I0(shifted_val),
        .I1(step),
        .I2(sent),
        .I3(\waveform_atten_freq_reg[0]_0 ),
        .O(\waveform_atten_freq_reg[0] ));
  LUT6 #(
    .INIT(64'hFFFFFFFF9F7B0000)) 
    \waveform_atten_freq[0]_i_2__1 
       (.I0(atten_mag_stored[0]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[3]),
        .I3(atten_mag_stored[1]),
        .I4(P[0]),
        .I5(\waveform_atten_freq[0]_i_3__1_n_0 ),
        .O(shifted_val));
  LUT6 #(
    .INIT(64'h6084400020840000)) 
    \waveform_atten_freq[0]_i_3__1 
       (.I0(atten_mag_stored[0]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[3]),
        .I3(atten_mag_stored[1]),
        .I4(P[1]),
        .I5(P[2]),
        .O(\waveform_atten_freq[0]_i_3__1_n_0 ));
  FDCE \waveform_base_reg[0] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[0]),
        .Q(Q[0]));
  FDCE \waveform_base_reg[15] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[8]),
        .Q(Q[8]));
  FDCE \waveform_base_reg[1] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[1]),
        .Q(Q[1]));
  FDCE \waveform_base_reg[2] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[2]),
        .Q(Q[2]));
  FDCE \waveform_base_reg[3] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[3]),
        .Q(Q[3]));
  FDCE \waveform_base_reg[4] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[4]),
        .Q(Q[4]));
  FDCE \waveform_base_reg[5] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[5]),
        .Q(Q[5]));
  FDCE \waveform_base_reg[6] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[6]),
        .Q(Q[6]));
  FDCE \waveform_base_reg[7] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[7]),
        .Q(Q[7]));
endmodule

(* ORIG_REF_NAME = "baseReg" *) 
module audioSys_0_baseReg_8
   (\waveform_atten_freq_reg[0] ,
    Q,
    multVal,
    step,
    sent,
    \waveform_atten_freq_reg[0]_0 ,
    E,
    waveform,
    clk,
    reset,
    \received_byte_reg[7] ,
    atten_mag,
    P);
  output \waveform_atten_freq_reg[0] ;
  output [8:0]Q;
  output [5:0]multVal;
  input step;
  input sent;
  input \waveform_atten_freq_reg[0]_0 ;
  input [0:0]E;
  input [8:0]waveform;
  input clk;
  input reset;
  input [0:0]\received_byte_reg[7] ;
  input [3:0]atten_mag;
  input [2:0]P;

  wire [0:0]E;
  wire [2:0]P;
  wire [8:0]Q;
  wire [3:0]atten_mag;
  wire [3:0]atten_mag_stored;
  wire clk;
  wire [5:0]multVal;
  wire [0:0]\received_byte_reg[7] ;
  wire reset;
  wire sent;
  wire [0:0]shifted_val;
  wire step;
  wire [8:0]waveform;
  wire \waveform_atten_freq[0]_i_3__0_n_0 ;
  wire \waveform_atten_freq_reg[0] ;
  wire \waveform_atten_freq_reg[0]_0 ;

  FDPE \atten_mag_stored_reg[0] 
       (.C(clk),
        .CE(\received_byte_reg[7] ),
        .D(atten_mag[0]),
        .PRE(reset),
        .Q(atten_mag_stored[0]));
  FDPE \atten_mag_stored_reg[1] 
       (.C(clk),
        .CE(\received_byte_reg[7] ),
        .D(atten_mag[1]),
        .PRE(reset),
        .Q(atten_mag_stored[1]));
  FDPE \atten_mag_stored_reg[2] 
       (.C(clk),
        .CE(\received_byte_reg[7] ),
        .D(atten_mag[2]),
        .PRE(reset),
        .Q(atten_mag_stored[2]));
  FDPE \atten_mag_stored_reg[3] 
       (.C(clk),
        .CE(\received_byte_reg[7] ),
        .D(atten_mag[3]),
        .PRE(reset),
        .Q(atten_mag_stored[3]));
  LUT4 #(
    .INIT(16'h0001)) 
    waveMult_i_1__0
       (.I0(atten_mag_stored[3]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[0]),
        .I3(atten_mag_stored[1]),
        .O(multVal[5]));
  LUT4 #(
    .INIT(16'h0056)) 
    waveMult_i_2__0
       (.I0(atten_mag_stored[2]),
        .I1(atten_mag_stored[1]),
        .I2(atten_mag_stored[0]),
        .I3(atten_mag_stored[3]),
        .O(multVal[4]));
  LUT4 #(
    .INIT(16'h002E)) 
    waveMult_i_3__0
       (.I0(atten_mag_stored[2]),
        .I1(atten_mag_stored[0]),
        .I2(atten_mag_stored[1]),
        .I3(atten_mag_stored[3]),
        .O(multVal[3]));
  LUT4 #(
    .INIT(16'h6922)) 
    waveMult_i_4__0
       (.I0(atten_mag_stored[3]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[0]),
        .I3(atten_mag_stored[1]),
        .O(multVal[2]));
  LUT4 #(
    .INIT(16'h18A8)) 
    waveMult_i_5__0
       (.I0(atten_mag_stored[2]),
        .I1(atten_mag_stored[0]),
        .I2(atten_mag_stored[3]),
        .I3(atten_mag_stored[1]),
        .O(multVal[1]));
  LUT4 #(
    .INIT(16'hA9A6)) 
    waveMult_i_6__0
       (.I0(atten_mag_stored[3]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[1]),
        .I3(atten_mag_stored[0]),
        .O(multVal[0]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \waveform_atten_freq[0]_i_1__0 
       (.I0(shifted_val),
        .I1(step),
        .I2(sent),
        .I3(\waveform_atten_freq_reg[0]_0 ),
        .O(\waveform_atten_freq_reg[0] ));
  LUT6 #(
    .INIT(64'hFFFFFFFF9F7B0000)) 
    \waveform_atten_freq[0]_i_2__0 
       (.I0(atten_mag_stored[0]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[3]),
        .I3(atten_mag_stored[1]),
        .I4(P[0]),
        .I5(\waveform_atten_freq[0]_i_3__0_n_0 ),
        .O(shifted_val));
  LUT6 #(
    .INIT(64'h6084400020840000)) 
    \waveform_atten_freq[0]_i_3__0 
       (.I0(atten_mag_stored[0]),
        .I1(atten_mag_stored[2]),
        .I2(atten_mag_stored[3]),
        .I3(atten_mag_stored[1]),
        .I4(P[1]),
        .I5(P[2]),
        .O(\waveform_atten_freq[0]_i_3__0_n_0 ));
  FDCE \waveform_base_reg[0] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[0]),
        .Q(Q[0]));
  FDCE \waveform_base_reg[15] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[8]),
        .Q(Q[8]));
  FDCE \waveform_base_reg[1] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[1]),
        .Q(Q[1]));
  FDCE \waveform_base_reg[2] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[2]),
        .Q(Q[2]));
  FDCE \waveform_base_reg[3] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[3]),
        .Q(Q[3]));
  FDCE \waveform_base_reg[4] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[4]),
        .Q(Q[4]));
  FDCE \waveform_base_reg[5] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[5]),
        .Q(Q[5]));
  FDCE \waveform_base_reg[6] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[6]),
        .Q(Q[6]));
  FDCE \waveform_base_reg[7] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(waveform[7]),
        .Q(Q[7]));
endmodule

(* CORE_GENERATION_INFO = "clk_wiz_0,clk_wiz_v5_1,{component_name=clk_wiz_0,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=1,clkin1_period=10.0,clkin2_period=10.0,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}" *) (* ORIG_REF_NAME = "clk_wiz_0" *) 
module audioSys_0_clk_wiz_0
   (clk_main,
    clk_out1,
    reset,
    locked);
  input clk_main;
  output clk_out1;
  input reset;
  output locked;

  wire clk_main;
  wire clk_out1;
  wire locked;
  wire reset;

  audioSys_0_clk_wiz_0_clk_wiz inst
       (.clk_main(clk_main),
        .clk_out1(clk_out1),
        .locked(locked),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "clk_wiz_0_clk_wiz" *) 
module audioSys_0_clk_wiz_0_clk_wiz
   (clk_main,
    clk_out1,
    reset,
    locked);
  input clk_main;
  output clk_out1;
  input reset;
  output locked;

  wire clk_main;
  wire clk_main_clk_wiz_0;
  wire clk_out1;
  wire clk_out1_clk_wiz_0;
  wire clkfbout_buf_clk_wiz_0;
  wire clkfbout_clk_wiz_0;
  wire locked;
  wire reset;
  wire NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED;
  wire NLW_mmcm_adv_inst_DRDY_UNCONNECTED;
  wire NLW_mmcm_adv_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_mmcm_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkf_buf
       (.I(clkfbout_clk_wiz_0),
        .O(clkfbout_buf_clk_wiz_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF #(
    .IOSTANDARD("DEFAULT")) 
    clkin1_ibufg
       (.I(clk_main),
        .O(clk_main_clk_wiz_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkout1_buf
       (.I(clk_out1_clk_wiz_0),
        .O(clk_out1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(48.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(10.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(78.125000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(1),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(5),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PSEN_INVERTED(1'b0),
    .IS_PSINCDEC_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
    mmcm_adv_inst
       (.CLKFBIN(clkfbout_buf_clk_wiz_0),
        .CLKFBOUT(clkfbout_clk_wiz_0),
        .CLKFBOUTB(NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(clk_main_clk_wiz_0),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(clk_out1_clk_wiz_0),
        .CLKOUT0B(NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED),
        .CLKOUT1B(NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_mmcm_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_mmcm_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(locked),
        .PSCLK(1'b0),
        .PSDONE(NLW_mmcm_adv_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(reset));
endmodule

(* ORIG_REF_NAME = "comInterface" *) 
module audioSys_0_comInterface
   (div_en_reg,
    div_en_reg_0,
    div_en_reg_1,
    \data_reg[9] ,
    \data_reg[9]_0 ,
    \data_reg[9]_1 ,
    Q,
    \data_reg[3] ,
    atten_enable,
    MREQ_N,
    WR_N,
    addr,
    div_en_reg_2,
    E,
    div_en_reg_3,
    \count_reg[4] ,
    div_en_reg_4,
    \count_reg[4]_0 ,
    data,
    clk,
    reset);
  output div_en_reg;
  output div_en_reg_0;
  output div_en_reg_1;
  output [0:0]\data_reg[9] ;
  output [0:0]\data_reg[9]_0 ;
  output [0:0]\data_reg[9]_1 ;
  output [5:0]Q;
  output [3:0]\data_reg[3] ;
  output [2:0]atten_enable;
  input MREQ_N;
  input WR_N;
  input [9:0]addr;
  input div_en_reg_2;
  input [0:0]E;
  input div_en_reg_3;
  input [0:0]\count_reg[4] ;
  input div_en_reg_4;
  input [0:0]\count_reg[4]_0 ;
  input [7:0]data;
  input clk;
  input reset;

  wire [0:0]E;
  wire MREQ_N;
  wire [5:0]Q;
  wire WR_N;
  wire [9:0]addr;
  wire [2:0]atten_enable;
  wire clk;
  wire command_stored_n_0;
  wire command_stored_n_7;
  wire [0:0]\count_reg[4] ;
  wire [0:0]\count_reg[4]_0 ;
  wire [1:0]cs;
  wire \cs[0]_i_1__4_n_0 ;
  wire \cs[1]_i_1__4_n_0 ;
  wire [7:0]data;
  wire [3:0]\data_reg[3] ;
  wire [0:0]\data_reg[9] ;
  wire [0:0]\data_reg[9]_0 ;
  wire [0:0]\data_reg[9]_1 ;
  wire div_en_reg;
  wire div_en_reg_0;
  wire div_en_reg_1;
  wire div_en_reg_2;
  wire div_en_reg_3;
  wire div_en_reg_4;
  wire [7:6]received_byte;
  wire received_stored_n_0;
  wire received_stored_n_1;
  wire received_stored_n_13;
  wire received_stored_n_14;
  wire reset;

  audioSys_0_commandDecoder command_stored
       (.E(E),
        .Q(cs),
        .\atten_mag_stored_reg[0] (command_stored_n_7),
        .clk(clk),
        .\count_reg[4] (\count_reg[4] ),
        .\count_reg[4]_0 (\count_reg[4]_0 ),
        .\data_reg[3] (\data_reg[3] ),
        .\data_reg[9] (\data_reg[9] ),
        .\data_reg[9]_0 (\data_reg[9]_0 ),
        .\data_reg[9]_1 (\data_reg[9]_1 ),
        .div_en_reg(div_en_reg),
        .div_en_reg_0(div_en_reg_0),
        .div_en_reg_1(div_en_reg_1),
        .div_en_reg_2(div_en_reg_2),
        .div_en_reg_3(div_en_reg_3),
        .div_en_reg_4(div_en_reg_4),
        .double_transfer_reg_0(command_stored_n_0),
        .\received_byte_reg[4] (received_stored_n_13),
        .\received_byte_reg[6] (received_stored_n_14),
        .\received_byte_reg[7] ({received_byte,Q[5],Q[3:0]}),
        .reset(reset));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0111)) 
    \cs[0]_i_1__4 
       (.I0(received_stored_n_1),
        .I1(received_stored_n_0),
        .I2(cs[1]),
        .I3(cs[0]),
        .O(\cs[0]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0E00)) 
    \cs[1]_i_1__4 
       (.I0(received_stored_n_1),
        .I1(received_stored_n_0),
        .I2(cs[1]),
        .I3(cs[0]),
        .O(\cs[1]_i_1__4_n_0 ));
  FDCE \cs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\cs[0]_i_1__4_n_0 ),
        .Q(cs[0]));
  FDCE \cs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\cs[1]_i_1__4_n_0 ),
        .Q(cs[1]));
  audioSys_0_regReceiver received_stored
       (.MREQ_N(MREQ_N),
        .Q({received_byte,Q}),
        .WR_N(WR_N),
        .addr(addr),
        .atten_enable(atten_enable),
        .clk(clk),
        .\cs_reg[0] (command_stored_n_7),
        .\cs_reg[1] (cs),
        .data(data),
        .double_transfer_reg(received_stored_n_14),
        .double_transfer_reg_0(command_stored_n_0),
        .\first_byte_reg[7] (received_stored_n_13),
        .\received_byte_reg[0]_0 (received_stored_n_0),
        .\received_byte_reg[0]_1 (received_stored_n_1),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "commandDecoder" *) 
module audioSys_0_commandDecoder
   (double_transfer_reg_0,
    div_en_reg,
    div_en_reg_0,
    div_en_reg_1,
    \data_reg[9] ,
    \data_reg[9]_0 ,
    \data_reg[9]_1 ,
    \atten_mag_stored_reg[0] ,
    \data_reg[3] ,
    \received_byte_reg[6] ,
    clk,
    reset,
    div_en_reg_2,
    E,
    div_en_reg_3,
    \count_reg[4] ,
    div_en_reg_4,
    \count_reg[4]_0 ,
    Q,
    \received_byte_reg[4] ,
    \received_byte_reg[7] );
  output double_transfer_reg_0;
  output div_en_reg;
  output div_en_reg_0;
  output div_en_reg_1;
  output [0:0]\data_reg[9] ;
  output [0:0]\data_reg[9]_0 ;
  output [0:0]\data_reg[9]_1 ;
  output \atten_mag_stored_reg[0] ;
  output [3:0]\data_reg[3] ;
  input \received_byte_reg[6] ;
  input clk;
  input reset;
  input div_en_reg_2;
  input [0:0]E;
  input div_en_reg_3;
  input [0:0]\count_reg[4] ;
  input div_en_reg_4;
  input [0:0]\count_reg[4]_0 ;
  input [1:0]Q;
  input [0:0]\received_byte_reg[4] ;
  input [6:0]\received_byte_reg[7] ;

  wire [0:0]E;
  wire [1:0]Q;
  wire \atten_mag_stored_reg[0] ;
  wire clk;
  wire [0:0]\count_reg[4] ;
  wire [0:0]\count_reg[4]_0 ;
  wire \data[9]_i_2_n_0 ;
  wire [3:0]\data_reg[3] ;
  wire [0:0]\data_reg[9] ;
  wire [0:0]\data_reg[9]_0 ;
  wire [0:0]\data_reg[9]_1 ;
  wire div_en_reg;
  wire div_en_reg_0;
  wire div_en_reg_1;
  wire div_en_reg_2;
  wire div_en_reg_3;
  wire div_en_reg_4;
  wire double_transfer_reg_0;
  wire \first_byte_reg_n_0_[5] ;
  wire \first_byte_reg_n_0_[6] ;
  wire p_1_in;
  wire [0:0]\received_byte_reg[4] ;
  wire \received_byte_reg[6] ;
  wire [6:0]\received_byte_reg[7] ;
  wire reset;

  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \atten_mag_stored[3]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(double_transfer_reg_0),
        .O(\atten_mag_stored_reg[0] ));
  LUT5 #(
    .INIT(32'h00000080)) 
    \data[9]_i_1 
       (.I0(\data[9]_i_2_n_0 ),
        .I1(p_1_in),
        .I2(\first_byte_reg_n_0_[6] ),
        .I3(\first_byte_reg_n_0_[5] ),
        .I4(div_en_reg_2),
        .O(\data_reg[9] ));
  LUT5 #(
    .INIT(32'h00002000)) 
    \data[9]_i_1__0 
       (.I0(\data[9]_i_2_n_0 ),
        .I1(\first_byte_reg_n_0_[6] ),
        .I2(p_1_in),
        .I3(\first_byte_reg_n_0_[5] ),
        .I4(div_en_reg_3),
        .O(\data_reg[9]_0 ));
  LUT5 #(
    .INIT(32'h00000020)) 
    \data[9]_i_1__1 
       (.I0(\data[9]_i_2_n_0 ),
        .I1(\first_byte_reg_n_0_[6] ),
        .I2(p_1_in),
        .I3(\first_byte_reg_n_0_[5] ),
        .I4(div_en_reg_4),
        .O(\data_reg[9]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \data[9]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(double_transfer_reg_0),
        .O(\data[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF0080)) 
    div_en_i_1
       (.I0(\data[9]_i_2_n_0 ),
        .I1(p_1_in),
        .I2(\first_byte_reg_n_0_[6] ),
        .I3(\first_byte_reg_n_0_[5] ),
        .I4(div_en_reg_2),
        .I5(E),
        .O(div_en_reg));
  LUT6 #(
    .INIT(64'h00000000FFFF2000)) 
    div_en_i_1__0
       (.I0(\data[9]_i_2_n_0 ),
        .I1(\first_byte_reg_n_0_[6] ),
        .I2(p_1_in),
        .I3(\first_byte_reg_n_0_[5] ),
        .I4(div_en_reg_3),
        .I5(\count_reg[4] ),
        .O(div_en_reg_0));
  LUT6 #(
    .INIT(64'h00000000FFFF0020)) 
    div_en_i_1__1
       (.I0(\data[9]_i_2_n_0 ),
        .I1(\first_byte_reg_n_0_[6] ),
        .I2(p_1_in),
        .I3(\first_byte_reg_n_0_[5] ),
        .I4(div_en_reg_4),
        .I5(\count_reg[4]_0 ),
        .O(div_en_reg_1));
  FDCE double_transfer_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\received_byte_reg[6] ),
        .Q(double_transfer_reg_0));
  FDCE \first_byte_reg[0] 
       (.C(clk),
        .CE(\received_byte_reg[4] ),
        .CLR(reset),
        .D(\received_byte_reg[7] [0]),
        .Q(\data_reg[3] [0]));
  FDCE \first_byte_reg[1] 
       (.C(clk),
        .CE(\received_byte_reg[4] ),
        .CLR(reset),
        .D(\received_byte_reg[7] [1]),
        .Q(\data_reg[3] [1]));
  FDCE \first_byte_reg[2] 
       (.C(clk),
        .CE(\received_byte_reg[4] ),
        .CLR(reset),
        .D(\received_byte_reg[7] [2]),
        .Q(\data_reg[3] [2]));
  FDCE \first_byte_reg[3] 
       (.C(clk),
        .CE(\received_byte_reg[4] ),
        .CLR(reset),
        .D(\received_byte_reg[7] [3]),
        .Q(\data_reg[3] [3]));
  FDCE \first_byte_reg[5] 
       (.C(clk),
        .CE(\received_byte_reg[4] ),
        .CLR(reset),
        .D(\received_byte_reg[7] [4]),
        .Q(\first_byte_reg_n_0_[5] ));
  FDCE \first_byte_reg[6] 
       (.C(clk),
        .CE(\received_byte_reg[4] ),
        .CLR(reset),
        .D(\received_byte_reg[7] [5]),
        .Q(\first_byte_reg_n_0_[6] ));
  FDCE \first_byte_reg[7] 
       (.C(clk),
        .CE(\received_byte_reg[4] ),
        .CLR(reset),
        .D(\received_byte_reg[7] [6]),
        .Q(p_1_in));
endmodule

(* ORIG_REF_NAME = "counter" *) 
module audioSys_0_counter
   (S,
    remainder_preview,
    D,
    CO,
    E,
    Q,
    \remainder_reg[0] ,
    reset,
    remainder0,
    div_en_reg,
    DI,
    \remainder_reg[6] ,
    \remainder_reg[13] ,
    \remainder_reg[14] ,
    \remainder_reg[16] ,
    \remainder_reg[15] ,
    clk);
  output [0:0]S;
  output [0:0]remainder_preview;
  output [0:0]D;
  output [0:0]CO;
  output [0:0]E;
  input [1:0]Q;
  input [0:0]\remainder_reg[0] ;
  input reset;
  input [0:0]remainder0;
  input div_en_reg;
  input [2:0]DI;
  input [2:0]\remainder_reg[6] ;
  input [3:0]\remainder_reg[13] ;
  input [3:0]\remainder_reg[14] ;
  input [0:0]\remainder_reg[16] ;
  input [0:0]\remainder_reg[15] ;
  input clk;

  wire [0:0]CO;
  wire [0:0]D;
  wire [2:0]DI;
  wire [0:0]E;
  wire [1:0]Q;
  wire [0:0]S;
  wire clk;
  wire [4:0]count_reg__0;
  wire div_en_reg;
  wire [4:0]p_0_in;
  wire [0:0]remainder0;
  wire \remainder[16]_i_20_n_0 ;
  wire \remainder[16]_i_24_n_0 ;
  wire \remainder[16]_i_25_n_0 ;
  wire [0:0]remainder_preview;
  wire [0:0]\remainder_reg[0] ;
  wire [3:0]\remainder_reg[13] ;
  wire [3:0]\remainder_reg[14] ;
  wire [0:0]\remainder_reg[15] ;
  wire [0:0]\remainder_reg[16] ;
  wire \remainder_reg[16]_i_4_n_0 ;
  wire \remainder_reg[16]_i_4_n_1 ;
  wire \remainder_reg[16]_i_4_n_2 ;
  wire \remainder_reg[16]_i_4_n_3 ;
  wire \remainder_reg[16]_i_8_n_0 ;
  wire \remainder_reg[16]_i_8_n_1 ;
  wire \remainder_reg[16]_i_8_n_2 ;
  wire \remainder_reg[16]_i_8_n_3 ;
  wire [2:0]\remainder_reg[6] ;
  wire reset;
  wire [3:1]\NLW_remainder_reg[16]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_remainder_reg[16]_i_2_O_UNCONNECTED ;
  wire [3:0]\NLW_remainder_reg[16]_i_4_O_UNCONNECTED ;
  wire [3:0]\NLW_remainder_reg[16]_i_8_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_1__0 
       (.I0(div_en_reg),
        .I1(count_reg__0[0]),
        .O(p_0_in[0]));
  LUT3 #(
    .INIT(8'hD7)) 
    \count[1]_i_1__0 
       (.I0(div_en_reg),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'hA802)) 
    \count[2]_i_1__0 
       (.I0(div_en_reg),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT5 #(
    .INIT(32'hAAA80002)) 
    \count[3]_i_1__0 
       (.I0(div_en_reg),
        .I1(count_reg__0[2]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[3]),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFD55555557)) 
    \count[4]_i_1__1 
       (.I0(div_en_reg),
        .I1(count_reg__0[3]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[2]),
        .I5(count_reg__0[4]),
        .O(p_0_in[4]));
  FDCE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[0]),
        .Q(count_reg__0[0]));
  FDPE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[1]),
        .PRE(reset),
        .Q(count_reg__0[1]));
  FDCE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[2]),
        .Q(count_reg__0[2]));
  FDCE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[3]),
        .Q(count_reg__0[3]));
  FDPE \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[4]),
        .PRE(reset),
        .Q(count_reg__0[4]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    \remainder[0]_i_1 
       (.I0(remainder0),
        .I1(CO),
        .I2(div_en_reg),
        .I3(remainder_preview),
        .O(D));
  LUT6 #(
    .INIT(64'h0100101100051101)) 
    \remainder[0]_i_2 
       (.I0(reset),
        .I1(count_reg__0[4]),
        .I2(count_reg__0[3]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[0]),
        .I5(count_reg__0[2]),
        .O(remainder_preview));
  LUT5 #(
    .INIT(32'h040D000C)) 
    \remainder[16]_i_20 
       (.I0(Q[0]),
        .I1(\remainder_reg[0] ),
        .I2(reset),
        .I3(Q[1]),
        .I4(\remainder[16]_i_25_n_0 ),
        .O(\remainder[16]_i_20_n_0 ));
  LUT5 #(
    .INIT(32'h00823341)) 
    \remainder[16]_i_24 
       (.I0(\remainder[16]_i_25_n_0 ),
        .I1(Q[1]),
        .I2(\remainder_reg[0] ),
        .I3(reset),
        .I4(Q[0]),
        .O(\remainder[16]_i_24_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'h10450351)) 
    \remainder[16]_i_25 
       (.I0(count_reg__0[4]),
        .I1(count_reg__0[3]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[2]),
        .O(\remainder[16]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \remainder[3]_i_9 
       (.I0(Q[0]),
        .I1(remainder_preview),
        .O(S));
  CARRY4 \remainder_reg[16]_i_2 
       (.CI(\remainder_reg[16]_i_4_n_0 ),
        .CO({\NLW_remainder_reg[16]_i_2_CO_UNCONNECTED [3:1],CO}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\remainder_reg[16] }),
        .O(\NLW_remainder_reg[16]_i_2_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,\remainder_reg[15] }));
  CARRY4 \remainder_reg[16]_i_4 
       (.CI(\remainder_reg[16]_i_8_n_0 ),
        .CO({\remainder_reg[16]_i_4_n_0 ,\remainder_reg[16]_i_4_n_1 ,\remainder_reg[16]_i_4_n_2 ,\remainder_reg[16]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI(\remainder_reg[13] ),
        .O(\NLW_remainder_reg[16]_i_4_O_UNCONNECTED [3:0]),
        .S(\remainder_reg[14] ));
  CARRY4 \remainder_reg[16]_i_8 
       (.CI(1'b0),
        .CO({\remainder_reg[16]_i_8_n_0 ,\remainder_reg[16]_i_8_n_1 ,\remainder_reg[16]_i_8_n_2 ,\remainder_reg[16]_i_8_n_3 }),
        .CYINIT(1'b1),
        .DI({DI,\remainder[16]_i_20_n_0 }),
        .O(\NLW_remainder_reg[16]_i_8_O_UNCONNECTED [3:0]),
        .S({\remainder_reg[6] ,\remainder[16]_i_24_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \step_size_curr[15]_i_1 
       (.I0(count_reg__0[4]),
        .I1(count_reg__0[3]),
        .I2(count_reg__0[2]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[0]),
        .O(E));
endmodule

(* ORIG_REF_NAME = "counterSCL" *) 
module audioSys_0_counterSCL
   (D,
    \cs_reg[0] ,
    sent_reg,
    SCL,
    E,
    \bitCount_reg[0] ,
    byteAck_reg,
    \byteCount_reg[1] ,
    \byteCount_reg[0] ,
    SDA,
    Q,
    sent_reg_0,
    byteAck_reg_0,
    \byteCount_reg[1]_0 ,
    \byteCount_reg[0]_0 ,
    \bitCount_reg[3] ,
    \cs_reg[1] ,
    \cs_reg[0]_0 ,
    \bitCount_reg[2] ,
    \count_reg[4]_0 ,
    \cs_reg[1]_0 ,
    clk,
    reset);
  output [1:0]D;
  output \cs_reg[0] ;
  output sent_reg;
  output SCL;
  output [0:0]E;
  output [0:0]\bitCount_reg[0] ;
  output byteAck_reg;
  output \byteCount_reg[1] ;
  output \byteCount_reg[0] ;
  inout SDA;
  input [1:0]Q;
  input sent_reg_0;
  input byteAck_reg_0;
  input \byteCount_reg[1]_0 ;
  input \byteCount_reg[0]_0 ;
  input [0:0]\bitCount_reg[3] ;
  input [1:0]\cs_reg[1] ;
  input \cs_reg[0]_0 ;
  input \bitCount_reg[2] ;
  input [3:0]\count_reg[4]_0 ;
  input \cs_reg[1]_0 ;
  input clk;
  input reset;

  wire [1:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire SCL;
  wire SCL_INST_0_i_1_n_0;
  wire SDA;
  wire SDA_INST_0_i_1_n_0;
  wire SDA_INST_0_i_3_n_0;
  wire \bitCount[3]_i_3__0_n_0 ;
  wire [0:0]\bitCount_reg[0] ;
  wire \bitCount_reg[2] ;
  wire [0:0]\bitCount_reg[3] ;
  wire byteAck0;
  wire byteAck_i_10_n_0;
  wire byteAck_i_11_n_0;
  wire byteAck_i_12_n_0;
  wire byteAck_i_13_n_0;
  wire byteAck_i_2_n_0;
  wire byteAck_i_4_n_0;
  wire byteAck_i_6_n_0;
  wire byteAck_i_7_n_0;
  wire byteAck_i_8_n_0;
  wire byteAck_i_9_n_0;
  wire byteAck_reg;
  wire byteAck_reg_0;
  wire \byteCount[1]_i_2_n_0 ;
  wire \byteCount[1]_i_3_n_0 ;
  wire \byteCount[1]_i_4_n_0 ;
  wire \byteCount_reg[0] ;
  wire \byteCount_reg[0]_0 ;
  wire \byteCount_reg[1] ;
  wire \byteCount_reg[1]_0 ;
  wire clk;
  wire [7:0]count;
  wire count1;
  wire \count[4]_i_2_n_0 ;
  wire \count[4]_i_3_n_0 ;
  wire \count[5]_i_2__0_n_0 ;
  wire \count[7]_i_2_n_0 ;
  wire \count[7]_i_3_n_0 ;
  wire \count[7]_i_5_n_0 ;
  wire [3:0]\count_reg[4]_0 ;
  wire \cs[0]_i_2__0_n_0 ;
  wire \cs[1]_i_3_n_0 ;
  wire \cs_reg[0] ;
  wire \cs_reg[0]_0 ;
  wire [1:0]\cs_reg[1] ;
  wire \cs_reg[1]_0 ;
  wire ns2;
  wire [7:0]p_0_in;
  wire reset;
  wire sent_reg;
  wire sent_reg_0;

  LUT6 #(
    .INIT(64'hBABABABABABABABB)) 
    SCL_INST_0
       (.I0(Q[1]),
        .I1(count[7]),
        .I2(SCL_INST_0_i_1_n_0),
        .I3(count[2]),
        .I4(count[4]),
        .I5(count[3]),
        .O(SCL));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h7)) 
    SCL_INST_0_i_1
       (.I0(count[6]),
        .I1(count[5]),
        .O(SCL_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    SDA_INST_0
       (.I0(SDA_INST_0_i_1_n_0),
        .I1(\cs_reg[0]_0 ),
        .I2(1'b0),
        .I3(1'b0),
        .I4(1'b0),
        .I5(1'b0),
        .O(SDA));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFA3F0A3)) 
    SDA_INST_0_i_1
       (.I0(SDA_INST_0_i_3_n_0),
        .I1(\cs_reg[0] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\bitCount_reg[2] ),
        .O(SDA_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFEFF00FF00FF00)) 
    SDA_INST_0_i_3
       (.I0(count[4]),
        .I1(count[2]),
        .I2(count[3]),
        .I3(count[7]),
        .I4(count[6]),
        .I5(count[5]),
        .O(SDA_INST_0_i_3_n_0));
  LUT6 #(
    .INIT(64'h0444044404444444)) 
    SDA_INST_0_i_4
       (.I0(\cs_reg[1] [1]),
        .I1(\cs_reg[1] [0]),
        .I2(\count_reg[4]_0 [2]),
        .I3(\count_reg[4]_0 [3]),
        .I4(\count_reg[4]_0 [0]),
        .I5(\count_reg[4]_0 [1]),
        .O(\cs_reg[0] ));
  LUT5 #(
    .INIT(32'hFDDDDDDD)) 
    \bitCount[3]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(count[7]),
        .I3(\bitCount[3]_i_3__0_n_0 ),
        .I4(count[6]),
        .O(\bitCount_reg[0] ));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    \bitCount[3]_i_3__0 
       (.I0(count[3]),
        .I1(count[0]),
        .I2(count[2]),
        .I3(count[1]),
        .I4(count[5]),
        .I5(count[4]),
        .O(\bitCount[3]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000AFFF0000AC0C)) 
    byteAck_i_1
       (.I0(byteAck_i_2_n_0),
        .I1(byteAck0),
        .I2(count[7]),
        .I3(byteAck_i_4_n_0),
        .I4(\cs_reg[1]_0 ),
        .I5(byteAck_reg_0),
        .O(byteAck_reg));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h08)) 
    byteAck_i_10
       (.I0(count[0]),
        .I1(count[2]),
        .I2(count[1]),
        .O(byteAck_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h5D)) 
    byteAck_i_11
       (.I0(count[5]),
        .I1(count[3]),
        .I2(count[4]),
        .O(byteAck_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h00BF)) 
    byteAck_i_12
       (.I0(count[1]),
        .I1(count[2]),
        .I2(count[0]),
        .I3(byteAck_i_7_n_0),
        .O(byteAck_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    byteAck_i_13
       (.I0(count[1]),
        .I1(count[0]),
        .I2(count[3]),
        .I3(count[2]),
        .O(byteAck_i_13_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    byteAck_i_2
       (.I0(byteAck_i_6_n_0),
        .I1(SDA),
        .O(byteAck_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    byteAck_i_3
       (.I0(SDA),
        .I1(byteAck_i_7_n_0),
        .O(byteAck0));
  LUT6 #(
    .INIT(64'hFFFFEFFF00002000)) 
    byteAck_i_4
       (.I0(byteAck_i_8_n_0),
        .I1(byteAck_i_9_n_0),
        .I2(count[6]),
        .I3(byteAck_i_10_n_0),
        .I4(byteAck_i_11_n_0),
        .I5(byteAck0),
        .O(byteAck_i_4_n_0));
  LUT6 #(
    .INIT(64'h04000000FFFBFFFF)) 
    byteAck_i_6
       (.I0(count[4]),
        .I1(count[5]),
        .I2(count[3]),
        .I3(byteAck_i_12_n_0),
        .I4(count[6]),
        .I5(byteAck_i_7_n_0),
        .O(byteAck_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    byteAck_i_7
       (.I0(\bitCount_reg[3] ),
        .I1(byteAck_i_13_n_0),
        .I2(count[6]),
        .I3(count[7]),
        .I4(count[5]),
        .I5(count[4]),
        .O(byteAck_i_7_n_0));
  LUT3 #(
    .INIT(8'hAB)) 
    byteAck_i_8
       (.I0(byteAck_reg_0),
        .I1(byteAck_i_7_n_0),
        .I2(SDA),
        .O(byteAck_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'hB)) 
    byteAck_i_9
       (.I0(count[4]),
        .I1(count[5]),
        .O(byteAck_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0F20)) 
    \byteCount[0]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(\byteCount[1]_i_2_n_0 ),
        .I3(\byteCount_reg[0]_0 ),
        .O(\byteCount_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h04FF0800)) 
    \byteCount[1]_i_1 
       (.I0(\byteCount_reg[0]_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\byteCount[1]_i_2_n_0 ),
        .I4(\byteCount_reg[1]_0 ),
        .O(\byteCount_reg[1] ));
  LUT6 #(
    .INIT(64'hDFDDFFFFDDDDDDDD)) 
    \byteCount[1]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(count[1]),
        .I3(count[0]),
        .I4(count[2]),
        .I5(\byteCount[1]_i_3_n_0 ),
        .O(\byteCount[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \byteCount[1]_i_3 
       (.I0(byteAck_i_11_n_0),
        .I1(\byteCount[1]_i_4_n_0 ),
        .I2(byteAck_i_9_n_0),
        .I3(byteAck_reg_0),
        .I4(count[7]),
        .I5(count[6]),
        .O(\byteCount[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \byteCount[1]_i_4 
       (.I0(count[1]),
        .I1(count[2]),
        .O(\byteCount[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \count[0]_i_1 
       (.I0(count[0]),
        .I1(\count[7]_i_3_n_0 ),
        .I2(count1),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0006)) 
    \count[1]_i_1 
       (.I0(count[0]),
        .I1(count[1]),
        .I2(\count[7]_i_3_n_0 ),
        .I3(count1),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h00000078)) 
    \count[2]_i_1 
       (.I0(count[0]),
        .I1(count[1]),
        .I2(count[2]),
        .I3(\count[7]_i_3_n_0 ),
        .I4(count1),
        .O(p_0_in[2]));
  LUT6 #(
    .INIT(64'h0000000000007F80)) 
    \count[3]_i_1 
       (.I0(count[1]),
        .I1(count[0]),
        .I2(count[2]),
        .I3(count[3]),
        .I4(\count[7]_i_3_n_0 ),
        .I5(count1),
        .O(p_0_in[3]));
  LUT3 #(
    .INIT(8'hFD)) 
    \count[4]_i_1 
       (.I0(\cs_reg[1] [0]),
        .I1(\cs_reg[1] [1]),
        .I2(\count[4]_i_3_n_0 ),
        .O(E));
  LUT6 #(
    .INIT(64'h0000000000007F80)) 
    \count[4]_i_1__0 
       (.I0(count[2]),
        .I1(\count[4]_i_2_n_0 ),
        .I2(count[3]),
        .I3(count[4]),
        .I4(\count[7]_i_3_n_0 ),
        .I5(count1),
        .O(p_0_in[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \count[4]_i_2 
       (.I0(count[1]),
        .I1(count[0]),
        .O(\count[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00004045)) 
    \count[4]_i_3 
       (.I0(Q[0]),
        .I1(count1),
        .I2(Q[1]),
        .I3(\cs_reg[0] ),
        .I4(sent_reg_0),
        .O(\count[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0006)) 
    \count[5]_i_1 
       (.I0(\count[5]_i_2__0_n_0 ),
        .I1(count[5]),
        .I2(\count[7]_i_3_n_0 ),
        .I3(count1),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \count[5]_i_2__0 
       (.I0(count[4]),
        .I1(count[2]),
        .I2(count[0]),
        .I3(count[1]),
        .I4(count[3]),
        .O(\count[5]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0006)) 
    \count[6]_i_1 
       (.I0(\count[7]_i_2_n_0 ),
        .I1(count[6]),
        .I2(\count[7]_i_3_n_0 ),
        .I3(count1),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h00000078)) 
    \count[7]_i_1 
       (.I0(\count[7]_i_2_n_0 ),
        .I1(count[6]),
        .I2(count[7]),
        .I3(\count[7]_i_3_n_0 ),
        .I4(count1),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count[7]_i_2 
       (.I0(count[5]),
        .I1(count[3]),
        .I2(count[1]),
        .I3(count[0]),
        .I4(count[2]),
        .I5(count[4]),
        .O(\count[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hC1)) 
    \count[7]_i_3 
       (.I0(\cs_reg[0] ),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\count[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \count[7]_i_4 
       (.I0(\count[7]_i_5_n_0 ),
        .I1(count[5]),
        .I2(count[3]),
        .I3(count[4]),
        .O(count1));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hFE000000)) 
    \count[7]_i_5 
       (.I0(count[0]),
        .I1(count[2]),
        .I2(count[1]),
        .I3(count[6]),
        .I4(count[7]),
        .O(\count[7]_i_5_n_0 ));
  FDCE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[0]),
        .Q(count[0]));
  FDCE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[1]),
        .Q(count[1]));
  FDCE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[2]),
        .Q(count[2]));
  FDCE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[3]),
        .Q(count[3]));
  FDCE \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[4]),
        .Q(count[4]));
  FDCE \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[5]),
        .Q(count[5]));
  FDCE \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[6]),
        .Q(count[6]));
  FDCE \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[7]),
        .Q(count[7]));
  LUT6 #(
    .INIT(64'h000000000020FF20)) 
    \cs[0]_i_1__0 
       (.I0(\cs[0]_i_2__0_n_0 ),
        .I1(SCL_INST_0_i_1_n_0),
        .I2(\cs_reg[0] ),
        .I3(Q[0]),
        .I4(ns2),
        .I5(Q[1]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    \cs[0]_i_2__0 
       (.I0(count[1]),
        .I1(count[0]),
        .I2(count[7]),
        .I3(count[4]),
        .I4(count[2]),
        .I5(count[3]),
        .O(\cs[0]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'h0838)) 
    \cs[1]_i_1 
       (.I0(ns2),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(count1),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \cs[1]_i_2 
       (.I0(SCL_INST_0_i_1_n_0),
        .I1(count[1]),
        .I2(count[0]),
        .I3(\cs[1]_i_3_n_0 ),
        .I4(byteAck_reg_0),
        .I5(\byteCount_reg[1]_0 ),
        .O(ns2));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \cs[1]_i_3 
       (.I0(\byteCount_reg[0]_0 ),
        .I1(\bitCount_reg[3] ),
        .I2(count[4]),
        .I3(count[7]),
        .I4(count[3]),
        .I5(count[2]),
        .O(\cs[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000D10000)) 
    sent_i_1__0
       (.I0(\cs_reg[0] ),
        .I1(Q[1]),
        .I2(count1),
        .I3(Q[0]),
        .I4(\cs_reg[1] [0]),
        .I5(\cs_reg[1] [1]),
        .O(sent_reg));
endmodule

(* ORIG_REF_NAME = "counter" *) 
module audioSys_0_counter_4
   (S,
    remainder_preview,
    D,
    CO,
    E,
    Q,
    \remainder_reg[0] ,
    reset,
    remainder0,
    div_en_reg,
    DI,
    \remainder_reg[6] ,
    \remainder_reg[13] ,
    \remainder_reg[14] ,
    \remainder_reg[16] ,
    \remainder_reg[15] ,
    clk);
  output [0:0]S;
  output [0:0]remainder_preview;
  output [0:0]D;
  output [0:0]CO;
  output [0:0]E;
  input [1:0]Q;
  input [0:0]\remainder_reg[0] ;
  input reset;
  input [0:0]remainder0;
  input div_en_reg;
  input [2:0]DI;
  input [2:0]\remainder_reg[6] ;
  input [3:0]\remainder_reg[13] ;
  input [3:0]\remainder_reg[14] ;
  input [0:0]\remainder_reg[16] ;
  input [0:0]\remainder_reg[15] ;
  input clk;

  wire [0:0]CO;
  wire [0:0]D;
  wire [2:0]DI;
  wire [0:0]E;
  wire [1:0]Q;
  wire [0:0]S;
  wire clk;
  wire [4:0]count_reg__0__0;
  wire div_en_reg;
  wire [4:0]p_0_in;
  wire [0:0]remainder0;
  wire \remainder[16]_i_20__0_n_0 ;
  wire \remainder[16]_i_24__0_n_0 ;
  wire \remainder[16]_i_25__0_n_0 ;
  wire [0:0]remainder_preview;
  wire [0:0]\remainder_reg[0] ;
  wire [3:0]\remainder_reg[13] ;
  wire [3:0]\remainder_reg[14] ;
  wire [0:0]\remainder_reg[15] ;
  wire [0:0]\remainder_reg[16] ;
  wire \remainder_reg[16]_i_4__0_n_0 ;
  wire \remainder_reg[16]_i_4__0_n_1 ;
  wire \remainder_reg[16]_i_4__0_n_2 ;
  wire \remainder_reg[16]_i_4__0_n_3 ;
  wire \remainder_reg[16]_i_8__0_n_0 ;
  wire \remainder_reg[16]_i_8__0_n_1 ;
  wire \remainder_reg[16]_i_8__0_n_2 ;
  wire \remainder_reg[16]_i_8__0_n_3 ;
  wire [2:0]\remainder_reg[6] ;
  wire reset;
  wire [3:1]\NLW_remainder_reg[16]_i_2__0_CO_UNCONNECTED ;
  wire [3:0]\NLW_remainder_reg[16]_i_2__0_O_UNCONNECTED ;
  wire [3:0]\NLW_remainder_reg[16]_i_4__0_O_UNCONNECTED ;
  wire [3:0]\NLW_remainder_reg[16]_i_8__0_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_1__1 
       (.I0(div_en_reg),
        .I1(count_reg__0__0[0]),
        .O(p_0_in[0]));
  LUT3 #(
    .INIT(8'hD7)) 
    \count[1]_i_1__1 
       (.I0(div_en_reg),
        .I1(count_reg__0__0[0]),
        .I2(count_reg__0__0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'hA802)) 
    \count[2]_i_1__1 
       (.I0(div_en_reg),
        .I1(count_reg__0__0[1]),
        .I2(count_reg__0__0[0]),
        .I3(count_reg__0__0[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT5 #(
    .INIT(32'hAAA80002)) 
    \count[3]_i_1__1 
       (.I0(div_en_reg),
        .I1(count_reg__0__0[2]),
        .I2(count_reg__0__0[0]),
        .I3(count_reg__0__0[1]),
        .I4(count_reg__0__0[3]),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFD55555557)) 
    \count[4]_i_1__2 
       (.I0(div_en_reg),
        .I1(count_reg__0__0[3]),
        .I2(count_reg__0__0[1]),
        .I3(count_reg__0__0[0]),
        .I4(count_reg__0__0[2]),
        .I5(count_reg__0__0[4]),
        .O(p_0_in[4]));
  FDCE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[0]),
        .Q(count_reg__0__0[0]));
  FDPE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[1]),
        .PRE(reset),
        .Q(count_reg__0__0[1]));
  FDCE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[2]),
        .Q(count_reg__0__0[2]));
  FDCE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[3]),
        .Q(count_reg__0__0[3]));
  FDPE \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[4]),
        .PRE(reset),
        .Q(count_reg__0__0[4]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    \remainder[0]_i_1__0 
       (.I0(remainder0),
        .I1(CO),
        .I2(div_en_reg),
        .I3(remainder_preview),
        .O(D));
  LUT6 #(
    .INIT(64'h0100101100051101)) 
    \remainder[0]_i_2__0 
       (.I0(reset),
        .I1(count_reg__0__0[4]),
        .I2(count_reg__0__0[3]),
        .I3(count_reg__0__0[1]),
        .I4(count_reg__0__0[0]),
        .I5(count_reg__0__0[2]),
        .O(remainder_preview));
  LUT5 #(
    .INIT(32'h040D000C)) 
    \remainder[16]_i_20__0 
       (.I0(Q[0]),
        .I1(\remainder_reg[0] ),
        .I2(reset),
        .I3(Q[1]),
        .I4(\remainder[16]_i_25__0_n_0 ),
        .O(\remainder[16]_i_20__0_n_0 ));
  LUT5 #(
    .INIT(32'h00823341)) 
    \remainder[16]_i_24__0 
       (.I0(\remainder[16]_i_25__0_n_0 ),
        .I1(Q[1]),
        .I2(\remainder_reg[0] ),
        .I3(reset),
        .I4(Q[0]),
        .O(\remainder[16]_i_24__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT5 #(
    .INIT(32'h10450351)) 
    \remainder[16]_i_25__0 
       (.I0(count_reg__0__0[4]),
        .I1(count_reg__0__0[3]),
        .I2(count_reg__0__0[1]),
        .I3(count_reg__0__0[0]),
        .I4(count_reg__0__0[2]),
        .O(\remainder[16]_i_25__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \remainder[3]_i_9__0 
       (.I0(Q[0]),
        .I1(remainder_preview),
        .O(S));
  CARRY4 \remainder_reg[16]_i_2__0 
       (.CI(\remainder_reg[16]_i_4__0_n_0 ),
        .CO({\NLW_remainder_reg[16]_i_2__0_CO_UNCONNECTED [3:1],CO}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\remainder_reg[16] }),
        .O(\NLW_remainder_reg[16]_i_2__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,\remainder_reg[15] }));
  CARRY4 \remainder_reg[16]_i_4__0 
       (.CI(\remainder_reg[16]_i_8__0_n_0 ),
        .CO({\remainder_reg[16]_i_4__0_n_0 ,\remainder_reg[16]_i_4__0_n_1 ,\remainder_reg[16]_i_4__0_n_2 ,\remainder_reg[16]_i_4__0_n_3 }),
        .CYINIT(1'b0),
        .DI(\remainder_reg[13] ),
        .O(\NLW_remainder_reg[16]_i_4__0_O_UNCONNECTED [3:0]),
        .S(\remainder_reg[14] ));
  CARRY4 \remainder_reg[16]_i_8__0 
       (.CI(1'b0),
        .CO({\remainder_reg[16]_i_8__0_n_0 ,\remainder_reg[16]_i_8__0_n_1 ,\remainder_reg[16]_i_8__0_n_2 ,\remainder_reg[16]_i_8__0_n_3 }),
        .CYINIT(1'b1),
        .DI({DI,\remainder[16]_i_20__0_n_0 }),
        .O(\NLW_remainder_reg[16]_i_8__0_O_UNCONNECTED [3:0]),
        .S({\remainder_reg[6] ,\remainder[16]_i_24__0_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \step_size_curr[15]_i_1__0 
       (.I0(count_reg__0__0[4]),
        .I1(count_reg__0__0[3]),
        .I2(count_reg__0__0[2]),
        .I3(count_reg__0__0[1]),
        .I4(count_reg__0__0[0]),
        .O(E));
endmodule

(* ORIG_REF_NAME = "counter" *) 
module audioSys_0_counter_7
   (S,
    remainder_preview,
    D,
    CO,
    E,
    Q,
    \remainder_reg[0] ,
    reset,
    remainder0,
    div_en_reg,
    DI,
    \remainder_reg[6] ,
    \remainder_reg[13] ,
    \remainder_reg[14] ,
    \remainder_reg[16] ,
    \remainder_reg[15] ,
    clk);
  output [0:0]S;
  output [0:0]remainder_preview;
  output [0:0]D;
  output [0:0]CO;
  output [0:0]E;
  input [1:0]Q;
  input [0:0]\remainder_reg[0] ;
  input reset;
  input [0:0]remainder0;
  input div_en_reg;
  input [2:0]DI;
  input [2:0]\remainder_reg[6] ;
  input [3:0]\remainder_reg[13] ;
  input [3:0]\remainder_reg[14] ;
  input [0:0]\remainder_reg[16] ;
  input [0:0]\remainder_reg[15] ;
  input clk;

  wire [0:0]CO;
  wire [0:0]D;
  wire [2:0]DI;
  wire [0:0]E;
  wire [1:0]Q;
  wire [0:0]S;
  wire clk;
  wire [4:0]count_reg__0;
  wire div_en_reg;
  wire [4:0]p_0_in;
  wire [0:0]remainder0;
  wire \remainder[16]_i_20__1_n_0 ;
  wire \remainder[16]_i_24__1_n_0 ;
  wire \remainder[16]_i_25__1_n_0 ;
  wire [0:0]remainder_preview;
  wire [0:0]\remainder_reg[0] ;
  wire [3:0]\remainder_reg[13] ;
  wire [3:0]\remainder_reg[14] ;
  wire [0:0]\remainder_reg[15] ;
  wire [0:0]\remainder_reg[16] ;
  wire \remainder_reg[16]_i_4__1_n_0 ;
  wire \remainder_reg[16]_i_4__1_n_1 ;
  wire \remainder_reg[16]_i_4__1_n_2 ;
  wire \remainder_reg[16]_i_4__1_n_3 ;
  wire \remainder_reg[16]_i_8__1_n_0 ;
  wire \remainder_reg[16]_i_8__1_n_1 ;
  wire \remainder_reg[16]_i_8__1_n_2 ;
  wire \remainder_reg[16]_i_8__1_n_3 ;
  wire [2:0]\remainder_reg[6] ;
  wire reset;
  wire [3:1]\NLW_remainder_reg[16]_i_2__1_CO_UNCONNECTED ;
  wire [3:0]\NLW_remainder_reg[16]_i_2__1_O_UNCONNECTED ;
  wire [3:0]\NLW_remainder_reg[16]_i_4__1_O_UNCONNECTED ;
  wire [3:0]\NLW_remainder_reg[16]_i_8__1_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_1__2 
       (.I0(div_en_reg),
        .I1(count_reg__0[0]),
        .O(p_0_in[0]));
  LUT3 #(
    .INIT(8'hD7)) 
    \count[1]_i_1__2 
       (.I0(div_en_reg),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'hA802)) 
    \count[2]_i_1__2 
       (.I0(div_en_reg),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT5 #(
    .INIT(32'hAAA80002)) 
    \count[3]_i_1__2 
       (.I0(div_en_reg),
        .I1(count_reg__0[2]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[3]),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFD55555557)) 
    \count[4]_i_1__3 
       (.I0(div_en_reg),
        .I1(count_reg__0[3]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[2]),
        .I5(count_reg__0[4]),
        .O(p_0_in[4]));
  FDCE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[0]),
        .Q(count_reg__0[0]));
  FDPE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[1]),
        .PRE(reset),
        .Q(count_reg__0[1]));
  FDCE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[2]),
        .Q(count_reg__0[2]));
  FDCE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in[3]),
        .Q(count_reg__0[3]));
  FDPE \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[4]),
        .PRE(reset),
        .Q(count_reg__0[4]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    \remainder[0]_i_1__1 
       (.I0(remainder0),
        .I1(CO),
        .I2(div_en_reg),
        .I3(remainder_preview),
        .O(D));
  LUT6 #(
    .INIT(64'h0100101100051101)) 
    \remainder[0]_i_2__1 
       (.I0(reset),
        .I1(count_reg__0[4]),
        .I2(count_reg__0[3]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[0]),
        .I5(count_reg__0[2]),
        .O(remainder_preview));
  LUT5 #(
    .INIT(32'h040D000C)) 
    \remainder[16]_i_20__1 
       (.I0(Q[0]),
        .I1(\remainder_reg[0] ),
        .I2(reset),
        .I3(Q[1]),
        .I4(\remainder[16]_i_25__1_n_0 ),
        .O(\remainder[16]_i_20__1_n_0 ));
  LUT5 #(
    .INIT(32'h00823341)) 
    \remainder[16]_i_24__1 
       (.I0(\remainder[16]_i_25__1_n_0 ),
        .I1(Q[1]),
        .I2(\remainder_reg[0] ),
        .I3(reset),
        .I4(Q[0]),
        .O(\remainder[16]_i_24__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h10450351)) 
    \remainder[16]_i_25__1 
       (.I0(count_reg__0[4]),
        .I1(count_reg__0[3]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[2]),
        .O(\remainder[16]_i_25__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \remainder[3]_i_9__1 
       (.I0(Q[0]),
        .I1(remainder_preview),
        .O(S));
  CARRY4 \remainder_reg[16]_i_2__1 
       (.CI(\remainder_reg[16]_i_4__1_n_0 ),
        .CO({\NLW_remainder_reg[16]_i_2__1_CO_UNCONNECTED [3:1],CO}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\remainder_reg[16] }),
        .O(\NLW_remainder_reg[16]_i_2__1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,\remainder_reg[15] }));
  CARRY4 \remainder_reg[16]_i_4__1 
       (.CI(\remainder_reg[16]_i_8__1_n_0 ),
        .CO({\remainder_reg[16]_i_4__1_n_0 ,\remainder_reg[16]_i_4__1_n_1 ,\remainder_reg[16]_i_4__1_n_2 ,\remainder_reg[16]_i_4__1_n_3 }),
        .CYINIT(1'b0),
        .DI(\remainder_reg[13] ),
        .O(\NLW_remainder_reg[16]_i_4__1_O_UNCONNECTED [3:0]),
        .S(\remainder_reg[14] ));
  CARRY4 \remainder_reg[16]_i_8__1 
       (.CI(1'b0),
        .CO({\remainder_reg[16]_i_8__1_n_0 ,\remainder_reg[16]_i_8__1_n_1 ,\remainder_reg[16]_i_8__1_n_2 ,\remainder_reg[16]_i_8__1_n_3 }),
        .CYINIT(1'b1),
        .DI({DI,\remainder[16]_i_20__1_n_0 }),
        .O(\NLW_remainder_reg[16]_i_8__1_O_UNCONNECTED [3:0]),
        .S({\remainder_reg[6] ,\remainder[16]_i_24__1_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \step_size_curr[15]_i_1__1 
       (.I0(count_reg__0[4]),
        .I1(count_reg__0[3]),
        .I2(count_reg__0[2]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[0]),
        .O(E));
endmodule

(* ORIG_REF_NAME = "dacInterface" *) 
module audioSys_0_dacInterface
   (Q,
    SDATA,
    BCLK,
    MCLK,
    SCL,
    step,
    LRCLK,
    SDA,
    atten_valid_freq,
    atten_valid,
    \waveform_atten_freq_reg[0] ,
    \waveform_atten_freq_reg[0]_0 ,
    \waveform_atten_freq_reg[0]_1 ,
    clk,
    reset,
    D);
  output [0:0]Q;
  output SDATA;
  output BCLK;
  output MCLK;
  output SCL;
  output step;
  output LRCLK;
  inout SDA;
  input [2:0]atten_valid_freq;
  input atten_valid;
  input \waveform_atten_freq_reg[0] ;
  input \waveform_atten_freq_reg[0]_0 ;
  input \waveform_atten_freq_reg[0]_1 ;
  input clk;
  input reset;
  input [0:0]D;

  wire BCLK;
  wire [0:0]D;
  wire LRCLK;
  wire MCLK;
  wire [0:0]Q;
  wire SCL;
  wire SDA;
  wire SDATA;
  wire atten_valid;
  wire [2:0]atten_valid_freq;
  wire clk;
  wire control_n_0;
  wire control_n_2;
  wire \count[0]_i_1__4_n_0 ;
  wire \count[1]_i_1__7_n_0 ;
  wire \count[2]_i_1__4_n_0 ;
  wire \count[3]_i_1__4_n_0 ;
  wire \count[4]_i_2__0_n_0 ;
  wire \count[4]_i_4_n_0 ;
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[2] ;
  wire \count_reg_n_0_[3] ;
  wire \count_reg_n_0_[4] ;
  wire [1:0]cs;
  wire \cs[0]_i_10_n_0 ;
  wire \cs[0]_i_11_n_0 ;
  wire \cs[0]_i_12_n_0 ;
  wire \cs[0]_i_1_n_0 ;
  wire \cs[0]_i_2_n_0 ;
  wire \cs[0]_i_3_n_0 ;
  wire \cs[0]_i_4_n_0 ;
  wire \cs[0]_i_5_n_0 ;
  wire \cs[0]_i_6_n_0 ;
  wire \cs[0]_i_7_n_0 ;
  wire \cs[0]_i_8_n_0 ;
  wire \cs[0]_i_9_n_0 ;
  wire \cs[1]_i_1__0_n_0 ;
  wire [31:0]initialization;
  wire \initialization[0]_i_1_n_0 ;
  wire \initialization[10]_i_1_n_0 ;
  wire \initialization[11]_i_1_n_0 ;
  wire \initialization[12]_i_1_n_0 ;
  wire \initialization[12]_i_3_n_0 ;
  wire \initialization[12]_i_4_n_0 ;
  wire \initialization[12]_i_5_n_0 ;
  wire \initialization[12]_i_6_n_0 ;
  wire \initialization[13]_i_1_n_0 ;
  wire \initialization[14]_i_1_n_0 ;
  wire \initialization[15]_i_1_n_0 ;
  wire \initialization[16]_i_1_n_0 ;
  wire \initialization[16]_i_3_n_0 ;
  wire \initialization[16]_i_4_n_0 ;
  wire \initialization[16]_i_5_n_0 ;
  wire \initialization[16]_i_6_n_0 ;
  wire \initialization[17]_i_1_n_0 ;
  wire \initialization[18]_i_1_n_0 ;
  wire \initialization[19]_i_1_n_0 ;
  wire \initialization[1]_i_1_n_0 ;
  wire \initialization[20]_i_1_n_0 ;
  wire \initialization[20]_i_3_n_0 ;
  wire \initialization[20]_i_4_n_0 ;
  wire \initialization[20]_i_5_n_0 ;
  wire \initialization[20]_i_6_n_0 ;
  wire \initialization[21]_i_1_n_0 ;
  wire \initialization[22]_i_1_n_0 ;
  wire \initialization[23]_i_1_n_0 ;
  wire \initialization[24]_i_1_n_0 ;
  wire \initialization[24]_i_3_n_0 ;
  wire \initialization[24]_i_4_n_0 ;
  wire \initialization[24]_i_5_n_0 ;
  wire \initialization[24]_i_6_n_0 ;
  wire \initialization[25]_i_1_n_0 ;
  wire \initialization[26]_i_1_n_0 ;
  wire \initialization[27]_i_1_n_0 ;
  wire \initialization[28]_i_1_n_0 ;
  wire \initialization[28]_i_3_n_0 ;
  wire \initialization[28]_i_4_n_0 ;
  wire \initialization[28]_i_5_n_0 ;
  wire \initialization[28]_i_6_n_0 ;
  wire \initialization[29]_i_1_n_0 ;
  wire \initialization[2]_i_1_n_0 ;
  wire \initialization[30]_i_1_n_0 ;
  wire \initialization[31]_i_1_n_0 ;
  wire \initialization[31]_i_3_n_0 ;
  wire \initialization[31]_i_4_n_0 ;
  wire \initialization[31]_i_5_n_0 ;
  wire \initialization[3]_i_1_n_0 ;
  wire \initialization[4]_i_1_n_0 ;
  wire \initialization[4]_i_3_n_0 ;
  wire \initialization[4]_i_4_n_0 ;
  wire \initialization[4]_i_5_n_0 ;
  wire \initialization[4]_i_6_n_0 ;
  wire \initialization[5]_i_1_n_0 ;
  wire \initialization[6]_i_1_n_0 ;
  wire \initialization[7]_i_1_n_0 ;
  wire \initialization[8]_i_1_n_0 ;
  wire \initialization[8]_i_3_n_0 ;
  wire \initialization[8]_i_4_n_0 ;
  wire \initialization[8]_i_5_n_0 ;
  wire \initialization[8]_i_6_n_0 ;
  wire \initialization[9]_i_1_n_0 ;
  wire \initialization_reg[12]_i_2_n_0 ;
  wire \initialization_reg[12]_i_2_n_1 ;
  wire \initialization_reg[12]_i_2_n_2 ;
  wire \initialization_reg[12]_i_2_n_3 ;
  wire \initialization_reg[12]_i_2_n_4 ;
  wire \initialization_reg[12]_i_2_n_5 ;
  wire \initialization_reg[12]_i_2_n_6 ;
  wire \initialization_reg[12]_i_2_n_7 ;
  wire \initialization_reg[16]_i_2_n_0 ;
  wire \initialization_reg[16]_i_2_n_1 ;
  wire \initialization_reg[16]_i_2_n_2 ;
  wire \initialization_reg[16]_i_2_n_3 ;
  wire \initialization_reg[16]_i_2_n_4 ;
  wire \initialization_reg[16]_i_2_n_5 ;
  wire \initialization_reg[16]_i_2_n_6 ;
  wire \initialization_reg[16]_i_2_n_7 ;
  wire \initialization_reg[20]_i_2_n_0 ;
  wire \initialization_reg[20]_i_2_n_1 ;
  wire \initialization_reg[20]_i_2_n_2 ;
  wire \initialization_reg[20]_i_2_n_3 ;
  wire \initialization_reg[20]_i_2_n_4 ;
  wire \initialization_reg[20]_i_2_n_5 ;
  wire \initialization_reg[20]_i_2_n_6 ;
  wire \initialization_reg[20]_i_2_n_7 ;
  wire \initialization_reg[24]_i_2_n_0 ;
  wire \initialization_reg[24]_i_2_n_1 ;
  wire \initialization_reg[24]_i_2_n_2 ;
  wire \initialization_reg[24]_i_2_n_3 ;
  wire \initialization_reg[24]_i_2_n_4 ;
  wire \initialization_reg[24]_i_2_n_5 ;
  wire \initialization_reg[24]_i_2_n_6 ;
  wire \initialization_reg[24]_i_2_n_7 ;
  wire \initialization_reg[28]_i_2_n_0 ;
  wire \initialization_reg[28]_i_2_n_1 ;
  wire \initialization_reg[28]_i_2_n_2 ;
  wire \initialization_reg[28]_i_2_n_3 ;
  wire \initialization_reg[28]_i_2_n_4 ;
  wire \initialization_reg[28]_i_2_n_5 ;
  wire \initialization_reg[28]_i_2_n_6 ;
  wire \initialization_reg[28]_i_2_n_7 ;
  wire \initialization_reg[31]_i_2_n_2 ;
  wire \initialization_reg[31]_i_2_n_3 ;
  wire \initialization_reg[31]_i_2_n_5 ;
  wire \initialization_reg[31]_i_2_n_6 ;
  wire \initialization_reg[31]_i_2_n_7 ;
  wire \initialization_reg[4]_i_2_n_0 ;
  wire \initialization_reg[4]_i_2_n_1 ;
  wire \initialization_reg[4]_i_2_n_2 ;
  wire \initialization_reg[4]_i_2_n_3 ;
  wire \initialization_reg[4]_i_2_n_4 ;
  wire \initialization_reg[4]_i_2_n_5 ;
  wire \initialization_reg[4]_i_2_n_6 ;
  wire \initialization_reg[4]_i_2_n_7 ;
  wire \initialization_reg[8]_i_2_n_0 ;
  wire \initialization_reg[8]_i_2_n_1 ;
  wire \initialization_reg[8]_i_2_n_2 ;
  wire \initialization_reg[8]_i_2_n_3 ;
  wire \initialization_reg[8]_i_2_n_4 ;
  wire \initialization_reg[8]_i_2_n_5 ;
  wire \initialization_reg[8]_i_2_n_6 ;
  wire \initialization_reg[8]_i_2_n_7 ;
  wire locked;
  wire reset;
  wire sent_reg_n_0;
  wire step;
  wire \waveform_atten_freq_reg[0] ;
  wire \waveform_atten_freq_reg[0]_0 ;
  wire \waveform_atten_freq_reg[0]_1 ;
  wire [3:2]\NLW_initialization_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_initialization_reg[31]_i_2_O_UNCONNECTED ;

  audioSys_0_I2C control
       (.E(control_n_2),
        .Q({\count_reg_n_0_[4] ,\count_reg_n_0_[3] ,\count_reg_n_0_[2] ,\count_reg_n_0_[1] ,\count_reg_n_0_[0] }),
        .SCL(SCL),
        .SDA(SDA),
        .clk(clk),
        .\cs_reg[1]_0 (cs),
        .reset(reset),
        .sent_reg(control_n_0),
        .sent_reg_0(sent_reg_n_0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \count[0]_i_1__4 
       (.I0(\count_reg_n_0_[0] ),
        .I1(cs[0]),
        .I2(cs[1]),
        .O(\count[0]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h0060)) 
    \count[1]_i_1__7 
       (.I0(\count_reg_n_0_[0] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(cs[0]),
        .I3(cs[1]),
        .O(\count[1]_i_1__7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h00007800)) 
    \count[2]_i_1__4 
       (.I0(\count_reg_n_0_[0] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[2] ),
        .I3(cs[0]),
        .I4(cs[1]),
        .O(\count[2]_i_1__4_n_0 ));
  LUT6 #(
    .INIT(64'h000000007F800000)) 
    \count[3]_i_1__4 
       (.I0(\count_reg_n_0_[1] ),
        .I1(\count_reg_n_0_[0] ),
        .I2(\count_reg_n_0_[2] ),
        .I3(\count_reg_n_0_[3] ),
        .I4(cs[0]),
        .I5(cs[1]),
        .O(\count[3]_i_1__4_n_0 ));
  LUT5 #(
    .INIT(32'h00007800)) 
    \count[4]_i_2__0 
       (.I0(\count[4]_i_4_n_0 ),
        .I1(\count_reg_n_0_[3] ),
        .I2(\count_reg_n_0_[4] ),
        .I3(cs[0]),
        .I4(cs[1]),
        .O(\count[4]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \count[4]_i_4 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[0] ),
        .I2(\count_reg_n_0_[1] ),
        .O(\count[4]_i_4_n_0 ));
  FDCE \count_reg[0] 
       (.C(clk),
        .CE(control_n_2),
        .CLR(reset),
        .D(\count[0]_i_1__4_n_0 ),
        .Q(\count_reg_n_0_[0] ));
  FDCE \count_reg[1] 
       (.C(clk),
        .CE(control_n_2),
        .CLR(reset),
        .D(\count[1]_i_1__7_n_0 ),
        .Q(\count_reg_n_0_[1] ));
  FDCE \count_reg[2] 
       (.C(clk),
        .CE(control_n_2),
        .CLR(reset),
        .D(\count[2]_i_1__4_n_0 ),
        .Q(\count_reg_n_0_[2] ));
  FDCE \count_reg[3] 
       (.C(clk),
        .CE(control_n_2),
        .CLR(reset),
        .D(\count[3]_i_1__4_n_0 ),
        .Q(\count_reg_n_0_[3] ));
  FDCE \count_reg[4] 
       (.C(clk),
        .CE(control_n_2),
        .CLR(reset),
        .D(\count[4]_i_2__0_n_0 ),
        .Q(\count_reg_n_0_[4] ));
  LUT6 #(
    .INIT(64'h7444744474444444)) 
    \cs[0]_i_1 
       (.I0(\cs[0]_i_2_n_0 ),
        .I1(cs[0]),
        .I2(\cs[0]_i_3_n_0 ),
        .I3(\cs[0]_i_4_n_0 ),
        .I4(initialization[15]),
        .I5(\cs[0]_i_5_n_0 ),
        .O(\cs[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \cs[0]_i_10 
       (.I0(initialization[9]),
        .I1(initialization[8]),
        .O(\cs[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cs[0]_i_11 
       (.I0(initialization[29]),
        .I1(initialization[31]),
        .I2(initialization[27]),
        .I3(initialization[28]),
        .I4(initialization[30]),
        .I5(\cs[0]_i_12_n_0 ),
        .O(\cs[0]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cs[0]_i_12 
       (.I0(initialization[25]),
        .I1(initialization[26]),
        .I2(initialization[22]),
        .I3(initialization[21]),
        .I4(initialization[24]),
        .I5(initialization[23]),
        .O(\cs[0]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h00008880)) 
    \cs[0]_i_2 
       (.I0(\count_reg_n_0_[4] ),
        .I1(\count_reg_n_0_[3] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[2] ),
        .I4(cs[1]),
        .O(\cs[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cs[0]_i_3 
       (.I0(initialization[6]),
        .I1(initialization[8]),
        .I2(initialization[9]),
        .I3(\cs[0]_i_6_n_0 ),
        .I4(\cs[0]_i_7_n_0 ),
        .O(\cs[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hC0C08080C0C08000)) 
    \cs[0]_i_4 
       (.I0(initialization[10]),
        .I1(\cs[0]_i_8_n_0 ),
        .I2(\cs[0]_i_9_n_0 ),
        .I3(initialization[7]),
        .I4(\cs[0]_i_6_n_0 ),
        .I5(\cs[0]_i_10_n_0 ),
        .O(\cs[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \cs[0]_i_5 
       (.I0(initialization[16]),
        .I1(\cs[0]_i_11_n_0 ),
        .O(\cs[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cs[0]_i_6 
       (.I0(initialization[12]),
        .I1(initialization[11]),
        .I2(initialization[14]),
        .I3(initialization[13]),
        .I4(\cs[0]_i_11_n_0 ),
        .I5(initialization[16]),
        .O(\cs[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cs[0]_i_7 
       (.I0(initialization[4]),
        .I1(initialization[5]),
        .I2(initialization[0]),
        .I3(initialization[3]),
        .I4(initialization[2]),
        .I5(initialization[1]),
        .O(\cs[0]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    \cs[0]_i_8 
       (.I0(initialization[18]),
        .I1(initialization[17]),
        .I2(initialization[19]),
        .I3(initialization[20]),
        .I4(\cs[0]_i_11_n_0 ),
        .O(\cs[0]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cs[0]_i_9 
       (.I0(locked),
        .I1(cs[1]),
        .O(\cs[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF88800000)) 
    \cs[1]_i_1__0 
       (.I0(\count_reg_n_0_[4] ),
        .I1(\count_reg_n_0_[3] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[2] ),
        .I4(cs[0]),
        .I5(cs[1]),
        .O(\cs[1]_i_1__0_n_0 ));
  FDCE \cs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\cs[0]_i_1_n_0 ),
        .Q(cs[0]));
  FDCE \cs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\cs[1]_i_1__0_n_0 ),
        .Q(cs[1]));
  audioSys_0_serialInterface dacVal
       (.CLK(BCLK),
        .D(D),
        .LRCLK(LRCLK),
        .Q(Q),
        .SDATA(SDATA),
        .atten_valid(atten_valid),
        .atten_valid_freq(atten_valid_freq),
        .\cs_reg[1] (cs),
        .reset(reset),
        .step(step),
        .\waveform_atten_freq_reg[0] (\waveform_atten_freq_reg[0] ),
        .\waveform_atten_freq_reg[0]_0 (\waveform_atten_freq_reg[0]_0 ),
        .\waveform_atten_freq_reg[0]_1 (\waveform_atten_freq_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \initialization[0]_i_1 
       (.I0(initialization[0]),
        .I1(cs[0]),
        .I2(cs[1]),
        .O(\initialization[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[10]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[12]_i_2_n_6 ),
        .I2(cs[1]),
        .O(\initialization[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[11]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[12]_i_2_n_5 ),
        .I2(cs[1]),
        .O(\initialization[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[12]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[12]_i_2_n_4 ),
        .I2(cs[1]),
        .O(\initialization[12]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[12]_i_3 
       (.I0(initialization[12]),
        .O(\initialization[12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[12]_i_4 
       (.I0(initialization[11]),
        .O(\initialization[12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[12]_i_5 
       (.I0(initialization[10]),
        .O(\initialization[12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[12]_i_6 
       (.I0(initialization[9]),
        .O(\initialization[12]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[13]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[16]_i_2_n_7 ),
        .I2(cs[1]),
        .O(\initialization[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[14]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[16]_i_2_n_6 ),
        .I2(cs[1]),
        .O(\initialization[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[15]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[16]_i_2_n_5 ),
        .I2(cs[1]),
        .O(\initialization[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[16]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[16]_i_2_n_4 ),
        .I2(cs[1]),
        .O(\initialization[16]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[16]_i_3 
       (.I0(initialization[16]),
        .O(\initialization[16]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[16]_i_4 
       (.I0(initialization[15]),
        .O(\initialization[16]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[16]_i_5 
       (.I0(initialization[14]),
        .O(\initialization[16]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[16]_i_6 
       (.I0(initialization[13]),
        .O(\initialization[16]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[17]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[20]_i_2_n_7 ),
        .I2(cs[1]),
        .O(\initialization[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[18]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[20]_i_2_n_6 ),
        .I2(cs[1]),
        .O(\initialization[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[19]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[20]_i_2_n_5 ),
        .I2(cs[1]),
        .O(\initialization[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[1]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[4]_i_2_n_7 ),
        .I2(cs[1]),
        .O(\initialization[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[20]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[20]_i_2_n_4 ),
        .I2(cs[1]),
        .O(\initialization[20]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[20]_i_3 
       (.I0(initialization[20]),
        .O(\initialization[20]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[20]_i_4 
       (.I0(initialization[19]),
        .O(\initialization[20]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[20]_i_5 
       (.I0(initialization[18]),
        .O(\initialization[20]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[20]_i_6 
       (.I0(initialization[17]),
        .O(\initialization[20]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[21]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[24]_i_2_n_7 ),
        .I2(cs[1]),
        .O(\initialization[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[22]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[24]_i_2_n_6 ),
        .I2(cs[1]),
        .O(\initialization[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[23]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[24]_i_2_n_5 ),
        .I2(cs[1]),
        .O(\initialization[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[24]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[24]_i_2_n_4 ),
        .I2(cs[1]),
        .O(\initialization[24]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[24]_i_3 
       (.I0(initialization[24]),
        .O(\initialization[24]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[24]_i_4 
       (.I0(initialization[23]),
        .O(\initialization[24]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[24]_i_5 
       (.I0(initialization[22]),
        .O(\initialization[24]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[24]_i_6 
       (.I0(initialization[21]),
        .O(\initialization[24]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[25]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[28]_i_2_n_7 ),
        .I2(cs[1]),
        .O(\initialization[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[26]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[28]_i_2_n_6 ),
        .I2(cs[1]),
        .O(\initialization[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[27]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[28]_i_2_n_5 ),
        .I2(cs[1]),
        .O(\initialization[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[28]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[28]_i_2_n_4 ),
        .I2(cs[1]),
        .O(\initialization[28]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[28]_i_3 
       (.I0(initialization[28]),
        .O(\initialization[28]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[28]_i_4 
       (.I0(initialization[27]),
        .O(\initialization[28]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[28]_i_5 
       (.I0(initialization[26]),
        .O(\initialization[28]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[28]_i_6 
       (.I0(initialization[25]),
        .O(\initialization[28]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[29]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[31]_i_2_n_7 ),
        .I2(cs[1]),
        .O(\initialization[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[2]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[4]_i_2_n_6 ),
        .I2(cs[1]),
        .O(\initialization[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[30]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[31]_i_2_n_6 ),
        .I2(cs[1]),
        .O(\initialization[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[31]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[31]_i_2_n_5 ),
        .I2(cs[1]),
        .O(\initialization[31]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[31]_i_3 
       (.I0(initialization[31]),
        .O(\initialization[31]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[31]_i_4 
       (.I0(initialization[30]),
        .O(\initialization[31]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[31]_i_5 
       (.I0(initialization[29]),
        .O(\initialization[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[3]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[4]_i_2_n_5 ),
        .I2(cs[1]),
        .O(\initialization[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[4]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[4]_i_2_n_4 ),
        .I2(cs[1]),
        .O(\initialization[4]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[4]_i_3 
       (.I0(initialization[4]),
        .O(\initialization[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[4]_i_4 
       (.I0(initialization[3]),
        .O(\initialization[4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[4]_i_5 
       (.I0(initialization[2]),
        .O(\initialization[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[4]_i_6 
       (.I0(initialization[1]),
        .O(\initialization[4]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[5]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[8]_i_2_n_7 ),
        .I2(cs[1]),
        .O(\initialization[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[6]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[8]_i_2_n_6 ),
        .I2(cs[1]),
        .O(\initialization[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[7]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[8]_i_2_n_5 ),
        .I2(cs[1]),
        .O(\initialization[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[8]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[8]_i_2_n_4 ),
        .I2(cs[1]),
        .O(\initialization[8]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[8]_i_3 
       (.I0(initialization[8]),
        .O(\initialization[8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[8]_i_4 
       (.I0(initialization[7]),
        .O(\initialization[8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[8]_i_5 
       (.I0(initialization[6]),
        .O(\initialization[8]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \initialization[8]_i_6 
       (.I0(initialization[5]),
        .O(\initialization[8]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \initialization[9]_i_1 
       (.I0(cs[0]),
        .I1(\initialization_reg[12]_i_2_n_7 ),
        .I2(cs[1]),
        .O(\initialization[9]_i_1_n_0 ));
  FDCE \initialization_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[0]_i_1_n_0 ),
        .Q(initialization[0]));
  FDCE \initialization_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[10]_i_1_n_0 ),
        .Q(initialization[10]));
  FDCE \initialization_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[11]_i_1_n_0 ),
        .Q(initialization[11]));
  FDCE \initialization_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[12]_i_1_n_0 ),
        .Q(initialization[12]));
  CARRY4 \initialization_reg[12]_i_2 
       (.CI(\initialization_reg[8]_i_2_n_0 ),
        .CO({\initialization_reg[12]_i_2_n_0 ,\initialization_reg[12]_i_2_n_1 ,\initialization_reg[12]_i_2_n_2 ,\initialization_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\initialization_reg[12]_i_2_n_4 ,\initialization_reg[12]_i_2_n_5 ,\initialization_reg[12]_i_2_n_6 ,\initialization_reg[12]_i_2_n_7 }),
        .S({\initialization[12]_i_3_n_0 ,\initialization[12]_i_4_n_0 ,\initialization[12]_i_5_n_0 ,\initialization[12]_i_6_n_0 }));
  FDCE \initialization_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[13]_i_1_n_0 ),
        .Q(initialization[13]));
  FDCE \initialization_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[14]_i_1_n_0 ),
        .Q(initialization[14]));
  FDCE \initialization_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[15]_i_1_n_0 ),
        .Q(initialization[15]));
  FDCE \initialization_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[16]_i_1_n_0 ),
        .Q(initialization[16]));
  CARRY4 \initialization_reg[16]_i_2 
       (.CI(\initialization_reg[12]_i_2_n_0 ),
        .CO({\initialization_reg[16]_i_2_n_0 ,\initialization_reg[16]_i_2_n_1 ,\initialization_reg[16]_i_2_n_2 ,\initialization_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\initialization_reg[16]_i_2_n_4 ,\initialization_reg[16]_i_2_n_5 ,\initialization_reg[16]_i_2_n_6 ,\initialization_reg[16]_i_2_n_7 }),
        .S({\initialization[16]_i_3_n_0 ,\initialization[16]_i_4_n_0 ,\initialization[16]_i_5_n_0 ,\initialization[16]_i_6_n_0 }));
  FDCE \initialization_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[17]_i_1_n_0 ),
        .Q(initialization[17]));
  FDCE \initialization_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[18]_i_1_n_0 ),
        .Q(initialization[18]));
  FDCE \initialization_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[19]_i_1_n_0 ),
        .Q(initialization[19]));
  FDCE \initialization_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[1]_i_1_n_0 ),
        .Q(initialization[1]));
  FDCE \initialization_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[20]_i_1_n_0 ),
        .Q(initialization[20]));
  CARRY4 \initialization_reg[20]_i_2 
       (.CI(\initialization_reg[16]_i_2_n_0 ),
        .CO({\initialization_reg[20]_i_2_n_0 ,\initialization_reg[20]_i_2_n_1 ,\initialization_reg[20]_i_2_n_2 ,\initialization_reg[20]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\initialization_reg[20]_i_2_n_4 ,\initialization_reg[20]_i_2_n_5 ,\initialization_reg[20]_i_2_n_6 ,\initialization_reg[20]_i_2_n_7 }),
        .S({\initialization[20]_i_3_n_0 ,\initialization[20]_i_4_n_0 ,\initialization[20]_i_5_n_0 ,\initialization[20]_i_6_n_0 }));
  FDCE \initialization_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[21]_i_1_n_0 ),
        .Q(initialization[21]));
  FDCE \initialization_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[22]_i_1_n_0 ),
        .Q(initialization[22]));
  FDCE \initialization_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[23]_i_1_n_0 ),
        .Q(initialization[23]));
  FDCE \initialization_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[24]_i_1_n_0 ),
        .Q(initialization[24]));
  CARRY4 \initialization_reg[24]_i_2 
       (.CI(\initialization_reg[20]_i_2_n_0 ),
        .CO({\initialization_reg[24]_i_2_n_0 ,\initialization_reg[24]_i_2_n_1 ,\initialization_reg[24]_i_2_n_2 ,\initialization_reg[24]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\initialization_reg[24]_i_2_n_4 ,\initialization_reg[24]_i_2_n_5 ,\initialization_reg[24]_i_2_n_6 ,\initialization_reg[24]_i_2_n_7 }),
        .S({\initialization[24]_i_3_n_0 ,\initialization[24]_i_4_n_0 ,\initialization[24]_i_5_n_0 ,\initialization[24]_i_6_n_0 }));
  FDCE \initialization_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[25]_i_1_n_0 ),
        .Q(initialization[25]));
  FDCE \initialization_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[26]_i_1_n_0 ),
        .Q(initialization[26]));
  FDCE \initialization_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[27]_i_1_n_0 ),
        .Q(initialization[27]));
  FDCE \initialization_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[28]_i_1_n_0 ),
        .Q(initialization[28]));
  CARRY4 \initialization_reg[28]_i_2 
       (.CI(\initialization_reg[24]_i_2_n_0 ),
        .CO({\initialization_reg[28]_i_2_n_0 ,\initialization_reg[28]_i_2_n_1 ,\initialization_reg[28]_i_2_n_2 ,\initialization_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\initialization_reg[28]_i_2_n_4 ,\initialization_reg[28]_i_2_n_5 ,\initialization_reg[28]_i_2_n_6 ,\initialization_reg[28]_i_2_n_7 }),
        .S({\initialization[28]_i_3_n_0 ,\initialization[28]_i_4_n_0 ,\initialization[28]_i_5_n_0 ,\initialization[28]_i_6_n_0 }));
  FDCE \initialization_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[29]_i_1_n_0 ),
        .Q(initialization[29]));
  FDCE \initialization_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[2]_i_1_n_0 ),
        .Q(initialization[2]));
  FDCE \initialization_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[30]_i_1_n_0 ),
        .Q(initialization[30]));
  FDCE \initialization_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[31]_i_1_n_0 ),
        .Q(initialization[31]));
  CARRY4 \initialization_reg[31]_i_2 
       (.CI(\initialization_reg[28]_i_2_n_0 ),
        .CO({\NLW_initialization_reg[31]_i_2_CO_UNCONNECTED [3:2],\initialization_reg[31]_i_2_n_2 ,\initialization_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_initialization_reg[31]_i_2_O_UNCONNECTED [3],\initialization_reg[31]_i_2_n_5 ,\initialization_reg[31]_i_2_n_6 ,\initialization_reg[31]_i_2_n_7 }),
        .S({1'b0,\initialization[31]_i_3_n_0 ,\initialization[31]_i_4_n_0 ,\initialization[31]_i_5_n_0 }));
  FDCE \initialization_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[3]_i_1_n_0 ),
        .Q(initialization[3]));
  FDCE \initialization_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[4]_i_1_n_0 ),
        .Q(initialization[4]));
  CARRY4 \initialization_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\initialization_reg[4]_i_2_n_0 ,\initialization_reg[4]_i_2_n_1 ,\initialization_reg[4]_i_2_n_2 ,\initialization_reg[4]_i_2_n_3 }),
        .CYINIT(initialization[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\initialization_reg[4]_i_2_n_4 ,\initialization_reg[4]_i_2_n_5 ,\initialization_reg[4]_i_2_n_6 ,\initialization_reg[4]_i_2_n_7 }),
        .S({\initialization[4]_i_3_n_0 ,\initialization[4]_i_4_n_0 ,\initialization[4]_i_5_n_0 ,\initialization[4]_i_6_n_0 }));
  FDCE \initialization_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[5]_i_1_n_0 ),
        .Q(initialization[5]));
  FDCE \initialization_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[6]_i_1_n_0 ),
        .Q(initialization[6]));
  FDCE \initialization_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[7]_i_1_n_0 ),
        .Q(initialization[7]));
  FDCE \initialization_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[8]_i_1_n_0 ),
        .Q(initialization[8]));
  CARRY4 \initialization_reg[8]_i_2 
       (.CI(\initialization_reg[4]_i_2_n_0 ),
        .CO({\initialization_reg[8]_i_2_n_0 ,\initialization_reg[8]_i_2_n_1 ,\initialization_reg[8]_i_2_n_2 ,\initialization_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\initialization_reg[8]_i_2_n_4 ,\initialization_reg[8]_i_2_n_5 ,\initialization_reg[8]_i_2_n_6 ,\initialization_reg[8]_i_2_n_7 }),
        .S({\initialization[8]_i_3_n_0 ,\initialization[8]_i_4_n_0 ,\initialization[8]_i_5_n_0 ,\initialization[8]_i_6_n_0 }));
  FDCE \initialization_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\initialization[9]_i_1_n_0 ),
        .Q(initialization[9]));
  FDCE sent_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(control_n_0),
        .Q(sent_reg_n_0));
  audioSys_0_BCLKGen serialBCLock
       (.BCLK(BCLK),
        .MCLK(MCLK),
        .locked(locked),
        .reset(reset));
  (* CORE_GENERATION_INFO = "clk_wiz_0,clk_wiz_v5_1,{component_name=clk_wiz_0,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=1,clkin1_period=10.0,clkin2_period=10.0,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}" *) 
  audioSys_0_clk_wiz_0 serialClocks
       (.clk_main(clk),
        .clk_out1(MCLK),
        .locked(locked),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "divider" *) 
module audioSys_0_divider
   (E,
    \step_size_curr_reg[15] ,
    Q,
    reset,
    div_en_reg,
    clk);
  output [0:0]E;
  output [15:0]\step_size_curr_reg[15] ;
  input [9:0]Q;
  input reset;
  input div_en_reg;
  input clk;

  wire [0:0]E;
  wire [9:0]Q;
  wire clk;
  wire div_cnt_n_0;
  wire div_cnt_n_1;
  wire div_cnt_n_2;
  wire div_en_reg;
  wire [16:0]remainder;
  wire [16:0]remainder0;
  wire \remainder[10]_i_1_n_0 ;
  wire \remainder[11]_i_10_n_0 ;
  wire \remainder[11]_i_1_n_0 ;
  wire \remainder[11]_i_7_n_0 ;
  wire \remainder[11]_i_8_n_0 ;
  wire \remainder[11]_i_9_n_0 ;
  wire \remainder[12]_i_1_n_0 ;
  wire \remainder[13]_i_1_n_0 ;
  wire \remainder[14]_i_1_n_0 ;
  wire \remainder[15]_i_10_n_0 ;
  wire \remainder[15]_i_1_n_0 ;
  wire \remainder[15]_i_7_n_0 ;
  wire \remainder[15]_i_8_n_0 ;
  wire \remainder[15]_i_9_n_0 ;
  wire \remainder[16]_i_10_n_0 ;
  wire \remainder[16]_i_11_n_0 ;
  wire \remainder[16]_i_12_n_0 ;
  wire \remainder[16]_i_13_n_0 ;
  wire \remainder[16]_i_14_n_0 ;
  wire \remainder[16]_i_15_n_0 ;
  wire \remainder[16]_i_16_n_0 ;
  wire \remainder[16]_i_17_n_0 ;
  wire \remainder[16]_i_18_n_0 ;
  wire \remainder[16]_i_19_n_0 ;
  wire \remainder[16]_i_1_n_0 ;
  wire \remainder[16]_i_21_n_0 ;
  wire \remainder[16]_i_22_n_0 ;
  wire \remainder[16]_i_23_n_0 ;
  wire \remainder[16]_i_5_n_0 ;
  wire \remainder[16]_i_6_n_0 ;
  wire \remainder[16]_i_7_n_0 ;
  wire \remainder[16]_i_9_n_0 ;
  wire \remainder[1]_i_1_n_0 ;
  wire \remainder[2]_i_1_n_0 ;
  wire \remainder[3]_i_1_n_0 ;
  wire \remainder[3]_i_5_n_0 ;
  wire \remainder[3]_i_6_n_0 ;
  wire \remainder[3]_i_7_n_0 ;
  wire \remainder[3]_i_8_n_0 ;
  wire \remainder[4]_i_1_n_0 ;
  wire \remainder[5]_i_1_n_0 ;
  wire \remainder[6]_i_1_n_0 ;
  wire \remainder[7]_i_10_n_0 ;
  wire \remainder[7]_i_1_n_0 ;
  wire \remainder[7]_i_7_n_0 ;
  wire \remainder[7]_i_8_n_0 ;
  wire \remainder[7]_i_9_n_0 ;
  wire \remainder[8]_i_1_n_0 ;
  wire \remainder[9]_i_1_n_0 ;
  wire [15:2]remainder_preview;
  wire \remainder_reg[11]_i_2_n_0 ;
  wire \remainder_reg[11]_i_2_n_1 ;
  wire \remainder_reg[11]_i_2_n_2 ;
  wire \remainder_reg[11]_i_2_n_3 ;
  wire \remainder_reg[15]_i_2_n_0 ;
  wire \remainder_reg[15]_i_2_n_1 ;
  wire \remainder_reg[15]_i_2_n_2 ;
  wire \remainder_reg[15]_i_2_n_3 ;
  wire \remainder_reg[3]_i_2_n_0 ;
  wire \remainder_reg[3]_i_2_n_1 ;
  wire \remainder_reg[3]_i_2_n_2 ;
  wire \remainder_reg[3]_i_2_n_3 ;
  wire \remainder_reg[7]_i_2_n_0 ;
  wire \remainder_reg[7]_i_2_n_1 ;
  wire \remainder_reg[7]_i_2_n_2 ;
  wire \remainder_reg[7]_i_2_n_3 ;
  wire reset;
  wire step_size1;
  wire \step_size[0]_i_1_n_0 ;
  wire \step_size[10]_i_1_n_0 ;
  wire \step_size[11]_i_1_n_0 ;
  wire \step_size[12]_i_1_n_0 ;
  wire \step_size[13]_i_1_n_0 ;
  wire \step_size[14]_i_1_n_0 ;
  wire \step_size[15]_i_1_n_0 ;
  wire \step_size[1]_i_1_n_0 ;
  wire \step_size[2]_i_1_n_0 ;
  wire \step_size[3]_i_1_n_0 ;
  wire \step_size[4]_i_1_n_0 ;
  wire \step_size[5]_i_1_n_0 ;
  wire \step_size[6]_i_1_n_0 ;
  wire \step_size[7]_i_1_n_0 ;
  wire \step_size[8]_i_1_n_0 ;
  wire \step_size[9]_i_1_n_0 ;
  wire [15:0]\step_size_curr_reg[15] ;
  wire [3:0]\NLW_remainder_reg[16]_i_3_CO_UNCONNECTED ;
  wire [3:1]\NLW_remainder_reg[16]_i_3_O_UNCONNECTED ;

  audioSys_0_counter div_cnt
       (.CO(step_size1),
        .D(div_cnt_n_2),
        .DI({\remainder[16]_i_17_n_0 ,\remainder[16]_i_18_n_0 ,\remainder[16]_i_19_n_0 }),
        .E(E),
        .Q(Q[1:0]),
        .S(div_cnt_n_0),
        .clk(clk),
        .div_en_reg(div_en_reg),
        .remainder0(remainder0[0]),
        .remainder_preview(div_cnt_n_1),
        .\remainder_reg[0] (remainder[0]),
        .\remainder_reg[13] ({\remainder[16]_i_9_n_0 ,\remainder[16]_i_10_n_0 ,\remainder[16]_i_11_n_0 ,\remainder[16]_i_12_n_0 }),
        .\remainder_reg[14] ({\remainder[16]_i_13_n_0 ,\remainder[16]_i_14_n_0 ,\remainder[16]_i_15_n_0 ,\remainder[16]_i_16_n_0 }),
        .\remainder_reg[15] (\remainder[16]_i_6_n_0 ),
        .\remainder_reg[16] (\remainder[16]_i_5_n_0 ),
        .\remainder_reg[6] ({\remainder[16]_i_21_n_0 ,\remainder[16]_i_22_n_0 ,\remainder[16]_i_23_n_0 }),
        .reset(reset));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[10]_i_1 
       (.I0(remainder0[10]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[9]),
        .O(\remainder[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[11]_i_1 
       (.I0(remainder0[11]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[10]),
        .O(\remainder[11]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[11]_i_10 
       (.I0(remainder[7]),
        .I1(reset),
        .I2(Q[8]),
        .O(\remainder[11]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_3 
       (.I0(remainder[10]),
        .I1(reset),
        .O(remainder_preview[11]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_4 
       (.I0(remainder[9]),
        .I1(reset),
        .O(remainder_preview[10]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_5 
       (.I0(remainder[8]),
        .I1(reset),
        .O(remainder_preview[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_6 
       (.I0(remainder[7]),
        .I1(reset),
        .O(remainder_preview[8]));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[11]_i_7 
       (.I0(reset),
        .I1(remainder[10]),
        .O(\remainder[11]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[11]_i_8 
       (.I0(reset),
        .I1(remainder[9]),
        .O(\remainder[11]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[11]_i_9 
       (.I0(reset),
        .I1(remainder[8]),
        .I2(Q[9]),
        .O(\remainder[11]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[12]_i_1 
       (.I0(remainder0[12]),
        .I1(remainder[11]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[13]_i_1 
       (.I0(remainder0[13]),
        .I1(remainder[12]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[14]_i_1 
       (.I0(remainder0[14]),
        .I1(remainder[13]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[15]_i_1 
       (.I0(remainder0[15]),
        .I1(remainder[14]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_10 
       (.I0(reset),
        .I1(remainder[11]),
        .O(\remainder[15]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_3 
       (.I0(remainder[14]),
        .I1(reset),
        .O(remainder_preview[15]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_4 
       (.I0(remainder[13]),
        .I1(reset),
        .O(remainder_preview[14]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_5 
       (.I0(remainder[12]),
        .I1(reset),
        .O(remainder_preview[13]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_6 
       (.I0(remainder[11]),
        .I1(reset),
        .O(remainder_preview[12]));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_7 
       (.I0(reset),
        .I1(remainder[14]),
        .O(\remainder[15]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_8 
       (.I0(reset),
        .I1(remainder[13]),
        .O(\remainder[15]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_9 
       (.I0(reset),
        .I1(remainder[12]),
        .O(\remainder[15]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hF4000400)) 
    \remainder[16]_i_1 
       (.I0(reset),
        .I1(remainder[15]),
        .I2(step_size1),
        .I3(div_en_reg),
        .I4(remainder0[16]),
        .O(\remainder[16]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h32)) 
    \remainder[16]_i_10 
       (.I0(remainder[11]),
        .I1(reset),
        .I2(remainder[12]),
        .O(\remainder[16]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h32)) 
    \remainder[16]_i_11 
       (.I0(remainder[9]),
        .I1(reset),
        .I2(remainder[10]),
        .O(\remainder[16]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_12 
       (.I0(Q[9]),
        .I1(reset),
        .I2(remainder[8]),
        .I3(remainder[7]),
        .I4(Q[8]),
        .O(\remainder[16]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'hCD)) 
    \remainder[16]_i_13 
       (.I0(remainder[14]),
        .I1(reset),
        .I2(remainder[13]),
        .O(\remainder[16]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'hCD)) 
    \remainder[16]_i_14 
       (.I0(remainder[12]),
        .I1(reset),
        .I2(remainder[11]),
        .O(\remainder[16]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hCD)) 
    \remainder[16]_i_15 
       (.I0(remainder[10]),
        .I1(reset),
        .I2(remainder[9]),
        .O(\remainder[16]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_16 
       (.I0(remainder[8]),
        .I1(Q[9]),
        .I2(remainder[7]),
        .I3(reset),
        .I4(Q[8]),
        .O(\remainder[16]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_17 
       (.I0(Q[7]),
        .I1(reset),
        .I2(remainder[6]),
        .I3(remainder[5]),
        .I4(Q[6]),
        .O(\remainder[16]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_18 
       (.I0(Q[5]),
        .I1(reset),
        .I2(remainder[4]),
        .I3(remainder[3]),
        .I4(Q[4]),
        .O(\remainder[16]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_19 
       (.I0(Q[3]),
        .I1(reset),
        .I2(remainder[2]),
        .I3(remainder[1]),
        .I4(Q[2]),
        .O(\remainder[16]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_21 
       (.I0(remainder[6]),
        .I1(Q[7]),
        .I2(remainder[5]),
        .I3(reset),
        .I4(Q[6]),
        .O(\remainder[16]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_22 
       (.I0(remainder[4]),
        .I1(Q[5]),
        .I2(remainder[3]),
        .I3(reset),
        .I4(Q[4]),
        .O(\remainder[16]_i_22_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_23 
       (.I0(remainder[2]),
        .I1(Q[3]),
        .I2(remainder[1]),
        .I3(reset),
        .I4(Q[2]),
        .O(\remainder[16]_i_23_n_0 ));
  LUT3 #(
    .INIT(8'h54)) 
    \remainder[16]_i_5 
       (.I0(reset),
        .I1(remainder[16]),
        .I2(remainder[15]),
        .O(\remainder[16]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hF1)) 
    \remainder[16]_i_6 
       (.I0(remainder[15]),
        .I1(remainder[16]),
        .I2(reset),
        .O(\remainder[16]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[16]_i_7 
       (.I0(reset),
        .I1(remainder[15]),
        .O(\remainder[16]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h32)) 
    \remainder[16]_i_9 
       (.I0(remainder[13]),
        .I1(reset),
        .I2(remainder[14]),
        .O(\remainder[16]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[1]_i_1 
       (.I0(remainder0[1]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[0]),
        .O(\remainder[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[2]_i_1 
       (.I0(remainder0[2]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[1]),
        .O(\remainder[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[3]_i_1 
       (.I0(remainder0[3]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[2]),
        .O(\remainder[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[3]_i_3 
       (.I0(remainder[2]),
        .I1(reset),
        .O(remainder_preview[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[3]_i_4 
       (.I0(remainder[1]),
        .I1(reset),
        .O(remainder_preview[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[3]_i_5 
       (.I0(remainder[0]),
        .I1(reset),
        .O(\remainder[3]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[3]_i_6 
       (.I0(reset),
        .I1(remainder[2]),
        .I2(Q[3]),
        .O(\remainder[3]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[3]_i_7 
       (.I0(remainder[1]),
        .I1(reset),
        .I2(Q[2]),
        .O(\remainder[3]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[3]_i_8 
       (.I0(remainder[0]),
        .I1(reset),
        .I2(Q[1]),
        .O(\remainder[3]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[4]_i_1 
       (.I0(remainder0[4]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[3]),
        .O(\remainder[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[5]_i_1 
       (.I0(remainder0[5]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[4]),
        .O(\remainder[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[6]_i_1 
       (.I0(remainder0[6]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[5]),
        .O(\remainder[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[7]_i_1 
       (.I0(remainder0[7]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[6]),
        .O(\remainder[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[7]_i_10 
       (.I0(remainder[3]),
        .I1(reset),
        .I2(Q[4]),
        .O(\remainder[7]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_3 
       (.I0(remainder[6]),
        .I1(reset),
        .O(remainder_preview[7]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_4 
       (.I0(remainder[5]),
        .I1(reset),
        .O(remainder_preview[6]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_5 
       (.I0(remainder[4]),
        .I1(reset),
        .O(remainder_preview[5]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_6 
       (.I0(remainder[3]),
        .I1(reset),
        .O(remainder_preview[4]));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[7]_i_7 
       (.I0(reset),
        .I1(remainder[6]),
        .I2(Q[7]),
        .O(\remainder[7]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[7]_i_8 
       (.I0(remainder[5]),
        .I1(reset),
        .I2(Q[6]),
        .O(\remainder[7]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[7]_i_9 
       (.I0(reset),
        .I1(remainder[4]),
        .I2(Q[5]),
        .O(\remainder[7]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[8]_i_1 
       (.I0(remainder0[8]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[7]),
        .O(\remainder[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[9]_i_1 
       (.I0(remainder0[9]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[8]),
        .O(\remainder[9]_i_1_n_0 ));
  FDCE \remainder_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(div_cnt_n_2),
        .Q(remainder[0]));
  FDCE \remainder_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[10]_i_1_n_0 ),
        .Q(remainder[10]));
  FDCE \remainder_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[11]_i_1_n_0 ),
        .Q(remainder[11]));
  CARRY4 \remainder_reg[11]_i_2 
       (.CI(\remainder_reg[7]_i_2_n_0 ),
        .CO({\remainder_reg[11]_i_2_n_0 ,\remainder_reg[11]_i_2_n_1 ,\remainder_reg[11]_i_2_n_2 ,\remainder_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(remainder_preview[11:8]),
        .O(remainder0[11:8]),
        .S({\remainder[11]_i_7_n_0 ,\remainder[11]_i_8_n_0 ,\remainder[11]_i_9_n_0 ,\remainder[11]_i_10_n_0 }));
  FDCE \remainder_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[12]_i_1_n_0 ),
        .Q(remainder[12]));
  FDCE \remainder_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[13]_i_1_n_0 ),
        .Q(remainder[13]));
  FDCE \remainder_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[14]_i_1_n_0 ),
        .Q(remainder[14]));
  FDCE \remainder_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[15]_i_1_n_0 ),
        .Q(remainder[15]));
  CARRY4 \remainder_reg[15]_i_2 
       (.CI(\remainder_reg[11]_i_2_n_0 ),
        .CO({\remainder_reg[15]_i_2_n_0 ,\remainder_reg[15]_i_2_n_1 ,\remainder_reg[15]_i_2_n_2 ,\remainder_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(remainder_preview[15:12]),
        .O(remainder0[15:12]),
        .S({\remainder[15]_i_7_n_0 ,\remainder[15]_i_8_n_0 ,\remainder[15]_i_9_n_0 ,\remainder[15]_i_10_n_0 }));
  FDCE \remainder_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[16]_i_1_n_0 ),
        .Q(remainder[16]));
  CARRY4 \remainder_reg[16]_i_3 
       (.CI(\remainder_reg[15]_i_2_n_0 ),
        .CO(\NLW_remainder_reg[16]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_remainder_reg[16]_i_3_O_UNCONNECTED [3:1],remainder0[16]}),
        .S({1'b0,1'b0,1'b0,\remainder[16]_i_7_n_0 }));
  FDCE \remainder_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[1]_i_1_n_0 ),
        .Q(remainder[1]));
  FDCE \remainder_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[2]_i_1_n_0 ),
        .Q(remainder[2]));
  FDCE \remainder_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[3]_i_1_n_0 ),
        .Q(remainder[3]));
  CARRY4 \remainder_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\remainder_reg[3]_i_2_n_0 ,\remainder_reg[3]_i_2_n_1 ,\remainder_reg[3]_i_2_n_2 ,\remainder_reg[3]_i_2_n_3 }),
        .CYINIT(1'b1),
        .DI({remainder_preview[3:2],\remainder[3]_i_5_n_0 ,div_cnt_n_1}),
        .O(remainder0[3:0]),
        .S({\remainder[3]_i_6_n_0 ,\remainder[3]_i_7_n_0 ,\remainder[3]_i_8_n_0 ,div_cnt_n_0}));
  FDCE \remainder_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[4]_i_1_n_0 ),
        .Q(remainder[4]));
  FDCE \remainder_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[5]_i_1_n_0 ),
        .Q(remainder[5]));
  FDCE \remainder_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[6]_i_1_n_0 ),
        .Q(remainder[6]));
  FDCE \remainder_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[7]_i_1_n_0 ),
        .Q(remainder[7]));
  CARRY4 \remainder_reg[7]_i_2 
       (.CI(\remainder_reg[3]_i_2_n_0 ),
        .CO({\remainder_reg[7]_i_2_n_0 ,\remainder_reg[7]_i_2_n_1 ,\remainder_reg[7]_i_2_n_2 ,\remainder_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(remainder_preview[7:4]),
        .O(remainder0[7:4]),
        .S({\remainder[7]_i_7_n_0 ,\remainder[7]_i_8_n_0 ,\remainder[7]_i_9_n_0 ,\remainder[7]_i_10_n_0 }));
  FDCE \remainder_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[8]_i_1_n_0 ),
        .Q(remainder[8]));
  FDCE \remainder_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[9]_i_1_n_0 ),
        .Q(remainder[9]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[0]_i_1 
       (.I0(div_en_reg),
        .I1(step_size1),
        .O(\step_size[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[10]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [9]),
        .O(\step_size[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[11]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [10]),
        .O(\step_size[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[12]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [11]),
        .O(\step_size[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[13]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [12]),
        .O(\step_size[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[14]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [13]),
        .O(\step_size[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[15]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [14]),
        .O(\step_size[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[1]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [0]),
        .O(\step_size[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[2]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [1]),
        .O(\step_size[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[3]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [2]),
        .O(\step_size[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[4]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [3]),
        .O(\step_size[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[5]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [4]),
        .O(\step_size[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[6]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [5]),
        .O(\step_size[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[7]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [6]),
        .O(\step_size[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[8]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [7]),
        .O(\step_size[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[9]_i_1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [8]),
        .O(\step_size[9]_i_1_n_0 ));
  FDCE \step_size_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[0]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [0]));
  FDCE \step_size_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[10]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [10]));
  FDCE \step_size_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[11]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [11]));
  FDCE \step_size_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[12]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [12]));
  FDCE \step_size_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[13]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [13]));
  FDCE \step_size_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[14]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [14]));
  FDCE \step_size_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[15]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [15]));
  FDCE \step_size_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[1]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [1]));
  FDCE \step_size_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[2]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [2]));
  FDCE \step_size_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[3]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [3]));
  FDCE \step_size_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[4]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [4]));
  FDCE \step_size_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[5]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [5]));
  FDCE \step_size_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[6]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [6]));
  FDCE \step_size_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[7]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [7]));
  FDCE \step_size_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[8]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [8]));
  FDCE \step_size_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[9]_i_1_n_0 ),
        .Q(\step_size_curr_reg[15] [9]));
endmodule

(* ORIG_REF_NAME = "divider" *) 
module audioSys_0_divider_2
   (E,
    \step_size_curr_reg[15] ,
    Q,
    reset,
    div_en_reg,
    clk);
  output [0:0]E;
  output [15:0]\step_size_curr_reg[15] ;
  input [9:0]Q;
  input reset;
  input div_en_reg;
  input clk;

  wire [0:0]E;
  wire [9:0]Q;
  wire clk;
  wire div_cnt_n_0;
  wire div_cnt_n_1;
  wire div_cnt_n_2;
  wire div_en_reg;
  wire [16:0]remainder;
  wire [16:0]remainder0;
  wire \remainder[10]_i_1__0_n_0 ;
  wire \remainder[11]_i_10__0_n_0 ;
  wire \remainder[11]_i_1__0_n_0 ;
  wire \remainder[11]_i_7__0_n_0 ;
  wire \remainder[11]_i_8__0_n_0 ;
  wire \remainder[11]_i_9__0_n_0 ;
  wire \remainder[12]_i_1__0_n_0 ;
  wire \remainder[13]_i_1__0_n_0 ;
  wire \remainder[14]_i_1__0_n_0 ;
  wire \remainder[15]_i_10__0_n_0 ;
  wire \remainder[15]_i_1__0_n_0 ;
  wire \remainder[15]_i_7__0_n_0 ;
  wire \remainder[15]_i_8__0_n_0 ;
  wire \remainder[15]_i_9__0_n_0 ;
  wire \remainder[16]_i_10__0_n_0 ;
  wire \remainder[16]_i_11__0_n_0 ;
  wire \remainder[16]_i_12__0_n_0 ;
  wire \remainder[16]_i_13__0_n_0 ;
  wire \remainder[16]_i_14__0_n_0 ;
  wire \remainder[16]_i_15__0_n_0 ;
  wire \remainder[16]_i_16__0_n_0 ;
  wire \remainder[16]_i_17__0_n_0 ;
  wire \remainder[16]_i_18__0_n_0 ;
  wire \remainder[16]_i_19__0_n_0 ;
  wire \remainder[16]_i_1__0_n_0 ;
  wire \remainder[16]_i_21__0_n_0 ;
  wire \remainder[16]_i_22__0_n_0 ;
  wire \remainder[16]_i_23__0_n_0 ;
  wire \remainder[16]_i_5__0_n_0 ;
  wire \remainder[16]_i_6__0_n_0 ;
  wire \remainder[16]_i_7__0_n_0 ;
  wire \remainder[16]_i_9__0_n_0 ;
  wire \remainder[1]_i_1__0_n_0 ;
  wire \remainder[2]_i_1__0_n_0 ;
  wire \remainder[3]_i_1__0_n_0 ;
  wire \remainder[3]_i_5__0_n_0 ;
  wire \remainder[3]_i_6__0_n_0 ;
  wire \remainder[3]_i_7__0_n_0 ;
  wire \remainder[3]_i_8__0_n_0 ;
  wire \remainder[4]_i_1__0_n_0 ;
  wire \remainder[5]_i_1__0_n_0 ;
  wire \remainder[6]_i_1__0_n_0 ;
  wire \remainder[7]_i_10__0_n_0 ;
  wire \remainder[7]_i_1__0_n_0 ;
  wire \remainder[7]_i_7__0_n_0 ;
  wire \remainder[7]_i_8__0_n_0 ;
  wire \remainder[7]_i_9__0_n_0 ;
  wire \remainder[8]_i_1__0_n_0 ;
  wire \remainder[9]_i_1__0_n_0 ;
  wire [15:2]remainder_preview;
  wire \remainder_reg[11]_i_2__0_n_0 ;
  wire \remainder_reg[11]_i_2__0_n_1 ;
  wire \remainder_reg[11]_i_2__0_n_2 ;
  wire \remainder_reg[11]_i_2__0_n_3 ;
  wire \remainder_reg[15]_i_2__0_n_0 ;
  wire \remainder_reg[15]_i_2__0_n_1 ;
  wire \remainder_reg[15]_i_2__0_n_2 ;
  wire \remainder_reg[15]_i_2__0_n_3 ;
  wire \remainder_reg[3]_i_2__0_n_0 ;
  wire \remainder_reg[3]_i_2__0_n_1 ;
  wire \remainder_reg[3]_i_2__0_n_2 ;
  wire \remainder_reg[3]_i_2__0_n_3 ;
  wire \remainder_reg[7]_i_2__0_n_0 ;
  wire \remainder_reg[7]_i_2__0_n_1 ;
  wire \remainder_reg[7]_i_2__0_n_2 ;
  wire \remainder_reg[7]_i_2__0_n_3 ;
  wire reset;
  wire step_size1;
  wire \step_size[0]_i_1__0_n_0 ;
  wire \step_size[10]_i_1__0_n_0 ;
  wire \step_size[11]_i_1__0_n_0 ;
  wire \step_size[12]_i_1__0_n_0 ;
  wire \step_size[13]_i_1__0_n_0 ;
  wire \step_size[14]_i_1__0_n_0 ;
  wire \step_size[15]_i_1__0_n_0 ;
  wire \step_size[1]_i_1__0_n_0 ;
  wire \step_size[2]_i_1__0_n_0 ;
  wire \step_size[3]_i_1__0_n_0 ;
  wire \step_size[4]_i_1__0_n_0 ;
  wire \step_size[5]_i_1__0_n_0 ;
  wire \step_size[6]_i_1__0_n_0 ;
  wire \step_size[7]_i_1__0_n_0 ;
  wire \step_size[8]_i_1__0_n_0 ;
  wire \step_size[9]_i_1__0_n_0 ;
  wire [15:0]\step_size_curr_reg[15] ;
  wire [3:0]\NLW_remainder_reg[16]_i_3__0_CO_UNCONNECTED ;
  wire [3:1]\NLW_remainder_reg[16]_i_3__0_O_UNCONNECTED ;

  audioSys_0_counter_4 div_cnt
       (.CO(step_size1),
        .D(div_cnt_n_2),
        .DI({\remainder[16]_i_17__0_n_0 ,\remainder[16]_i_18__0_n_0 ,\remainder[16]_i_19__0_n_0 }),
        .E(E),
        .Q(Q[1:0]),
        .S(div_cnt_n_0),
        .clk(clk),
        .div_en_reg(div_en_reg),
        .remainder0(remainder0[0]),
        .remainder_preview(div_cnt_n_1),
        .\remainder_reg[0] (remainder[0]),
        .\remainder_reg[13] ({\remainder[16]_i_9__0_n_0 ,\remainder[16]_i_10__0_n_0 ,\remainder[16]_i_11__0_n_0 ,\remainder[16]_i_12__0_n_0 }),
        .\remainder_reg[14] ({\remainder[16]_i_13__0_n_0 ,\remainder[16]_i_14__0_n_0 ,\remainder[16]_i_15__0_n_0 ,\remainder[16]_i_16__0_n_0 }),
        .\remainder_reg[15] (\remainder[16]_i_6__0_n_0 ),
        .\remainder_reg[16] (\remainder[16]_i_5__0_n_0 ),
        .\remainder_reg[6] ({\remainder[16]_i_21__0_n_0 ,\remainder[16]_i_22__0_n_0 ,\remainder[16]_i_23__0_n_0 }),
        .reset(reset));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[10]_i_1__0 
       (.I0(remainder0[10]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[9]),
        .O(\remainder[10]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[11]_i_10__0 
       (.I0(remainder[7]),
        .I1(reset),
        .I2(Q[8]),
        .O(\remainder[11]_i_10__0_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[11]_i_1__0 
       (.I0(remainder0[11]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[10]),
        .O(\remainder[11]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_3__0 
       (.I0(remainder[10]),
        .I1(reset),
        .O(remainder_preview[11]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_4__0 
       (.I0(remainder[9]),
        .I1(reset),
        .O(remainder_preview[10]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_5__0 
       (.I0(remainder[8]),
        .I1(reset),
        .O(remainder_preview[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_6__0 
       (.I0(remainder[7]),
        .I1(reset),
        .O(remainder_preview[8]));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[11]_i_7__0 
       (.I0(reset),
        .I1(remainder[10]),
        .O(\remainder[11]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[11]_i_8__0 
       (.I0(reset),
        .I1(remainder[9]),
        .O(\remainder[11]_i_8__0_n_0 ));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[11]_i_9__0 
       (.I0(reset),
        .I1(remainder[8]),
        .I2(Q[9]),
        .O(\remainder[11]_i_9__0_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[12]_i_1__0 
       (.I0(remainder0[12]),
        .I1(remainder[11]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[12]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[13]_i_1__0 
       (.I0(remainder0[13]),
        .I1(remainder[12]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[13]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[14]_i_1__0 
       (.I0(remainder0[14]),
        .I1(remainder[13]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[14]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_10__0 
       (.I0(reset),
        .I1(remainder[11]),
        .O(\remainder[15]_i_10__0_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[15]_i_1__0 
       (.I0(remainder0[15]),
        .I1(remainder[14]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[15]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_3__0 
       (.I0(remainder[14]),
        .I1(reset),
        .O(remainder_preview[15]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_4__0 
       (.I0(remainder[13]),
        .I1(reset),
        .O(remainder_preview[14]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_5__0 
       (.I0(remainder[12]),
        .I1(reset),
        .O(remainder_preview[13]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_6__0 
       (.I0(remainder[11]),
        .I1(reset),
        .O(remainder_preview[12]));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_7__0 
       (.I0(reset),
        .I1(remainder[14]),
        .O(\remainder[15]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_8__0 
       (.I0(reset),
        .I1(remainder[13]),
        .O(\remainder[15]_i_8__0_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_9__0 
       (.I0(reset),
        .I1(remainder[12]),
        .O(\remainder[15]_i_9__0_n_0 ));
  LUT3 #(
    .INIT(8'h32)) 
    \remainder[16]_i_10__0 
       (.I0(remainder[11]),
        .I1(reset),
        .I2(remainder[12]),
        .O(\remainder[16]_i_10__0_n_0 ));
  LUT3 #(
    .INIT(8'h32)) 
    \remainder[16]_i_11__0 
       (.I0(remainder[9]),
        .I1(reset),
        .I2(remainder[10]),
        .O(\remainder[16]_i_11__0_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_12__0 
       (.I0(Q[9]),
        .I1(reset),
        .I2(remainder[8]),
        .I3(remainder[7]),
        .I4(Q[8]),
        .O(\remainder[16]_i_12__0_n_0 ));
  LUT3 #(
    .INIT(8'hCD)) 
    \remainder[16]_i_13__0 
       (.I0(remainder[14]),
        .I1(reset),
        .I2(remainder[13]),
        .O(\remainder[16]_i_13__0_n_0 ));
  LUT3 #(
    .INIT(8'hCD)) 
    \remainder[16]_i_14__0 
       (.I0(remainder[12]),
        .I1(reset),
        .I2(remainder[11]),
        .O(\remainder[16]_i_14__0_n_0 ));
  LUT3 #(
    .INIT(8'hCD)) 
    \remainder[16]_i_15__0 
       (.I0(remainder[10]),
        .I1(reset),
        .I2(remainder[9]),
        .O(\remainder[16]_i_15__0_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_16__0 
       (.I0(remainder[8]),
        .I1(Q[9]),
        .I2(remainder[7]),
        .I3(reset),
        .I4(Q[8]),
        .O(\remainder[16]_i_16__0_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_17__0 
       (.I0(Q[7]),
        .I1(reset),
        .I2(remainder[6]),
        .I3(remainder[5]),
        .I4(Q[6]),
        .O(\remainder[16]_i_17__0_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_18__0 
       (.I0(Q[5]),
        .I1(reset),
        .I2(remainder[4]),
        .I3(remainder[3]),
        .I4(Q[4]),
        .O(\remainder[16]_i_18__0_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_19__0 
       (.I0(Q[3]),
        .I1(reset),
        .I2(remainder[2]),
        .I3(remainder[1]),
        .I4(Q[2]),
        .O(\remainder[16]_i_19__0_n_0 ));
  LUT5 #(
    .INIT(32'hF4000400)) 
    \remainder[16]_i_1__0 
       (.I0(reset),
        .I1(remainder[15]),
        .I2(step_size1),
        .I3(div_en_reg),
        .I4(remainder0[16]),
        .O(\remainder[16]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_21__0 
       (.I0(remainder[6]),
        .I1(Q[7]),
        .I2(remainder[5]),
        .I3(reset),
        .I4(Q[6]),
        .O(\remainder[16]_i_21__0_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_22__0 
       (.I0(remainder[4]),
        .I1(Q[5]),
        .I2(remainder[3]),
        .I3(reset),
        .I4(Q[4]),
        .O(\remainder[16]_i_22__0_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_23__0 
       (.I0(remainder[2]),
        .I1(Q[3]),
        .I2(remainder[1]),
        .I3(reset),
        .I4(Q[2]),
        .O(\remainder[16]_i_23__0_n_0 ));
  LUT3 #(
    .INIT(8'h54)) 
    \remainder[16]_i_5__0 
       (.I0(reset),
        .I1(remainder[16]),
        .I2(remainder[15]),
        .O(\remainder[16]_i_5__0_n_0 ));
  LUT3 #(
    .INIT(8'hF1)) 
    \remainder[16]_i_6__0 
       (.I0(remainder[15]),
        .I1(remainder[16]),
        .I2(reset),
        .O(\remainder[16]_i_6__0_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[16]_i_7__0 
       (.I0(reset),
        .I1(remainder[15]),
        .O(\remainder[16]_i_7__0_n_0 ));
  LUT3 #(
    .INIT(8'h32)) 
    \remainder[16]_i_9__0 
       (.I0(remainder[13]),
        .I1(reset),
        .I2(remainder[14]),
        .O(\remainder[16]_i_9__0_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[1]_i_1__0 
       (.I0(remainder0[1]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[0]),
        .O(\remainder[1]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[2]_i_1__0 
       (.I0(remainder0[2]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[1]),
        .O(\remainder[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[3]_i_1__0 
       (.I0(remainder0[3]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[2]),
        .O(\remainder[3]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[3]_i_3__0 
       (.I0(remainder[2]),
        .I1(reset),
        .O(remainder_preview[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[3]_i_4__0 
       (.I0(remainder[1]),
        .I1(reset),
        .O(remainder_preview[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[3]_i_5__0 
       (.I0(remainder[0]),
        .I1(reset),
        .O(\remainder[3]_i_5__0_n_0 ));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[3]_i_6__0 
       (.I0(reset),
        .I1(remainder[2]),
        .I2(Q[3]),
        .O(\remainder[3]_i_6__0_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[3]_i_7__0 
       (.I0(remainder[1]),
        .I1(reset),
        .I2(Q[2]),
        .O(\remainder[3]_i_7__0_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[3]_i_8__0 
       (.I0(remainder[0]),
        .I1(reset),
        .I2(Q[1]),
        .O(\remainder[3]_i_8__0_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[4]_i_1__0 
       (.I0(remainder0[4]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[3]),
        .O(\remainder[4]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[5]_i_1__0 
       (.I0(remainder0[5]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[4]),
        .O(\remainder[5]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[6]_i_1__0 
       (.I0(remainder0[6]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[5]),
        .O(\remainder[6]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[7]_i_10__0 
       (.I0(remainder[3]),
        .I1(reset),
        .I2(Q[4]),
        .O(\remainder[7]_i_10__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[7]_i_1__0 
       (.I0(remainder0[7]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[6]),
        .O(\remainder[7]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_3__0 
       (.I0(remainder[6]),
        .I1(reset),
        .O(remainder_preview[7]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_4__0 
       (.I0(remainder[5]),
        .I1(reset),
        .O(remainder_preview[6]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_5__0 
       (.I0(remainder[4]),
        .I1(reset),
        .O(remainder_preview[5]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_6__0 
       (.I0(remainder[3]),
        .I1(reset),
        .O(remainder_preview[4]));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[7]_i_7__0 
       (.I0(reset),
        .I1(remainder[6]),
        .I2(Q[7]),
        .O(\remainder[7]_i_7__0_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[7]_i_8__0 
       (.I0(remainder[5]),
        .I1(reset),
        .I2(Q[6]),
        .O(\remainder[7]_i_8__0_n_0 ));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[7]_i_9__0 
       (.I0(reset),
        .I1(remainder[4]),
        .I2(Q[5]),
        .O(\remainder[7]_i_9__0_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[8]_i_1__0 
       (.I0(remainder0[8]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[7]),
        .O(\remainder[8]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[9]_i_1__0 
       (.I0(remainder0[9]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[8]),
        .O(\remainder[9]_i_1__0_n_0 ));
  FDCE \remainder_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(div_cnt_n_2),
        .Q(remainder[0]));
  FDCE \remainder_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[10]_i_1__0_n_0 ),
        .Q(remainder[10]));
  FDCE \remainder_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[11]_i_1__0_n_0 ),
        .Q(remainder[11]));
  CARRY4 \remainder_reg[11]_i_2__0 
       (.CI(\remainder_reg[7]_i_2__0_n_0 ),
        .CO({\remainder_reg[11]_i_2__0_n_0 ,\remainder_reg[11]_i_2__0_n_1 ,\remainder_reg[11]_i_2__0_n_2 ,\remainder_reg[11]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI(remainder_preview[11:8]),
        .O(remainder0[11:8]),
        .S({\remainder[11]_i_7__0_n_0 ,\remainder[11]_i_8__0_n_0 ,\remainder[11]_i_9__0_n_0 ,\remainder[11]_i_10__0_n_0 }));
  FDCE \remainder_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[12]_i_1__0_n_0 ),
        .Q(remainder[12]));
  FDCE \remainder_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[13]_i_1__0_n_0 ),
        .Q(remainder[13]));
  FDCE \remainder_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[14]_i_1__0_n_0 ),
        .Q(remainder[14]));
  FDCE \remainder_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[15]_i_1__0_n_0 ),
        .Q(remainder[15]));
  CARRY4 \remainder_reg[15]_i_2__0 
       (.CI(\remainder_reg[11]_i_2__0_n_0 ),
        .CO({\remainder_reg[15]_i_2__0_n_0 ,\remainder_reg[15]_i_2__0_n_1 ,\remainder_reg[15]_i_2__0_n_2 ,\remainder_reg[15]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI(remainder_preview[15:12]),
        .O(remainder0[15:12]),
        .S({\remainder[15]_i_7__0_n_0 ,\remainder[15]_i_8__0_n_0 ,\remainder[15]_i_9__0_n_0 ,\remainder[15]_i_10__0_n_0 }));
  FDCE \remainder_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[16]_i_1__0_n_0 ),
        .Q(remainder[16]));
  CARRY4 \remainder_reg[16]_i_3__0 
       (.CI(\remainder_reg[15]_i_2__0_n_0 ),
        .CO(\NLW_remainder_reg[16]_i_3__0_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_remainder_reg[16]_i_3__0_O_UNCONNECTED [3:1],remainder0[16]}),
        .S({1'b0,1'b0,1'b0,\remainder[16]_i_7__0_n_0 }));
  FDCE \remainder_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[1]_i_1__0_n_0 ),
        .Q(remainder[1]));
  FDCE \remainder_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[2]_i_1__0_n_0 ),
        .Q(remainder[2]));
  FDCE \remainder_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[3]_i_1__0_n_0 ),
        .Q(remainder[3]));
  CARRY4 \remainder_reg[3]_i_2__0 
       (.CI(1'b0),
        .CO({\remainder_reg[3]_i_2__0_n_0 ,\remainder_reg[3]_i_2__0_n_1 ,\remainder_reg[3]_i_2__0_n_2 ,\remainder_reg[3]_i_2__0_n_3 }),
        .CYINIT(1'b1),
        .DI({remainder_preview[3:2],\remainder[3]_i_5__0_n_0 ,div_cnt_n_1}),
        .O(remainder0[3:0]),
        .S({\remainder[3]_i_6__0_n_0 ,\remainder[3]_i_7__0_n_0 ,\remainder[3]_i_8__0_n_0 ,div_cnt_n_0}));
  FDCE \remainder_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[4]_i_1__0_n_0 ),
        .Q(remainder[4]));
  FDCE \remainder_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[5]_i_1__0_n_0 ),
        .Q(remainder[5]));
  FDCE \remainder_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[6]_i_1__0_n_0 ),
        .Q(remainder[6]));
  FDCE \remainder_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[7]_i_1__0_n_0 ),
        .Q(remainder[7]));
  CARRY4 \remainder_reg[7]_i_2__0 
       (.CI(\remainder_reg[3]_i_2__0_n_0 ),
        .CO({\remainder_reg[7]_i_2__0_n_0 ,\remainder_reg[7]_i_2__0_n_1 ,\remainder_reg[7]_i_2__0_n_2 ,\remainder_reg[7]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI(remainder_preview[7:4]),
        .O(remainder0[7:4]),
        .S({\remainder[7]_i_7__0_n_0 ,\remainder[7]_i_8__0_n_0 ,\remainder[7]_i_9__0_n_0 ,\remainder[7]_i_10__0_n_0 }));
  FDCE \remainder_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[8]_i_1__0_n_0 ),
        .Q(remainder[8]));
  FDCE \remainder_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[9]_i_1__0_n_0 ),
        .Q(remainder[9]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[0]_i_1__0 
       (.I0(div_en_reg),
        .I1(step_size1),
        .O(\step_size[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[10]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [9]),
        .O(\step_size[10]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[11]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [10]),
        .O(\step_size[11]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[12]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [11]),
        .O(\step_size[12]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[13]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [12]),
        .O(\step_size[13]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[14]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [13]),
        .O(\step_size[14]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[15]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [14]),
        .O(\step_size[15]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[1]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [0]),
        .O(\step_size[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[2]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [1]),
        .O(\step_size[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[3]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [2]),
        .O(\step_size[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[4]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [3]),
        .O(\step_size[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[5]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [4]),
        .O(\step_size[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[6]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [5]),
        .O(\step_size[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[7]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [6]),
        .O(\step_size[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[8]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [7]),
        .O(\step_size[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[9]_i_1__0 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [8]),
        .O(\step_size[9]_i_1__0_n_0 ));
  FDCE \step_size_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[0]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [0]));
  FDCE \step_size_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[10]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [10]));
  FDCE \step_size_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[11]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [11]));
  FDCE \step_size_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[12]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [12]));
  FDCE \step_size_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[13]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [13]));
  FDCE \step_size_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[14]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [14]));
  FDCE \step_size_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[15]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [15]));
  FDCE \step_size_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[1]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [1]));
  FDCE \step_size_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[2]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [2]));
  FDCE \step_size_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[3]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [3]));
  FDCE \step_size_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[4]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [4]));
  FDCE \step_size_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[5]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [5]));
  FDCE \step_size_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[6]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [6]));
  FDCE \step_size_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[7]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [7]));
  FDCE \step_size_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[8]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [8]));
  FDCE \step_size_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[9]_i_1__0_n_0 ),
        .Q(\step_size_curr_reg[15] [9]));
endmodule

(* ORIG_REF_NAME = "divider" *) 
module audioSys_0_divider_5
   (E,
    \step_size_curr_reg[15] ,
    Q,
    reset,
    div_en_reg,
    clk);
  output [0:0]E;
  output [15:0]\step_size_curr_reg[15] ;
  input [9:0]Q;
  input reset;
  input div_en_reg;
  input clk;

  wire [0:0]E;
  wire [9:0]Q;
  wire clk;
  wire div_cnt_n_0;
  wire div_cnt_n_1;
  wire div_cnt_n_2;
  wire div_en_reg;
  wire [16:0]remainder;
  wire [16:0]remainder0;
  wire \remainder[10]_i_1__1_n_0 ;
  wire \remainder[11]_i_10__1_n_0 ;
  wire \remainder[11]_i_1__1_n_0 ;
  wire \remainder[11]_i_7__1_n_0 ;
  wire \remainder[11]_i_8__1_n_0 ;
  wire \remainder[11]_i_9__1_n_0 ;
  wire \remainder[12]_i_1__1_n_0 ;
  wire \remainder[13]_i_1__1_n_0 ;
  wire \remainder[14]_i_1__1_n_0 ;
  wire \remainder[15]_i_10__1_n_0 ;
  wire \remainder[15]_i_1__1_n_0 ;
  wire \remainder[15]_i_7__1_n_0 ;
  wire \remainder[15]_i_8__1_n_0 ;
  wire \remainder[15]_i_9__1_n_0 ;
  wire \remainder[16]_i_10__1_n_0 ;
  wire \remainder[16]_i_11__1_n_0 ;
  wire \remainder[16]_i_12__1_n_0 ;
  wire \remainder[16]_i_13__1_n_0 ;
  wire \remainder[16]_i_14__1_n_0 ;
  wire \remainder[16]_i_15__1_n_0 ;
  wire \remainder[16]_i_16__1_n_0 ;
  wire \remainder[16]_i_17__1_n_0 ;
  wire \remainder[16]_i_18__1_n_0 ;
  wire \remainder[16]_i_19__1_n_0 ;
  wire \remainder[16]_i_1__1_n_0 ;
  wire \remainder[16]_i_21__1_n_0 ;
  wire \remainder[16]_i_22__1_n_0 ;
  wire \remainder[16]_i_23__1_n_0 ;
  wire \remainder[16]_i_5__1_n_0 ;
  wire \remainder[16]_i_6__1_n_0 ;
  wire \remainder[16]_i_7__1_n_0 ;
  wire \remainder[16]_i_9__1_n_0 ;
  wire \remainder[1]_i_1__1_n_0 ;
  wire \remainder[2]_i_1__1_n_0 ;
  wire \remainder[3]_i_1__1_n_0 ;
  wire \remainder[3]_i_5__1_n_0 ;
  wire \remainder[3]_i_6__1_n_0 ;
  wire \remainder[3]_i_7__1_n_0 ;
  wire \remainder[3]_i_8__1_n_0 ;
  wire \remainder[4]_i_1__1_n_0 ;
  wire \remainder[5]_i_1__1_n_0 ;
  wire \remainder[6]_i_1__1_n_0 ;
  wire \remainder[7]_i_10__1_n_0 ;
  wire \remainder[7]_i_1__1_n_0 ;
  wire \remainder[7]_i_7__1_n_0 ;
  wire \remainder[7]_i_8__1_n_0 ;
  wire \remainder[7]_i_9__1_n_0 ;
  wire \remainder[8]_i_1__1_n_0 ;
  wire \remainder[9]_i_1__1_n_0 ;
  wire [15:2]remainder_preview;
  wire \remainder_reg[11]_i_2__1_n_0 ;
  wire \remainder_reg[11]_i_2__1_n_1 ;
  wire \remainder_reg[11]_i_2__1_n_2 ;
  wire \remainder_reg[11]_i_2__1_n_3 ;
  wire \remainder_reg[15]_i_2__1_n_0 ;
  wire \remainder_reg[15]_i_2__1_n_1 ;
  wire \remainder_reg[15]_i_2__1_n_2 ;
  wire \remainder_reg[15]_i_2__1_n_3 ;
  wire \remainder_reg[3]_i_2__1_n_0 ;
  wire \remainder_reg[3]_i_2__1_n_1 ;
  wire \remainder_reg[3]_i_2__1_n_2 ;
  wire \remainder_reg[3]_i_2__1_n_3 ;
  wire \remainder_reg[7]_i_2__1_n_0 ;
  wire \remainder_reg[7]_i_2__1_n_1 ;
  wire \remainder_reg[7]_i_2__1_n_2 ;
  wire \remainder_reg[7]_i_2__1_n_3 ;
  wire reset;
  wire step_size1;
  wire \step_size[0]_i_1__1_n_0 ;
  wire \step_size[10]_i_1__1_n_0 ;
  wire \step_size[11]_i_1__1_n_0 ;
  wire \step_size[12]_i_1__1_n_0 ;
  wire \step_size[13]_i_1__1_n_0 ;
  wire \step_size[14]_i_1__1_n_0 ;
  wire \step_size[15]_i_1__1_n_0 ;
  wire \step_size[1]_i_1__1_n_0 ;
  wire \step_size[2]_i_1__1_n_0 ;
  wire \step_size[3]_i_1__1_n_0 ;
  wire \step_size[4]_i_1__1_n_0 ;
  wire \step_size[5]_i_1__1_n_0 ;
  wire \step_size[6]_i_1__1_n_0 ;
  wire \step_size[7]_i_1__1_n_0 ;
  wire \step_size[8]_i_1__1_n_0 ;
  wire \step_size[9]_i_1__1_n_0 ;
  wire [15:0]\step_size_curr_reg[15] ;
  wire [3:0]\NLW_remainder_reg[16]_i_3__1_CO_UNCONNECTED ;
  wire [3:1]\NLW_remainder_reg[16]_i_3__1_O_UNCONNECTED ;

  audioSys_0_counter_7 div_cnt
       (.CO(step_size1),
        .D(div_cnt_n_2),
        .DI({\remainder[16]_i_17__1_n_0 ,\remainder[16]_i_18__1_n_0 ,\remainder[16]_i_19__1_n_0 }),
        .E(E),
        .Q(Q[1:0]),
        .S(div_cnt_n_0),
        .clk(clk),
        .div_en_reg(div_en_reg),
        .remainder0(remainder0[0]),
        .remainder_preview(div_cnt_n_1),
        .\remainder_reg[0] (remainder[0]),
        .\remainder_reg[13] ({\remainder[16]_i_9__1_n_0 ,\remainder[16]_i_10__1_n_0 ,\remainder[16]_i_11__1_n_0 ,\remainder[16]_i_12__1_n_0 }),
        .\remainder_reg[14] ({\remainder[16]_i_13__1_n_0 ,\remainder[16]_i_14__1_n_0 ,\remainder[16]_i_15__1_n_0 ,\remainder[16]_i_16__1_n_0 }),
        .\remainder_reg[15] (\remainder[16]_i_6__1_n_0 ),
        .\remainder_reg[16] (\remainder[16]_i_5__1_n_0 ),
        .\remainder_reg[6] ({\remainder[16]_i_21__1_n_0 ,\remainder[16]_i_22__1_n_0 ,\remainder[16]_i_23__1_n_0 }),
        .reset(reset));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[10]_i_1__1 
       (.I0(remainder0[10]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[9]),
        .O(\remainder[10]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[11]_i_10__1 
       (.I0(remainder[7]),
        .I1(reset),
        .I2(Q[8]),
        .O(\remainder[11]_i_10__1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[11]_i_1__1 
       (.I0(remainder0[11]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[10]),
        .O(\remainder[11]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_3__1 
       (.I0(remainder[10]),
        .I1(reset),
        .O(remainder_preview[11]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_4__1 
       (.I0(remainder[9]),
        .I1(reset),
        .O(remainder_preview[10]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_5__1 
       (.I0(remainder[8]),
        .I1(reset),
        .O(remainder_preview[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[11]_i_6__1 
       (.I0(remainder[7]),
        .I1(reset),
        .O(remainder_preview[8]));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[11]_i_7__1 
       (.I0(reset),
        .I1(remainder[10]),
        .O(\remainder[11]_i_7__1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[11]_i_8__1 
       (.I0(reset),
        .I1(remainder[9]),
        .O(\remainder[11]_i_8__1_n_0 ));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[11]_i_9__1 
       (.I0(reset),
        .I1(remainder[8]),
        .I2(Q[9]),
        .O(\remainder[11]_i_9__1_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[12]_i_1__1 
       (.I0(remainder0[12]),
        .I1(remainder[11]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[12]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[13]_i_1__1 
       (.I0(remainder0[13]),
        .I1(remainder[12]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[13]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[14]_i_1__1 
       (.I0(remainder0[14]),
        .I1(remainder[13]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[14]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_10__1 
       (.I0(reset),
        .I1(remainder[11]),
        .O(\remainder[15]_i_10__1_n_0 ));
  LUT5 #(
    .INIT(32'hAA000C00)) 
    \remainder[15]_i_1__1 
       (.I0(remainder0[15]),
        .I1(remainder[14]),
        .I2(reset),
        .I3(div_en_reg),
        .I4(step_size1),
        .O(\remainder[15]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_3__1 
       (.I0(remainder[14]),
        .I1(reset),
        .O(remainder_preview[15]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_4__1 
       (.I0(remainder[13]),
        .I1(reset),
        .O(remainder_preview[14]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_5__1 
       (.I0(remainder[12]),
        .I1(reset),
        .O(remainder_preview[13]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[15]_i_6__1 
       (.I0(remainder[11]),
        .I1(reset),
        .O(remainder_preview[12]));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_7__1 
       (.I0(reset),
        .I1(remainder[14]),
        .O(\remainder[15]_i_7__1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_8__1 
       (.I0(reset),
        .I1(remainder[13]),
        .O(\remainder[15]_i_8__1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[15]_i_9__1 
       (.I0(reset),
        .I1(remainder[12]),
        .O(\remainder[15]_i_9__1_n_0 ));
  LUT3 #(
    .INIT(8'h32)) 
    \remainder[16]_i_10__1 
       (.I0(remainder[11]),
        .I1(reset),
        .I2(remainder[12]),
        .O(\remainder[16]_i_10__1_n_0 ));
  LUT3 #(
    .INIT(8'h32)) 
    \remainder[16]_i_11__1 
       (.I0(remainder[9]),
        .I1(reset),
        .I2(remainder[10]),
        .O(\remainder[16]_i_11__1_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_12__1 
       (.I0(Q[9]),
        .I1(reset),
        .I2(remainder[8]),
        .I3(remainder[7]),
        .I4(Q[8]),
        .O(\remainder[16]_i_12__1_n_0 ));
  LUT3 #(
    .INIT(8'hCD)) 
    \remainder[16]_i_13__1 
       (.I0(remainder[14]),
        .I1(reset),
        .I2(remainder[13]),
        .O(\remainder[16]_i_13__1_n_0 ));
  LUT3 #(
    .INIT(8'hCD)) 
    \remainder[16]_i_14__1 
       (.I0(remainder[12]),
        .I1(reset),
        .I2(remainder[11]),
        .O(\remainder[16]_i_14__1_n_0 ));
  LUT3 #(
    .INIT(8'hCD)) 
    \remainder[16]_i_15__1 
       (.I0(remainder[10]),
        .I1(reset),
        .I2(remainder[9]),
        .O(\remainder[16]_i_15__1_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_16__1 
       (.I0(remainder[8]),
        .I1(Q[9]),
        .I2(remainder[7]),
        .I3(reset),
        .I4(Q[8]),
        .O(\remainder[16]_i_16__1_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_17__1 
       (.I0(Q[7]),
        .I1(reset),
        .I2(remainder[6]),
        .I3(remainder[5]),
        .I4(Q[6]),
        .O(\remainder[16]_i_17__1_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_18__1 
       (.I0(Q[5]),
        .I1(reset),
        .I2(remainder[4]),
        .I3(remainder[3]),
        .I4(Q[4]),
        .O(\remainder[16]_i_18__1_n_0 ));
  LUT5 #(
    .INIT(32'h10103110)) 
    \remainder[16]_i_19__1 
       (.I0(Q[3]),
        .I1(reset),
        .I2(remainder[2]),
        .I3(remainder[1]),
        .I4(Q[2]),
        .O(\remainder[16]_i_19__1_n_0 ));
  LUT5 #(
    .INIT(32'hF4000400)) 
    \remainder[16]_i_1__1 
       (.I0(reset),
        .I1(remainder[15]),
        .I2(step_size1),
        .I3(div_en_reg),
        .I4(remainder0[16]),
        .O(\remainder[16]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_21__1 
       (.I0(remainder[6]),
        .I1(Q[7]),
        .I2(remainder[5]),
        .I3(reset),
        .I4(Q[6]),
        .O(\remainder[16]_i_21__1_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_22__1 
       (.I0(remainder[4]),
        .I1(Q[5]),
        .I2(remainder[3]),
        .I3(reset),
        .I4(Q[4]),
        .O(\remainder[16]_i_22__1_n_0 ));
  LUT5 #(
    .INIT(32'h00903309)) 
    \remainder[16]_i_23__1 
       (.I0(remainder[2]),
        .I1(Q[3]),
        .I2(remainder[1]),
        .I3(reset),
        .I4(Q[2]),
        .O(\remainder[16]_i_23__1_n_0 ));
  LUT3 #(
    .INIT(8'h54)) 
    \remainder[16]_i_5__1 
       (.I0(reset),
        .I1(remainder[16]),
        .I2(remainder[15]),
        .O(\remainder[16]_i_5__1_n_0 ));
  LUT3 #(
    .INIT(8'hF1)) 
    \remainder[16]_i_6__1 
       (.I0(remainder[15]),
        .I1(remainder[16]),
        .I2(reset),
        .O(\remainder[16]_i_6__1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \remainder[16]_i_7__1 
       (.I0(reset),
        .I1(remainder[15]),
        .O(\remainder[16]_i_7__1_n_0 ));
  LUT3 #(
    .INIT(8'h32)) 
    \remainder[16]_i_9__1 
       (.I0(remainder[13]),
        .I1(reset),
        .I2(remainder[14]),
        .O(\remainder[16]_i_9__1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[1]_i_1__1 
       (.I0(remainder0[1]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[0]),
        .O(\remainder[1]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[2]_i_1__1 
       (.I0(remainder0[2]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[1]),
        .O(\remainder[2]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[3]_i_1__1 
       (.I0(remainder0[3]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[2]),
        .O(\remainder[3]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[3]_i_3__1 
       (.I0(remainder[2]),
        .I1(reset),
        .O(remainder_preview[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[3]_i_4__1 
       (.I0(remainder[1]),
        .I1(reset),
        .O(remainder_preview[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[3]_i_5__1 
       (.I0(remainder[0]),
        .I1(reset),
        .O(\remainder[3]_i_5__1_n_0 ));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[3]_i_6__1 
       (.I0(reset),
        .I1(remainder[2]),
        .I2(Q[3]),
        .O(\remainder[3]_i_6__1_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[3]_i_7__1 
       (.I0(remainder[1]),
        .I1(reset),
        .I2(Q[2]),
        .O(\remainder[3]_i_7__1_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[3]_i_8__1 
       (.I0(remainder[0]),
        .I1(reset),
        .I2(Q[1]),
        .O(\remainder[3]_i_8__1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[4]_i_1__1 
       (.I0(remainder0[4]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[3]),
        .O(\remainder[4]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[5]_i_1__1 
       (.I0(remainder0[5]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[4]),
        .O(\remainder[5]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[6]_i_1__1 
       (.I0(remainder0[6]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[5]),
        .O(\remainder[6]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[7]_i_10__1 
       (.I0(remainder[3]),
        .I1(reset),
        .I2(Q[4]),
        .O(\remainder[7]_i_10__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[7]_i_1__1 
       (.I0(remainder0[7]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[6]),
        .O(\remainder[7]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_3__1 
       (.I0(remainder[6]),
        .I1(reset),
        .O(remainder_preview[7]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_4__1 
       (.I0(remainder[5]),
        .I1(reset),
        .O(remainder_preview[6]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_5__1 
       (.I0(remainder[4]),
        .I1(reset),
        .O(remainder_preview[5]));
  LUT2 #(
    .INIT(4'h2)) 
    \remainder[7]_i_6__1 
       (.I0(remainder[3]),
        .I1(reset),
        .O(remainder_preview[4]));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[7]_i_7__1 
       (.I0(reset),
        .I1(remainder[6]),
        .I2(Q[7]),
        .O(\remainder[7]_i_7__1_n_0 ));
  LUT3 #(
    .INIT(8'h2D)) 
    \remainder[7]_i_8__1 
       (.I0(remainder[5]),
        .I1(reset),
        .I2(Q[6]),
        .O(\remainder[7]_i_8__1_n_0 ));
  LUT3 #(
    .INIT(8'h4B)) 
    \remainder[7]_i_9__1 
       (.I0(reset),
        .I1(remainder[4]),
        .I2(Q[5]),
        .O(\remainder[7]_i_9__1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[8]_i_1__1 
       (.I0(remainder0[8]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[7]),
        .O(\remainder[8]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h80B08080)) 
    \remainder[9]_i_1__1 
       (.I0(remainder0[9]),
        .I1(step_size1),
        .I2(div_en_reg),
        .I3(reset),
        .I4(remainder[8]),
        .O(\remainder[9]_i_1__1_n_0 ));
  FDCE \remainder_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(div_cnt_n_2),
        .Q(remainder[0]));
  FDCE \remainder_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[10]_i_1__1_n_0 ),
        .Q(remainder[10]));
  FDCE \remainder_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[11]_i_1__1_n_0 ),
        .Q(remainder[11]));
  CARRY4 \remainder_reg[11]_i_2__1 
       (.CI(\remainder_reg[7]_i_2__1_n_0 ),
        .CO({\remainder_reg[11]_i_2__1_n_0 ,\remainder_reg[11]_i_2__1_n_1 ,\remainder_reg[11]_i_2__1_n_2 ,\remainder_reg[11]_i_2__1_n_3 }),
        .CYINIT(1'b0),
        .DI(remainder_preview[11:8]),
        .O(remainder0[11:8]),
        .S({\remainder[11]_i_7__1_n_0 ,\remainder[11]_i_8__1_n_0 ,\remainder[11]_i_9__1_n_0 ,\remainder[11]_i_10__1_n_0 }));
  FDCE \remainder_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[12]_i_1__1_n_0 ),
        .Q(remainder[12]));
  FDCE \remainder_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[13]_i_1__1_n_0 ),
        .Q(remainder[13]));
  FDCE \remainder_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[14]_i_1__1_n_0 ),
        .Q(remainder[14]));
  FDCE \remainder_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[15]_i_1__1_n_0 ),
        .Q(remainder[15]));
  CARRY4 \remainder_reg[15]_i_2__1 
       (.CI(\remainder_reg[11]_i_2__1_n_0 ),
        .CO({\remainder_reg[15]_i_2__1_n_0 ,\remainder_reg[15]_i_2__1_n_1 ,\remainder_reg[15]_i_2__1_n_2 ,\remainder_reg[15]_i_2__1_n_3 }),
        .CYINIT(1'b0),
        .DI(remainder_preview[15:12]),
        .O(remainder0[15:12]),
        .S({\remainder[15]_i_7__1_n_0 ,\remainder[15]_i_8__1_n_0 ,\remainder[15]_i_9__1_n_0 ,\remainder[15]_i_10__1_n_0 }));
  FDCE \remainder_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[16]_i_1__1_n_0 ),
        .Q(remainder[16]));
  CARRY4 \remainder_reg[16]_i_3__1 
       (.CI(\remainder_reg[15]_i_2__1_n_0 ),
        .CO(\NLW_remainder_reg[16]_i_3__1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_remainder_reg[16]_i_3__1_O_UNCONNECTED [3:1],remainder0[16]}),
        .S({1'b0,1'b0,1'b0,\remainder[16]_i_7__1_n_0 }));
  FDCE \remainder_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[1]_i_1__1_n_0 ),
        .Q(remainder[1]));
  FDCE \remainder_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[2]_i_1__1_n_0 ),
        .Q(remainder[2]));
  FDCE \remainder_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[3]_i_1__1_n_0 ),
        .Q(remainder[3]));
  CARRY4 \remainder_reg[3]_i_2__1 
       (.CI(1'b0),
        .CO({\remainder_reg[3]_i_2__1_n_0 ,\remainder_reg[3]_i_2__1_n_1 ,\remainder_reg[3]_i_2__1_n_2 ,\remainder_reg[3]_i_2__1_n_3 }),
        .CYINIT(1'b1),
        .DI({remainder_preview[3:2],\remainder[3]_i_5__1_n_0 ,div_cnt_n_1}),
        .O(remainder0[3:0]),
        .S({\remainder[3]_i_6__1_n_0 ,\remainder[3]_i_7__1_n_0 ,\remainder[3]_i_8__1_n_0 ,div_cnt_n_0}));
  FDCE \remainder_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[4]_i_1__1_n_0 ),
        .Q(remainder[4]));
  FDCE \remainder_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[5]_i_1__1_n_0 ),
        .Q(remainder[5]));
  FDCE \remainder_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[6]_i_1__1_n_0 ),
        .Q(remainder[6]));
  FDCE \remainder_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[7]_i_1__1_n_0 ),
        .Q(remainder[7]));
  CARRY4 \remainder_reg[7]_i_2__1 
       (.CI(\remainder_reg[3]_i_2__1_n_0 ),
        .CO({\remainder_reg[7]_i_2__1_n_0 ,\remainder_reg[7]_i_2__1_n_1 ,\remainder_reg[7]_i_2__1_n_2 ,\remainder_reg[7]_i_2__1_n_3 }),
        .CYINIT(1'b0),
        .DI(remainder_preview[7:4]),
        .O(remainder0[7:4]),
        .S({\remainder[7]_i_7__1_n_0 ,\remainder[7]_i_8__1_n_0 ,\remainder[7]_i_9__1_n_0 ,\remainder[7]_i_10__1_n_0 }));
  FDCE \remainder_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[8]_i_1__1_n_0 ),
        .Q(remainder[8]));
  FDCE \remainder_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\remainder[9]_i_1__1_n_0 ),
        .Q(remainder[9]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[0]_i_1__1 
       (.I0(div_en_reg),
        .I1(step_size1),
        .O(\step_size[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[10]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [9]),
        .O(\step_size[10]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[11]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [10]),
        .O(\step_size[11]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[12]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [11]),
        .O(\step_size[12]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[13]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [12]),
        .O(\step_size[13]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[14]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [13]),
        .O(\step_size[14]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[15]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [14]),
        .O(\step_size[15]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[1]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [0]),
        .O(\step_size[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[2]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [1]),
        .O(\step_size[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[3]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [2]),
        .O(\step_size[3]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[4]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [3]),
        .O(\step_size[4]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[5]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [4]),
        .O(\step_size[5]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[6]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [5]),
        .O(\step_size[6]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[7]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [6]),
        .O(\step_size[7]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[8]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [7]),
        .O(\step_size[8]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \step_size[9]_i_1__1 
       (.I0(div_en_reg),
        .I1(\step_size_curr_reg[15] [8]),
        .O(\step_size[9]_i_1__1_n_0 ));
  FDCE \step_size_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[0]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [0]));
  FDCE \step_size_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[10]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [10]));
  FDCE \step_size_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[11]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [11]));
  FDCE \step_size_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[12]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [12]));
  FDCE \step_size_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[13]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [13]));
  FDCE \step_size_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[14]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [14]));
  FDCE \step_size_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[15]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [15]));
  FDCE \step_size_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[1]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [1]));
  FDCE \step_size_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[2]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [2]));
  FDCE \step_size_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[3]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [3]));
  FDCE \step_size_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[4]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [4]));
  FDCE \step_size_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[5]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [5]));
  FDCE \step_size_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[6]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [6]));
  FDCE \step_size_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[7]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [7]));
  FDCE \step_size_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[8]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [8]));
  FDCE \step_size_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\step_size[9]_i_1__1_n_0 ),
        .Q(\step_size_curr_reg[15] [9]));
endmodule

(* ORIG_REF_NAME = "freqAttenuatorSingle" *) 
module audioSys_0_freqAttenuatorSingle
   (sent,
    atten_valid_freq_reg_0,
    atten_valid_freq_reg_1,
    atten_valid,
    atten_valid_freq_reg_2,
    E,
    \status_reg[0] ,
    \waveform_atten_freq_reg[0]_0 ,
    step,
    clk,
    reset,
    atten_valid_freq,
    waveform,
    \received_byte_reg[6] ,
    atten_mag);
  output sent;
  output atten_valid_freq_reg_0;
  output atten_valid_freq_reg_1;
  output atten_valid;
  output [0:0]atten_valid_freq_reg_2;
  output [0:0]E;
  output \status_reg[0] ;
  output \waveform_atten_freq_reg[0]_0 ;
  input step;
  input clk;
  input reset;
  input [1:0]atten_valid_freq;
  input [8:0]waveform;
  input [0:0]\received_byte_reg[6] ;
  input [3:0]atten_mag;

  wire [0:0]E;
  wire [3:0]atten_mag;
  wire atten_valid;
  wire [1:0]atten_valid_freq;
  wire atten_valid_freq_i_1_n_0;
  wire atten_valid_freq_reg_0;
  wire atten_valid_freq_reg_1;
  wire [0:0]atten_valid_freq_reg_2;
  wire clk;
  wire [1:0]count;
  wire \count[0]_i_1__5_n_0 ;
  wire \count[1]_i_1__3_n_0 ;
  wire [1:0]cs;
  wire \cs[0]_i_1__3_n_0 ;
  wire \cs[1]_i_1__1_n_0 ;
  wire [5:0]multVal;
  wire [15:0]product;
  wire [0:0]\received_byte_reg[6] ;
  wire reset;
  wire sent;
  wire \status_reg[0] ;
  wire step;
  wire waveMult_i_7_n_0;
  wire [8:0]waveform;
  wire waveformStorage_n_0;
  wire \waveform_atten_freq_reg[0]_0 ;
  wire [15:0]waveform_base;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    atten_valid_freq_i_1
       (.I0(sent),
        .I1(step),
        .I2(atten_valid_freq_reg_2),
        .O(atten_valid_freq_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    atten_valid_freq_i_1__0
       (.I0(sent),
        .I1(step),
        .I2(atten_valid_freq[1]),
        .O(atten_valid_freq_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    atten_valid_freq_i_1__1
       (.I0(sent),
        .I1(step),
        .I2(atten_valid_freq[0]),
        .O(atten_valid_freq_reg_1));
  FDCE atten_valid_freq_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(atten_valid_freq_i_1_n_0),
        .Q(atten_valid_freq_reg_2));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \bitCount[3]_i_4__0 
       (.I0(atten_valid_freq_reg_2),
        .I1(atten_valid_freq[0]),
        .I2(atten_valid_freq[1]),
        .O(atten_valid));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \count[0]_i_1__5 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(count[0]),
        .O(\count[0]_i_1__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0220)) 
    \count[1]_i_1__3 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(count[1]),
        .I3(count[0]),
        .O(\count[1]_i_1__3_n_0 ));
  FDCE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\count[0]_i_1__5_n_0 ),
        .Q(count[0]));
  FDCE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\count[1]_i_1__3_n_0 ),
        .Q(count[1]));
  LUT6 #(
    .INIT(64'h000F00007FFF7F7F)) 
    \cs[0]_i_1__3 
       (.I0(count[1]),
        .I1(count[0]),
        .I2(cs[0]),
        .I3(sent),
        .I4(step),
        .I5(cs[1]),
        .O(\cs[0]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h51A200A200A200A2)) 
    \cs[1]_i_1__1 
       (.I0(cs[1]),
        .I1(step),
        .I2(sent),
        .I3(cs[0]),
        .I4(count[1]),
        .I5(count[0]),
        .O(\cs[1]_i_1__1_n_0 ));
  FDCE \cs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\cs[0]_i_1__3_n_0 ),
        .Q(cs[0]));
  FDCE \cs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\cs[1]_i_1__1_n_0 ),
        .Q(cs[1]));
  FDCE sent_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(step),
        .Q(sent));
  LUT6 #(
    .INIT(64'hFBFFFFFFA2A2A2A2)) 
    \status[0]_i_2 
       (.I0(cs[1]),
        .I1(step),
        .I2(sent),
        .I3(count[0]),
        .I4(count[1]),
        .I5(cs[0]),
        .O(\status_reg[0] ));
  (* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0,{}" *) 
  (* CORE_GENERATION_INFO = "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "mult_gen_v12_0,Vivado 2015.2" *) 
  audioSys_0_mult_gen_0__3 waveMult
       (.A({waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[7:0]}),
        .B(multVal),
        .CE(waveMult_i_7_n_0),
        .CLK(clk),
        .P(product));
  LUT4 #(
    .INIT(16'h0444)) 
    waveMult_i_7
       (.I0(cs[1]),
        .I1(cs[0]),
        .I2(count[1]),
        .I3(count[0]),
        .O(waveMult_i_7_n_0));
  audioSys_0_baseReg waveformStorage
       (.E(E),
        .P(product[2:0]),
        .Q({waveform_base[15],waveform_base[7:0]}),
        .atten_mag(atten_mag),
        .clk(clk),
        .multVal(multVal),
        .\received_byte_reg[6] (\received_byte_reg[6] ),
        .reset(reset),
        .sent_reg(sent),
        .step(step),
        .waveform(waveform),
        .\waveform_atten_freq_reg[0] (waveformStorage_n_0),
        .\waveform_atten_freq_reg[0]_0 (\waveform_atten_freq_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0055000055D55555)) 
    \waveform[15]_i_1 
       (.I0(cs[0]),
        .I1(count[1]),
        .I2(count[0]),
        .I3(sent),
        .I4(step),
        .I5(cs[1]),
        .O(E));
  FDCE \waveform_atten_freq_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(waveformStorage_n_0),
        .Q(\waveform_atten_freq_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "freqAttenuatorSingle" *) 
module audioSys_0_freqAttenuatorSingle__xdcDup__1
   (\waveform_atten_freq_reg[0]_0 ,
    atten_valid_freq,
    E,
    \status_reg[0] ,
    clk,
    reset,
    sent_reg,
    sent,
    step,
    waveform,
    \received_byte_reg[7] ,
    atten_mag);
  output \waveform_atten_freq_reg[0]_0 ;
  output [0:0]atten_valid_freq;
  output [0:0]E;
  output \status_reg[0] ;
  input clk;
  input reset;
  input sent_reg;
  input sent;
  input step;
  input [8:0]waveform;
  input [0:0]\received_byte_reg[7] ;
  input [3:0]atten_mag;

  wire [0:0]E;
  wire [3:0]atten_mag;
  wire [0:0]atten_valid_freq;
  wire clk;
  wire [1:0]count;
  wire \count[0]_i_1__7_n_0 ;
  wire \count[1]_i_1__5_n_0 ;
  wire [1:0]cs;
  wire \cs[0]_i_1__1_n_0 ;
  wire \cs[1]_i_1__3_n_0 ;
  wire [5:0]multVal;
  wire [15:0]product;
  wire [0:0]\received_byte_reg[7] ;
  wire reset;
  wire sent;
  wire sent_reg;
  wire \status_reg[0] ;
  wire step;
  wire waveMult_i_7__1_n_0;
  wire [8:0]waveform;
  wire waveformStorage_n_0;
  wire \waveform_atten_freq_reg[0]_0 ;
  wire [15:0]waveform_base;

  FDCE atten_valid_freq_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(sent_reg),
        .Q(atten_valid_freq));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \count[0]_i_1__7 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(count[0]),
        .O(\count[0]_i_1__7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0220)) 
    \count[1]_i_1__5 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(count[1]),
        .I3(count[0]),
        .O(\count[1]_i_1__5_n_0 ));
  FDCE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\count[0]_i_1__7_n_0 ),
        .Q(count[0]));
  FDCE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\count[1]_i_1__5_n_0 ),
        .Q(count[1]));
  LUT6 #(
    .INIT(64'h000F00007FFF7F7F)) 
    \cs[0]_i_1__1 
       (.I0(count[1]),
        .I1(count[0]),
        .I2(cs[0]),
        .I3(sent),
        .I4(step),
        .I5(cs[1]),
        .O(\cs[0]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h51A200A200A200A2)) 
    \cs[1]_i_1__3 
       (.I0(cs[1]),
        .I1(step),
        .I2(sent),
        .I3(cs[0]),
        .I4(count[1]),
        .I5(count[0]),
        .O(\cs[1]_i_1__3_n_0 ));
  FDCE \cs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\cs[0]_i_1__1_n_0 ),
        .Q(cs[0]));
  FDCE \cs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\cs[1]_i_1__3_n_0 ),
        .Q(cs[1]));
  LUT6 #(
    .INIT(64'hFBFFFFFFA2A2A2A2)) 
    \status[0]_i_2__1 
       (.I0(cs[1]),
        .I1(step),
        .I2(sent),
        .I3(count[0]),
        .I4(count[1]),
        .I5(cs[0]),
        .O(\status_reg[0] ));
  (* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0,{}" *) 
  (* CORE_GENERATION_INFO = "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "mult_gen_v12_0,Vivado 2015.2" *) 
  audioSys_0_mult_gen_0 waveMult
       (.A({waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[7:0]}),
        .B(multVal),
        .CE(waveMult_i_7__1_n_0),
        .CLK(clk),
        .P(product));
  LUT4 #(
    .INIT(16'h0444)) 
    waveMult_i_7__1
       (.I0(cs[1]),
        .I1(cs[0]),
        .I2(count[1]),
        .I3(count[0]),
        .O(waveMult_i_7__1_n_0));
  audioSys_0_baseReg_10 waveformStorage
       (.E(E),
        .P(product[2:0]),
        .Q({waveform_base[15],waveform_base[7:0]}),
        .atten_mag(atten_mag),
        .clk(clk),
        .multVal(multVal),
        .\received_byte_reg[7] (\received_byte_reg[7] ),
        .reset(reset),
        .sent(sent),
        .step(step),
        .waveform(waveform),
        .\waveform_atten_freq_reg[0] (waveformStorage_n_0),
        .\waveform_atten_freq_reg[0]_0 (\waveform_atten_freq_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0055000055D55555)) 
    \waveform[15]_i_1__1 
       (.I0(cs[0]),
        .I1(count[1]),
        .I2(count[0]),
        .I3(sent),
        .I4(step),
        .I5(cs[1]),
        .O(E));
  FDCE \waveform_atten_freq_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(waveformStorage_n_0),
        .Q(\waveform_atten_freq_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "freqAttenuatorSingle" *) 
module audioSys_0_freqAttenuatorSingle__xdcDup__2
   (\waveform_atten_freq_reg[0]_0 ,
    atten_valid_freq,
    D,
    E,
    \status_reg[0] ,
    clk,
    reset,
    sent_reg,
    sent,
    step,
    atten_valid_freq_reg_0,
    Q,
    waveform,
    \received_byte_reg[7] ,
    atten_mag);
  output \waveform_atten_freq_reg[0]_0 ;
  output [0:0]atten_valid_freq;
  output [0:0]D;
  output [0:0]E;
  output \status_reg[0] ;
  input clk;
  input reset;
  input sent_reg;
  input sent;
  input step;
  input [1:0]atten_valid_freq_reg_0;
  input [0:0]Q;
  input [8:0]waveform;
  input [0:0]\received_byte_reg[7] ;
  input [3:0]atten_mag;

  wire [0:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [3:0]atten_mag;
  wire [0:0]atten_valid_freq;
  wire [1:0]atten_valid_freq_reg_0;
  wire clk;
  wire [1:0]count;
  wire \count[0]_i_1__6_n_0 ;
  wire \count[1]_i_1__4_n_0 ;
  wire [1:0]cs;
  wire \cs[0]_i_1__2_n_0 ;
  wire \cs[1]_i_1__2_n_0 ;
  wire [5:0]multVal;
  wire [15:0]product;
  wire [0:0]\received_byte_reg[7] ;
  wire reset;
  wire sent;
  wire sent_reg;
  wire \status_reg[0] ;
  wire step;
  wire waveMult_i_7__0_n_0;
  wire [8:0]waveform;
  wire waveformStorage_n_0;
  wire \waveform_atten_freq_reg[0]_0 ;
  wire [15:0]waveform_base;

  FDCE atten_valid_freq_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(sent_reg),
        .Q(atten_valid_freq));
  LUT4 #(
    .INIT(16'h01FF)) 
    \count[0]_i_1__3 
       (.I0(atten_valid_freq),
        .I1(atten_valid_freq_reg_0[0]),
        .I2(atten_valid_freq_reg_0[1]),
        .I3(Q),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \count[0]_i_1__6 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(count[0]),
        .O(\count[0]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0220)) 
    \count[1]_i_1__4 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(count[1]),
        .I3(count[0]),
        .O(\count[1]_i_1__4_n_0 ));
  FDCE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\count[0]_i_1__6_n_0 ),
        .Q(count[0]));
  FDCE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\count[1]_i_1__4_n_0 ),
        .Q(count[1]));
  LUT6 #(
    .INIT(64'h000F00007FFF7F7F)) 
    \cs[0]_i_1__2 
       (.I0(count[1]),
        .I1(count[0]),
        .I2(cs[0]),
        .I3(sent),
        .I4(step),
        .I5(cs[1]),
        .O(\cs[0]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h51A200A200A200A2)) 
    \cs[1]_i_1__2 
       (.I0(cs[1]),
        .I1(step),
        .I2(sent),
        .I3(cs[0]),
        .I4(count[1]),
        .I5(count[0]),
        .O(\cs[1]_i_1__2_n_0 ));
  FDCE \cs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\cs[0]_i_1__2_n_0 ),
        .Q(cs[0]));
  FDCE \cs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\cs[1]_i_1__2_n_0 ),
        .Q(cs[1]));
  LUT6 #(
    .INIT(64'hFBFFFFFFA2A2A2A2)) 
    \status[0]_i_2__0 
       (.I0(cs[1]),
        .I1(step),
        .I2(sent),
        .I3(count[0]),
        .I4(count[1]),
        .I5(cs[0]),
        .O(\status_reg[0] ));
  (* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0,{}" *) 
  (* CORE_GENERATION_INFO = "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "mult_gen_v12_0,Vivado 2015.2" *) 
  audioSys_0_mult_gen_0__4 waveMult
       (.A({waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[15],waveform_base[7:0]}),
        .B(multVal),
        .CE(waveMult_i_7__0_n_0),
        .CLK(clk),
        .P(product));
  LUT4 #(
    .INIT(16'h0444)) 
    waveMult_i_7__0
       (.I0(cs[1]),
        .I1(cs[0]),
        .I2(count[1]),
        .I3(count[0]),
        .O(waveMult_i_7__0_n_0));
  audioSys_0_baseReg_8 waveformStorage
       (.E(E),
        .P(product[2:0]),
        .Q({waveform_base[15],waveform_base[7:0]}),
        .atten_mag(atten_mag),
        .clk(clk),
        .multVal(multVal),
        .\received_byte_reg[7] (\received_byte_reg[7] ),
        .reset(reset),
        .sent(sent),
        .step(step),
        .waveform(waveform),
        .\waveform_atten_freq_reg[0] (waveformStorage_n_0),
        .\waveform_atten_freq_reg[0]_0 (\waveform_atten_freq_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0055000055D55555)) 
    \waveform[15]_i_1__0 
       (.I0(cs[0]),
        .I1(count[1]),
        .I2(count[0]),
        .I3(sent),
        .I4(step),
        .I5(cs[1]),
        .O(E));
  FDCE \waveform_atten_freq_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(waveformStorage_n_0),
        .Q(\waveform_atten_freq_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "freqSynth" *) 
module audioSys_0_freqSynth
   (\remainder_reg[0] ,
    Q,
    E,
    \first_byte_reg[6] ,
    clk,
    reset,
    \first_byte_reg[6]_0 ,
    D,
    \cs_reg[1] ,
    \cs_reg[0] );
  output \remainder_reg[0] ;
  output [8:0]Q;
  output [0:0]E;
  input \first_byte_reg[6] ;
  input clk;
  input reset;
  input [0:0]\first_byte_reg[6]_0 ;
  input [9:0]D;
  input \cs_reg[1] ;
  input [0:0]\cs_reg[0] ;

  wire [9:0]D;
  wire [0:0]E;
  wire [8:0]Q;
  wire clk;
  wire [0:0]\cs_reg[0] ;
  wire \cs_reg[1] ;
  wire [9:0]data;
  wire \first_byte_reg[6] ;
  wire [0:0]\first_byte_reg[6]_0 ;
  wire \remainder_reg[0] ;
  wire reset;
  wire [15:0]step_size;
  wire [15:0]step_size_curr;

  FDCE \data_reg[0] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[0]),
        .Q(data[0]));
  FDCE \data_reg[1] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[1]),
        .Q(data[1]));
  FDCE \data_reg[2] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[2]),
        .Q(data[2]));
  FDCE \data_reg[3] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[3]),
        .Q(data[3]));
  FDCE \data_reg[4] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[4]),
        .Q(data[4]));
  FDCE \data_reg[5] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[5]),
        .Q(data[5]));
  FDCE \data_reg[6] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[6]),
        .Q(data[6]));
  FDCE \data_reg[7] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[7]),
        .Q(data[7]));
  FDCE \data_reg[8] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[8]),
        .Q(data[8]));
  FDCE \data_reg[9] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[9]),
        .Q(data[9]));
  FDCE div_en_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\first_byte_reg[6] ),
        .Q(\remainder_reg[0] ));
  audioSys_0_divider_5 freqCalc
       (.E(E),
        .Q(data),
        .clk(clk),
        .div_en_reg(\remainder_reg[0] ),
        .reset(reset),
        .\step_size_curr_reg[15] (step_size));
  audioSys_0_waveGen_6 gen
       (.Q(step_size_curr),
        .clk(clk),
        .\cs_reg[0] (\cs_reg[0] ),
        .\cs_reg[1] (\cs_reg[1] ),
        .reset(reset),
        .\waveform_base_reg[15] (Q));
  FDCE \step_size_curr_reg[0] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[0]),
        .Q(step_size_curr[0]));
  FDCE \step_size_curr_reg[10] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[10]),
        .Q(step_size_curr[10]));
  FDCE \step_size_curr_reg[11] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[11]),
        .Q(step_size_curr[11]));
  FDCE \step_size_curr_reg[12] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[12]),
        .Q(step_size_curr[12]));
  FDCE \step_size_curr_reg[13] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[13]),
        .Q(step_size_curr[13]));
  FDCE \step_size_curr_reg[14] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[14]),
        .Q(step_size_curr[14]));
  FDCE \step_size_curr_reg[15] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[15]),
        .Q(step_size_curr[15]));
  FDCE \step_size_curr_reg[1] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[1]),
        .Q(step_size_curr[1]));
  FDCE \step_size_curr_reg[2] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[2]),
        .Q(step_size_curr[2]));
  FDCE \step_size_curr_reg[3] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[3]),
        .Q(step_size_curr[3]));
  FDCE \step_size_curr_reg[4] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[4]),
        .Q(step_size_curr[4]));
  FDCE \step_size_curr_reg[5] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[5]),
        .Q(step_size_curr[5]));
  FDCE \step_size_curr_reg[6] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[6]),
        .Q(step_size_curr[6]));
  FDCE \step_size_curr_reg[7] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[7]),
        .Q(step_size_curr[7]));
  FDCE \step_size_curr_reg[8] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[8]),
        .Q(step_size_curr[8]));
  FDCE \step_size_curr_reg[9] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[9]),
        .Q(step_size_curr[9]));
endmodule

(* ORIG_REF_NAME = "freqSynth" *) 
module audioSys_0_freqSynth_0
   (\remainder_reg[0] ,
    Q,
    E,
    \first_byte_reg[6] ,
    clk,
    reset,
    \first_byte_reg[6]_0 ,
    D,
    \cs_reg[1] ,
    \cs_reg[0] );
  output \remainder_reg[0] ;
  output [8:0]Q;
  output [0:0]E;
  input \first_byte_reg[6] ;
  input clk;
  input reset;
  input [0:0]\first_byte_reg[6]_0 ;
  input [9:0]D;
  input \cs_reg[1] ;
  input [0:0]\cs_reg[0] ;

  wire [9:0]D;
  wire [0:0]E;
  wire [8:0]Q;
  wire clk;
  wire [0:0]\cs_reg[0] ;
  wire \cs_reg[1] ;
  wire [9:0]data;
  wire \first_byte_reg[6] ;
  wire [0:0]\first_byte_reg[6]_0 ;
  wire \remainder_reg[0] ;
  wire reset;
  wire [15:0]step_size;
  wire [15:0]step_size_curr;

  FDCE \data_reg[0] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[0]),
        .Q(data[0]));
  FDCE \data_reg[1] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[1]),
        .Q(data[1]));
  FDCE \data_reg[2] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[2]),
        .Q(data[2]));
  FDCE \data_reg[3] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[3]),
        .Q(data[3]));
  FDCE \data_reg[4] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[4]),
        .Q(data[4]));
  FDCE \data_reg[5] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[5]),
        .Q(data[5]));
  FDCE \data_reg[6] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[6]),
        .Q(data[6]));
  FDCE \data_reg[7] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[7]),
        .Q(data[7]));
  FDCE \data_reg[8] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[8]),
        .Q(data[8]));
  FDCE \data_reg[9] 
       (.C(clk),
        .CE(\first_byte_reg[6]_0 ),
        .CLR(reset),
        .D(D[9]),
        .Q(data[9]));
  FDCE div_en_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\first_byte_reg[6] ),
        .Q(\remainder_reg[0] ));
  audioSys_0_divider_2 freqCalc
       (.E(E),
        .Q(data),
        .clk(clk),
        .div_en_reg(\remainder_reg[0] ),
        .reset(reset),
        .\step_size_curr_reg[15] (step_size));
  audioSys_0_waveGen_3 gen
       (.Q(step_size_curr),
        .clk(clk),
        .\cs_reg[0] (\cs_reg[0] ),
        .\cs_reg[1] (\cs_reg[1] ),
        .reset(reset),
        .\waveform_base_reg[15] (Q));
  FDCE \step_size_curr_reg[0] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[0]),
        .Q(step_size_curr[0]));
  FDCE \step_size_curr_reg[10] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[10]),
        .Q(step_size_curr[10]));
  FDCE \step_size_curr_reg[11] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[11]),
        .Q(step_size_curr[11]));
  FDCE \step_size_curr_reg[12] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[12]),
        .Q(step_size_curr[12]));
  FDCE \step_size_curr_reg[13] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[13]),
        .Q(step_size_curr[13]));
  FDCE \step_size_curr_reg[14] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[14]),
        .Q(step_size_curr[14]));
  FDCE \step_size_curr_reg[15] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[15]),
        .Q(step_size_curr[15]));
  FDCE \step_size_curr_reg[1] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[1]),
        .Q(step_size_curr[1]));
  FDCE \step_size_curr_reg[2] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[2]),
        .Q(step_size_curr[2]));
  FDCE \step_size_curr_reg[3] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[3]),
        .Q(step_size_curr[3]));
  FDCE \step_size_curr_reg[4] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[4]),
        .Q(step_size_curr[4]));
  FDCE \step_size_curr_reg[5] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[5]),
        .Q(step_size_curr[5]));
  FDCE \step_size_curr_reg[6] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[6]),
        .Q(step_size_curr[6]));
  FDCE \step_size_curr_reg[7] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[7]),
        .Q(step_size_curr[7]));
  FDCE \step_size_curr_reg[8] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[8]),
        .Q(step_size_curr[8]));
  FDCE \step_size_curr_reg[9] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[9]),
        .Q(step_size_curr[9]));
endmodule

(* ORIG_REF_NAME = "freqSynth" *) 
module audioSys_0_freqSynth_1
   (\remainder_reg[0] ,
    Q,
    E,
    \first_byte_reg[7] ,
    clk,
    reset,
    \first_byte_reg[7]_0 ,
    D,
    \cs_reg[1] ,
    \cs_reg[0] );
  output \remainder_reg[0] ;
  output [8:0]Q;
  output [0:0]E;
  input \first_byte_reg[7] ;
  input clk;
  input reset;
  input [0:0]\first_byte_reg[7]_0 ;
  input [9:0]D;
  input \cs_reg[1] ;
  input [0:0]\cs_reg[0] ;

  wire [9:0]D;
  wire [0:0]E;
  wire [8:0]Q;
  wire clk;
  wire [0:0]\cs_reg[0] ;
  wire \cs_reg[1] ;
  wire [9:0]data;
  wire \first_byte_reg[7] ;
  wire [0:0]\first_byte_reg[7]_0 ;
  wire \remainder_reg[0] ;
  wire reset;
  wire [15:0]step_size;
  wire [15:0]step_size_curr;

  FDCE \data_reg[0] 
       (.C(clk),
        .CE(\first_byte_reg[7]_0 ),
        .CLR(reset),
        .D(D[0]),
        .Q(data[0]));
  FDCE \data_reg[1] 
       (.C(clk),
        .CE(\first_byte_reg[7]_0 ),
        .CLR(reset),
        .D(D[1]),
        .Q(data[1]));
  FDCE \data_reg[2] 
       (.C(clk),
        .CE(\first_byte_reg[7]_0 ),
        .CLR(reset),
        .D(D[2]),
        .Q(data[2]));
  FDCE \data_reg[3] 
       (.C(clk),
        .CE(\first_byte_reg[7]_0 ),
        .CLR(reset),
        .D(D[3]),
        .Q(data[3]));
  FDCE \data_reg[4] 
       (.C(clk),
        .CE(\first_byte_reg[7]_0 ),
        .CLR(reset),
        .D(D[4]),
        .Q(data[4]));
  FDCE \data_reg[5] 
       (.C(clk),
        .CE(\first_byte_reg[7]_0 ),
        .CLR(reset),
        .D(D[5]),
        .Q(data[5]));
  FDCE \data_reg[6] 
       (.C(clk),
        .CE(\first_byte_reg[7]_0 ),
        .CLR(reset),
        .D(D[6]),
        .Q(data[6]));
  FDCE \data_reg[7] 
       (.C(clk),
        .CE(\first_byte_reg[7]_0 ),
        .CLR(reset),
        .D(D[7]),
        .Q(data[7]));
  FDCE \data_reg[8] 
       (.C(clk),
        .CE(\first_byte_reg[7]_0 ),
        .CLR(reset),
        .D(D[8]),
        .Q(data[8]));
  FDCE \data_reg[9] 
       (.C(clk),
        .CE(\first_byte_reg[7]_0 ),
        .CLR(reset),
        .D(D[9]),
        .Q(data[9]));
  FDCE div_en_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\first_byte_reg[7] ),
        .Q(\remainder_reg[0] ));
  audioSys_0_divider freqCalc
       (.E(E),
        .Q(data),
        .clk(clk),
        .div_en_reg(\remainder_reg[0] ),
        .reset(reset),
        .\step_size_curr_reg[15] (step_size));
  audioSys_0_waveGen gen
       (.Q(step_size_curr),
        .clk(clk),
        .\cs_reg[0] (\cs_reg[0] ),
        .\cs_reg[1] (\cs_reg[1] ),
        .reset(reset),
        .\waveform_base_reg[15] (Q));
  FDCE \step_size_curr_reg[0] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[0]),
        .Q(step_size_curr[0]));
  FDCE \step_size_curr_reg[10] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[10]),
        .Q(step_size_curr[10]));
  FDCE \step_size_curr_reg[11] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[11]),
        .Q(step_size_curr[11]));
  FDCE \step_size_curr_reg[12] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[12]),
        .Q(step_size_curr[12]));
  FDCE \step_size_curr_reg[13] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[13]),
        .Q(step_size_curr[13]));
  FDCE \step_size_curr_reg[14] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[14]),
        .Q(step_size_curr[14]));
  FDCE \step_size_curr_reg[15] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[15]),
        .Q(step_size_curr[15]));
  FDCE \step_size_curr_reg[1] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[1]),
        .Q(step_size_curr[1]));
  FDCE \step_size_curr_reg[2] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[2]),
        .Q(step_size_curr[2]));
  FDCE \step_size_curr_reg[3] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[3]),
        .Q(step_size_curr[3]));
  FDCE \step_size_curr_reg[4] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[4]),
        .Q(step_size_curr[4]));
  FDCE \step_size_curr_reg[5] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[5]),
        .Q(step_size_curr[5]));
  FDCE \step_size_curr_reg[6] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[6]),
        .Q(step_size_curr[6]));
  FDCE \step_size_curr_reg[7] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[7]),
        .Q(step_size_curr[7]));
  FDCE \step_size_curr_reg[8] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[8]),
        .Q(step_size_curr[8]));
  FDCE \step_size_curr_reg[9] 
       (.C(clk),
        .CE(E),
        .CLR(reset),
        .D(step_size[9]),
        .Q(step_size_curr[9]));
endmodule

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0,{}" *) (* CORE_GENERATION_INFO = "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* ORIG_REF_NAME = "mult_gen_0" *) (* X_CORE_INFO = "mult_gen_v12_0,Vivado 2015.2" *) 
module audioSys_0_mult_gen_0
   (CLK,
    A,
    B,
    CE,
    P);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [15:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [5:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [15:0]P;

  wire [15:0]A;
  wire [5:0]B;
  wire CE;
  wire CLK;
  wire [15:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "6" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "15" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* DONT_TOUCH *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  audioSys_0_mult_gen_v12_0 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0,{}" *) (* CORE_GENERATION_INFO = "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* ORIG_REF_NAME = "mult_gen_0" *) (* X_CORE_INFO = "mult_gen_v12_0,Vivado 2015.2" *) 
module audioSys_0_mult_gen_0__3
   (CLK,
    A,
    B,
    CE,
    P);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [15:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [5:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [15:0]P;

  wire [15:0]A;
  wire [5:0]B;
  wire CE;
  wire CLK;
  wire [15:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "6" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "15" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* DONT_TOUCH *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  audioSys_0_mult_gen_v12_0__3 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0,{}" *) (* CORE_GENERATION_INFO = "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* ORIG_REF_NAME = "mult_gen_0" *) (* X_CORE_INFO = "mult_gen_v12_0,Vivado 2015.2" *) 
module audioSys_0_mult_gen_0__4
   (CLK,
    A,
    B,
    CE,
    P);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [15:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [5:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [15:0]P;

  wire [15:0]A;
  wire [5:0]B;
  wire CE;
  wire CLK;
  wire [15:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "6" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "15" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* DONT_TOUCH *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  audioSys_0_mult_gen_v12_0__4 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "6" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "15" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* ORIG_REF_NAME = "mult_gen_v12_0" *) 
module audioSys_0_mult_gen_v12_0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [5:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [15:0]P;
  output [47:0]PCASC;

  wire [15:0]A;
  wire [5:0]B;
  wire CE;
  wire CLK;
  wire [15:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "6" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "15" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  audioSys_0_mult_gen_v12_0_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "6" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "15" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* ORIG_REF_NAME = "mult_gen_v12_0" *) 
module audioSys_0_mult_gen_v12_0__3
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [5:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [15:0]P;
  output [47:0]PCASC;

  wire [15:0]A;
  wire [5:0]B;
  wire CE;
  wire CLK;
  wire [15:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "6" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "15" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  audioSys_0_mult_gen_v12_0_viv__3 i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "6" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "15" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* ORIG_REF_NAME = "mult_gen_v12_0" *) 
module audioSys_0_mult_gen_v12_0__4
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [5:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [15:0]P;
  output [47:0]PCASC;

  wire [15:0]A;
  wire [5:0]B;
  wire CE;
  wire CLK;
  wire [15:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "6" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "15" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  audioSys_0_mult_gen_v12_0_viv__4 i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule

(* ORIG_REF_NAME = "regReceiver" *) 
module audioSys_0_regReceiver
   (\received_byte_reg[0]_0 ,
    \received_byte_reg[0]_1 ,
    atten_enable,
    Q,
    \first_byte_reg[7] ,
    double_transfer_reg,
    MREQ_N,
    WR_N,
    addr,
    \cs_reg[0] ,
    double_transfer_reg_0,
    \cs_reg[1] ,
    data,
    clk,
    reset);
  output \received_byte_reg[0]_0 ;
  output \received_byte_reg[0]_1 ;
  output [2:0]atten_enable;
  output [7:0]Q;
  output [0:0]\first_byte_reg[7] ;
  output double_transfer_reg;
  input MREQ_N;
  input WR_N;
  input [9:0]addr;
  input \cs_reg[0] ;
  input double_transfer_reg_0;
  input [1:0]\cs_reg[1] ;
  input [7:0]data;
  input clk;
  input reset;

  wire MREQ_N;
  wire [7:0]Q;
  wire WR_N;
  wire activated;
  wire [9:0]addr;
  wire [2:0]atten_enable;
  wire clk;
  wire \cs_reg[0] ;
  wire [1:0]\cs_reg[1] ;
  wire [7:0]data;
  wire double_transfer_reg;
  wire double_transfer_reg_0;
  wire [0:0]\first_byte_reg[7] ;
  wire \received_byte_reg[0]_0 ;
  wire \received_byte_reg[0]_1 ;
  wire reset;

  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \atten_mag_stored[3]_i_1 
       (.I0(Q[7]),
        .I1(Q[6]),
        .I2(Q[4]),
        .I3(Q[5]),
        .I4(\cs_reg[0] ),
        .O(atten_enable[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \atten_mag_stored[3]_i_1__0 
       (.I0(Q[7]),
        .I1(Q[6]),
        .I2(Q[4]),
        .I3(Q[5]),
        .I4(\cs_reg[0] ),
        .O(atten_enable[1]));
  LUT5 #(
    .INIT(32'h00800000)) 
    \atten_mag_stored[3]_i_1__1 
       (.I0(Q[6]),
        .I1(Q[7]),
        .I2(Q[4]),
        .I3(Q[5]),
        .I4(\cs_reg[0] ),
        .O(atten_enable[2]));
  LUT6 #(
    .INIT(64'hFF00FF000007FF00)) 
    double_transfer_i_1
       (.I0(Q[6]),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(double_transfer_reg_0),
        .I4(\cs_reg[1] [1]),
        .I5(\cs_reg[1] [0]),
        .O(double_transfer_reg));
  LUT6 #(
    .INIT(64'h0000000000150000)) 
    \first_byte[7]_i_1 
       (.I0(Q[4]),
        .I1(Q[5]),
        .I2(Q[6]),
        .I3(double_transfer_reg_0),
        .I4(\cs_reg[1] [1]),
        .I5(\cs_reg[1] [0]),
        .O(\first_byte_reg[7] ));
  LUT2 #(
    .INIT(4'h1)) 
    \received_byte[7]_i_1 
       (.I0(\received_byte_reg[0]_1 ),
        .I1(\received_byte_reg[0]_0 ),
        .O(activated));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \received_byte[7]_i_2 
       (.I0(addr[5]),
        .I1(addr[4]),
        .I2(addr[8]),
        .I3(addr[9]),
        .I4(addr[6]),
        .I5(addr[7]),
        .O(\received_byte_reg[0]_1 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \received_byte[7]_i_3 
       (.I0(MREQ_N),
        .I1(WR_N),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[1]),
        .I5(addr[0]),
        .O(\received_byte_reg[0]_0 ));
  FDCE \received_byte_reg[0] 
       (.C(clk),
        .CE(activated),
        .CLR(reset),
        .D(data[0]),
        .Q(Q[0]));
  FDCE \received_byte_reg[1] 
       (.C(clk),
        .CE(activated),
        .CLR(reset),
        .D(data[1]),
        .Q(Q[1]));
  FDCE \received_byte_reg[2] 
       (.C(clk),
        .CE(activated),
        .CLR(reset),
        .D(data[2]),
        .Q(Q[2]));
  FDCE \received_byte_reg[3] 
       (.C(clk),
        .CE(activated),
        .CLR(reset),
        .D(data[3]),
        .Q(Q[3]));
  FDCE \received_byte_reg[4] 
       (.C(clk),
        .CE(activated),
        .CLR(reset),
        .D(data[4]),
        .Q(Q[4]));
  FDCE \received_byte_reg[5] 
       (.C(clk),
        .CE(activated),
        .CLR(reset),
        .D(data[5]),
        .Q(Q[5]));
  FDCE \received_byte_reg[6] 
       (.C(clk),
        .CE(activated),
        .CLR(reset),
        .D(data[6]),
        .Q(Q[6]));
  FDCE \received_byte_reg[7] 
       (.C(clk),
        .CE(activated),
        .CLR(reset),
        .D(data[7]),
        .Q(Q[7]));
endmodule

(* ORIG_REF_NAME = "serialInterface" *) 
module audioSys_0_serialInterface
   (Q,
    SDATA,
    step,
    LRCLK,
    atten_valid_freq,
    atten_valid,
    \waveform_atten_freq_reg[0] ,
    \waveform_atten_freq_reg[0]_0 ,
    \waveform_atten_freq_reg[0]_1 ,
    \cs_reg[1] ,
    CLK,
    reset,
    D);
  output [0:0]Q;
  output SDATA;
  output step;
  output LRCLK;
  input [2:0]atten_valid_freq;
  input atten_valid;
  input \waveform_atten_freq_reg[0] ;
  input \waveform_atten_freq_reg[0]_0 ;
  input \waveform_atten_freq_reg[0]_1 ;
  input [1:0]\cs_reg[1] ;
  input CLK;
  input reset;
  input [0:0]D;

  wire CLK;
  wire [0:0]D;
  wire LRCLK;
  wire [0:0]Q;
  wire SDATA;
  wire SDATA_INST_0_i_1_n_0;
  wire atten_valid;
  wire [2:0]atten_valid_freq;
  wire [3:0]bitCount;
  wire bitCount1;
  wire \bitCount[0]_i_1_n_0 ;
  wire \bitCount[1]_i_1_n_0 ;
  wire \bitCount[2]_i_1_n_0 ;
  wire \bitCount[3]_i_1_n_0 ;
  wire \bitCount[3]_i_2_n_0 ;
  wire \count[1]_i_1__6_n_0 ;
  wire \count[2]_i_1__3_n_0 ;
  wire \count[3]_i_1__3_n_0 ;
  wire \count[4]_i_1__4_n_0 ;
  wire \count[5]_i_1__0_n_0 ;
  wire \count[5]_i_2_n_0 ;
  wire [5:1]count_reg;
  wire [1:0]\cs_reg[1] ;
  wire reset;
  wire step;
  wire \waveform_atten_freq_reg[0] ;
  wire \waveform_atten_freq_reg[0]_0 ;
  wire \waveform_atten_freq_reg[0]_1 ;

  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT1 #(
    .INIT(2'h1)) 
    LRCLK_INST_0
       (.I0(count_reg[5]),
        .O(LRCLK));
  LUT3 #(
    .INIT(8'h04)) 
    SDATA_INST_0
       (.I0(bitCount[3]),
        .I1(SDATA_INST_0_i_1_n_0),
        .I2(count_reg[4]),
        .O(SDATA));
  LUT6 #(
    .INIT(64'h0000000000004114)) 
    SDATA_INST_0_i_1
       (.I0(bitCount[1]),
        .I1(\waveform_atten_freq_reg[0] ),
        .I2(\waveform_atten_freq_reg[0]_0 ),
        .I3(\waveform_atten_freq_reg[0]_1 ),
        .I4(bitCount[0]),
        .I5(bitCount[2]),
        .O(SDATA_INST_0_i_1_n_0));
  LUT5 #(
    .INIT(32'hFF01FFFF)) 
    \bitCount[0]_i_1 
       (.I0(atten_valid_freq[1]),
        .I1(atten_valid_freq[0]),
        .I2(atten_valid_freq[2]),
        .I3(bitCount1),
        .I4(bitCount[0]),
        .O(\bitCount[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF01FF01FFFF)) 
    \bitCount[1]_i_1 
       (.I0(atten_valid_freq[1]),
        .I1(atten_valid_freq[0]),
        .I2(atten_valid_freq[2]),
        .I3(bitCount1),
        .I4(bitCount[0]),
        .I5(bitCount[1]),
        .O(\bitCount[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFDDDDF)) 
    \bitCount[2]_i_1 
       (.I0(atten_valid),
        .I1(bitCount1),
        .I2(bitCount[1]),
        .I3(bitCount[0]),
        .I4(bitCount[2]),
        .O(\bitCount[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF01FFFF)) 
    \bitCount[3]_i_1 
       (.I0(atten_valid_freq[1]),
        .I1(atten_valid_freq[0]),
        .I2(atten_valid_freq[2]),
        .I3(bitCount1),
        .I4(count_reg[4]),
        .O(\bitCount[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFDDDDDDDDF)) 
    \bitCount[3]_i_2 
       (.I0(atten_valid),
        .I1(bitCount1),
        .I2(bitCount[2]),
        .I3(bitCount[0]),
        .I4(bitCount[1]),
        .I5(bitCount[3]),
        .O(\bitCount[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \bitCount[3]_i_3 
       (.I0(count_reg[2]),
        .I1(count_reg[3]),
        .I2(Q),
        .I3(count_reg[1]),
        .I4(count_reg[4]),
        .O(bitCount1));
  FDPE #(
    .IS_C_INVERTED(1'b1)) 
    \bitCount_reg[0] 
       (.C(CLK),
        .CE(\bitCount[3]_i_1_n_0 ),
        .D(\bitCount[0]_i_1_n_0 ),
        .PRE(reset),
        .Q(bitCount[0]));
  FDPE #(
    .IS_C_INVERTED(1'b1)) 
    \bitCount_reg[1] 
       (.C(CLK),
        .CE(\bitCount[3]_i_1_n_0 ),
        .D(\bitCount[1]_i_1_n_0 ),
        .PRE(reset),
        .Q(bitCount[1]));
  FDPE #(
    .IS_C_INVERTED(1'b1)) 
    \bitCount_reg[2] 
       (.C(CLK),
        .CE(\bitCount[3]_i_1_n_0 ),
        .D(\bitCount[2]_i_1_n_0 ),
        .PRE(reset),
        .Q(bitCount[2]));
  FDPE #(
    .IS_C_INVERTED(1'b1)) 
    \bitCount_reg[3] 
       (.C(CLK),
        .CE(\bitCount[3]_i_1_n_0 ),
        .D(\bitCount[3]_i_2_n_0 ),
        .PRE(reset),
        .Q(bitCount[3]));
  LUT5 #(
    .INIT(32'h6666666F)) 
    \count[1]_i_1__6 
       (.I0(count_reg[1]),
        .I1(Q),
        .I2(atten_valid_freq[1]),
        .I3(atten_valid_freq[0]),
        .I4(atten_valid_freq[2]),
        .O(\count[1]_i_1__6_n_0 ));
  LUT6 #(
    .INIT(64'h6A6A6A6A6A6A6AFF)) 
    \count[2]_i_1__3 
       (.I0(count_reg[2]),
        .I1(count_reg[1]),
        .I2(Q),
        .I3(atten_valid_freq[1]),
        .I4(atten_valid_freq[0]),
        .I5(atten_valid_freq[2]),
        .O(\count[2]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h6AAAFFFF)) 
    \count[3]_i_1__3 
       (.I0(count_reg[3]),
        .I1(count_reg[2]),
        .I2(Q),
        .I3(count_reg[1]),
        .I4(atten_valid),
        .O(\count[3]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAFFFFFFFF)) 
    \count[4]_i_1__4 
       (.I0(count_reg[4]),
        .I1(count_reg[3]),
        .I2(count_reg[1]),
        .I3(Q),
        .I4(count_reg[2]),
        .I5(atten_valid),
        .O(\count[4]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h6AAAFFFF)) 
    \count[5]_i_1__0 
       (.I0(count_reg[5]),
        .I1(count_reg[4]),
        .I2(\count[5]_i_2_n_0 ),
        .I3(count_reg[3]),
        .I4(atten_valid),
        .O(\count[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \count[5]_i_2 
       (.I0(count_reg[2]),
        .I1(Q),
        .I2(count_reg[1]),
        .O(\count[5]_i_2_n_0 ));
  FDPE #(
    .IS_C_INVERTED(1'b1)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(D),
        .PRE(reset),
        .Q(Q));
  FDPE #(
    .IS_C_INVERTED(1'b1)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[1]_i_1__6_n_0 ),
        .PRE(reset),
        .Q(count_reg[1]));
  FDPE #(
    .IS_C_INVERTED(1'b1)) 
    \count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[2]_i_1__3_n_0 ),
        .PRE(reset),
        .Q(count_reg[2]));
  FDPE #(
    .IS_C_INVERTED(1'b1)) 
    \count_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[3]_i_1__3_n_0 ),
        .PRE(reset),
        .Q(count_reg[3]));
  FDPE #(
    .IS_C_INVERTED(1'b1)) 
    \count_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[4]_i_1__4_n_0 ),
        .PRE(reset),
        .Q(count_reg[4]));
  FDPE #(
    .IS_C_INVERTED(1'b1)) 
    \count_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[5]_i_1__0_n_0 ),
        .PRE(reset),
        .Q(count_reg[5]));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    sent_i_1
       (.I0(\cs_reg[1] [0]),
        .I1(count_reg[3]),
        .I2(count_reg[5]),
        .I3(count_reg[4]),
        .I4(\count[5]_i_2_n_0 ),
        .I5(\cs_reg[1] [1]),
        .O(step));
endmodule

(* ORIG_REF_NAME = "waveGen" *) 
module audioSys_0_waveGen
   (\waveform_base_reg[15] ,
    Q,
    \cs_reg[1] ,
    clk,
    reset,
    \cs_reg[0] );
  output [8:0]\waveform_base_reg[15] ;
  input [15:0]Q;
  input \cs_reg[1] ;
  input clk;
  input reset;
  input [0:0]\cs_reg[0] ;

  wire [15:0]Q;
  wire clk;
  wire [0:0]\cs_reg[0] ;
  wire \cs_reg[1] ;
  wire reset;
  wire [0:0]status;
  wire \status[0]_i_10_n_0 ;
  wire \status[0]_i_11_n_0 ;
  wire \status[0]_i_12_n_0 ;
  wire \status[0]_i_1_n_0 ;
  wire \status[0]_i_5_n_0 ;
  wire \status[0]_i_6_n_0 ;
  wire \status[0]_i_7_n_0 ;
  wire \status[0]_i_8_n_0 ;
  wire \status[0]_i_9_n_0 ;
  wire \status_reg[0]_i_3_n_1 ;
  wire \status_reg[0]_i_3_n_2 ;
  wire \status_reg[0]_i_3_n_3 ;
  wire \status_reg[0]_i_3_n_4 ;
  wire \status_reg[0]_i_3_n_5 ;
  wire \status_reg[0]_i_3_n_6 ;
  wire \status_reg[0]_i_3_n_7 ;
  wire \status_reg[0]_i_4_n_1 ;
  wire \status_reg[0]_i_4_n_2 ;
  wire \status_reg[0]_i_4_n_3 ;
  wire \status_reg[0]_i_4_n_4 ;
  wire \status_reg[0]_i_4_n_5 ;
  wire \status_reg[0]_i_4_n_6 ;
  wire \status_reg[0]_i_4_n_7 ;
  wire [15:0]waveform;
  wire \waveform[11]_i_10_n_0 ;
  wire \waveform[11]_i_11_n_0 ;
  wire \waveform[11]_i_4_n_0 ;
  wire \waveform[11]_i_5_n_0 ;
  wire \waveform[11]_i_6_n_0 ;
  wire \waveform[11]_i_7_n_0 ;
  wire \waveform[11]_i_8_n_0 ;
  wire \waveform[11]_i_9_n_0 ;
  wire \waveform[3]_i_10_n_0 ;
  wire \waveform[3]_i_11_n_0 ;
  wire \waveform[3]_i_4_n_0 ;
  wire \waveform[3]_i_5_n_0 ;
  wire \waveform[3]_i_6_n_0 ;
  wire \waveform[3]_i_7_n_0 ;
  wire \waveform[3]_i_8_n_0 ;
  wire \waveform[3]_i_9_n_0 ;
  wire \waveform[7]_i_10_n_0 ;
  wire \waveform[7]_i_11_n_0 ;
  wire \waveform[7]_i_4_n_0 ;
  wire \waveform[7]_i_5_n_0 ;
  wire \waveform[7]_i_6_n_0 ;
  wire \waveform[7]_i_7_n_0 ;
  wire \waveform[7]_i_8_n_0 ;
  wire \waveform[7]_i_9_n_0 ;
  wire [8:0]\waveform_base_reg[15] ;
  wire \waveform_reg[11]_i_2_n_0 ;
  wire \waveform_reg[11]_i_2_n_1 ;
  wire \waveform_reg[11]_i_2_n_2 ;
  wire \waveform_reg[11]_i_2_n_3 ;
  wire \waveform_reg[11]_i_2_n_4 ;
  wire \waveform_reg[11]_i_2_n_5 ;
  wire \waveform_reg[11]_i_2_n_6 ;
  wire \waveform_reg[11]_i_2_n_7 ;
  wire \waveform_reg[11]_i_3_n_0 ;
  wire \waveform_reg[11]_i_3_n_1 ;
  wire \waveform_reg[11]_i_3_n_2 ;
  wire \waveform_reg[11]_i_3_n_3 ;
  wire \waveform_reg[11]_i_3_n_4 ;
  wire \waveform_reg[11]_i_3_n_5 ;
  wire \waveform_reg[11]_i_3_n_6 ;
  wire \waveform_reg[11]_i_3_n_7 ;
  wire \waveform_reg[3]_i_2_n_0 ;
  wire \waveform_reg[3]_i_2_n_1 ;
  wire \waveform_reg[3]_i_2_n_2 ;
  wire \waveform_reg[3]_i_2_n_3 ;
  wire \waveform_reg[3]_i_2_n_4 ;
  wire \waveform_reg[3]_i_2_n_5 ;
  wire \waveform_reg[3]_i_2_n_6 ;
  wire \waveform_reg[3]_i_2_n_7 ;
  wire \waveform_reg[3]_i_3_n_0 ;
  wire \waveform_reg[3]_i_3_n_1 ;
  wire \waveform_reg[3]_i_3_n_2 ;
  wire \waveform_reg[3]_i_3_n_3 ;
  wire \waveform_reg[3]_i_3_n_4 ;
  wire \waveform_reg[3]_i_3_n_5 ;
  wire \waveform_reg[3]_i_3_n_6 ;
  wire \waveform_reg[3]_i_3_n_7 ;
  wire \waveform_reg[7]_i_2_n_0 ;
  wire \waveform_reg[7]_i_2_n_1 ;
  wire \waveform_reg[7]_i_2_n_2 ;
  wire \waveform_reg[7]_i_2_n_3 ;
  wire \waveform_reg[7]_i_2_n_4 ;
  wire \waveform_reg[7]_i_2_n_5 ;
  wire \waveform_reg[7]_i_2_n_6 ;
  wire \waveform_reg[7]_i_2_n_7 ;
  wire \waveform_reg[7]_i_3_n_0 ;
  wire \waveform_reg[7]_i_3_n_1 ;
  wire \waveform_reg[7]_i_3_n_2 ;
  wire \waveform_reg[7]_i_3_n_3 ;
  wire \waveform_reg[7]_i_3_n_4 ;
  wire \waveform_reg[7]_i_3_n_5 ;
  wire \waveform_reg[7]_i_3_n_6 ;
  wire \waveform_reg[7]_i_3_n_7 ;
  wire \waveform_reg_n_0_[0] ;
  wire \waveform_reg_n_0_[1] ;
  wire \waveform_reg_n_0_[2] ;
  wire \waveform_reg_n_0_[3] ;
  wire \waveform_reg_n_0_[4] ;
  wire \waveform_reg_n_0_[5] ;
  wire \waveform_reg_n_0_[6] ;
  wire [3:3]\NLW_status_reg[0]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_status_reg[0]_i_4_CO_UNCONNECTED ;

  LUT5 #(
    .INIT(32'hEEFF0050)) 
    \status[0]_i_1 
       (.I0(\cs_reg[1] ),
        .I1(\status_reg[0]_i_3_n_4 ),
        .I2(\status_reg[0]_i_4_n_4 ),
        .I3(\waveform_base_reg[15] [8]),
        .I4(status),
        .O(\status[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_10 
       (.I0(\waveform_base_reg[15] [7]),
        .I1(Q[14]),
        .O(\status[0]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_11 
       (.I0(\waveform_base_reg[15] [6]),
        .I1(Q[13]),
        .O(\status[0]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_12 
       (.I0(\waveform_base_reg[15] [5]),
        .I1(Q[12]),
        .O(\status[0]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_5 
       (.I0(Q[15]),
        .I1(\waveform_base_reg[15] [8]),
        .O(\status[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_6 
       (.I0(Q[14]),
        .I1(\waveform_base_reg[15] [7]),
        .O(\status[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_7 
       (.I0(Q[13]),
        .I1(\waveform_base_reg[15] [6]),
        .O(\status[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_8 
       (.I0(Q[12]),
        .I1(\waveform_base_reg[15] [5]),
        .O(\status[0]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_9 
       (.I0(\waveform_base_reg[15] [8]),
        .I1(Q[15]),
        .O(\status[0]_i_9_n_0 ));
  FDCE \status_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\status[0]_i_1_n_0 ),
        .Q(status));
  CARRY4 \status_reg[0]_i_3 
       (.CI(\waveform_reg[11]_i_2_n_0 ),
        .CO({\NLW_status_reg[0]_i_3_CO_UNCONNECTED [3],\status_reg[0]_i_3_n_1 ,\status_reg[0]_i_3_n_2 ,\status_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\waveform_base_reg[15] [7:5]}),
        .O({\status_reg[0]_i_3_n_4 ,\status_reg[0]_i_3_n_5 ,\status_reg[0]_i_3_n_6 ,\status_reg[0]_i_3_n_7 }),
        .S({\status[0]_i_5_n_0 ,\status[0]_i_6_n_0 ,\status[0]_i_7_n_0 ,\status[0]_i_8_n_0 }));
  CARRY4 \status_reg[0]_i_4 
       (.CI(\waveform_reg[11]_i_3_n_0 ),
        .CO({\NLW_status_reg[0]_i_4_CO_UNCONNECTED [3],\status_reg[0]_i_4_n_1 ,\status_reg[0]_i_4_n_2 ,\status_reg[0]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\waveform_base_reg[15] [7:5]}),
        .O({\status_reg[0]_i_4_n_4 ,\status_reg[0]_i_4_n_5 ,\status_reg[0]_i_4_n_6 ,\status_reg[0]_i_4_n_7 }),
        .S({\status[0]_i_9_n_0 ,\status[0]_i_10_n_0 ,\status[0]_i_11_n_0 ,\status[0]_i_12_n_0 }));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[0]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2_n_7 ),
        .I3(\waveform_reg[3]_i_3_n_7 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[0]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[10]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2_n_5 ),
        .I3(\waveform_reg[11]_i_3_n_5 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[10]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[11]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2_n_4 ),
        .I3(\waveform_reg[11]_i_3_n_4 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[11]));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_10 
       (.I0(\waveform_base_reg[15] [2]),
        .I1(Q[9]),
        .O(\waveform[11]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_11 
       (.I0(\waveform_base_reg[15] [1]),
        .I1(Q[8]),
        .O(\waveform[11]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_4 
       (.I0(Q[11]),
        .I1(\waveform_base_reg[15] [4]),
        .O(\waveform[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_5 
       (.I0(Q[10]),
        .I1(\waveform_base_reg[15] [3]),
        .O(\waveform[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_6 
       (.I0(Q[9]),
        .I1(\waveform_base_reg[15] [2]),
        .O(\waveform[11]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_7 
       (.I0(Q[8]),
        .I1(\waveform_base_reg[15] [1]),
        .O(\waveform[11]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_8 
       (.I0(\waveform_base_reg[15] [4]),
        .I1(Q[11]),
        .O(\waveform[11]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_9 
       (.I0(\waveform_base_reg[15] [3]),
        .I1(Q[10]),
        .O(\waveform[11]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[12]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\status_reg[0]_i_3_n_7 ),
        .I3(\status_reg[0]_i_4_n_7 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[12]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[13]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\status_reg[0]_i_3_n_6 ),
        .I3(\status_reg[0]_i_4_n_6 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[13]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[14]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\status_reg[0]_i_3_n_5 ),
        .I3(\status_reg[0]_i_4_n_5 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[14]));
  LUT4 #(
    .INIT(16'hF8C8)) 
    \waveform[15]_i_2 
       (.I0(status),
        .I1(\status_reg[0]_i_3_n_4 ),
        .I2(\status_reg[0]_i_4_n_4 ),
        .I3(\waveform_base_reg[15] [8]),
        .O(waveform[15]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[1]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2_n_6 ),
        .I3(\waveform_reg[3]_i_3_n_6 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[1]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[2]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2_n_5 ),
        .I3(\waveform_reg[3]_i_3_n_5 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[2]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[3]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2_n_4 ),
        .I3(\waveform_reg[3]_i_3_n_4 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_10 
       (.I0(\waveform_reg_n_0_[1] ),
        .I1(Q[1]),
        .O(\waveform[3]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_11 
       (.I0(\waveform_reg_n_0_[0] ),
        .I1(Q[0]),
        .O(\waveform[3]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_4 
       (.I0(Q[3]),
        .I1(\waveform_reg_n_0_[3] ),
        .O(\waveform[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_5 
       (.I0(Q[2]),
        .I1(\waveform_reg_n_0_[2] ),
        .O(\waveform[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_6 
       (.I0(Q[1]),
        .I1(\waveform_reg_n_0_[1] ),
        .O(\waveform[3]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_7 
       (.I0(Q[0]),
        .I1(\waveform_reg_n_0_[0] ),
        .O(\waveform[3]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_8 
       (.I0(\waveform_reg_n_0_[3] ),
        .I1(Q[3]),
        .O(\waveform[3]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_9 
       (.I0(\waveform_reg_n_0_[2] ),
        .I1(Q[2]),
        .O(\waveform[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[4]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2_n_7 ),
        .I3(\waveform_reg[7]_i_3_n_7 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[4]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[5]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2_n_6 ),
        .I3(\waveform_reg[7]_i_3_n_6 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[5]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[6]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2_n_5 ),
        .I3(\waveform_reg[7]_i_3_n_5 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[6]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[7]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2_n_4 ),
        .I3(\waveform_reg[7]_i_3_n_4 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_10 
       (.I0(\waveform_reg_n_0_[5] ),
        .I1(Q[5]),
        .O(\waveform[7]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_11 
       (.I0(\waveform_reg_n_0_[4] ),
        .I1(Q[4]),
        .O(\waveform[7]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_4 
       (.I0(Q[7]),
        .I1(\waveform_base_reg[15] [0]),
        .O(\waveform[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_5 
       (.I0(Q[6]),
        .I1(\waveform_reg_n_0_[6] ),
        .O(\waveform[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_6 
       (.I0(Q[5]),
        .I1(\waveform_reg_n_0_[5] ),
        .O(\waveform[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_7 
       (.I0(Q[4]),
        .I1(\waveform_reg_n_0_[4] ),
        .O(\waveform[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_8 
       (.I0(\waveform_base_reg[15] [0]),
        .I1(Q[7]),
        .O(\waveform[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_9 
       (.I0(\waveform_reg_n_0_[6] ),
        .I1(Q[6]),
        .O(\waveform[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[8]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2_n_7 ),
        .I3(\waveform_reg[11]_i_3_n_7 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[8]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[9]_i_1 
       (.I0(\status_reg[0]_i_3_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2_n_6 ),
        .I3(\waveform_reg[11]_i_3_n_6 ),
        .I4(\status_reg[0]_i_4_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[9]));
  FDCE \waveform_reg[0] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[0]),
        .Q(\waveform_reg_n_0_[0] ));
  FDCE \waveform_reg[10] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[10]),
        .Q(\waveform_base_reg[15] [3]));
  FDCE \waveform_reg[11] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[11]),
        .Q(\waveform_base_reg[15] [4]));
  CARRY4 \waveform_reg[11]_i_2 
       (.CI(\waveform_reg[7]_i_2_n_0 ),
        .CO({\waveform_reg[11]_i_2_n_0 ,\waveform_reg[11]_i_2_n_1 ,\waveform_reg[11]_i_2_n_2 ,\waveform_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\waveform_base_reg[15] [4:1]),
        .O({\waveform_reg[11]_i_2_n_4 ,\waveform_reg[11]_i_2_n_5 ,\waveform_reg[11]_i_2_n_6 ,\waveform_reg[11]_i_2_n_7 }),
        .S({\waveform[11]_i_4_n_0 ,\waveform[11]_i_5_n_0 ,\waveform[11]_i_6_n_0 ,\waveform[11]_i_7_n_0 }));
  CARRY4 \waveform_reg[11]_i_3 
       (.CI(\waveform_reg[7]_i_3_n_0 ),
        .CO({\waveform_reg[11]_i_3_n_0 ,\waveform_reg[11]_i_3_n_1 ,\waveform_reg[11]_i_3_n_2 ,\waveform_reg[11]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(\waveform_base_reg[15] [4:1]),
        .O({\waveform_reg[11]_i_3_n_4 ,\waveform_reg[11]_i_3_n_5 ,\waveform_reg[11]_i_3_n_6 ,\waveform_reg[11]_i_3_n_7 }),
        .S({\waveform[11]_i_8_n_0 ,\waveform[11]_i_9_n_0 ,\waveform[11]_i_10_n_0 ,\waveform[11]_i_11_n_0 }));
  FDCE \waveform_reg[12] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[12]),
        .Q(\waveform_base_reg[15] [5]));
  FDCE \waveform_reg[13] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[13]),
        .Q(\waveform_base_reg[15] [6]));
  FDCE \waveform_reg[14] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[14]),
        .Q(\waveform_base_reg[15] [7]));
  FDCE \waveform_reg[15] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[15]),
        .Q(\waveform_base_reg[15] [8]));
  FDCE \waveform_reg[1] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[1]),
        .Q(\waveform_reg_n_0_[1] ));
  FDCE \waveform_reg[2] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[2]),
        .Q(\waveform_reg_n_0_[2] ));
  FDCE \waveform_reg[3] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[3]),
        .Q(\waveform_reg_n_0_[3] ));
  CARRY4 \waveform_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\waveform_reg[3]_i_2_n_0 ,\waveform_reg[3]_i_2_n_1 ,\waveform_reg[3]_i_2_n_2 ,\waveform_reg[3]_i_2_n_3 }),
        .CYINIT(1'b1),
        .DI({\waveform_reg_n_0_[3] ,\waveform_reg_n_0_[2] ,\waveform_reg_n_0_[1] ,\waveform_reg_n_0_[0] }),
        .O({\waveform_reg[3]_i_2_n_4 ,\waveform_reg[3]_i_2_n_5 ,\waveform_reg[3]_i_2_n_6 ,\waveform_reg[3]_i_2_n_7 }),
        .S({\waveform[3]_i_4_n_0 ,\waveform[3]_i_5_n_0 ,\waveform[3]_i_6_n_0 ,\waveform[3]_i_7_n_0 }));
  CARRY4 \waveform_reg[3]_i_3 
       (.CI(1'b0),
        .CO({\waveform_reg[3]_i_3_n_0 ,\waveform_reg[3]_i_3_n_1 ,\waveform_reg[3]_i_3_n_2 ,\waveform_reg[3]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({\waveform_reg_n_0_[3] ,\waveform_reg_n_0_[2] ,\waveform_reg_n_0_[1] ,\waveform_reg_n_0_[0] }),
        .O({\waveform_reg[3]_i_3_n_4 ,\waveform_reg[3]_i_3_n_5 ,\waveform_reg[3]_i_3_n_6 ,\waveform_reg[3]_i_3_n_7 }),
        .S({\waveform[3]_i_8_n_0 ,\waveform[3]_i_9_n_0 ,\waveform[3]_i_10_n_0 ,\waveform[3]_i_11_n_0 }));
  FDCE \waveform_reg[4] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[4]),
        .Q(\waveform_reg_n_0_[4] ));
  FDCE \waveform_reg[5] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[5]),
        .Q(\waveform_reg_n_0_[5] ));
  FDCE \waveform_reg[6] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[6]),
        .Q(\waveform_reg_n_0_[6] ));
  FDCE \waveform_reg[7] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[7]),
        .Q(\waveform_base_reg[15] [0]));
  CARRY4 \waveform_reg[7]_i_2 
       (.CI(\waveform_reg[3]_i_2_n_0 ),
        .CO({\waveform_reg[7]_i_2_n_0 ,\waveform_reg[7]_i_2_n_1 ,\waveform_reg[7]_i_2_n_2 ,\waveform_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\waveform_base_reg[15] [0],\waveform_reg_n_0_[6] ,\waveform_reg_n_0_[5] ,\waveform_reg_n_0_[4] }),
        .O({\waveform_reg[7]_i_2_n_4 ,\waveform_reg[7]_i_2_n_5 ,\waveform_reg[7]_i_2_n_6 ,\waveform_reg[7]_i_2_n_7 }),
        .S({\waveform[7]_i_4_n_0 ,\waveform[7]_i_5_n_0 ,\waveform[7]_i_6_n_0 ,\waveform[7]_i_7_n_0 }));
  CARRY4 \waveform_reg[7]_i_3 
       (.CI(\waveform_reg[3]_i_3_n_0 ),
        .CO({\waveform_reg[7]_i_3_n_0 ,\waveform_reg[7]_i_3_n_1 ,\waveform_reg[7]_i_3_n_2 ,\waveform_reg[7]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({\waveform_base_reg[15] [0],\waveform_reg_n_0_[6] ,\waveform_reg_n_0_[5] ,\waveform_reg_n_0_[4] }),
        .O({\waveform_reg[7]_i_3_n_4 ,\waveform_reg[7]_i_3_n_5 ,\waveform_reg[7]_i_3_n_6 ,\waveform_reg[7]_i_3_n_7 }),
        .S({\waveform[7]_i_8_n_0 ,\waveform[7]_i_9_n_0 ,\waveform[7]_i_10_n_0 ,\waveform[7]_i_11_n_0 }));
  FDCE \waveform_reg[8] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[8]),
        .Q(\waveform_base_reg[15] [1]));
  FDCE \waveform_reg[9] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[9]),
        .Q(\waveform_base_reg[15] [2]));
endmodule

(* ORIG_REF_NAME = "waveGen" *) 
module audioSys_0_waveGen_3
   (\waveform_base_reg[15] ,
    Q,
    \cs_reg[1] ,
    clk,
    reset,
    \cs_reg[0] );
  output [8:0]\waveform_base_reg[15] ;
  input [15:0]Q;
  input \cs_reg[1] ;
  input clk;
  input reset;
  input [0:0]\cs_reg[0] ;

  wire [15:0]Q;
  wire clk;
  wire [0:0]\cs_reg[0] ;
  wire \cs_reg[1] ;
  wire reset;
  wire [0:0]status;
  wire \status[0]_i_10__0_n_0 ;
  wire \status[0]_i_11__0_n_0 ;
  wire \status[0]_i_12__0_n_0 ;
  wire \status[0]_i_1__0_n_0 ;
  wire \status[0]_i_5__0_n_0 ;
  wire \status[0]_i_6__0_n_0 ;
  wire \status[0]_i_7__0_n_0 ;
  wire \status[0]_i_8__0_n_0 ;
  wire \status[0]_i_9__0_n_0 ;
  wire \status_reg[0]_i_3__0_n_1 ;
  wire \status_reg[0]_i_3__0_n_2 ;
  wire \status_reg[0]_i_3__0_n_3 ;
  wire \status_reg[0]_i_3__0_n_4 ;
  wire \status_reg[0]_i_3__0_n_5 ;
  wire \status_reg[0]_i_3__0_n_6 ;
  wire \status_reg[0]_i_3__0_n_7 ;
  wire \status_reg[0]_i_4__0_n_1 ;
  wire \status_reg[0]_i_4__0_n_2 ;
  wire \status_reg[0]_i_4__0_n_3 ;
  wire \status_reg[0]_i_4__0_n_4 ;
  wire \status_reg[0]_i_4__0_n_5 ;
  wire \status_reg[0]_i_4__0_n_6 ;
  wire \status_reg[0]_i_4__0_n_7 ;
  wire [15:0]waveform;
  wire \waveform[11]_i_10__0_n_0 ;
  wire \waveform[11]_i_11__0_n_0 ;
  wire \waveform[11]_i_4__0_n_0 ;
  wire \waveform[11]_i_5__0_n_0 ;
  wire \waveform[11]_i_6__0_n_0 ;
  wire \waveform[11]_i_7__0_n_0 ;
  wire \waveform[11]_i_8__0_n_0 ;
  wire \waveform[11]_i_9__0_n_0 ;
  wire \waveform[3]_i_10__0_n_0 ;
  wire \waveform[3]_i_11__0_n_0 ;
  wire \waveform[3]_i_4__0_n_0 ;
  wire \waveform[3]_i_5__0_n_0 ;
  wire \waveform[3]_i_6__0_n_0 ;
  wire \waveform[3]_i_7__0_n_0 ;
  wire \waveform[3]_i_8__0_n_0 ;
  wire \waveform[3]_i_9__0_n_0 ;
  wire \waveform[7]_i_10__0_n_0 ;
  wire \waveform[7]_i_11__0_n_0 ;
  wire \waveform[7]_i_4__0_n_0 ;
  wire \waveform[7]_i_5__0_n_0 ;
  wire \waveform[7]_i_6__0_n_0 ;
  wire \waveform[7]_i_7__0_n_0 ;
  wire \waveform[7]_i_8__0_n_0 ;
  wire \waveform[7]_i_9__0_n_0 ;
  wire [8:0]\waveform_base_reg[15] ;
  wire \waveform_reg[11]_i_2__0_n_0 ;
  wire \waveform_reg[11]_i_2__0_n_1 ;
  wire \waveform_reg[11]_i_2__0_n_2 ;
  wire \waveform_reg[11]_i_2__0_n_3 ;
  wire \waveform_reg[11]_i_2__0_n_4 ;
  wire \waveform_reg[11]_i_2__0_n_5 ;
  wire \waveform_reg[11]_i_2__0_n_6 ;
  wire \waveform_reg[11]_i_2__0_n_7 ;
  wire \waveform_reg[11]_i_3__0_n_0 ;
  wire \waveform_reg[11]_i_3__0_n_1 ;
  wire \waveform_reg[11]_i_3__0_n_2 ;
  wire \waveform_reg[11]_i_3__0_n_3 ;
  wire \waveform_reg[11]_i_3__0_n_4 ;
  wire \waveform_reg[11]_i_3__0_n_5 ;
  wire \waveform_reg[11]_i_3__0_n_6 ;
  wire \waveform_reg[11]_i_3__0_n_7 ;
  wire \waveform_reg[3]_i_2__0_n_0 ;
  wire \waveform_reg[3]_i_2__0_n_1 ;
  wire \waveform_reg[3]_i_2__0_n_2 ;
  wire \waveform_reg[3]_i_2__0_n_3 ;
  wire \waveform_reg[3]_i_2__0_n_4 ;
  wire \waveform_reg[3]_i_2__0_n_5 ;
  wire \waveform_reg[3]_i_2__0_n_6 ;
  wire \waveform_reg[3]_i_2__0_n_7 ;
  wire \waveform_reg[3]_i_3__0_n_0 ;
  wire \waveform_reg[3]_i_3__0_n_1 ;
  wire \waveform_reg[3]_i_3__0_n_2 ;
  wire \waveform_reg[3]_i_3__0_n_3 ;
  wire \waveform_reg[3]_i_3__0_n_4 ;
  wire \waveform_reg[3]_i_3__0_n_5 ;
  wire \waveform_reg[3]_i_3__0_n_6 ;
  wire \waveform_reg[3]_i_3__0_n_7 ;
  wire \waveform_reg[7]_i_2__0_n_0 ;
  wire \waveform_reg[7]_i_2__0_n_1 ;
  wire \waveform_reg[7]_i_2__0_n_2 ;
  wire \waveform_reg[7]_i_2__0_n_3 ;
  wire \waveform_reg[7]_i_2__0_n_4 ;
  wire \waveform_reg[7]_i_2__0_n_5 ;
  wire \waveform_reg[7]_i_2__0_n_6 ;
  wire \waveform_reg[7]_i_2__0_n_7 ;
  wire \waveform_reg[7]_i_3__0_n_0 ;
  wire \waveform_reg[7]_i_3__0_n_1 ;
  wire \waveform_reg[7]_i_3__0_n_2 ;
  wire \waveform_reg[7]_i_3__0_n_3 ;
  wire \waveform_reg[7]_i_3__0_n_4 ;
  wire \waveform_reg[7]_i_3__0_n_5 ;
  wire \waveform_reg[7]_i_3__0_n_6 ;
  wire \waveform_reg[7]_i_3__0_n_7 ;
  wire \waveform_reg_n_0_[0] ;
  wire \waveform_reg_n_0_[1] ;
  wire \waveform_reg_n_0_[2] ;
  wire \waveform_reg_n_0_[3] ;
  wire \waveform_reg_n_0_[4] ;
  wire \waveform_reg_n_0_[5] ;
  wire \waveform_reg_n_0_[6] ;
  wire [3:3]\NLW_status_reg[0]_i_3__0_CO_UNCONNECTED ;
  wire [3:3]\NLW_status_reg[0]_i_4__0_CO_UNCONNECTED ;

  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_10__0 
       (.I0(\waveform_base_reg[15] [7]),
        .I1(Q[14]),
        .O(\status[0]_i_10__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_11__0 
       (.I0(\waveform_base_reg[15] [6]),
        .I1(Q[13]),
        .O(\status[0]_i_11__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_12__0 
       (.I0(\waveform_base_reg[15] [5]),
        .I1(Q[12]),
        .O(\status[0]_i_12__0_n_0 ));
  LUT5 #(
    .INIT(32'hEEFF0050)) 
    \status[0]_i_1__0 
       (.I0(\cs_reg[1] ),
        .I1(\status_reg[0]_i_3__0_n_4 ),
        .I2(\status_reg[0]_i_4__0_n_4 ),
        .I3(\waveform_base_reg[15] [8]),
        .I4(status),
        .O(\status[0]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_5__0 
       (.I0(Q[15]),
        .I1(\waveform_base_reg[15] [8]),
        .O(\status[0]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_6__0 
       (.I0(Q[14]),
        .I1(\waveform_base_reg[15] [7]),
        .O(\status[0]_i_6__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_7__0 
       (.I0(Q[13]),
        .I1(\waveform_base_reg[15] [6]),
        .O(\status[0]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_8__0 
       (.I0(Q[12]),
        .I1(\waveform_base_reg[15] [5]),
        .O(\status[0]_i_8__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_9__0 
       (.I0(\waveform_base_reg[15] [8]),
        .I1(Q[15]),
        .O(\status[0]_i_9__0_n_0 ));
  FDCE \status_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\status[0]_i_1__0_n_0 ),
        .Q(status));
  CARRY4 \status_reg[0]_i_3__0 
       (.CI(\waveform_reg[11]_i_2__0_n_0 ),
        .CO({\NLW_status_reg[0]_i_3__0_CO_UNCONNECTED [3],\status_reg[0]_i_3__0_n_1 ,\status_reg[0]_i_3__0_n_2 ,\status_reg[0]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\waveform_base_reg[15] [7:5]}),
        .O({\status_reg[0]_i_3__0_n_4 ,\status_reg[0]_i_3__0_n_5 ,\status_reg[0]_i_3__0_n_6 ,\status_reg[0]_i_3__0_n_7 }),
        .S({\status[0]_i_5__0_n_0 ,\status[0]_i_6__0_n_0 ,\status[0]_i_7__0_n_0 ,\status[0]_i_8__0_n_0 }));
  CARRY4 \status_reg[0]_i_4__0 
       (.CI(\waveform_reg[11]_i_3__0_n_0 ),
        .CO({\NLW_status_reg[0]_i_4__0_CO_UNCONNECTED [3],\status_reg[0]_i_4__0_n_1 ,\status_reg[0]_i_4__0_n_2 ,\status_reg[0]_i_4__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\waveform_base_reg[15] [7:5]}),
        .O({\status_reg[0]_i_4__0_n_4 ,\status_reg[0]_i_4__0_n_5 ,\status_reg[0]_i_4__0_n_6 ,\status_reg[0]_i_4__0_n_7 }),
        .S({\status[0]_i_9__0_n_0 ,\status[0]_i_10__0_n_0 ,\status[0]_i_11__0_n_0 ,\status[0]_i_12__0_n_0 }));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[0]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2__0_n_7 ),
        .I3(\waveform_reg[3]_i_3__0_n_7 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[0]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[10]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2__0_n_5 ),
        .I3(\waveform_reg[11]_i_3__0_n_5 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[10]));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_10__0 
       (.I0(\waveform_base_reg[15] [2]),
        .I1(Q[9]),
        .O(\waveform[11]_i_10__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_11__0 
       (.I0(\waveform_base_reg[15] [1]),
        .I1(Q[8]),
        .O(\waveform[11]_i_11__0_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[11]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2__0_n_4 ),
        .I3(\waveform_reg[11]_i_3__0_n_4 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[11]));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_4__0 
       (.I0(Q[11]),
        .I1(\waveform_base_reg[15] [4]),
        .O(\waveform[11]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_5__0 
       (.I0(Q[10]),
        .I1(\waveform_base_reg[15] [3]),
        .O(\waveform[11]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_6__0 
       (.I0(Q[9]),
        .I1(\waveform_base_reg[15] [2]),
        .O(\waveform[11]_i_6__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_7__0 
       (.I0(Q[8]),
        .I1(\waveform_base_reg[15] [1]),
        .O(\waveform[11]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_8__0 
       (.I0(\waveform_base_reg[15] [4]),
        .I1(Q[11]),
        .O(\waveform[11]_i_8__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_9__0 
       (.I0(\waveform_base_reg[15] [3]),
        .I1(Q[10]),
        .O(\waveform[11]_i_9__0_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[12]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\status_reg[0]_i_3__0_n_7 ),
        .I3(\status_reg[0]_i_4__0_n_7 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[12]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[13]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\status_reg[0]_i_3__0_n_6 ),
        .I3(\status_reg[0]_i_4__0_n_6 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[13]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[14]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\status_reg[0]_i_3__0_n_5 ),
        .I3(\status_reg[0]_i_4__0_n_5 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[14]));
  LUT4 #(
    .INIT(16'hF8C8)) 
    \waveform[15]_i_2__0 
       (.I0(status),
        .I1(\status_reg[0]_i_3__0_n_4 ),
        .I2(\status_reg[0]_i_4__0_n_4 ),
        .I3(\waveform_base_reg[15] [8]),
        .O(waveform[15]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[1]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2__0_n_6 ),
        .I3(\waveform_reg[3]_i_3__0_n_6 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[1]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[2]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2__0_n_5 ),
        .I3(\waveform_reg[3]_i_3__0_n_5 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_10__0 
       (.I0(\waveform_reg_n_0_[1] ),
        .I1(Q[1]),
        .O(\waveform[3]_i_10__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_11__0 
       (.I0(\waveform_reg_n_0_[0] ),
        .I1(Q[0]),
        .O(\waveform[3]_i_11__0_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[3]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2__0_n_4 ),
        .I3(\waveform_reg[3]_i_3__0_n_4 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_4__0 
       (.I0(Q[3]),
        .I1(\waveform_reg_n_0_[3] ),
        .O(\waveform[3]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_5__0 
       (.I0(Q[2]),
        .I1(\waveform_reg_n_0_[2] ),
        .O(\waveform[3]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_6__0 
       (.I0(Q[1]),
        .I1(\waveform_reg_n_0_[1] ),
        .O(\waveform[3]_i_6__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_7__0 
       (.I0(Q[0]),
        .I1(\waveform_reg_n_0_[0] ),
        .O(\waveform[3]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_8__0 
       (.I0(\waveform_reg_n_0_[3] ),
        .I1(Q[3]),
        .O(\waveform[3]_i_8__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_9__0 
       (.I0(\waveform_reg_n_0_[2] ),
        .I1(Q[2]),
        .O(\waveform[3]_i_9__0_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[4]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2__0_n_7 ),
        .I3(\waveform_reg[7]_i_3__0_n_7 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[4]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[5]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2__0_n_6 ),
        .I3(\waveform_reg[7]_i_3__0_n_6 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[5]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[6]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2__0_n_5 ),
        .I3(\waveform_reg[7]_i_3__0_n_5 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_10__0 
       (.I0(\waveform_reg_n_0_[5] ),
        .I1(Q[5]),
        .O(\waveform[7]_i_10__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_11__0 
       (.I0(\waveform_reg_n_0_[4] ),
        .I1(Q[4]),
        .O(\waveform[7]_i_11__0_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[7]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2__0_n_4 ),
        .I3(\waveform_reg[7]_i_3__0_n_4 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[7]));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_4__0 
       (.I0(Q[7]),
        .I1(\waveform_base_reg[15] [0]),
        .O(\waveform[7]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_5__0 
       (.I0(Q[6]),
        .I1(\waveform_reg_n_0_[6] ),
        .O(\waveform[7]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_6__0 
       (.I0(Q[5]),
        .I1(\waveform_reg_n_0_[5] ),
        .O(\waveform[7]_i_6__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_7__0 
       (.I0(Q[4]),
        .I1(\waveform_reg_n_0_[4] ),
        .O(\waveform[7]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_8__0 
       (.I0(\waveform_base_reg[15] [0]),
        .I1(Q[7]),
        .O(\waveform[7]_i_8__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_9__0 
       (.I0(\waveform_reg_n_0_[6] ),
        .I1(Q[6]),
        .O(\waveform[7]_i_9__0_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[8]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2__0_n_7 ),
        .I3(\waveform_reg[11]_i_3__0_n_7 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[8]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[9]_i_1__0 
       (.I0(\status_reg[0]_i_3__0_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2__0_n_6 ),
        .I3(\waveform_reg[11]_i_3__0_n_6 ),
        .I4(\status_reg[0]_i_4__0_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[9]));
  FDCE \waveform_reg[0] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[0]),
        .Q(\waveform_reg_n_0_[0] ));
  FDCE \waveform_reg[10] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[10]),
        .Q(\waveform_base_reg[15] [3]));
  FDCE \waveform_reg[11] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[11]),
        .Q(\waveform_base_reg[15] [4]));
  CARRY4 \waveform_reg[11]_i_2__0 
       (.CI(\waveform_reg[7]_i_2__0_n_0 ),
        .CO({\waveform_reg[11]_i_2__0_n_0 ,\waveform_reg[11]_i_2__0_n_1 ,\waveform_reg[11]_i_2__0_n_2 ,\waveform_reg[11]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI(\waveform_base_reg[15] [4:1]),
        .O({\waveform_reg[11]_i_2__0_n_4 ,\waveform_reg[11]_i_2__0_n_5 ,\waveform_reg[11]_i_2__0_n_6 ,\waveform_reg[11]_i_2__0_n_7 }),
        .S({\waveform[11]_i_4__0_n_0 ,\waveform[11]_i_5__0_n_0 ,\waveform[11]_i_6__0_n_0 ,\waveform[11]_i_7__0_n_0 }));
  CARRY4 \waveform_reg[11]_i_3__0 
       (.CI(\waveform_reg[7]_i_3__0_n_0 ),
        .CO({\waveform_reg[11]_i_3__0_n_0 ,\waveform_reg[11]_i_3__0_n_1 ,\waveform_reg[11]_i_3__0_n_2 ,\waveform_reg[11]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI(\waveform_base_reg[15] [4:1]),
        .O({\waveform_reg[11]_i_3__0_n_4 ,\waveform_reg[11]_i_3__0_n_5 ,\waveform_reg[11]_i_3__0_n_6 ,\waveform_reg[11]_i_3__0_n_7 }),
        .S({\waveform[11]_i_8__0_n_0 ,\waveform[11]_i_9__0_n_0 ,\waveform[11]_i_10__0_n_0 ,\waveform[11]_i_11__0_n_0 }));
  FDCE \waveform_reg[12] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[12]),
        .Q(\waveform_base_reg[15] [5]));
  FDCE \waveform_reg[13] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[13]),
        .Q(\waveform_base_reg[15] [6]));
  FDCE \waveform_reg[14] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[14]),
        .Q(\waveform_base_reg[15] [7]));
  FDCE \waveform_reg[15] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[15]),
        .Q(\waveform_base_reg[15] [8]));
  FDCE \waveform_reg[1] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[1]),
        .Q(\waveform_reg_n_0_[1] ));
  FDCE \waveform_reg[2] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[2]),
        .Q(\waveform_reg_n_0_[2] ));
  FDCE \waveform_reg[3] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[3]),
        .Q(\waveform_reg_n_0_[3] ));
  CARRY4 \waveform_reg[3]_i_2__0 
       (.CI(1'b0),
        .CO({\waveform_reg[3]_i_2__0_n_0 ,\waveform_reg[3]_i_2__0_n_1 ,\waveform_reg[3]_i_2__0_n_2 ,\waveform_reg[3]_i_2__0_n_3 }),
        .CYINIT(1'b1),
        .DI({\waveform_reg_n_0_[3] ,\waveform_reg_n_0_[2] ,\waveform_reg_n_0_[1] ,\waveform_reg_n_0_[0] }),
        .O({\waveform_reg[3]_i_2__0_n_4 ,\waveform_reg[3]_i_2__0_n_5 ,\waveform_reg[3]_i_2__0_n_6 ,\waveform_reg[3]_i_2__0_n_7 }),
        .S({\waveform[3]_i_4__0_n_0 ,\waveform[3]_i_5__0_n_0 ,\waveform[3]_i_6__0_n_0 ,\waveform[3]_i_7__0_n_0 }));
  CARRY4 \waveform_reg[3]_i_3__0 
       (.CI(1'b0),
        .CO({\waveform_reg[3]_i_3__0_n_0 ,\waveform_reg[3]_i_3__0_n_1 ,\waveform_reg[3]_i_3__0_n_2 ,\waveform_reg[3]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\waveform_reg_n_0_[3] ,\waveform_reg_n_0_[2] ,\waveform_reg_n_0_[1] ,\waveform_reg_n_0_[0] }),
        .O({\waveform_reg[3]_i_3__0_n_4 ,\waveform_reg[3]_i_3__0_n_5 ,\waveform_reg[3]_i_3__0_n_6 ,\waveform_reg[3]_i_3__0_n_7 }),
        .S({\waveform[3]_i_8__0_n_0 ,\waveform[3]_i_9__0_n_0 ,\waveform[3]_i_10__0_n_0 ,\waveform[3]_i_11__0_n_0 }));
  FDCE \waveform_reg[4] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[4]),
        .Q(\waveform_reg_n_0_[4] ));
  FDCE \waveform_reg[5] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[5]),
        .Q(\waveform_reg_n_0_[5] ));
  FDCE \waveform_reg[6] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[6]),
        .Q(\waveform_reg_n_0_[6] ));
  FDCE \waveform_reg[7] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[7]),
        .Q(\waveform_base_reg[15] [0]));
  CARRY4 \waveform_reg[7]_i_2__0 
       (.CI(\waveform_reg[3]_i_2__0_n_0 ),
        .CO({\waveform_reg[7]_i_2__0_n_0 ,\waveform_reg[7]_i_2__0_n_1 ,\waveform_reg[7]_i_2__0_n_2 ,\waveform_reg[7]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\waveform_base_reg[15] [0],\waveform_reg_n_0_[6] ,\waveform_reg_n_0_[5] ,\waveform_reg_n_0_[4] }),
        .O({\waveform_reg[7]_i_2__0_n_4 ,\waveform_reg[7]_i_2__0_n_5 ,\waveform_reg[7]_i_2__0_n_6 ,\waveform_reg[7]_i_2__0_n_7 }),
        .S({\waveform[7]_i_4__0_n_0 ,\waveform[7]_i_5__0_n_0 ,\waveform[7]_i_6__0_n_0 ,\waveform[7]_i_7__0_n_0 }));
  CARRY4 \waveform_reg[7]_i_3__0 
       (.CI(\waveform_reg[3]_i_3__0_n_0 ),
        .CO({\waveform_reg[7]_i_3__0_n_0 ,\waveform_reg[7]_i_3__0_n_1 ,\waveform_reg[7]_i_3__0_n_2 ,\waveform_reg[7]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\waveform_base_reg[15] [0],\waveform_reg_n_0_[6] ,\waveform_reg_n_0_[5] ,\waveform_reg_n_0_[4] }),
        .O({\waveform_reg[7]_i_3__0_n_4 ,\waveform_reg[7]_i_3__0_n_5 ,\waveform_reg[7]_i_3__0_n_6 ,\waveform_reg[7]_i_3__0_n_7 }),
        .S({\waveform[7]_i_8__0_n_0 ,\waveform[7]_i_9__0_n_0 ,\waveform[7]_i_10__0_n_0 ,\waveform[7]_i_11__0_n_0 }));
  FDCE \waveform_reg[8] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[8]),
        .Q(\waveform_base_reg[15] [1]));
  FDCE \waveform_reg[9] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[9]),
        .Q(\waveform_base_reg[15] [2]));
endmodule

(* ORIG_REF_NAME = "waveGen" *) 
module audioSys_0_waveGen_6
   (\waveform_base_reg[15] ,
    Q,
    \cs_reg[1] ,
    clk,
    reset,
    \cs_reg[0] );
  output [8:0]\waveform_base_reg[15] ;
  input [15:0]Q;
  input \cs_reg[1] ;
  input clk;
  input reset;
  input [0:0]\cs_reg[0] ;

  wire [15:0]Q;
  wire clk;
  wire [0:0]\cs_reg[0] ;
  wire \cs_reg[1] ;
  wire reset;
  wire [0:0]status;
  wire \status[0]_i_10__1_n_0 ;
  wire \status[0]_i_11__1_n_0 ;
  wire \status[0]_i_12__1_n_0 ;
  wire \status[0]_i_1__1_n_0 ;
  wire \status[0]_i_5__1_n_0 ;
  wire \status[0]_i_6__1_n_0 ;
  wire \status[0]_i_7__1_n_0 ;
  wire \status[0]_i_8__1_n_0 ;
  wire \status[0]_i_9__1_n_0 ;
  wire \status_reg[0]_i_3__1_n_1 ;
  wire \status_reg[0]_i_3__1_n_2 ;
  wire \status_reg[0]_i_3__1_n_3 ;
  wire \status_reg[0]_i_3__1_n_4 ;
  wire \status_reg[0]_i_3__1_n_5 ;
  wire \status_reg[0]_i_3__1_n_6 ;
  wire \status_reg[0]_i_3__1_n_7 ;
  wire \status_reg[0]_i_4__1_n_1 ;
  wire \status_reg[0]_i_4__1_n_2 ;
  wire \status_reg[0]_i_4__1_n_3 ;
  wire \status_reg[0]_i_4__1_n_4 ;
  wire \status_reg[0]_i_4__1_n_5 ;
  wire \status_reg[0]_i_4__1_n_6 ;
  wire \status_reg[0]_i_4__1_n_7 ;
  wire [15:0]waveform;
  wire \waveform[11]_i_10__1_n_0 ;
  wire \waveform[11]_i_11__1_n_0 ;
  wire \waveform[11]_i_4__1_n_0 ;
  wire \waveform[11]_i_5__1_n_0 ;
  wire \waveform[11]_i_6__1_n_0 ;
  wire \waveform[11]_i_7__1_n_0 ;
  wire \waveform[11]_i_8__1_n_0 ;
  wire \waveform[11]_i_9__1_n_0 ;
  wire \waveform[3]_i_10__1_n_0 ;
  wire \waveform[3]_i_11__1_n_0 ;
  wire \waveform[3]_i_4__1_n_0 ;
  wire \waveform[3]_i_5__1_n_0 ;
  wire \waveform[3]_i_6__1_n_0 ;
  wire \waveform[3]_i_7__1_n_0 ;
  wire \waveform[3]_i_8__1_n_0 ;
  wire \waveform[3]_i_9__1_n_0 ;
  wire \waveform[7]_i_10__1_n_0 ;
  wire \waveform[7]_i_11__1_n_0 ;
  wire \waveform[7]_i_4__1_n_0 ;
  wire \waveform[7]_i_5__1_n_0 ;
  wire \waveform[7]_i_6__1_n_0 ;
  wire \waveform[7]_i_7__1_n_0 ;
  wire \waveform[7]_i_8__1_n_0 ;
  wire \waveform[7]_i_9__1_n_0 ;
  wire [8:0]\waveform_base_reg[15] ;
  wire \waveform_reg[11]_i_2__1_n_0 ;
  wire \waveform_reg[11]_i_2__1_n_1 ;
  wire \waveform_reg[11]_i_2__1_n_2 ;
  wire \waveform_reg[11]_i_2__1_n_3 ;
  wire \waveform_reg[11]_i_2__1_n_4 ;
  wire \waveform_reg[11]_i_2__1_n_5 ;
  wire \waveform_reg[11]_i_2__1_n_6 ;
  wire \waveform_reg[11]_i_2__1_n_7 ;
  wire \waveform_reg[11]_i_3__1_n_0 ;
  wire \waveform_reg[11]_i_3__1_n_1 ;
  wire \waveform_reg[11]_i_3__1_n_2 ;
  wire \waveform_reg[11]_i_3__1_n_3 ;
  wire \waveform_reg[11]_i_3__1_n_4 ;
  wire \waveform_reg[11]_i_3__1_n_5 ;
  wire \waveform_reg[11]_i_3__1_n_6 ;
  wire \waveform_reg[11]_i_3__1_n_7 ;
  wire \waveform_reg[3]_i_2__1_n_0 ;
  wire \waveform_reg[3]_i_2__1_n_1 ;
  wire \waveform_reg[3]_i_2__1_n_2 ;
  wire \waveform_reg[3]_i_2__1_n_3 ;
  wire \waveform_reg[3]_i_2__1_n_4 ;
  wire \waveform_reg[3]_i_2__1_n_5 ;
  wire \waveform_reg[3]_i_2__1_n_6 ;
  wire \waveform_reg[3]_i_2__1_n_7 ;
  wire \waveform_reg[3]_i_3__1_n_0 ;
  wire \waveform_reg[3]_i_3__1_n_1 ;
  wire \waveform_reg[3]_i_3__1_n_2 ;
  wire \waveform_reg[3]_i_3__1_n_3 ;
  wire \waveform_reg[3]_i_3__1_n_4 ;
  wire \waveform_reg[3]_i_3__1_n_5 ;
  wire \waveform_reg[3]_i_3__1_n_6 ;
  wire \waveform_reg[3]_i_3__1_n_7 ;
  wire \waveform_reg[7]_i_2__1_n_0 ;
  wire \waveform_reg[7]_i_2__1_n_1 ;
  wire \waveform_reg[7]_i_2__1_n_2 ;
  wire \waveform_reg[7]_i_2__1_n_3 ;
  wire \waveform_reg[7]_i_2__1_n_4 ;
  wire \waveform_reg[7]_i_2__1_n_5 ;
  wire \waveform_reg[7]_i_2__1_n_6 ;
  wire \waveform_reg[7]_i_2__1_n_7 ;
  wire \waveform_reg[7]_i_3__1_n_0 ;
  wire \waveform_reg[7]_i_3__1_n_1 ;
  wire \waveform_reg[7]_i_3__1_n_2 ;
  wire \waveform_reg[7]_i_3__1_n_3 ;
  wire \waveform_reg[7]_i_3__1_n_4 ;
  wire \waveform_reg[7]_i_3__1_n_5 ;
  wire \waveform_reg[7]_i_3__1_n_6 ;
  wire \waveform_reg[7]_i_3__1_n_7 ;
  wire \waveform_reg_n_0_[0] ;
  wire \waveform_reg_n_0_[1] ;
  wire \waveform_reg_n_0_[2] ;
  wire \waveform_reg_n_0_[3] ;
  wire \waveform_reg_n_0_[4] ;
  wire \waveform_reg_n_0_[5] ;
  wire \waveform_reg_n_0_[6] ;
  wire [3:3]\NLW_status_reg[0]_i_3__1_CO_UNCONNECTED ;
  wire [3:3]\NLW_status_reg[0]_i_4__1_CO_UNCONNECTED ;

  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_10__1 
       (.I0(\waveform_base_reg[15] [7]),
        .I1(Q[14]),
        .O(\status[0]_i_10__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_11__1 
       (.I0(\waveform_base_reg[15] [6]),
        .I1(Q[13]),
        .O(\status[0]_i_11__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_12__1 
       (.I0(\waveform_base_reg[15] [5]),
        .I1(Q[12]),
        .O(\status[0]_i_12__1_n_0 ));
  LUT5 #(
    .INIT(32'hEEFF0050)) 
    \status[0]_i_1__1 
       (.I0(\cs_reg[1] ),
        .I1(\status_reg[0]_i_3__1_n_4 ),
        .I2(\status_reg[0]_i_4__1_n_4 ),
        .I3(\waveform_base_reg[15] [8]),
        .I4(status),
        .O(\status[0]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_5__1 
       (.I0(Q[15]),
        .I1(\waveform_base_reg[15] [8]),
        .O(\status[0]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_6__1 
       (.I0(Q[14]),
        .I1(\waveform_base_reg[15] [7]),
        .O(\status[0]_i_6__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_7__1 
       (.I0(Q[13]),
        .I1(\waveform_base_reg[15] [6]),
        .O(\status[0]_i_7__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \status[0]_i_8__1 
       (.I0(Q[12]),
        .I1(\waveform_base_reg[15] [5]),
        .O(\status[0]_i_8__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \status[0]_i_9__1 
       (.I0(\waveform_base_reg[15] [8]),
        .I1(Q[15]),
        .O(\status[0]_i_9__1_n_0 ));
  FDCE \status_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\status[0]_i_1__1_n_0 ),
        .Q(status));
  CARRY4 \status_reg[0]_i_3__1 
       (.CI(\waveform_reg[11]_i_2__1_n_0 ),
        .CO({\NLW_status_reg[0]_i_3__1_CO_UNCONNECTED [3],\status_reg[0]_i_3__1_n_1 ,\status_reg[0]_i_3__1_n_2 ,\status_reg[0]_i_3__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\waveform_base_reg[15] [7:5]}),
        .O({\status_reg[0]_i_3__1_n_4 ,\status_reg[0]_i_3__1_n_5 ,\status_reg[0]_i_3__1_n_6 ,\status_reg[0]_i_3__1_n_7 }),
        .S({\status[0]_i_5__1_n_0 ,\status[0]_i_6__1_n_0 ,\status[0]_i_7__1_n_0 ,\status[0]_i_8__1_n_0 }));
  CARRY4 \status_reg[0]_i_4__1 
       (.CI(\waveform_reg[11]_i_3__1_n_0 ),
        .CO({\NLW_status_reg[0]_i_4__1_CO_UNCONNECTED [3],\status_reg[0]_i_4__1_n_1 ,\status_reg[0]_i_4__1_n_2 ,\status_reg[0]_i_4__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\waveform_base_reg[15] [7:5]}),
        .O({\status_reg[0]_i_4__1_n_4 ,\status_reg[0]_i_4__1_n_5 ,\status_reg[0]_i_4__1_n_6 ,\status_reg[0]_i_4__1_n_7 }),
        .S({\status[0]_i_9__1_n_0 ,\status[0]_i_10__1_n_0 ,\status[0]_i_11__1_n_0 ,\status[0]_i_12__1_n_0 }));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[0]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2__1_n_7 ),
        .I3(\waveform_reg[3]_i_3__1_n_7 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[0]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[10]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2__1_n_5 ),
        .I3(\waveform_reg[11]_i_3__1_n_5 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[10]));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_10__1 
       (.I0(\waveform_base_reg[15] [2]),
        .I1(Q[9]),
        .O(\waveform[11]_i_10__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_11__1 
       (.I0(\waveform_base_reg[15] [1]),
        .I1(Q[8]),
        .O(\waveform[11]_i_11__1_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[11]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2__1_n_4 ),
        .I3(\waveform_reg[11]_i_3__1_n_4 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[11]));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_4__1 
       (.I0(Q[11]),
        .I1(\waveform_base_reg[15] [4]),
        .O(\waveform[11]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_5__1 
       (.I0(Q[10]),
        .I1(\waveform_base_reg[15] [3]),
        .O(\waveform[11]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_6__1 
       (.I0(Q[9]),
        .I1(\waveform_base_reg[15] [2]),
        .O(\waveform[11]_i_6__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[11]_i_7__1 
       (.I0(Q[8]),
        .I1(\waveform_base_reg[15] [1]),
        .O(\waveform[11]_i_7__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_8__1 
       (.I0(\waveform_base_reg[15] [4]),
        .I1(Q[11]),
        .O(\waveform[11]_i_8__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[11]_i_9__1 
       (.I0(\waveform_base_reg[15] [3]),
        .I1(Q[10]),
        .O(\waveform[11]_i_9__1_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[12]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\status_reg[0]_i_3__1_n_7 ),
        .I3(\status_reg[0]_i_4__1_n_7 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[12]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[13]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\status_reg[0]_i_3__1_n_6 ),
        .I3(\status_reg[0]_i_4__1_n_6 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[13]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[14]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\status_reg[0]_i_3__1_n_5 ),
        .I3(\status_reg[0]_i_4__1_n_5 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[14]));
  LUT4 #(
    .INIT(16'hF8C8)) 
    \waveform[15]_i_2__1 
       (.I0(status),
        .I1(\status_reg[0]_i_3__1_n_4 ),
        .I2(\status_reg[0]_i_4__1_n_4 ),
        .I3(\waveform_base_reg[15] [8]),
        .O(waveform[15]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[1]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2__1_n_6 ),
        .I3(\waveform_reg[3]_i_3__1_n_6 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[1]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[2]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2__1_n_5 ),
        .I3(\waveform_reg[3]_i_3__1_n_5 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_10__1 
       (.I0(\waveform_reg_n_0_[1] ),
        .I1(Q[1]),
        .O(\waveform[3]_i_10__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_11__1 
       (.I0(\waveform_reg_n_0_[0] ),
        .I1(Q[0]),
        .O(\waveform[3]_i_11__1_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[3]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[3]_i_2__1_n_4 ),
        .I3(\waveform_reg[3]_i_3__1_n_4 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_4__1 
       (.I0(Q[3]),
        .I1(\waveform_reg_n_0_[3] ),
        .O(\waveform[3]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_5__1 
       (.I0(Q[2]),
        .I1(\waveform_reg_n_0_[2] ),
        .O(\waveform[3]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_6__1 
       (.I0(Q[1]),
        .I1(\waveform_reg_n_0_[1] ),
        .O(\waveform[3]_i_6__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[3]_i_7__1 
       (.I0(Q[0]),
        .I1(\waveform_reg_n_0_[0] ),
        .O(\waveform[3]_i_7__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_8__1 
       (.I0(\waveform_reg_n_0_[3] ),
        .I1(Q[3]),
        .O(\waveform[3]_i_8__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[3]_i_9__1 
       (.I0(\waveform_reg_n_0_[2] ),
        .I1(Q[2]),
        .O(\waveform[3]_i_9__1_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[4]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2__1_n_7 ),
        .I3(\waveform_reg[7]_i_3__1_n_7 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[4]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[5]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2__1_n_6 ),
        .I3(\waveform_reg[7]_i_3__1_n_6 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[5]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[6]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2__1_n_5 ),
        .I3(\waveform_reg[7]_i_3__1_n_5 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_10__1 
       (.I0(\waveform_reg_n_0_[5] ),
        .I1(Q[5]),
        .O(\waveform[7]_i_10__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_11__1 
       (.I0(\waveform_reg_n_0_[4] ),
        .I1(Q[4]),
        .O(\waveform[7]_i_11__1_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[7]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[7]_i_2__1_n_4 ),
        .I3(\waveform_reg[7]_i_3__1_n_4 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[7]));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_4__1 
       (.I0(Q[7]),
        .I1(\waveform_base_reg[15] [0]),
        .O(\waveform[7]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_5__1 
       (.I0(Q[6]),
        .I1(\waveform_reg_n_0_[6] ),
        .O(\waveform[7]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_6__1 
       (.I0(Q[5]),
        .I1(\waveform_reg_n_0_[5] ),
        .O(\waveform[7]_i_6__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \waveform[7]_i_7__1 
       (.I0(Q[4]),
        .I1(\waveform_reg_n_0_[4] ),
        .O(\waveform[7]_i_7__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_8__1 
       (.I0(\waveform_base_reg[15] [0]),
        .I1(Q[7]),
        .O(\waveform[7]_i_8__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \waveform[7]_i_9__1 
       (.I0(\waveform_reg_n_0_[6] ),
        .I1(Q[6]),
        .O(\waveform[7]_i_9__1_n_0 ));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[8]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2__1_n_7 ),
        .I3(\waveform_reg[11]_i_3__1_n_7 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[8]));
  LUT6 #(
    .INIT(64'hF780F780F0F0F3C0)) 
    \waveform[9]_i_1__1 
       (.I0(\status_reg[0]_i_3__1_n_4 ),
        .I1(status),
        .I2(\waveform_reg[11]_i_2__1_n_6 ),
        .I3(\waveform_reg[11]_i_3__1_n_6 ),
        .I4(\status_reg[0]_i_4__1_n_4 ),
        .I5(\waveform_base_reg[15] [8]),
        .O(waveform[9]));
  FDCE \waveform_reg[0] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[0]),
        .Q(\waveform_reg_n_0_[0] ));
  FDCE \waveform_reg[10] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[10]),
        .Q(\waveform_base_reg[15] [3]));
  FDCE \waveform_reg[11] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[11]),
        .Q(\waveform_base_reg[15] [4]));
  CARRY4 \waveform_reg[11]_i_2__1 
       (.CI(\waveform_reg[7]_i_2__1_n_0 ),
        .CO({\waveform_reg[11]_i_2__1_n_0 ,\waveform_reg[11]_i_2__1_n_1 ,\waveform_reg[11]_i_2__1_n_2 ,\waveform_reg[11]_i_2__1_n_3 }),
        .CYINIT(1'b0),
        .DI(\waveform_base_reg[15] [4:1]),
        .O({\waveform_reg[11]_i_2__1_n_4 ,\waveform_reg[11]_i_2__1_n_5 ,\waveform_reg[11]_i_2__1_n_6 ,\waveform_reg[11]_i_2__1_n_7 }),
        .S({\waveform[11]_i_4__1_n_0 ,\waveform[11]_i_5__1_n_0 ,\waveform[11]_i_6__1_n_0 ,\waveform[11]_i_7__1_n_0 }));
  CARRY4 \waveform_reg[11]_i_3__1 
       (.CI(\waveform_reg[7]_i_3__1_n_0 ),
        .CO({\waveform_reg[11]_i_3__1_n_0 ,\waveform_reg[11]_i_3__1_n_1 ,\waveform_reg[11]_i_3__1_n_2 ,\waveform_reg[11]_i_3__1_n_3 }),
        .CYINIT(1'b0),
        .DI(\waveform_base_reg[15] [4:1]),
        .O({\waveform_reg[11]_i_3__1_n_4 ,\waveform_reg[11]_i_3__1_n_5 ,\waveform_reg[11]_i_3__1_n_6 ,\waveform_reg[11]_i_3__1_n_7 }),
        .S({\waveform[11]_i_8__1_n_0 ,\waveform[11]_i_9__1_n_0 ,\waveform[11]_i_10__1_n_0 ,\waveform[11]_i_11__1_n_0 }));
  FDCE \waveform_reg[12] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[12]),
        .Q(\waveform_base_reg[15] [5]));
  FDCE \waveform_reg[13] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[13]),
        .Q(\waveform_base_reg[15] [6]));
  FDCE \waveform_reg[14] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[14]),
        .Q(\waveform_base_reg[15] [7]));
  FDCE \waveform_reg[15] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[15]),
        .Q(\waveform_base_reg[15] [8]));
  FDCE \waveform_reg[1] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[1]),
        .Q(\waveform_reg_n_0_[1] ));
  FDCE \waveform_reg[2] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[2]),
        .Q(\waveform_reg_n_0_[2] ));
  FDCE \waveform_reg[3] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[3]),
        .Q(\waveform_reg_n_0_[3] ));
  CARRY4 \waveform_reg[3]_i_2__1 
       (.CI(1'b0),
        .CO({\waveform_reg[3]_i_2__1_n_0 ,\waveform_reg[3]_i_2__1_n_1 ,\waveform_reg[3]_i_2__1_n_2 ,\waveform_reg[3]_i_2__1_n_3 }),
        .CYINIT(1'b1),
        .DI({\waveform_reg_n_0_[3] ,\waveform_reg_n_0_[2] ,\waveform_reg_n_0_[1] ,\waveform_reg_n_0_[0] }),
        .O({\waveform_reg[3]_i_2__1_n_4 ,\waveform_reg[3]_i_2__1_n_5 ,\waveform_reg[3]_i_2__1_n_6 ,\waveform_reg[3]_i_2__1_n_7 }),
        .S({\waveform[3]_i_4__1_n_0 ,\waveform[3]_i_5__1_n_0 ,\waveform[3]_i_6__1_n_0 ,\waveform[3]_i_7__1_n_0 }));
  CARRY4 \waveform_reg[3]_i_3__1 
       (.CI(1'b0),
        .CO({\waveform_reg[3]_i_3__1_n_0 ,\waveform_reg[3]_i_3__1_n_1 ,\waveform_reg[3]_i_3__1_n_2 ,\waveform_reg[3]_i_3__1_n_3 }),
        .CYINIT(1'b0),
        .DI({\waveform_reg_n_0_[3] ,\waveform_reg_n_0_[2] ,\waveform_reg_n_0_[1] ,\waveform_reg_n_0_[0] }),
        .O({\waveform_reg[3]_i_3__1_n_4 ,\waveform_reg[3]_i_3__1_n_5 ,\waveform_reg[3]_i_3__1_n_6 ,\waveform_reg[3]_i_3__1_n_7 }),
        .S({\waveform[3]_i_8__1_n_0 ,\waveform[3]_i_9__1_n_0 ,\waveform[3]_i_10__1_n_0 ,\waveform[3]_i_11__1_n_0 }));
  FDCE \waveform_reg[4] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[4]),
        .Q(\waveform_reg_n_0_[4] ));
  FDCE \waveform_reg[5] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[5]),
        .Q(\waveform_reg_n_0_[5] ));
  FDCE \waveform_reg[6] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[6]),
        .Q(\waveform_reg_n_0_[6] ));
  FDCE \waveform_reg[7] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[7]),
        .Q(\waveform_base_reg[15] [0]));
  CARRY4 \waveform_reg[7]_i_2__1 
       (.CI(\waveform_reg[3]_i_2__1_n_0 ),
        .CO({\waveform_reg[7]_i_2__1_n_0 ,\waveform_reg[7]_i_2__1_n_1 ,\waveform_reg[7]_i_2__1_n_2 ,\waveform_reg[7]_i_2__1_n_3 }),
        .CYINIT(1'b0),
        .DI({\waveform_base_reg[15] [0],\waveform_reg_n_0_[6] ,\waveform_reg_n_0_[5] ,\waveform_reg_n_0_[4] }),
        .O({\waveform_reg[7]_i_2__1_n_4 ,\waveform_reg[7]_i_2__1_n_5 ,\waveform_reg[7]_i_2__1_n_6 ,\waveform_reg[7]_i_2__1_n_7 }),
        .S({\waveform[7]_i_4__1_n_0 ,\waveform[7]_i_5__1_n_0 ,\waveform[7]_i_6__1_n_0 ,\waveform[7]_i_7__1_n_0 }));
  CARRY4 \waveform_reg[7]_i_3__1 
       (.CI(\waveform_reg[3]_i_3__1_n_0 ),
        .CO({\waveform_reg[7]_i_3__1_n_0 ,\waveform_reg[7]_i_3__1_n_1 ,\waveform_reg[7]_i_3__1_n_2 ,\waveform_reg[7]_i_3__1_n_3 }),
        .CYINIT(1'b0),
        .DI({\waveform_base_reg[15] [0],\waveform_reg_n_0_[6] ,\waveform_reg_n_0_[5] ,\waveform_reg_n_0_[4] }),
        .O({\waveform_reg[7]_i_3__1_n_4 ,\waveform_reg[7]_i_3__1_n_5 ,\waveform_reg[7]_i_3__1_n_6 ,\waveform_reg[7]_i_3__1_n_7 }),
        .S({\waveform[7]_i_8__1_n_0 ,\waveform[7]_i_9__1_n_0 ,\waveform[7]_i_10__1_n_0 ,\waveform[7]_i_11__1_n_0 }));
  FDCE \waveform_reg[8] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[8]),
        .Q(\waveform_base_reg[15] [1]));
  FDCE \waveform_reg[9] 
       (.C(clk),
        .CE(\cs_reg[0] ),
        .CLR(reset),
        .D(waveform[9]),
        .Q(\waveform_base_reg[15] [2]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
arnh+KKoDgsw4/tPEYwnnPGDRbVikesong6+Q2OyHujI0sMs8SCxocYLiXw5FQrlRM68qU6J4fD5
u2TxpWpRVQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
Yq/vnjZLCL1QwIH7cUbwc5FvSHLhapSL6t8LSQJUEHtxWu+KSjh1dhPJmktrgDFaXac705ujvztl
+YNsaRHfN24YRZgfmuNNkTYC/UuSjXT5p/OoHt34ja5+sL1swpkd0kS4KoUu1L5VgNu5PzU1KlJu
xNTTz0V55se0kA3xWGQ=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
eoHGlvGv7vY3KM2pS9QmvseVWbTY70mMUJ3dA0VjqlsHyDJxtnekm0x4ES3HnmtT6I31arKf6/ET
ILLvECnH2OOJH68Mcf4J7JFoX45Zwa7B7KIjwEYTSxi92dQiphR/l29FqZuSejHT7E7bMi4sclKz
j+vGrH1SqUduR0rwKN9CPHaVuDw/oVW2lWa9c3BvcGgxPZYlQfuBzMSoT7ADN6SHXTy8LugMRN19
ZeoXElJXwG4eJoi81sjzUnliKzvxYAUg5fobuuhqHUtJVxrVPTQmR3/xJ4qtPwhElOZ3/puQnm50
9DRgrlf21WXL7TGNp7fuSABNGeZz8AwBEp0Vrg==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
TeLIf/zkpCY4yQD/TbVP7xhsSq6QqpAxE+H0wAcGmKjkx1YJ+YQD83Gi50v2Dxag9LF0iTX0QwAQ
/QvIx7YohUWqQvk+r2+0yK1URFJmBCNFEEivz+FDjQlbO1RDN1XaKdHoCL25pyeg1dtt9P7mQ33V
nqRohJY9ZYEdwnXPBdY=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
fOxmOBbj/YQDvu07VmpBaNFeLYg0SbTKg02Kj6lBe0YdruMt8S7cfJlbx82jKhkR/NlBv2HbJo+e
TUO8AOppQbnS+cHMa8q6CqMi4aTf38ur9dGrsWfXdqtFgwbHnesqIWvZJGaoWSctLiHT6GsQM0GG
Tru90EZL56azfqnVDZxXIapp7tYbdgZBFhdsrGDFzAx7l+LUsYAqJ0L8llIw9IWY+8q/E3Gy9rpS
YPICwHReFMwy12AIuCLjzneQvBv1J7TzX7xOGO9D6usPWzR3Ig03iZPhbgu4HfeKyk4x8fM5TrTw
4E17UpHtFJ/o6MADz00WRJLpGrki4atbYJ7OPg==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
AnSfS+9S8IV5gf6AqlOWolhOQrA1MzRICtGE6GaeKJFsoWtdpsMEbpc9L+CFN5UrqaxYTLkUpzhf
XyCgmtEYEtaM6Q3YeopCQOu9nFjXOZEZsrq+Wn6mmPKz0GpWaFSJuMHFJAtnHdhx/QAy4qfYIORb
lvBr4AXuRw8Oz5uabNwUK0ShCeDsdttI2p6IWBonfGCPhTjl+73TaHSH2AOOY22/ycuHH+xjSus1
kQBRvMqFUPKF3NloMtlkL7vCQKuN+qdYKaGWqY6x5ZKzzT/w9OQ2JIeAEUPVZPqpnx3+jCeoHCNU
7OCbYs1rdB2lVDdzVXR0IAZM2jGMgADC0/IYNA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
cpXPbsYWzxtyh1KKPdBNRmFGegDyqIigtHmOqj9g/fnZAe/f3n6FLxzgDcdLn7aI/D7q0aWu0LUs
SGxpIBAtSPN8k/2npZCWsA+ej+uR6UFGW09cgw3Hm5V3IXfWMpbUo35eL7E5f++3opflbSi8szgO
2w8ypq6/QgG+m6OvljmsNrR91diLBfLVQs2SWxivokzCiwcHR8At/WmsED32F496c6euzDVh7Bdw
TZ+VaZ+RAeP9PMh+PT6cxBbU1OQmPLpj3S8Im/lquc0jAcdcUBd5DZMmYSglLu94cYsrizRmL4L/
ZpG6beiDru65ODZFM7/dka8eYsMeBFLK28kr6g==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21824)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
