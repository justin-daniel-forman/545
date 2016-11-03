`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2016 02:32:29 PM
// Design Name: 
// Module Name: freqAttenuator
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

module freqAttenuatorSingle(
    input logic signed [15:0] waveform,
    input logic reset,
    input logic clk,
    input logic waveform_valid,
    input logic [3:0] atten_mag,
    input logic atten_enable,
    output logic signed [15:0] waveform_atten_freq,
    output logic atten_valid_freq,
    input logic step,
    output logic acquire);
    
    logic signed [15:0] waveform_base,product,shifted_val;
    logic [3:0] atten_mag_stored;
    logic [5:0] multVal;
    logic [1:0] shift;
    logic mult_clk_en;
    logic [1:0] count;
    logic count_en;
    logic sent;
    logic new_request; 
    
    typedef enum {new_val,mult,io_wait} state;
    state cs,ns; 
    
    baseReg waveformStorage(.*);
    multLookup lookup(.*);
    mult_gen_0 waveMult(.CLK(clk),.A(waveform_base),.B(multVal),.CE(mult_clk_en),.P(product));
    shifter shifty_mc_shiftface(.*);
    
    assign new_request = step && !sent;
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            cs <= new_val;
        else
            cs <= ns;
    end
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            count <= 0;
        else if(count_en)
            count <= count + 1;
        else
            count <= 0;
    end
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset) begin
            waveform_atten_freq <= 0;
            atten_valid_freq <= 0;
            sent <= 0;
        end
        else if(new_request) begin
            waveform_atten_freq <= shifted_val;
            atten_valid_freq <= 1;
            sent <= 1;
        end
        else if(!step)
            sent <= 0;
    end
    
    always_comb begin
        mult_clk_en = 0;
        acquire = 0;
        count_en = 0;
        ns = new_val;
        case(cs) 
            new_val: begin
                acquire = 1;
                ns = mult;
            end
            mult: begin
                count_en = (count != 3);
                ns = ((count == 3) && !new_request) ? io_wait : mult;
                mult_clk_en = (count != 3);
                acquire = (count == 3) && (new_request);
            end
            io_wait: begin
                acquire = new_request;
                ns = new_request ? mult : io_wait;
            end
        endcase
    end
    
endmodule: freqAttenuatorSingle

module baseReg(
    input logic signed [15:0] waveform,
    input logic [3:0] atten_mag,
    input logic atten_enable,
    output logic signed [15:0] waveform_base,
    output logic [3:0] atten_mag_stored,
    input logic clk,
    input logic reset,
    input logic waveform_valid);
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset) begin
            waveform_base <= 0;
            atten_mag_stored <= 4'hf;
        end
        else begin
            if(waveform_valid) 
                waveform_base <= waveform >>> 7;
            if(atten_enable)
                atten_mag_stored <= atten_mag;
        end
    end
    
endmodule: baseReg

module multLookup(
    input logic [3:0] atten_mag_stored,
    output logic [5:0] multVal,
    output logic [1:0] shift);
    
    always_comb begin
        multVal = 1;
        shift = 0;
        case(atten_mag_stored)
            0: multVal = 32;
            1: multVal = 25;
            2: multVal = 20;
            3: multVal = 16;
            4: begin
                multVal = 25;
                shift = 1;
            end
            5: multVal = 10;
            6: multVal = 8;
            7: multVal = 6;
            8: multVal = 5;
            9: multVal = 4;
            10: multVal = 3;
            11: begin
                shift = 1;
                multVal = 5;
            end
            12: multVal = 2;
            13: begin
                multVal = 3;
                shift = 1;
            end
            14: begin
                multVal = 5;
                shift = 2;
            end
            15: multVal = 1;
            default: begin
                multVal = 1;
                shift = 0;
            end
        endcase
    end

endmodule: multLookup

module shifter(
    input logic [1:0] shift,
    input logic signed [15:0] product,
    output logic signed [15:0] shifted_val);
    
    assign shifted_val = product >>> shift;
    
endmodule: shifter