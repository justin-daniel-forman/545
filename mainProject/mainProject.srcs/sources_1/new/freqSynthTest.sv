module test;

	logic [15:0] waveform;
	logic clk,reset,step,enable,waveform_valid;
	logic [9:0] freq;
	logic byteDone;
	logic cs;
	logic [3:0] count;
	logic MCLK;
	
	logic [31:0] clk_count;
	logic [31:0] bclk_count;
	
	logic div_done;
	logic [15:0] step_size_curr;
	logic [5:0] serial_count;
	
	logic writeDone;
	logic locked;
	logic dataValid;
	
	logic SCL,BCLK,LRCLK,SDATA;
	wire SDA;
		
    assign writeDone = interfaceTest.writeDone;
	assign SDA = byteDone ? 0 : 1'bz;
	assign byteDone = interfaceTest.control.byteDone;
	assign div_done = synthTest.div_done;
	assign step_size_curr = synthTest.step_size_curr;
	assign serial_count = interfaceTest.dacVal.count;
	assign cs = interfaceTest.cs;
	assign count = interfaceTest.count;
	assign locked = interfaceTest.locked;
	assign dataValid = interfaceTest.dataValid;

	freqSynth synthTest(.*);
	dacInterface interfaceTest(.*);
    
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
    
    initial begin
        bclk_count = 0;
        forever begin
            @(negedge BCLK);
            bclk_count++;
        end
    end
        
	initial begin
		reset = 1;
		freq = 10'h0fe;
		enable = 1;
		clk_count = 0;
		bclk_count = 0;
		@(posedge clk);
		reset = 0;
		@(posedge clk);
		enable = 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		while(!step) 
		  @(posedge clk);
		@(posedge clk);
        @(posedge clk);
        @(posedge clk);
        while(waveform == 0) begin
            clk_count++;
            @(posedge clk);
        end
		while(waveform != 0) begin
		  clk_count++;
		  @(posedge clk);
		end
		while(!step) begin
		  clk_count++;
	       @(posedge clk);
	    end
	    while(step) begin
	       clk_count++;
	       @(posedge clk);
	    end
	    while(waveform == 0) begin
	       @(posedge clk);
	       clk_count++;
	    end
	    while(waveform != 0) begin
	       clk_count++;
	       @(posedge clk);
	    end
		$finish;
	end


endmodule: test