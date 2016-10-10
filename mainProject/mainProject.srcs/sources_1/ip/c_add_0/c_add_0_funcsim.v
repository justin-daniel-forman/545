// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Mon Oct  3 15:23:34 2016
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
knUI8MP47v7QDJ8NX7U14tfhnDJYwNpnrjsCsJ4ro3GiNPidzv7y+Tuw6XTX26HpWF2SHBGmdJ/c
5cICqQ1iqY0VhsvaT/YlttceXa//TXDkp0bbAqgrbGghG9ExKLYJO1Sa47s+nHaH9ZlBlQy1dibc
VvZdd/Wl+anbqIfrmh2fPMxi1DPPZQws4fu7m6b0fZ+qli5SxwE29ktTvlo/jyENsDJWLlpP3hYi
isPA8f5OUQNnfs+tH9OF5qH4fXycN7LXs2e5R35EY48RWQ5LXPi4PoNpOL2MvIuRVBpOi2hRKi/H
Qkaaf0YiwglHbgti9h0ijavvkueFU4ICdBPBCA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
ArlJfW4XFcpaoTDLgUB+fpSZh0gCzK6lhkYoch0tA2iWweGKDKFSzmXa2d69+TkD9/F+gCb6m3rE
NtaNgKQjvrVdz2BQ9qwiwXruwLgJzv2s/78JrmesHZ2Biu1jR++s2y3nkVoto6pWbA+G1FJEQjjP
X9PT+oCB7eWhiT23Dkmf4REN3eZDjUP226cnrRC5Y43YyhsT0+5QTnp7UOzzeTkl9gCtffjf4jaA
mFlG5yt60G3L7p4DRkg6+jMpZJMP53YdFVVBhnX5YxVu01WyxPe2vuTYxUsK6zekoiVgyiaBLC8Z
HMXpU42eUwm8joXhvHCevM2J+24eIgBBTnmXfw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 1456)
`pragma protect data_block
MPYGGFRGttvauVgw78h6Q8qcnsqxJCLwV47xxzA8tzjmi4+lw+EKEgTtI4Z1V+WUw3L7glYtQzIm
Ku1c0rJKSu1M+SC8N8HPWb5d2SPHebK8GLFIyoXZDAE2VYNEkR+nPIWMt0EXXiWwfDk4UPTSbfGc
9nfN32HtV2x950g3D9lczaMaiDEw7LrWKQAlx5ptxO5IdUf4EehsK/fqmj7OBFPWXBzj/KUdBTQA
EpyuZx0eRuZUByQFcsoDwTu7ZlJ9j2RHQh427gNyLg2gOS5XoAXgJQLhMwD2OpKHRVPHjyu27TRB
VMQfO+iq6q6ZRvrZ2hh5fXyKXRl/14pmv2lSgUABuF0PGBbTy83lxqHgctuzN6RiUp8UUmWL8clb
O7YeA3U0SjERWp3lCn6cW4qTwJ168vl4k9rNYQhTwZO0y7uOXYgP3qQxmW9fDcaXigpOogRQ+Rmb
/611oM3OUrBtNWaeqM1cgZJEFSWs+osl2A658GyQiyNrmSGxWCf1S3wlbRyiD9yoQcCTjBnZLUYd
DQxflo7pGR1VKFGVyjnRlHfJj+hXxiO92LGEX8Yyd2PqDpG7+5eBTEnjb1/MBH84AJBn22e8xtNI
5J2RSozfNsoM7gjDIM3ew1cePd1+5iKeNFX3SEAw6ICUk40KmWwTDPAekUa+SOPXQEtuVnRp3Ocz
gPFAC6uNgqDZMYVoOBh43yiUyxf/TPbA7VaSEWMLmWoLB+uQuOn+t0l3aAZNYm52piFHFnrz1GV/
Z1fFA9nVwLRUDNDMaohiio0WyW9fQxPAPFfjqgtDtEOZ1xhc1Nvw3ZcjGvYhC3ndiwalcxqPvV4b
WP3v3zwIB4I4jbsJ8T7dq6NCpQ2dYy2nzCAkSMeQEO9pXdHvDPXWtdPFvvGxPOAPcToNyR+Gap7W
HUhPD92pz6QguUpXpIH649O1jBBtda6ns6t4H9tuxfNddbJXDvp60prxZnfm2A11nz79ITEiTVFI
jfYicMzEPG7S8Ynt/RARGPXr1BJFem5v1D3if6X85sEjifY5EC3Vcyuv1ypJBLd7xb0JEF5y/c5z
KRB1lGrU1e0BM4HD4jvlJhmjv5r82mx2lI3pdqdbqv6OUB6d5BumBfvmfdhwQifouUa0bcvE3Cq2
fRpcTaMoxYjLV4Lw+dXx6xOTJxpJRe7D4sjsgE0nnqKx651p5LiSWhTbBTtPNDF4+95FdvYplaYk
L3QgxlkJMT+nWPL0vPW/Yhy16MzHV9Z5Q/GSVl/ASDkVquewuOm924XHUKd15IzlgKaxSwC3oall
z74KTxGNysXm09nkrJWBTBihZ30TV3iYxJ6vsxV7yMLtcjAfILf/BoLpvFc5yC3IlKS5yG4Jd1J6
4j/8spTjws46S+DVIJH/SZiIKBNVoLwOFtI6lI4pc3IWNCevD5FqRiC882zKROUs0DHDoFg5LM0F
XP+sHbwX9USIEZ/qadZSbw3yJRJC+6WrhRTX1t3QhrlJ26NoARLOFl8i0ym/IXz4IaA/AB9DG0zW
RiFB711RE1m7t4qfsmrjxDD2VvMxSjoGiapndpne2E53hQoJ2Ae39J8Pb5snrFw+cSAr81Vi0a8X
U3+kBUuVvEV9cXfZZmbkuuSL5rL4FvBxTuAaferzwQk1pZAjpPd3I77yOwLlKP4M0/2yXJFi5YOI
fq57K92hjwxhJJH3jXEQngaK0zgefbjqyA6EVz2ojGi4k9C2urlTeB+1l8ME7wG2tHWakiUKjvCA
xADynas47vJmLdRmbCN6T5rboImKCK+DH0QeOk9m3h/MhX/Ag9/wph9BBv830iJuDh8h5hg6PgPO
njgLm3Fw08qWRxxRC8tdiYgAeeJBhGPEVIEyI6qyGfLChNW2uCt/bC+7+BdWuf7AisEJT2Wakqco
MGo93PNMlNcc8JTb6mLL/VqcdpUPPOqL2oL+j/tYqw==
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
knUI8MP47v7QDJ8NX7U14tfhnDJYwNpnrjsCsJ4ro3GiNPidzv7y+Tuw6XTX26HpWF2SHBGmdJ/c
5cICqQ1iqY0VhsvaT/YlttceXa//TXDkp0bbAqgrbGghG9ExKLYJO1Sa47s+nHaH9ZlBlQy1dibc
VvZdd/Wl+anbqIfrmh2fPMxi1DPPZQws4fu7m6b0fZ+qli5SxwE29ktTvlo/jyENsDJWLlpP3hYi
isPA8f5OUQNnfs+tH9OF5qH4fXycN7LXs2e5R35EY48RWQ5LXPi4PoNpOL2MvIuRVBpOi2hRKi/H
Qkaaf0YiwglHbgti9h0ijavvkueFU4ICdBPBCA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
ArlJfW4XFcpaoTDLgUB+fpSZh0gCzK6lhkYoch0tA2iWweGKDKFSzmXa2d69+TkD9/F+gCb6m3rE
NtaNgKQjvrVdz2BQ9qwiwXruwLgJzv2s/78JrmesHZ2Biu1jR++s2y3nkVoto6pWbA+G1FJEQjjP
X9PT+oCB7eWhiT23Dkmf4REN3eZDjUP226cnrRC5Y43YyhsT0+5QTnp7UOzzeTkl9gCtffjf4jaA
mFlG5yt60G3L7p4DRkg6+jMpZJMP53YdFVVBhnX5YxVu01WyxPe2vuTYxUsK6zekoiVgyiaBLC8Z
HMXpU42eUwm8joXhvHCevM2J+24eIgBBTnmXfw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 688)
`pragma protect data_block
MPYGGFRGttvauVgw78h6Q9tPyKbfpFYURShdGV9ySb26Bs4sUODPtL5OyP4jkRtaIUzEU3hZsABK
khJDcmU2zdCTKPqt2/JLqiuyVmPJbCKFUy6UdHrUN870UVLZRQ4/SaOYdQPSdMwZVSiM2rW4wjXo
xyTb2MrHTvek9KOw47tBowMw/zqE4tqenljniWNbdK8h2z8ZE07VYuT3AOU6RKZf9sSGY0C8ijze
3lC38EjrpR6Txp7EOkGlx3ocn1dgzgV4MmhmnXFhDl76ppl91xsWDVAkRMEJLLcR1kkgjU8Byxv2
uOSO1tqaTEImrmlY4XtmfmXxKR+ZdEmK2eFEUr+CYw4kmN2nxjFbrcqV8ON3qgUTcXP73CQ4WyMO
+iAZFc5zsuKRaDpsQnaQAPEYjojzq8+kAtjDhyhHtC4L1kpYp0Ul7aT9ygb2sujVBWLfekaT0CVh
EZHlhl3W4b+WWGG2vWyXhBLdtC6X3TiABX30c2cAp9dxHNO7iAhJsLOtHkfUzKBDLLMf1+OUsiYR
JQEfrwlyArLMLvf0qVHhsiVtnaDcpfBHDsct/FbgRWn4UYePxK2slrHUqDNk803YdfG7Qg7yJSpp
5RZO7FG3gOquOtnGyueY293lOSlScoip/BIu0+V4zM11gb26o1J45vnsq4CE6QDuBJNvMfE4IpSo
Dh5clrU7OeKURwcZuXsyKNRob/2Kp+ysAVS7860S0OdVe2bbLz7wHkt+y9L2AGzpTtuUdJMgJMFf
m5upayTBt2yXF9m8orEmTU1P0nitPzANZ2ix/0RcKC8T8vo8uzPnIV9icHxzfpLiqUmarATgXoIP
dOXkKOETnlScPt50dIzUNB2UkZ7T0+JoLUIttcAWPpoZ400SPSVDUDqIXEY2z4vbEvp5iMXVnzoY
vX5quQ==
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
knUI8MP47v7QDJ8NX7U14tfhnDJYwNpnrjsCsJ4ro3GiNPidzv7y+Tuw6XTX26HpWF2SHBGmdJ/c
5cICqQ1iqY0VhsvaT/YlttceXa//TXDkp0bbAqgrbGghG9ExKLYJO1Sa47s+nHaH9ZlBlQy1dibc
VvZdd/Wl+anbqIfrmh2fPMxi1DPPZQws4fu7m6b0fZ+qli5SxwE29ktTvlo/jyENsDJWLlpP3hYi
isPA8f5OUQNnfs+tH9OF5qH4fXycN7LXs2e5R35EY48RWQ5LXPi4PoNpOL2MvIuRVBpOi2hRKi/H
Qkaaf0YiwglHbgti9h0ijavvkueFU4ICdBPBCA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
ArlJfW4XFcpaoTDLgUB+fpSZh0gCzK6lhkYoch0tA2iWweGKDKFSzmXa2d69+TkD9/F+gCb6m3rE
NtaNgKQjvrVdz2BQ9qwiwXruwLgJzv2s/78JrmesHZ2Biu1jR++s2y3nkVoto6pWbA+G1FJEQjjP
X9PT+oCB7eWhiT23Dkmf4REN3eZDjUP226cnrRC5Y43YyhsT0+5QTnp7UOzzeTkl9gCtffjf4jaA
mFlG5yt60G3L7p4DRkg6+jMpZJMP53YdFVVBhnX5YxVu01WyxPe2vuTYxUsK6zekoiVgyiaBLC8Z
HMXpU42eUwm8joXhvHCevM2J+24eIgBBTnmXfw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 352)
`pragma protect data_block
MPYGGFRGttvauVgw78h6Q9tPyKbfpFYURShdGV9ySb3yw8Ko6EiP3Im7LLtyvlthFp1rIkWvdiZR
sefdeE6rsvBn+oNBcq6+78iFfhL7XqGyZnrr8qXE+P3iMK8TvV4ltJkeuA3k8ATag7SX6IwXliNW
W4OGYm6GXohVO+QI4KbSTR2k4ZTNZQ4jSEegjuVMXRj/Vdk3WB/IlF+Diog+ECook7mmJJ5dNtLr
HX5ch3C4AUQ1rmQmgcqq4aXN7rBRPPZXyLdqhbpp+cYptVMqDpFlmqIN0f47EwL0HzpZTnMCDoa7
D3EKnGAC1s0yGSnbJXEMpNJFtOxTHIovYBBUBfg3UW05AVzSEqg/EShflC5RGpTgQkKsKwPmMzS1
U0dICpxJW7KB2PXQ/QkAIaHJBT/dZH9aFYiO1NhbRdQH5AUGr8T3SpWbFMEX3D5FhXhw6K9eDdfy
G0tZKh+bVwGbNA==
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
knUI8MP47v7QDJ8NX7U14tfhnDJYwNpnrjsCsJ4ro3GiNPidzv7y+Tuw6XTX26HpWF2SHBGmdJ/c
5cICqQ1iqY0VhsvaT/YlttceXa//TXDkp0bbAqgrbGghG9ExKLYJO1Sa47s+nHaH9ZlBlQy1dibc
VvZdd/Wl+anbqIfrmh2fPMxi1DPPZQws4fu7m6b0fZ+qli5SxwE29ktTvlo/jyENsDJWLlpP3hYi
isPA8f5OUQNnfs+tH9OF5qH4fXycN7LXs2e5R35EY48RWQ5LXPi4PoNpOL2MvIuRVBpOi2hRKi/H
Qkaaf0YiwglHbgti9h0ijavvkueFU4ICdBPBCA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
ArlJfW4XFcpaoTDLgUB+fpSZh0gCzK6lhkYoch0tA2iWweGKDKFSzmXa2d69+TkD9/F+gCb6m3rE
NtaNgKQjvrVdz2BQ9qwiwXruwLgJzv2s/78JrmesHZ2Biu1jR++s2y3nkVoto6pWbA+G1FJEQjjP
X9PT+oCB7eWhiT23Dkmf4REN3eZDjUP226cnrRC5Y43YyhsT0+5QTnp7UOzzeTkl9gCtffjf4jaA
mFlG5yt60G3L7p4DRkg6+jMpZJMP53YdFVVBhnX5YxVu01WyxPe2vuTYxUsK6zekoiVgyiaBLC8Z
HMXpU42eUwm8joXhvHCevM2J+24eIgBBTnmXfw==


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
