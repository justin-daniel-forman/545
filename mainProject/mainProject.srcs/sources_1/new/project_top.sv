`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2016 03:34:31 PM
// Design Name: 
// Module Name: project_top
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


module project_top(
    output AC_ADR0,
    output AC_ADR1,
    output AC_GPIO0,
    output AC_GPIO2,
    output AC_GPIO3,
    output AC_MCLK,
    output AC_SCK,
    inout AC_SDA,
    input GCLK,
    input BTNL
    );
    
    wire [7:0]  data_in;
    wire [7:0]  data_out;
    wire [15:0] addr_bus;
    wire MREQ_L,RD_L,WR_L,IORQ_L;
    
    wire SDA;
    logic SCL,MCLK,BCLK,LRCLK,SDATA;
    
    logic M1_L,INT_L,NMI_L,WAIT_L,RFSH_L,BUSACK_L,BUSREQ_L,HALT_L;
      
    logic clk_4;
    logic clk_8;
    logic clk_100;
    logic rst_L;
    logic reset;
    logic locked;
    
    logic [9:0] freq;
    logic [2:0] atten_enable,enable;
    logic [3:0] atten_mag;
    
    assign INT_L = 1;
    assign NMI_L = 1;
    assign WAIT_L = 1;
    assign BUSREQ_L = 1;
    
    assign clk_100 = GCLK;
    assign reset = BTNL;
    assign rst_L = ~BTNL;
    assign AC_SDA = SDA;
    assign AC_SCK = SCL;
    assign AC_MCLK = MCLK;
    assign AC_GPIO2 = BCLK;
    assign AC_GPIO3 = LRCLK;
    assign AC_GPIO0 = SDATA;
    assign AC_ADR0 = 1;
    assign AC_ADR1 = 1;
    
    audio_top psg(.*);
    mem_interface blkMem(.*);
    z80_block proc_top(.*);
    clk_wiz_0 ClkMHzGen(.clk_in1(GCLK),.clk_out1(clk_8),.*);
    ila_0 debug(.clk(GCLK),.probe0(addr_bus),.probe1(data_in),.probe2(data_out),.probe3(WR_L),.probe4(RD_L),.probe5(MREQ_L),
        .probe6(IORQ_L),.probe7(clk_4),.probe8(freq),.probe9(atten_mag),.probe10(atten_enable),.probe11(enable));
    
    always_ff @(posedge clk_8,posedge reset) begin
        if(reset)
            clk_4 <= 0;
        else if(locked)
            clk_4 <= ~clk_4;
    end
    
endmodule
