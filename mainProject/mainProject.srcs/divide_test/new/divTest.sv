module divTest; 

    logic [9:0] data;
    logic reset,clk,div_en,div_done;
    logic [15:0] step_size;
    logic [15:0] remainder,remainder_preview;
    logic [15:0] dividend;
    logic [4:0] count;
    
    
    divider div(.*);
    
    assign remainder = div.remainder;
    assign dividend = div.dividend;
    assign remainder_preview = div.remainder_preview;
    assign count = div.count;
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        $monitor($stime,,"step_size = %d, remainder = %d",step_size,div.remainder);
        reset = 1;
        data = 10'd31;
        div_en = 0;
        @(posedge clk);
        reset = 0;
        div_en = 1;
        while(!div_done)
            @(posedge clk);
        $finish;
    end 

endmodule: divTest