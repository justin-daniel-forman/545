`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2016 02:50:15 PM
// Design Name: 
// Module Name: toneGen
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


module toneGen(
    output AC_ADR0,
    output AC_ADR1,
    output AC_MCLK,
    output AC_SCK,
    inout AC_SDA,
    output AC_GPIO0,
    output AC_GPIO2,
    output AC_GPIO3,
    input GCLK,
    input BTNR,
    input BTNL,
    input SW0,SW1,SW2,SW3,SW4,SW5,SW6,SW7);
    
    wire SDA;   
    logic SCL,MCLK,BCLK,LRCLK,SDATA,clk,reset;
    logic [9:0] freq;
    logic [15:0] waveform;
    logic waveform_valid;
    logic enable,step;
    logic byteAck,byteDone;
    logic [1:0] byteCount;
    
    assign AC_ADR0 = 1;
    assign AC_ADR1 = 1;
    assign AC_MCLK = MCLK;
    assign AC_SCK = SCL;
    assign AC_SDA = byteDone ? 1'bz : SDA;
    assign AC_GPIO0 = SDATA;
    assign AC_GPIO2 = BCLK;
    assign AC_GPIO3 = LRCLK;
    assign clk = GCLK;
    assign reset = BTNR;
    assign freq = {1'b0,1'b0,SW7,SW6,SW5,SW4,SW3,SW2,SW1,SW0};
    assign enable = BTNL;
    
    freqSynth tone(.*);
    dacInterface adau(.*);
    ila_0 analyzer(clk,waveform,freq,byteDone,SCL,SDATA,BCLK,LRCLK,BTNR,AC_SDA,BTNL,byteCount);
    
    
endmodule: toneGen
