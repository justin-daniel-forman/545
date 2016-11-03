`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2016 05:58:21 PM
// Design Name: 
// Module Name: z80_project
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
    input  wire [7:0] data_in,
    output wire [7:0] data_out,
    inout  wire [15:0] addr_bus,
    output  wire M1_L,
    input  wire clk_4,
    input  wire rst_L,
    input  wire INT_L,
    input  wire NMI_L,
    input  wire WAIT_L,
    output wire MREQ_L,
    output wire IORQ_L,
    output wire RD_L,
    output wire WR_L,
    output wire RFSH_L,
    output wire BUSACK_L,
    input  wire BUSREQ_L,
    output wire HALT_L
 );
       
  z80_0 processor(.clk(clk_4),.*);
    
endmodule: z80_block