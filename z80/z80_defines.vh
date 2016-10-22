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

`define AND_r       8'b10100???

`define INC_r       8'b00???100
`define INC_HL      8'h34
`define INC_IX_d    8'h34
`define INC_IY_d    8'h34

`define CPL         8'h2F
`define CCF         8'h3F
`define SCF         8'h37
`define NOP         8'h00

`define JP_nn       8'hC3
`define JP_cc_nn    8'b11???010
`define JR_e        8'h18
`define JR_C_e      8'h38
`define JR_NC_e     8'h30
`define JR_Z_e      8'h28
`define JR_NZ_e     8'h20

`define CALL_nn		8'hCD

//flags
`define PV_flag   2
`define C_flag    0
`define Z_flag    6
`define H_flag    4
`define S_flag    7
`define N_flag    1

//TODO: SUB MIGHT NEED TO BE SPLIT INTO CPI AND SUB

//ALU commands
`define INCR_A_8  4'h1
`define INCR_B_8  4'h2
`define INCR_A_16 4'h3
`define DECR_A    4'h4
`define ALU_NOP   4'h5
`define ADD       4'h6
`define ADD_SE_B  4'h7
`define ALU_B     4'h8
`define SUB       4'h9
`define ADC       4'ha
`define ALU_CCF   4'hb
`define ALU_CPL   4'hc
`define AND       4'hd
