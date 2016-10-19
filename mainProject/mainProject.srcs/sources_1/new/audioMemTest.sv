`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2016 11:47:23 AM
// Design Name: 
// Module Name: audioMemTest
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


module audioMemTest(
    output logic [15:0] mem_addr,
    input logic [7:0] mem_data,
    output logic mem_en,
    output logic [15:0] addr,
    output logic [7:0] data,
    input logic clk_4,
    input logic reset,
    output logic MREQ_N,
    output logic WR_N
    );
    
    typedef enum {idle,fetch,fetch_delay,write} state;
    state cs,ns;
    
    logic [15:0] count;
    
    always_ff @(posedge clk_4) begin
        if(reset) begin
            count <= 0;
            cs <= idle;
        end
        else begin
            cs <= ns;
            if(cs == write) begin
                count <= count + 1;
            end
        end
    end
    
    always_comb begin
        case(cs)
            idle: begin
                mem_addr = count;
                MREQ_N = 1;
                WR_N = 1;
                data = 0;
                mem_en = !reset;
                addr = 0;
            end
            fetch: begin
                mem_addr = count;
                MREQ_N = 1;
                WR_N = 1;
                data = 0;
                mem_en = !reset;
                addr = 0;
            end
            fetch_delay: begin
                mem_addr = count;
                MREQ_N = 1;
                WR_N = 1;
                data = 0;
                mem_en = !reset;
                addr = 0;
            end
            write: begin
                mem_addr = count;
                data = mem_data;
                MREQ_N = 0;
                WR_N = 0;
                mem_en = 1;
                addr = 8'h7f;
            end
            default: begin
                mem_addr = count;
                MREQ_N = 1;
                WR_N = 1;
                data = 0;
                mem_en = !reset;
                addr = 0;
            end
        endcase
    end
    
    always_comb begin
        case(cs)
            idle:  ns = fetch;
            fetch: ns = fetch_delay;
            fetch_delay: ns = write;
            write: ns = fetch;
            default: ns = idle;
        endcase
    end
    
endmodule: audioMemTest
