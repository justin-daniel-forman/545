// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Mon Oct  3 13:43:20 2016
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
IKyMqTlzQwy8h2g+PlIFwHIae/A9O9SSnCmJMNm9/a4+OTIabxF4sj7etcTDhMOdRHI7+tiKvN6h
WuS6pvEaIl/LP+6Lbnf+SatUINxFFIKGs0fTzt4UtBVOKd5f0iXpgAION4qS7gMhQEaqGAJZWmvR
faqpcQ2lOgumHnsRJLFpySuC3zgmIfc/qWv6AJO4TBxZSLNC8XrjQdThc16QZT5dMIEXz2L4NsF9
fRcxhjU1j4qLKQfch0uWVJL7caAizVNAWUDacmPBbSXeefUfRWlWc1WeixYhGKhti4UrqPIu3ekg
uszXQtjzMd3QU8kTxng9OCVclpFgyVly/SLQEQ==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
hXn4eV/DwD38kIsW0kFB+GLL4OgWAiKRjy4yInL8QRvEU5rPYIktHyCNoEH3orVqTdvfVVTHS/I/
oukDfk0XrnfG3SP0oj6XPLg42afkjl5Czm9gM0cMrKpW/HQQaz3MsprqnzhIDSmkgD1immgIdkOE
9LuxIltpBtAynOljmEbmjhRWu5t4XFHEYpiMZziywCNrkzXnAhdqvCiVy+FOTpy4nYn6nlDH/Gcl
HUH+fWigXbT3kY60I6JTfA+n0hhaUiaHvXRgOiS0ZnMsP+8esvWNiGLwmaFcf716eejv4dN/KoeY
DVlp1CDGgGVeYRruiTpXtfIBrgplY3qMeGdZwg==


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
