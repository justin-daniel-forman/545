`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2016 11:33:44 AM
// Design Name: 
// Module Name: freqSynth
// Project Name: mainProject
// Target Devices: Zedboard
// Tool Versions: 
// Description: tone synthesis for SMS
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module freqSynth(
    input logic [9:0] freq,
    input logic reset,
    input logic clk,
    output logic signed [15:0] waveform,
    output logic waveform_valid,
    input logic enable,
    input logic acquire
    );
    
    logic div_en,div_done;
    logic [15:0] step_size;
    logic [9:0] data;
    
    logic [15:0] step_size_curr;
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset) begin
            div_en <= 0;
            data <= 0;
            step_size_curr <= 0;
        end
        else begin
            if(enable && !div_en) begin
                data <= freq;
                div_en <= 1;
            end
            if(div_done) begin
                div_en <= 0;
                step_size_curr <= step_size;
            end
        end
    end
    
    divider freqCalc(.*);
    waveGen gen(.*);

endmodule: freqSynth

module waveGen(input logic [15:0] step_size_curr, 
    input logic clk, reset, acquire,
    output logic signed [15:0] waveform,
    output logic waveform_valid);

    typedef enum {plus,minus} step_type;
    logic overflow_positive, overflow_negative;
    step_type status;

    assign overflow_negative = ((waveform >= 16'h8000) && (waveform - step_size_curr < 16'h8000));
    assign overflow_positive = ((waveform < 16'h8000) && (waveform + step_size_curr >= 16'h8000));
    assign waveform_valid = acquire;

    always_ff @(posedge clk, posedge reset) begin
        if(reset) begin
            waveform <= 0;
            status <= plus;
        end
        else if(acquire) begin 
            if(status == plus) begin
                if(overflow_positive) begin
                    status <= minus;
                    waveform <= waveform - step_size_curr;
                end
                else
                    waveform <= waveform + step_size_curr;
            end
            else begin
                if(overflow_negative) begin
                    status <= plus;
                    waveform <= waveform + step_size_curr;
                end
                else 
                    waveform <= waveform - step_size_curr;
            end
        end
    end

endmodule: waveGen

module divider(input logic [9:0] data, 
    input logic reset, 
    input logic clk,
    input logic div_en, 
    output logic [15:0] step_size, 
    output logic div_done);

    logic [17:0] dividend;
    logic [17:0] remainder;
    logic [4:0] count;
    logic count_en;
    logic [17:0] remainder_preview;

    counter div_cnt(.*);

    assign dividend = 18'd152727;
    assign div_done = (count == 5'b11111);
    assign count_en = div_en;
    assign remainder_preview = reset ? 0 : (remainder << 1) | ((dividend & (1 << count)) >> count);

    always_ff @(posedge clk, posedge reset) begin
        if(reset) begin
            step_size <= 0;
            remainder <= 0;
        end
        else begin
            if(div_en) begin
                if(data == 0) begin
                    step_size <= 0;
                    remainder <= 0;
                end
                else if(remainder_preview >= data) begin
                    remainder <= remainder_preview - data;
                    step_size <= (step_size << 1) | 1;
                end
                else begin
                    remainder <= remainder_preview;
                    step_size <= step_size << 1;
                end
            end
            else begin
                remainder <= 0;
                step_size <= 0;
            end
        end
    end

endmodule: divider

module counter(input logic clk, 
    input logic count_en,
    input logic reset,
    output logic [4:0] count);
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            count <= 5'd18;
        else if(count_en)
            count <= count - 1;
        else 
            count <= 5'd18;
    end

endmodule: counter