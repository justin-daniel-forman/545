// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Tue Oct 18 17:24:16 2016
// Host        : mittlefrueh.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
// Command     : write_verilog -force -mode funcsim
//               /afs/ece.cmu.edu/usr/suyashb/Private/545/mainProject/mainProject.srcs/sources_1/ip/mult_gen_0/mult_gen_0_funcsim.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0,{}" *) (* core_generation_info = "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "mult_gen_v12_0,Vivado 2015.2" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (CLK,
    A,
    B,
    CE,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [5:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [15:0]P;

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
  mult_gen_0_mult_gen_v12_0 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0
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
  mult_gen_0_mult_gen_v12_0_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
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
JZ5tsiMCLZkMXGbY9p+w73Gl2FYEkaO/tI8S4FP1q6tcCHgywOmgjo8SOTSXosm4rUyurYB8e9ty
Utj6weFaxSftJwIu0yCHmc1S7xbyu9XFZagGbknSwMg9GrvJAocl1G3NQTD1F46qhhiYTuGHntty
FNQLZZXNZUdMNjmOgy+oqSHq4X1fdrl8j/NigqHDvO9bvKIGnrOb65eHukJijX+SahbBZLp6Iuda
/bRfsNTu2RrvFr0V0JTxpk7S8es8wwYozFVAUQbG91EEV5n25bp2yFXMZNFe7I1YCz6nuaHJJJzk
Qkw5ph3rYnmZ7Kl52O0wtDdMdIK+jxrjLTbpeA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
vMgbyew99L+liq4ypK6tHqkDXuJIyHSGIZq+VzHDdquZ8XpMTCIx9NipfoPgwnrrvZGdpJXNl+h/
W0qIWlRB1fKdtXAzsH1dms+MiQxBVLAItx2bNIkM4wpTkcWfjEa9Gqz53WcRunacNQfew1BFMBCG
vQm50RoLPWHqB8EC+sAO8bt+LHa9tj+vVrBXsRh1KT9MQhkGfFk3SJ0TUxNXlULR9VWRf0wvAby0
TrTLhRFb/9Snt45enHUs5Mi2Yvcs+1gO1CEG+yvtVaPP9PcjUA820+X52Ti6nlMKogpasKCP4Uk+
ZZuZNoXKOeMqL6kzoDqwLXYii8UEygG3AqsHAw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7280)
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
