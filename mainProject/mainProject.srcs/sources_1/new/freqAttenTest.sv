`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2016 04:21:34 PM
// Design Name: 
// Module Name: freqAttenTest
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

module freqAttenTest(
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
    logic [15:0] waveform,waveform_atten;
    logic waveform_valid,atten_valid;
    logic enable,step,acquire;
    logic byteAck,byteDone;
    logic [1:0] byteCount;
    logic [3:0] atten_mag;
    logic atten_enable;
    
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
    assign freq = 10'hfe;
    assign enable = BTNL;
    assign atten_mag = {SW7,SW6,SW5,SW4};
    assign atten_enable = enable;
    
    freqSynth tone(.*);
    freqAttenuator atten(.*);
    dacInterface adau(.*);
    ila_0 analyzer(clk,waveform,freq,byteDone,SCL,SDATA,BCLK,LRCLK,BTNR,AC_SDA,BTNL,byteCount);
    
    
endmodule: freqAttenTest