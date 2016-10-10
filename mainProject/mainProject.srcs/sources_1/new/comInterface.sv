`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2016 03:14:20 PM
// Design Name: 
// Module Name: comInterface
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


module comInterface(
    input logic [15:0] addr,
    input logic clk,
    input logic reset,
    input logic MREQ_N,
    input logic WR_N,
    input logic [7:0] data,
    output logic [2:0] enable,
    output logic [9:0] freq,
    output logic [2:0] atten_enable,
    output logic [3:0] atten_mag
    );
    
    typedef enum {idle,latch,instr} state;
    state cs,ns;
    
    logic second_byte;
    logic activated;
    logic needs_double;
    logic decode_enable;
    logic [7:0] received_byte;
        
    assign activated = (addr == 16'hffff) && !MREQ_N && !WR_N;
        
    regReceiver received_stored (.*);
    commandDecoder command_stored (.*);
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            cs <= idle;
        else 
            cs <= ns;
    end
    
    always_comb begin
        decode_enable = 0;
        case(cs)
            idle: begin
                ns = activated ? latch : idle;
            end
            latch: begin
                ns = !activated ? instr : latch;
            end
            instr: begin
                ns = activated ? latch : idle;
                decode_enable = 1;
            end
        endcase
    end
    
    
endmodule: comInterface

module commandDecoder(
    input logic clk,
    input logic reset,
    input logic decode_enable,
    input logic [7:0] received_byte,
    output logic [2:0] enable,
    output logic [2:0] atten_enable,
    output logic [9:0] freq,
    output logic [3:0] atten_mag);
    
    logic double_transfer;
    logic [7:0] first_byte;
    logic [2:0] reg_addr;
    logic double_transfer_selected;
    logic atten_selected;
    
    assign reg_addr = double_transfer ? first_byte[6:4] : received_byte[6:4];
    assign freq = {received_byte[5:0],first_byte[3:0]};
    assign atten_mag = received_byte[3:0];
    assign double_transfer_selected = reg_addr == 0 || reg_addr == 2 || reg_addr == 4;
    assign atten_selected = !double_transfer_selected && (reg_addr < 6);
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset) begin
            first_byte <= 0;
            double_transfer <= 0;
        end
        else if(decode_enable) begin
            if(double_transfer)
                double_transfer <= 0;
            else if(double_transfer_selected) begin
                double_transfer <= 1;
                first_byte <= received_byte;
            end
        end
    end
    
    always_comb begin
        atten_enable = 0;
        enable = 0;
        if(decode_enable) begin
            if(double_transfer)
                enable[reg_addr >> 1] = 1;
            else if(atten_selected)
                atten_enable[reg_addr >> 1] = 1;
        end
    end
    
endmodule: commandDecoder
    
module regReceiver(
    input logic clk,
    input logic reset,
    input logic activated,
    input logic [7:0] data,
    output logic [7:0] received_byte);
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            received_byte <= 0;
        else if(activated)
            received_byte <= data;
    end
    
endmodule: regReceiver