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

//MODULE BELOW IS FOR TESTING ONLY
module freqAttenuatorSingle(
    input logic [15:0] waveform,
    input logic reset,
    input logic clk,
    input logic waveform_valid,
    input logic [3:0] atten_mag,
    input logic atten_enable,
    output logic [15:0] waveform_atten,
    output logic atten_valid,
    input logic step,
    output logic acquire);
    
    logic [15:0] waveform_base,product,shifted_val;
    logic [3:0] atten_mag_stored;
    logic [5:0] multVal;
    logic [1:0] shift;
    logic mult_clk_en;
    logic [1:0] count;
    logic count_en;
    logic sent;
    
    typedef enum {new_val,mult,io_wait} state;
    state cs,ns; 
    
    baseReg waveformStorage(.*);
    multLookup lookup(.*);
    mult_gen_0 waveMult(.CLK(clk),.A(waveform_base),.B(multVal),.CE(mult_clk_en),.P(product));
    shifter shift_mc_shiftface(.*);
    
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
            waveform_atten <= 0;
            atten_valid <= 0;
            sent <= 0;
        end
        else if(acquire && (cs != new_val) && !sent) begin
            waveform_atten <= shifted_val;
            atten_valid <= 1;
            sent <= 1;
        end
        else if(!step)
            sent <= 0;
    end
    
    always_comb begin
        mult_clk_en = 0;
        acquire = 0;
        count_en = 0;
        case(cs) 
            new_val: begin
                acquire = 1;
                ns = mult;
            end
            mult: begin
                count_en = (count != 3);
                ns = ((count == 3) && !step) ? io_wait : mult;
                mult_clk_en = (count != 3);
                acquire = (count == 3) && step;
            end
            io_wait: begin
                acquire = step;
                ns = step ? mult : io_wait;
            end
        endcase
    end
    
endmodule: freqAttenuatorSingle

module freqAttenuator(
    input logic [2:0][15:0] waveform,
    input logic reset,
    input logic clk,
    input logic [2:0] waveform_valid,
    input logic [2:0][3:0] atten_mag,
    input logic [2:0] atten_enable,
    output logic [15:0] waveform_atten,
    output logic atten_valid,
    input logic step,
    output logic acquire
    );
    
    logic [2:0][15:0] waveform_base,product,shifted_val;
    logic [15:0] add1_result,add2_result;
    logic [2:0][3:0] atten_mag_stored;
    logic [2:0][5:0] multVal;
    logic [2:0][1:0] shift;
    logic mult_clk_en;
    logic [1:0] count;
    logic count_en;
    logic sent;
    
    typedef enum {new_val,mult,io_wait} state;
    state cs,ns; 
    
    baseReg waveformStorage[2:0] (.*);
    multLookup lookup[2:0] (.*);
    mult_gen_0 waveMult [2:0] (.CLK(clk),.A(waveform_base),.B(multVal),.CE(mult_clk_en),.P(product));
    shifter shifty_mc_shiftface [2:0] (.*);
    c_add_0 add1(.A(shifted_val[0]),.B(shifted_val[1]),.S(add1_result));
    c_add_0 add2(.A(add1_result),.B(shifted_val[2]),.S(add2_result));
    
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
            waveform_atten <= 0;
            atten_valid <= 0;
            sent <= 0;
        end
        else if(acquire && (cs != new_val) && !sent) begin
            waveform_atten <= add2_result;
            atten_valid <= 1;
            sent <= 1;
        end
        else if(!step)
            sent <= 0;
    end
    
    always_comb begin
        mult_clk_en = 0;
        acquire = 0;
        count_en = 0;
        case(cs) 
            new_val: begin
                acquire = 1;
                ns = mult;
            end
            mult: begin
                count_en = (count != 3);
                ns = ((count == 3) && !step) ? io_wait : mult;
                mult_clk_en = (count != 3);
                acquire = (count == 3) && step;
            end
            io_wait: begin
                acquire = step;
                ns = step ? mult : io_wait;
            end
        endcase
    end
    
endmodule: freqAttenuator 

module baseReg(
    input logic [15:0] waveform,
    input logic [3:0] atten_mag,
    input logic atten_enable,
    output logic [15:0] waveform_base,
    output logic [3:0] atten_mag_stored,
    input logic clk,
    input logic reset,
    input logic waveform_valid);
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset) begin
            waveform_base <= 0;
            atten_mag_stored <= 0;
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
            0: multVal = 1;
            1: begin
                multVal = 5;
                shift = 2;
            end
            2: begin
                multVal = 3;
                shift = 1;
            end
            3: multVal = 2;
            4: begin
                shift = 1;
                multVal = 5;
            end
            5: multVal = 3;
            6: multVal = 4;
            7: multVal = 5;
            8: multVal = 6;
            9: multVal = 8;
            10: multVal = 10;
            11: begin
                multVal = 25;
                shift = 1;
            end
            12: multVal = 16;
            13: multVal = 20;
            14: multVal = 25;
            15: multVal = 32;
            default: begin
                multVal = 1;
                shift = 0;
            end
        endcase
    end

endmodule: multLookup

module shifter(
    input logic [1:0] shift,
    input logic [15:0] product,
    output logic [15:0] shifted_val);
    
    assign shifted_val = product >>> shift;
    
endmodule: shifter