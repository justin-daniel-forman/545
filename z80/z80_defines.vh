`define EXT_INST    8'hED
`define LD_HL_nn    8'h2A
`define LD_r_r      8'b01??????
`define LD_r_n      8'b00???110
`define LD_r_HL     8'b01???110 //this can match LD_r_r as well
`define IX_INST     8'hDD
`define LD_r_IX_d   8'b01???110 //this is state dependent
`define IY_INST     8'hFD
`define LD_r_IY_d   8'b01???110 //this is state dependent
`define LD_HL_r     8'b01110???
`define LD_IX_d_r   8'b01110???
`define LD_IY_d_r   8'b01110???
`define LD_HL_n     8'h36
`define LD_IX_d_n   8'h36
`define LD_IY_d_n   8'h36
`define LD_A_BC     8'h0A
`define LD_A_DE     8'h1A
`define LD_A_nn     8'h3A
`define LD_BC_A     8'h02
`define LD_DE_A     8'h12
`define LD_nn_A     8'h32
`define LD_dd_nn    8'b00??0001
`define LD_IX_nn    8'h21
`define LD_IY_nn    8'h21
`define LD_dd_nn_x  8'b01??1011
`define LD_IX_nn_x  8'h2A
`define LD_IY_nn_x  8'h2A
`define LD_nn_x_HL  8'h22
`define LD_nn_x_dd  8'b01??0011
`define LD_nn_x_IX  8'h22
`define LD_nn_x_IY  8'h22
`define LD_SP_IX    8'hF9
`define LD_SP_IY    8'hF9
`define LD_SP_HL    8'hF9
`define PUSH_qq     8'b11??0101
`define PUSH_IX     8'hE5
`define PUSH_IY     8'hE5
`define POP_qq      8'b11??0001
`define POP_IX      8'hE1
`define POP_IY      8'hE1

`define EX_DE_HL  8'hEB
`define EX_AF_AF  8'h08
`define EXX       8'hD9
`define EX_SP_HL  8'hE3
`define EX_SP_IX  8'hE3
`define EX_SP_IY  8'hE3
`define LDI       8'hA0
`define LDIR      8'hB0
`define LDD       8'hA8
`define LDDR      8'hB8
`define CPI       8'hA1
`define CPIR      8'hB1
`define CPD       8'hA9
`define CPDR      8'hB9

`define ADD_A_r     8'b10000???
`define ADD_A_n     8'hC6
`define ADD_A_HL    8'h86
`define ADD_A_IX_d  8'h86
`define ADD_A_IY_d  8'h86
`define ADC_A_r     8'b10001???
`define ADC_A_n     8'hCE
`define ADC_A_HL    8'h8E
`define ADC_A_IX_d  8'h8E
`define ADC_A_IY_d  8'h8E
`define SUB_r       8'b10010???
`define SUB_n       8'hD6
`define SUB_HL      8'h96
`define SUB_IX_d    8'h96
`define SUB_IY_d    8'h96
`define SBC_r       8'b10011???
`define SBC_n       8'hDE
`define SBC_HL      8'h9E
`define SBC_IX_d    8'h9E
`define SBC_IY_d    8'h9E
`define AND_r       8'b10100???
`define AND_n       8'hE6
`define AND_HL      8'hA6
`define AND_IX_d    8'hA6
`define AND_IY_d    8'hA6
`define OR_r        8'b10110???
`define OR_n        8'hF6
`define OR_HL       8'hB6
`define OR_IX_d     8'hB6
`define OR_IY_d     8'hB6
`define XOR_r       8'b10101???
`define XOR_n       8'hEE
`define XOR_HL      8'hAE
`define XOR_IX_d    8'hAE
`define XOR_IY_d    8'hAE
`define CP_r        8'b10111???
`define CP_n        8'hFE
`define CP_HL       8'hBE
`define CP_IX_d     8'hBE
`define CP_IY_d     8'hBE
`define INC_r       8'b00???100
`define INC_HL      8'h34
`define INC_IX_d    8'h34
`define INC_IY_d    8'h34
`define DEC_r       8'b00???101
`define DEC_HL      8'h35
`define DEC_IX_d    8'h35
`define DEC_IY_d    8'h35

`define CPL         8'h2F
`define CCF         8'h3F
`define SCF         8'h37
`define NOP         8'h00

`define BIT_b		8'hCB

`define JP_nn       8'hC3
`define JP_cc_nn    8'b11???010
`define JR_e        8'h18
`define JR_C_e      8'h38
`define JR_NC_e     8'h30
`define JR_Z_e      8'h28
`define JR_NZ_e     8'h20

`define CALL_nn		8'hCD
`define CALL_cc_nn  8'b11???100
`define RET			8'hC9
`define RET_cc		8'b11???000
`define RST_p		8'b11???111

`define IN_A_n      8'hDB
`define IN_r_C      8'b01???000
`define INI         8'hA2
`define INIR        8'hB2
`define IND         8'hAA
`define INDR        8'hBA
`define OUT_n_A     8'hD3
`define OUT_C_r     8'b01???001
`define OUTI        8'hA3
`define OTIR        8'hB3
`define OUTD        8'hAB
`define OTDR        8'hBB

//flags
`define PV_flag   2
`define C_flag    0
`define Z_flag    6
`define H_flag    4
`define S_flag    7
`define N_flag    1

//TODO: SUB MIGHT NEED TO BE SPLIT INTO CPI AND SUB

//ALU commands
`define INCR_A_8  6'h1
`define INCR_B_8  6'h2
`define INCR_A_16 6'h3
`define DECR_A_16 6'h4
`define ALU_NOP   6'h5
`define ADD       6'h6
`define ADC       6'h7
`define ADD_SE_B  6'h8
`define ALU_B     6'h9
`define SUB       6'ha
`define SBC       6'hb
`define SUB_EX    6'hc
`define ALU_CCF   6'hd
`define ALU_CPL   6'he
`define AND       6'hf

//TODO: Update all of these as necessary
`define OR        6'h18
`define XOR       6'h19
`define ALU_RST   6'h1a
`define DECR_BC   6'h1b
`define DECR_B_8  6'h1c
`define DECR_A_8  6'h1d


//DO NOT CHANGE WHAT'S BELOW UNLESS YOU'RE
//EXTENDING THE LENGTH OF THE BITCODES
`define BIT_TEST_0  6'h10
`define BIT_TEST_1  6'h11
`define BIT_TEST_2  6'h12
`define BIT_TEST_3  6'h13
`define BIT_TEST_4  6'h14
`define BIT_TEST_5  6'h15
`define BIT_TEST_6  6'h16
`define BIT_TEST_7  6'h17

`define BIT_RES_0	6'h20
`define BIT_RES_1	6'h21
`define BIT_RES_2	6'h22
`define BIT_RES_3 	6'h23
`define BIT_RES_4 	6'h24
`define BIT_RES_5 	6'h25
`define BIT_RES_6 	6'h26
`define BIT_RES_7 	6'h27

`define BIT_SET_0 	6'h30
`define BIT_SET_1 	6'h31
`define BIT_SET_2 	6'h32
`define BIT_SET_3 	6'h33
`define BIT_SET_4 	6'h34
`define BIT_SET_5 	6'h35
`define BIT_SET_6 	6'h36
`define BIT_SET_7 	6'h37
