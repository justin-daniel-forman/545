`define NOP 8'h00
`define INC 8'b00???100

`define EXT_INST 8'hED
`define LDI      8'hA0
`define LD_HL_nn 8'h2A
`define LD_r_r   8'b01??????
`define LD_r_n   8'b00???110

//ALU commands
`define INCR_A  4'b0001
`define DECR_A  4'b0010
`define ALU_NOP 4'b0000
