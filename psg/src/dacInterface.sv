`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2016 03:41:26 PM
// Design Name: 
// Module Name: dacInterface
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


module dacInterface(input logic [15:0] waveform, 
    input logic clk,
    input logic reset,
    input logic waveform_valid, 
    output logic step, 
    output logic SCL, 
    inout SDA,
    output logic MCLK, 
    output logic BCLK,
    output logic LRCLK, 
    output logic SDATA);
    
    typedef enum {locking,init,transmit} state;
    state cs,ns;
    
    logic [15:0] address;
    logic [7:0] data;
    logic writeDone,dataValid;
    logic [4:0] count;
    logic [31:0] initialization;
    
    logic serialDone;
    logic sent;
    logic locked;
    
    I2C control(.*);
    serialInterface dacVal(.*);
    clk_wiz_0 serialClocks(.clk_main(clk),
        .clk_out1(MCLK),.reset(reset),
        .locked(locked));
    BCLKGen serialBCLock(.*);
    
    //FSM
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            cs <= locking;
        else 
            cs <= ns;
    end
    
    //Initialization FSM
    always_ff @(posedge clk, posedge reset) begin
        if(reset) begin
            count <= 0;
            sent <= 0;
            initialization <= 0;
        end
        else if(cs == init) begin
            initialization <= 0;
            if(writeDone && !sent) begin 
                count <= count + 1;
                sent <= 1;
            end
            else if(!writeDone) 
                sent <= 0;
        end
        else begin
            count <= 0;
            sent <= 0;
            if(cs == locking)
                initialization <= initialization + 1;
            else
                initialization <= 0;
        end
    end
    
    //Next State Logic
    always_comb begin
        case(cs) 
            locking: ns = (locked && (initialization > 32'h1E8480)) ? init : locking;
            init: ns = (count > 25) ? transmit : init;
            transmit: ns = transmit;
            default: ns = init;
        endcase
    end
    
    //State Output Logic
    always_comb begin
        case(cs)
            locking : begin
                step = 0;
                dataValid = 0;
                address = 0;
                data = 0;
            end
            init: begin
                step = 0;
                case(count)
                    0: begin
                        dataValid = 1;
                        address = 16'h4000;
                        data = 8'h01;
                    end
                    1: begin
                        dataValid = 1;
                        address = 16'h40f2;
                        data = 8'h1;
                    end
                    2: begin
                        dataValid = 1;
                        address = 16'h40f5;
                        data = 8'h01;
                    end
                    3: begin
                        dataValid = 1;
                        address = 16'h40eb;
                        data = 8'hf;
                    end
                    4: begin 
                        dataValid = 1;
                        address = 16'h40f6;
                        data = 8'h0;
                    end
                    5: begin
                        dataValid = 1;
                        address = 16'h402a;
                        data = 8'h3; //c3
                    end
                    6: begin
                        dataValid = 1;
                        address = 16'h40f8;
                        data = 8'h6;
                    end
                    7: begin
                        dataValid = 1;
                        address = 16'h40f6;
                        data = 8'h1;
                    end
                    8: begin
                        dataValid = 1;
                        address = 16'h40eb;
                        data = 8'h0;
                    end
                    9: begin
                        dataValid = 1;
                        address = 16'h4017;
                        data = 8'h6;
                    end
                    10: begin
                        dataValid = 1;
                        address = 16'h401c;
                        data = 8'h21;
                    end
                    11: begin
                        dataValid = 1;
                        address = 16'h401e;
                        data = 8'h41;
                    end
                    12: begin
                        dataValid = 1;
                        address = 16'h4022;
                        data = 8'h1;//3
                    end
                    13: begin
                        dataValid = 1;
                        address = 16'h4027;
                        data = 8'h3;//e6
                    end
                    14: begin
                        dataValid = 1;
                        address = 16'h4012;
                        data = 1;
                    end
                    15: begin
                        dataValid = 1;
                        address = 16'h4016;
                        data = 8'b00000001;
                    end
                    16: begin
                        dataValid = 1;
                        address = 16'h4015;
                        data = 8'h8;
                    end
                    17: begin
                        dataValid = 1;
                        address = 16'h4023;
                        data = 8'he7;
                    end
                    18: begin
                        dataValid = 1;
                        address = 16'h4024;
                        data = 8'he7;
                    end
                    19: begin
                        dataValid = 1;
                        address = 16'h4025;
                        data = 8'he7;
                    end
                    20: begin
                        dataValid = 1;
                        address = 16'h4026;
                        data = 8'he7;
                    end
                    21: begin
                        dataValid = 1;
                        address = 16'h4029;
                        data = 8'h3;
                    end
                    22: begin
                        dataValid = 1;
                        address = 16'h402a;
                        data = 8'h3;
                    end
                    23: begin
                        dataValid = 1;
                        address = 16'h40f2;
                        data = 8'h1;
                    end
                    24: begin
                        dataValid = 1;
                        address = 16'h40f9;
                        data = 8'h7f;
                    end
                    25: begin
                        dataValid = 1;
                        address = 16'h40fa;
                        data = 8'h1;
                    end
                    default: begin
                        dataValid = 0;
                        address = 0;
                        data = 0;
                    end
                endcase
            end
            transmit: begin
                address = 0;
                data = 0;
                dataValid = 0;
                step = serialDone;
            end
            default: begin
                address = 0;
                data = 0;
                dataValid = 0;
                step = 0;
            end
        endcase
    end
            
    
endmodule: dacInterface

module counterSCL(input logic reset,
    input logic clk,
    input logic enable, 
    output logic [7:0] count);
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            count <= 0;
        else if(enable) begin
            if (count >= 249) 
                count <= 0;
            else
                count <= count + 1;
        end
        else
            count <= 0;
    end

endmodule: counterSCL

module I2C(
    input logic clk, 
    input logic reset,
    input logic [15:0] address,
    input logic [7:0] data,
    input logic dataValid, 
    output logic writeDone,
    output logic SCL,
    inout SDA);
    
    typedef enum {start,I2CData,stop} state;
    state cs,ns;
    
    logic [3:0][7:0] outData;
    logic [3:0] bitCount;
    logic [1:0] byteCount;
    logic [7:0] count;
    logic enable;
    logic serialValue;
    logic byteDone;
    logic byteAck;
        
    counterSCL SCLCount(.*);
    
    assign SDA = serialValue;
    assign byteDone = (bitCount >= 8); 
    assign lastByte = (byteDone && (byteCount == 3) && byteAck);
    assign outData[0] = 8'h76;
    assign outData[1] = address[15:8];
    assign outData[2] = address[7:0];
    assign outData[3] = data;
    
    always_ff @(posedge clk, posedge reset) begin
       if(reset)
           cs <= start;
       else 
           cs <= ns;
    end
    
    always_comb begin
        case(cs)
        start: begin
            writeDone = !dataValid;
            ns = (dataValid && (count == 229)) ? I2CData : start;
            serialValue = !dataValid;
            SCL = (count < 100);
            enable = dataValid;
        end
        I2CData: begin
            writeDone = 0;
            enable = 1;
            ns = ((count == 99) && lastByte) ? stop : I2CData;
            serialValue = !byteDone ? outData[byteCount][bitCount] : 1'bz;
            SCL = (count < 100);
        end
        stop: begin
            writeDone = (count >= 249);
            ns = (count >= 249) ? start : stop;
            SCL = 1;
            serialValue = (count >= 100);
            enable = 1;
        end
        default: begin
            ns = start;
            writeDone = 0;
            SCL = 1;
            enable = 0;
            serialValue = 1;
            end
        endcase
    end
   
    always_ff @(posedge clk, posedge reset) begin
        if(reset) begin
            byteCount <= 0;
            bitCount <= 7;
            byteAck <= 0;
        end
        else if(cs == I2CData) begin
            if(!count && byteDone && !SDA) begin
                byteAck <= 1;
            end
            if(count == 229) begin
                if(byteAck) begin
                    byteCount <= byteCount + 1;
                    bitCount <= 7;
                    byteAck <= 0;
                end
                else begin
                    bitCount <= bitCount - 1;
                end
            end
        end
        else begin
            byteAck <= 0;
            bitCount <= 7;
            byteCount <= 0;
        end
    end
	
endmodule: I2C

module BCLKGen(
    input logic reset,
    input logic MCLK,
    input logic locked, 
    output logic BCLK);
    
    always_ff @(posedge MCLK,posedge reset) begin
        if(reset) 
            BCLK <= 1;
        else if(locked)
            BCLK <= ~BCLK;
    end
    
endmodule: BCLKGen

module serialInterface(
    input logic BCLK,
    input logic reset, 
    input logic [15:0] waveform,
    input logic waveform_valid,
    output logic serialDone,
    output logic LRCLK, 
    output logic SDATA);
    
    logic [5:0] count;
    logic [3:0] bitCount;
    
    assign SDATA = (count < 16 || (count >= 32 && count < 48)) ? waveform[bitCount] : 0;
    assign serialDone = (count == 63);
    assign LRCLK = (count < 32);
    
    always_ff @(negedge BCLK, posedge reset) begin
        if(reset) begin
            count <= 63;
            bitCount <= 15;
        end
        else if(waveform_valid) begin
            if(serialDone || (count == 31))
                bitCount <= 15;
            else if(count < 16 || (count >= 32 && count < 48))
                bitCount <= bitCount - 1;
            count <= count + 1; 
        end
        else begin
           bitCount <= 15;
           count <= 63;
       end
    end
    
endmodule: serialInterface