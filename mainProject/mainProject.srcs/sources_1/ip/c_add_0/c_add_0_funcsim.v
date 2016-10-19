// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Tue Oct 18 17:24:10 2016
// Host        : mittlefrueh.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
// Command     : write_verilog -force -mode funcsim
//               /afs/ece.cmu.edu/usr/suyashb/Private/545/mainProject/mainProject.srcs/sources_1/ip/c_add_0/c_add_0_funcsim.v
// Design      : c_add_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_add_0,c_addsub_v12_0,{}" *) (* core_generation_info = "c_add_0,c_addsub_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_addsub,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_XDEVICEFAMILY=zynq,C_IMPLEMENTATION=1,C_A_WIDTH=16,C_B_WIDTH=16,C_OUT_WIDTH=16,C_CE_OVERRIDES_SCLR=0,C_A_TYPE=0,C_B_TYPE=0,C_LATENCY=0,C_ADD_MODE=0,C_B_CONSTANT=0,C_B_VALUE=0000000000000000,C_AINIT_VAL=0,C_SINIT_VAL=0,C_CE_OVERRIDES_BYPASS=1,C_BYPASS_LOW=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_C_IN=0,C_HAS_C_OUT=0,C_BORROW_LOW=1,C_HAS_CE=0,C_HAS_BYPASS=0,C_HAS_SCLR=0,C_HAS_SSET=0,C_HAS_SINIT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_addsub_v12_0,Vivado 2015.2" *) 
(* NotValidForBitStream *)
module c_add_0
   (A,
    B,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [15:0]S;

  wire [15:0]A;
  wire [15:0]B;
  wire [15:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "0000000000000000" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "16" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* DONT_TOUCH *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_add_0_c_addsub_v12_0 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "16" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000000" *) 
(* C_B_WIDTH = "16" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "16" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_addsub_v12_0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module c_add_0_c_addsub_v12_0
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [15:0]A;
  input [15:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [15:0]S;

  wire [15:0]A;
  wire ADD;
  wire [15:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire C_OUT;
  wire [15:0]S;
  wire SCLR;
  wire SINIT;
  wire SSET;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "0000000000000000" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "16" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_add_0_c_addsub_v12_0_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(C_IN),
        .C_OUT(C_OUT),
        .S(S),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
NtlHUOe6MM1p/PV12drrbV0GunfNFAMFX1RN0lgNr+rN7sdvgk4W2eSP7O5acplxmGXfRUoYQnIP
E9ycVdxD2g==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
RR/eBO0H72jaFKQhUnMcVNDU4bY8R82UfatTcvUVXDAERtdIYD6R0cRToKXax574OuBkZPzbEdds
tfMLVMggMoYjJM26JTU0xswFgJWQ++3jV5NqMCzJXv9UsqJOZsw8tH8vrCdAkauMJ+mJlkOgjGRq
tsk179rfUIuMuGMNNNY=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
m0urT1YktOTFldyCVLxe8GtDrkkWCLw9marxyt12BsF4SkU+/s5FXg+kM93e0SsGE5FqmS04134n
tnoG5XdhifA9DiqB1lQowow7WuO+GXPUDxRAqwriKjOvxfNYmiRlNQWuL0TcbXbkZooFGa0BwhYU
euAEph8dZmS86+3bULtMBfVJsF/W3DUM9TsL2VGjEy1wL2sL8/9LVBwF/yI4YDmlAvx8ZSPQOddT
dD5bKm5ZGlYDSSS6arW0Lu/v6hhOu+ZTHSPKOXVvZRHFZnqSRW762hQ1lKEXgPSy43k4MfcQmZOP
rhCXaSD3vlgnH7EF+7A2yYMIcmLr7YvDoWcDrw==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
DvriFSs33CF0bAVH6O8uB2iZOrDQ50U7ADRBlmazwrJgLezS2hm0HS4L4vr42c+CJV/hvDZqiLjZ
BENFIowi6niSqc7ofAVHnt2PbldFPTDpypDuNSs0qcoQa34sv9KoJ7jUZLeLlglBwLI3eLkAtmDh
cf3yXBIrtjNKUcachJM=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LPlcR0MOIcwKiQiBeI+zQH1fkCR6PvnIh3LLTtIAYbs0MSbVsvzgRKAcoCY7Xt2wD2P1TCdnC8dX
DgVkrz4QLo0T+uQmGQpEcdLjbVwNUmhSUUf+E5mHJ251V0S8eseJqV9bS51oCqlN4HpqNuel/jd9
W0ZCCyVNaf06n0HXILF2q0+nZPU9+B4pYMZo8wXQjjfoU+H5L3VrtwY2O1ehfnjSNIW7DtN5IVaV
YFPY7EdCN+vyK8J1QYijYEZP2FSxOstecyh4vQRZvl8bTRMZwSdhat5/wTPshQDDBu/prSynB24N
w/HM/X47E135dffHfrzpkAl03R1icEJOdP13GQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
mkTBF3+vpsybygPWZVJW8907qfsbUA7zH8DvOGsQguBypfp0RpKz9W+y8yFOxCt8nSuuvlSIet79
xmkPiy5nxcOkmOjIDb4VAMRTWQrqK0i2HHqar4cK4KkgnTSyjEk3Hllx96aJsfxS9jtwtEV6szru
zZ5uR2Kbhikx5+A2FKyPwCSh81tdSyKgG4VxTqBAtTC/686jm3evTaP9DavfomdwZZ0F9DQTnyKK
0BSEk9XRb+Z2CynsilIGDiR9OP+Cpzwyf8KxsdZPjvUhtjO8xmaeuiMFEQpug/sHedxBRa5d/8Ir
d2OPUtFiTdWt2DCjc1brn5WvKzixcmDldU33mw==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
mnRzHZjl+PcfHiypIy/si1MipRiDNY6XqjnNeTZceVgetRPuaoSBN4JLoc+IiCM0JaNIVC5oi9Sb
fPsJV/spmPSXLQ2b3bmjXlxrsByJr77MW0DArppieYetMIYZus+QoRaPMrQ9SZ27J8vH4yH1Tfok
QE2RyVifmMxStMZeYI2jVCdxfuQTD4h0i3n/CImiZT4L42hcIEoJKUakc43KRCOLMcQiAFedKdWD
CWnSpT8ymXmV30jV2EYBYoInkGyN1djqmIkeHRe9JByDjGVYDvezgt09H0jwEj+ldJKvM1ZGwGG6
An6VV6SDp4xLt+tv1xepjUaT43PgWGU3cHAijw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 1456)
`pragma protect data_block
3hj6hYAt6wqNNChEAsBRBdVh+OkLysziy9hjP8gS/nsKOOzya+LTf/0JCM5HHw0aftP9tn7LaqkG
g5k2Nr+uEH77a83fqhSeMOXyA7sgp/Eq065sYcn0GLvP6Nu2O0oa7MSYmJi0O9tr/YklSI5eqLAv
AVRJMk3nxT7O/Z8+48ZFJyvNAxropm6yDvaqH9It40ZX+rV2rBTUY2ZxgJuXfmV2qGNPjXDi3sbm
ZcwwdWznWmqwRur0bYkEcigEiCMJAXJ4a3fS/zIkwYLoLRxOw0MBfI3EiI28VV6TZxbUtYDZ1zeM
OcHJ3UzxnAMJvsGHBqaS5rBUNseQ1roPaiCx+wq/j//wIkadXmMlok0ETynN90YBt69mUdvXAxoQ
slI7e0BGbYFAIK01MWWDNu+P1DNuoP840CTYxx1THV15iXG8Z5dSd+RCU3MwAkQKq3bGgXdZDZzV
CfQnsEkfj8yh5qwJxEd9cjV2TgQiJ2Z3TFSuR4MnZJeQjxAvYHChAT3LZAFliXRRmO1Es/RRZBV9
X45I1/XcCZ+GNm8LPcsjo+BxLON8A9CKq99WXgE7fIzeaTrEChvf5eQJ4aYcn2/1AH3Nerom1yjU
pbona15Pf2l3WLM6XoCcAJwSDiw35JvlK1A/pTHq/FFHx1Is1XsCzzGrOOoxWueMOFD9Hla5XPqJ
JKL0QCzMw8XvsyRrGY+tCjPN4pZLGiP9nb4rl0VWbPbkqDC1j8Vstk29SlcWgb8TLVvVWX0cncZD
7TNROablCl8akEoFiQYOX2oB9iIJfjp6T0fCowkDYqDPhgeLZyJN4SRruUHs+8Q86UICmysjq3PI
dsvnAkh47j8RLn5Al3mFRfYfLdr1gQT2cObd1OfoYY7m0ErlJREQTrVgdwRxdPYXPG9iFP5OsI/4
bOTF6ngNLS/LH8PKuZPRpx6Xe6nivLx+lERRWgpsieYl6vdq1OyVTYkIlBUJEBIpONoDnb0vNdIB
YqaQvDS9qIjJDS7I/etFTuVb0LYUrmwuLwmboh0xgxw+ytb0WLbhHCYipTIbgMkaC4lHKPk7PpFd
8+h/J+kw11JiAVjTkHZ9EYIEWsKJKEIH2RiI4fg0+y0TMMd8rvl0FH7vmUJy3t8OyJzqg746fR5Z
bFhES0zdoIgM1BT68m0ENx+V9Xf43hDVTc7HgRlmxIs7q/eVDpLRhuR5yIYk+1AwppO+C7GRzWsj
61j5LDccLl0WZ7kcxk59VR7jvc4Mz6qKUYCxdkrJHgCMq7zLCt1GxXXOK4hBfgXPWC89WUWc4KVf
EuPVSuSMHq1wf1GYr4sEjbo++mmc1hbsThwNxcQJHy1LHw+rD1Kr0qK6o6oMYQfhXl4IusQJ4zHp
GObqWZjRzuTOV7QIYHKCOaTd9XqlG5hbB1+FqHncyf1sRcA6so31fOINn3K/c5z2pUamwXUBz+qq
SnzH2Ma5LFhg/XsRG5SeobBdVs1dmEzYXHgcf77puDUXYhaB/arWAPiQf1fCY8ZkB61p1q7RNf2M
FP1W9dL9WgqxmFl2vYjj21poDeV1oRdQeiTPZ3wvhi08s9WF2LjzdfrY6x75b2V5LyQnO4H0ro/x
0rgZk7NrmzRYCgxktjMjO/rat/xdSVF25qVZMe03LBvuuE2+GpJXPH+vPSikjPLMsKbfCa+6zSOf
c5dy3FAvxC4OAC8Al8oyXkEHRO6M9YcHljd7ilXgcUjPNKpdplxcZRWYYIcn+S8cUjoUFQ+8ORRE
tQPMdGP2RMMXc0QT1zoc0j4fxJXESWOg0mYlKyMpGgpgrzXkJlVGCu9h5rgoUPQyJAn+oR9PdbHb
AN9ozFFd6+8PQn9R7Jq2/F4Gx+qVuf3Nf45ZaoY/CGRlV9/ynuVPFW3VSPO5LsIJXP+WoQ0YxAmk
Cnah+QmsHsoj6sKkghPPU4hxdrK4kRemTHofuGxswA==
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
NtlHUOe6MM1p/PV12drrbV0GunfNFAMFX1RN0lgNr+rN7sdvgk4W2eSP7O5acplxmGXfRUoYQnIP
E9ycVdxD2g==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
RR/eBO0H72jaFKQhUnMcVNDU4bY8R82UfatTcvUVXDAERtdIYD6R0cRToKXax574OuBkZPzbEdds
tfMLVMggMoYjJM26JTU0xswFgJWQ++3jV5NqMCzJXv9UsqJOZsw8tH8vrCdAkauMJ+mJlkOgjGRq
tsk179rfUIuMuGMNNNY=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
m0urT1YktOTFldyCVLxe8GtDrkkWCLw9marxyt12BsF4SkU+/s5FXg+kM93e0SsGE5FqmS04134n
tnoG5XdhifA9DiqB1lQowow7WuO+GXPUDxRAqwriKjOvxfNYmiRlNQWuL0TcbXbkZooFGa0BwhYU
euAEph8dZmS86+3bULtMBfVJsF/W3DUM9TsL2VGjEy1wL2sL8/9LVBwF/yI4YDmlAvx8ZSPQOddT
dD5bKm5ZGlYDSSS6arW0Lu/v6hhOu+ZTHSPKOXVvZRHFZnqSRW762hQ1lKEXgPSy43k4MfcQmZOP
rhCXaSD3vlgnH7EF+7A2yYMIcmLr7YvDoWcDrw==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
DvriFSs33CF0bAVH6O8uB2iZOrDQ50U7ADRBlmazwrJgLezS2hm0HS4L4vr42c+CJV/hvDZqiLjZ
BENFIowi6niSqc7ofAVHnt2PbldFPTDpypDuNSs0qcoQa34sv9KoJ7jUZLeLlglBwLI3eLkAtmDh
cf3yXBIrtjNKUcachJM=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LPlcR0MOIcwKiQiBeI+zQH1fkCR6PvnIh3LLTtIAYbs0MSbVsvzgRKAcoCY7Xt2wD2P1TCdnC8dX
DgVkrz4QLo0T+uQmGQpEcdLjbVwNUmhSUUf+E5mHJ251V0S8eseJqV9bS51oCqlN4HpqNuel/jd9
W0ZCCyVNaf06n0HXILF2q0+nZPU9+B4pYMZo8wXQjjfoU+H5L3VrtwY2O1ehfnjSNIW7DtN5IVaV
YFPY7EdCN+vyK8J1QYijYEZP2FSxOstecyh4vQRZvl8bTRMZwSdhat5/wTPshQDDBu/prSynB24N
w/HM/X47E135dffHfrzpkAl03R1icEJOdP13GQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
mkTBF3+vpsybygPWZVJW8907qfsbUA7zH8DvOGsQguBypfp0RpKz9W+y8yFOxCt8nSuuvlSIet79
xmkPiy5nxcOkmOjIDb4VAMRTWQrqK0i2HHqar4cK4KkgnTSyjEk3Hllx96aJsfxS9jtwtEV6szru
zZ5uR2Kbhikx5+A2FKyPwCSh81tdSyKgG4VxTqBAtTC/686jm3evTaP9DavfomdwZZ0F9DQTnyKK
0BSEk9XRb+Z2CynsilIGDiR9OP+Cpzwyf8KxsdZPjvUhtjO8xmaeuiMFEQpug/sHedxBRa5d/8Ir
d2OPUtFiTdWt2DCjc1brn5WvKzixcmDldU33mw==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
mnRzHZjl+PcfHiypIy/si1MipRiDNY6XqjnNeTZceVgetRPuaoSBN4JLoc+IiCM0JaNIVC5oi9Sb
fPsJV/spmPSXLQ2b3bmjXlxrsByJr77MW0DArppieYetMIYZus+QoRaPMrQ9SZ27J8vH4yH1Tfok
QE2RyVifmMxStMZeYI2jVCdxfuQTD4h0i3n/CImiZT4L42hcIEoJKUakc43KRCOLMcQiAFedKdWD
CWnSpT8ymXmV30jV2EYBYoInkGyN1djqmIkeHRe9JByDjGVYDvezgt09H0jwEj+ldJKvM1ZGwGG6
An6VV6SDp4xLt+tv1xepjUaT43PgWGU3cHAijw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 688)
`pragma protect data_block
3hj6hYAt6wqNNChEAsBRBQuzI/nMNASC8GUqFlMsn3LdEdHpiDnLm/5GtochYPhMqXsbYapt54Jj
B5Ez4xb52VYhliS5ABBvRUJGisbsF3S2Ek0TvNFixB0yWbfFzNDAXzY1laKLpaG8RjpMzTR+8BYT
z7HZmvtI+K97z+c95vXWtAMFSld/2QybNH/KrrQyNL3KxOpy2GgAre60jTV5Y8kxXcB+kguJctcG
mY4/x4SuJdjnZqflOCMISAI+3mI18YWX7SDHtbRqndPo0e/1gsPfMpb7u5CjH2rO6yPpzZfveNEq
US65LK2T5s30kiBMVPyT22IKZ6xViiczKBvw8TS9wzC2c6N1j8U7ITE92VoYXs4suRSvF8d6zU9s
DMwrAfakA2gFMJYmnu24oQ58Tp7zqTxRGRG6ocxdpMuIm6QHGZ+AsmT1jTDKx8Ytre7TFojveE7E
pOL6NwNGq+0paddJrvI8t6VMTGiPOs6b/4kn9f7BnDw6zg06V4T/uDzWmAsn6wH4h/bik9hCu53/
mPWxqmeEJx3rTuJlVhIU/WwNCu1B6BrTFryYssh+VbzFKiz4IRd/lJRZgvVoLa9HHqzCsY8mucx7
c20QtqPF51wuK0SuLz2M4tOIS6BXu4n0YnECDOeDzwjC/iAiuUZwQDcyq7I5Ra5xKPMiyhU60GE3
FSduG4GvnupGvmQ559gsbSah24RdY3gWzKkvIi2tqfMGRH1tFaCNg80hONwaUFwjfAgAU88xtGjx
fFfSMrDpkVJ6TpHV5ymqCMcckMvP027S04uzgzFPPAGnlEO3CFqspotoOLJYsrd1hDPYfFfcc9XC
Mg2LAdwaTzAl2CDGnCJ4pJYQ9e4ZHV3xAnGalduTBDhhWKNLOY1cGv4YUjLPeDAuRSQFEK7eG8Vm
3Ow5Gg==
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
NtlHUOe6MM1p/PV12drrbV0GunfNFAMFX1RN0lgNr+rN7sdvgk4W2eSP7O5acplxmGXfRUoYQnIP
E9ycVdxD2g==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
RR/eBO0H72jaFKQhUnMcVNDU4bY8R82UfatTcvUVXDAERtdIYD6R0cRToKXax574OuBkZPzbEdds
tfMLVMggMoYjJM26JTU0xswFgJWQ++3jV5NqMCzJXv9UsqJOZsw8tH8vrCdAkauMJ+mJlkOgjGRq
tsk179rfUIuMuGMNNNY=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
m0urT1YktOTFldyCVLxe8GtDrkkWCLw9marxyt12BsF4SkU+/s5FXg+kM93e0SsGE5FqmS04134n
tnoG5XdhifA9DiqB1lQowow7WuO+GXPUDxRAqwriKjOvxfNYmiRlNQWuL0TcbXbkZooFGa0BwhYU
euAEph8dZmS86+3bULtMBfVJsF/W3DUM9TsL2VGjEy1wL2sL8/9LVBwF/yI4YDmlAvx8ZSPQOddT
dD5bKm5ZGlYDSSS6arW0Lu/v6hhOu+ZTHSPKOXVvZRHFZnqSRW762hQ1lKEXgPSy43k4MfcQmZOP
rhCXaSD3vlgnH7EF+7A2yYMIcmLr7YvDoWcDrw==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
DvriFSs33CF0bAVH6O8uB2iZOrDQ50U7ADRBlmazwrJgLezS2hm0HS4L4vr42c+CJV/hvDZqiLjZ
BENFIowi6niSqc7ofAVHnt2PbldFPTDpypDuNSs0qcoQa34sv9KoJ7jUZLeLlglBwLI3eLkAtmDh
cf3yXBIrtjNKUcachJM=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LPlcR0MOIcwKiQiBeI+zQH1fkCR6PvnIh3LLTtIAYbs0MSbVsvzgRKAcoCY7Xt2wD2P1TCdnC8dX
DgVkrz4QLo0T+uQmGQpEcdLjbVwNUmhSUUf+E5mHJ251V0S8eseJqV9bS51oCqlN4HpqNuel/jd9
W0ZCCyVNaf06n0HXILF2q0+nZPU9+B4pYMZo8wXQjjfoU+H5L3VrtwY2O1ehfnjSNIW7DtN5IVaV
YFPY7EdCN+vyK8J1QYijYEZP2FSxOstecyh4vQRZvl8bTRMZwSdhat5/wTPshQDDBu/prSynB24N
w/HM/X47E135dffHfrzpkAl03R1icEJOdP13GQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
mkTBF3+vpsybygPWZVJW8907qfsbUA7zH8DvOGsQguBypfp0RpKz9W+y8yFOxCt8nSuuvlSIet79
xmkPiy5nxcOkmOjIDb4VAMRTWQrqK0i2HHqar4cK4KkgnTSyjEk3Hllx96aJsfxS9jtwtEV6szru
zZ5uR2Kbhikx5+A2FKyPwCSh81tdSyKgG4VxTqBAtTC/686jm3evTaP9DavfomdwZZ0F9DQTnyKK
0BSEk9XRb+Z2CynsilIGDiR9OP+Cpzwyf8KxsdZPjvUhtjO8xmaeuiMFEQpug/sHedxBRa5d/8Ir
d2OPUtFiTdWt2DCjc1brn5WvKzixcmDldU33mw==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
mnRzHZjl+PcfHiypIy/si1MipRiDNY6XqjnNeTZceVgetRPuaoSBN4JLoc+IiCM0JaNIVC5oi9Sb
fPsJV/spmPSXLQ2b3bmjXlxrsByJr77MW0DArppieYetMIYZus+QoRaPMrQ9SZ27J8vH4yH1Tfok
QE2RyVifmMxStMZeYI2jVCdxfuQTD4h0i3n/CImiZT4L42hcIEoJKUakc43KRCOLMcQiAFedKdWD
CWnSpT8ymXmV30jV2EYBYoInkGyN1djqmIkeHRe9JByDjGVYDvezgt09H0jwEj+ldJKvM1ZGwGG6
An6VV6SDp4xLt+tv1xepjUaT43PgWGU3cHAijw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 352)
`pragma protect data_block
3hj6hYAt6wqNNChEAsBRBQuzI/nMNASC8GUqFlMsn3Kny/bNq+ZX6JKjIB97RUsUhWhN4+ANlYO8
9lOwCLuo9CKXK7UGKN/97jmoxxDeSBQgD0AAs3JKofOjaEcb5iW3LEez9IdlOhgvK/anegePWi9Q
16yNkQmdJZQS1tkpQHAmCj5KLWKoHJK5PYhzcl2uHiExPQwEN1VIJh4o5DPS1KwzR907mYvse5/S
Muyncx7cjyU4mIxcoFmPleqEnpzWJalAonzmt0vZaYuWMzDtRzMb1rYsdDRCtCnX5+Xm2QDLk9D0
jKSXvfuyJXGPpTbOVOzK84qX23Zvf5Z0bXCedxkIyMYSqNJSvjgjMeIkb0Ws9whD8rSxJGxSXxCA
QFxdF0q+uM7LGsJii7fzu8t7u5E7e4pxpA4UX3PS/b+XkVp7X7GaFIYOf5INcbGn/vEt6V11QKno
xRXo/Y0QyHWkwA==
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
NtlHUOe6MM1p/PV12drrbV0GunfNFAMFX1RN0lgNr+rN7sdvgk4W2eSP7O5acplxmGXfRUoYQnIP
E9ycVdxD2g==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
RR/eBO0H72jaFKQhUnMcVNDU4bY8R82UfatTcvUVXDAERtdIYD6R0cRToKXax574OuBkZPzbEdds
tfMLVMggMoYjJM26JTU0xswFgJWQ++3jV5NqMCzJXv9UsqJOZsw8tH8vrCdAkauMJ+mJlkOgjGRq
tsk179rfUIuMuGMNNNY=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
m0urT1YktOTFldyCVLxe8GtDrkkWCLw9marxyt12BsF4SkU+/s5FXg+kM93e0SsGE5FqmS04134n
tnoG5XdhifA9DiqB1lQowow7WuO+GXPUDxRAqwriKjOvxfNYmiRlNQWuL0TcbXbkZooFGa0BwhYU
euAEph8dZmS86+3bULtMBfVJsF/W3DUM9TsL2VGjEy1wL2sL8/9LVBwF/yI4YDmlAvx8ZSPQOddT
dD5bKm5ZGlYDSSS6arW0Lu/v6hhOu+ZTHSPKOXVvZRHFZnqSRW762hQ1lKEXgPSy43k4MfcQmZOP
rhCXaSD3vlgnH7EF+7A2yYMIcmLr7YvDoWcDrw==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
DvriFSs33CF0bAVH6O8uB2iZOrDQ50U7ADRBlmazwrJgLezS2hm0HS4L4vr42c+CJV/hvDZqiLjZ
BENFIowi6niSqc7ofAVHnt2PbldFPTDpypDuNSs0qcoQa34sv9KoJ7jUZLeLlglBwLI3eLkAtmDh
cf3yXBIrtjNKUcachJM=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LPlcR0MOIcwKiQiBeI+zQH1fkCR6PvnIh3LLTtIAYbs0MSbVsvzgRKAcoCY7Xt2wD2P1TCdnC8dX
DgVkrz4QLo0T+uQmGQpEcdLjbVwNUmhSUUf+E5mHJ251V0S8eseJqV9bS51oCqlN4HpqNuel/jd9
W0ZCCyVNaf06n0HXILF2q0+nZPU9+B4pYMZo8wXQjjfoU+H5L3VrtwY2O1ehfnjSNIW7DtN5IVaV
YFPY7EdCN+vyK8J1QYijYEZP2FSxOstecyh4vQRZvl8bTRMZwSdhat5/wTPshQDDBu/prSynB24N
w/HM/X47E135dffHfrzpkAl03R1icEJOdP13GQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
mkTBF3+vpsybygPWZVJW8907qfsbUA7zH8DvOGsQguBypfp0RpKz9W+y8yFOxCt8nSuuvlSIet79
xmkPiy5nxcOkmOjIDb4VAMRTWQrqK0i2HHqar4cK4KkgnTSyjEk3Hllx96aJsfxS9jtwtEV6szru
zZ5uR2Kbhikx5+A2FKyPwCSh81tdSyKgG4VxTqBAtTC/686jm3evTaP9DavfomdwZZ0F9DQTnyKK
0BSEk9XRb+Z2CynsilIGDiR9OP+Cpzwyf8KxsdZPjvUhtjO8xmaeuiMFEQpug/sHedxBRa5d/8Ir
d2OPUtFiTdWt2DCjc1brn5WvKzixcmDldU33mw==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
mnRzHZjl+PcfHiypIy/si1MipRiDNY6XqjnNeTZceVgetRPuaoSBN4JLoc+IiCM0JaNIVC5oi9Sb
fPsJV/spmPSXLQ2b3bmjXlxrsByJr77MW0DArppieYetMIYZus+QoRaPMrQ9SZ27J8vH4yH1Tfok
QE2RyVifmMxStMZeYI2jVCdxfuQTD4h0i3n/CImiZT4L42hcIEoJKUakc43KRCOLMcQiAFedKdWD
CWnSpT8ymXmV30jV2EYBYoInkGyN1djqmIkeHRe9JByDjGVYDvezgt09H0jwEj+ldJKvM1ZGwGG6
An6VV6SDp4xLt+tv1xepjUaT43PgWGU3cHAijw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9232)
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
