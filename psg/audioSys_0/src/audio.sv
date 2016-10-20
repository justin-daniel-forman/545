`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2016 02:39:43 PM
// Design Name: 
// Module Name: audio
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


module audioSys(
    input logic [15:0] addr,
    input logic clk,
    input logic reset,
    input logic MREQ_N,
    input logic WR_N,
    input logic [7:0] data,
    inout SDA,
    output logic SCL,
    output logic MCLK,
    output logic BCLK,
    output logic LRCLK,
    output logic SDATA);
    
    logic [2:0] enable,atten_enable;
    logic [3:0] atten_mag;
    logic [9:0] freq;
    
    logic signed [2:0][15:0] waveform,waveform_atten_freq;
    logic [2:0] waveform_valid;
    logic [2:0] acquire;
    logic [2:0] atten_valid_freq;
    logic step;
    
    assign atten_valid = (atten_valid_freq[0]||atten_valid_freq[1]||atten_valid_freq[2]);
    assign waveform_atten = waveform_atten_freq[0] + waveform_atten_freq[1] + waveform_atten_freq[2];
    
    comInterface cpuInterface(.*);
    freqSynth tone[2:0] (freq,reset,clk,waveform,waveform_valid,enable,acquire);
    freqAttenuatorSingle atten[2:0] (waveform,reset,clk,waveform_valid,atten_mag,atten_enable,waveform_atten_freq,atten_valid_freq,step,acquire);
    dacInterface interfaceTest(.waveform(waveform_atten),.waveform_valid(atten_valid),.*);
    
endmodule: audioSys
