// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Wed Oct 19 12:24:12 2016
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
AnqrA9pXAZmEx/29zLX8bQanW2OeWPcym4fhp6eW8mRO9v2ifro+9AVV3x4M+fJgrU02HmKEnxk0
norqwk+BLMpDXNbMscP5nqgGV413lsuj2eHgw+Cw1LaLraaaN3IRSe3ycw2ZvyOHe1JxNkNu8YHa
8Tpt0fie45MH7OztJY+pnsFAN23/OYBdiD1EitagJc7C76kw0AuIZCnzkBYgR8AOJdN0U7axlyxL
zHauA3qWJ3ngooJfZAmZtzjhgHHEVqGtkX9frqpdVYj4cRaakrbjSuhqF+Z4ZxSkpw2b6lddg855
ua1lIbYoaKv0+9l8mS49H+FZ1l2X9waVGfTSZw==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
K/N/KAjOR/lwHCxkDaSzSTd6Lq2b+UhOfCIUR2AMfA8h1drFVkUoqXAt7x/O6kW3ax6mgc5uf3kp
VSZI1eDpleG/fvi7zwgmCOcsUSEz8edsFz9e+hlfnbn+Id7NdrEbeaHAOjydRR0iAYsRwu7zd9mI
4Ciw8JNhIzrHwolfc6nHfgZpu4jgLVR+LrWzG23qvNG7yDtqWgl5Qn6grnu2WFI6APs4YM876B4Q
sWdjfUM5yVOQmqEEK3XJQ8mc102kBtRhnMYBiNl7948VteUwt/L1eiJAXHSxLbfAub+hFb112aZH
oYbblnHGe2BsI4jHcpbSHzVyYGjkWsT642iHDg==


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
