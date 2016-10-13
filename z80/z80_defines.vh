`define NOP 8'h00
`define INC 8'b00???100

`define EXT_INST    8'hED
`define LDI         8'hA0
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
`define LD_SP_IX    8'hF9
`define LD_SP_HL    8'hF9

`define EX_DE_HL  8'hEB
`define EXX       8'hD9

//ALU commands
`define INCR_A    4'h1
`define DECR_A    4'h2
`define ALU_NOP   4'h3
`define ADD       4'h4
`define ADD_SE_B  4'h5
`define ALU_B     4'h6
