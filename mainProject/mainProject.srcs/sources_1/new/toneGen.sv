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
    logic [2:0][9:0] freq;
    logic signed [2:0][15:0] waveform;
    logic [2:0] waveform_valid;
    logic enable,step;
    logic byteAck,byteDone;
    logic [1:0] byteCount;
    
    logic [2:0] atten_enable;
    logic [2:0] atten_valid_freq;
    logic signed [2:0][15:0] waveform_atten_freq;
    logic signed [15:0] waveform_atten;
    logic atten_valid;
    logic [2:0][3:0] atten_mag;
    logic [2:0] acquire;
    
    
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
    assign freq = {10'hef,10'hfe,10'h1fe};
    assign enable = BTNL;
    assign atten_enable = {enable,enable,enable};
    assign atten_mag = {4'h0,{SW7,SW6,SW5,SW4},{SW3,SW2,SW1,SW0}};
    assign atten_valid = (atten_valid_freq[0]||atten_valid_freq[1]||atten_valid_freq[2]);
    assign waveform_atten = waveform_atten_freq[0] + waveform_atten_freq[1] + waveform_atten_freq[2];
    
    freqSynth tone[2:0] (freq,reset,clk,waveform,waveform_valid,enable,acquire);
    freqAttenuatorSingle atten[2:0] (waveform,reset,clk,waveform_valid,atten_mag,atten_enable,waveform_atten_freq,atten_valid_freq,step,acquire);
    dacInterface interfaceTest(.waveform(waveform_atten),.waveform_valid(atten_valid),.*);
    ila_0 analyzer(clk,waveform_atten,freq,byteDone,SCL,SDATA,BCLK,LRCLK,BTNR,AC_SDA,BTNL,byteCount);
    
    
endmodule: toneGen
