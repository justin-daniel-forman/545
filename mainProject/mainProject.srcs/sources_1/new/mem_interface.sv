`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2016 03:16:27 PM
// Design Name: 
// Module Name: mem_interface
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


module mem_interface(
    output wire [7:0] data_in,
    input wire [7:0] data_out,
    input wire [15:0] addr_bus,
    input wire MREQ_L,
    input wire RD_L,
    input wire WR_L,
    input wire clk_4,
    output wire rom_corrupted
    );
    
    wire [7:0] douta;
    wire [7:0] dina;
    wire [15:0] addra;
    wire wea;
    wire ena;
    wire clka; //Rename the clock signal to have it match
    
    //wire [7:0] memory_out; 
    //assign memory_out = (!RD_L && !MREQ_L) ? douta : 8'bz;
    //assign data_bus = memory_out;    

    assign dina = data_out;
    assign data_in = douta;
    assign wea = (!MREQ_L && !WR_L && (addr_bus >= 16'hc000));
    assign rom_corrupted = (!MREQ_L && !WR_L && (addr_bus < 16'hc000));
    assign clka = clk_4;
    assign ena = (!MREQ_L && (wea || !RD_L));
    assign addra = addr_bus;
    
    blk_mem_gen_0 ramMem(.*);
    
endmodule
