`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2016 03:16:27 PM
// Design Name: 
// Module Name: audio_top
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


module audio_top(
    input [7:0] data_out,
    input [15:0] addr_bus,
    input logic IORQ_L,
    input logic WR_L,
    inout logic SDA,
    output logic SCL,
    output logic MCLK,
    output logic BCLK,
    output logic LRCLK,
    output logic SDATA,
    input logic clk_100,
    input logic reset,
    output logic [9:0] freq,
    output logic [3:0] atten_mag,
    output logic [2:0] atten_enable,enable
);
    
    audioSys_0 toneGenerator(.data(data_out),.addr(addr_bus),.clk(clk_100),.reset(reset),.WR_N(WR_L),.MREQ_N(IORQ_L),.*);
    
endmodule
