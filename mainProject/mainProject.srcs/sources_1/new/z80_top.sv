`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2016 05:09:57 PM
// Design Name: 
// Module Name: z80_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module z80_block(
    inout wire [7:0] data_bus,
    inout wire [15:0] addr_bus,
    input M1_L,
    input clk_4,
    input rst_L,
    input INT_L,
    input NMI_L,
    input WAIT_L,
    output MREQ_L,
    output IORQ_L,
    output RD_L,
    output WR_L,
    output RFSH_L,
    output BUSACK_L,
    input BUSREQ_L,
    output HALT_L
    );
    
    z80_0 processor(.clk(clk_4),.data_bus(data_bus),.*);
    
endmodule
