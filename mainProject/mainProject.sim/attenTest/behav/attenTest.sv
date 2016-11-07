module attenTest;

    logic clk,reset;
    logic [9:0] freq;
    logic waveform_valid;
    logic [2:0] enable;


    logic [3:0] atten_mag;
    logic [2:0] atten_enable;
    
    logic clk_4;
    
    logic mem_en;
    logic [15:0] addr,mem_addr;
    logic MREQ_N,WR_N;
    logic [7:0] data,mem_data;
    
    blk_mem_gen_0 memDat(.clka(clk_4),.ena(mem_en),.addra(mem_addr),.douta(mem_data));
    audioMemTest memIO(.*);
    comInterface audioInterface(.*);
        
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        clk_4 = 0;
        forever #125 clk_4 = ~clk_4;
    end
    

    initial begin
		reset = 1;
		@(posedge clk_4);
		reset = 0;
		@(posedge clk_4);
		@(posedge clk_4);
		@(posedge clk_4);
		@(posedge clk_4);
		@(posedge clk_4);
        @(posedge clk_4);
        @(posedge clk_4);
		$finish;
	end

endmodule: attenTest