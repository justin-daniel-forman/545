module tb ();


  logic clk, rst_L;

  logic drive_B, drive_C, drive_D, drive_E, drive_H, drive_L;
  logic drive_SPL, drive_SPH, drive_IXL, drive_IXH, drive_IYL;
  logic drive_IYH;

  logic ld_B, ld_C, ld_D, ld_E, ld_H, ld_L, ld_SPL, ld_SPH;
  logic ld_IXH, ld_IXL, ld_IYH, ld_IYL, drive_single, drive_double;
  logic switch_context;
  logic swap_reg;

  logic [7:0] D_BUS;
  logic [15:0] A_BUS;
  logic [7:0] out_single;
  logic [15:0] out_double;


  regfile DUT(.*);

  //generate clock
  initial begin
    clk = 0;
    forever begin
      #10 clk = ~clk;
    end
  end

  assign D_BUS = 8'hba;
  assign A_BUS = 16'hfeed;

  //test bench
  logic [31:0] i;
  initial begin
    ld_B = 0;
    ld_C = 0;
    ld_D = 0;
    ld_E = 0;
    ld_H = 0;
    ld_L = 0;
    ld_IYL = 0;
    ld_IYH = 0;
    ld_SPH = 0;
    ld_SPL = 0;
    ld_IXL = 0;
    ld_IXH = 0;

    swap_reg = 0;
    switch_context = 0;

    rst_L = 0;
    @(posedge clk);
    rst_L <= 1;
    @(posedge clk);

    //check that loading each 8-bit register works
    ld_B <= 1;
    @(posedge clk); //turns B to ba
    ld_B <= 1;
    ld_C <= 1;
    @(posedge clk); //turns BC into feed
    ld_C <= 0;
    @(posedge clk); //turns B to ba

    ld_B <= 0;
    ld_D <= 1;
    ld_E <= 1;
    @(posedge clk); //turns DE into feed

    ld_D <= 0;
    @(posedge clk); //turns E into ba (DE = feba)

    ld_E <= 0;
    ld_H <= 1;
    ld_L <= 1;
    @(posedge clk); //turns HL into feed


    //TODO: Swap is broken -- FIX
    swap_reg <= 1;
    ld_D <= 1;
    ld_E <= 1;
    ld_H <= 1;
    ld_L <= 1;
    @(posedge clk); //turns HL into feba and DE into feed

    swap_reg <= 0;
    ld_D     <= 0;
    ld_E     <= 0;
    ld_H     <= 0;
    ld_L     <= 0;
    @(posedge clk); //no changes
    @(posedge clk);

    drive_single <= 1;
    drive_D      <= 1;
    @(posedge clk);
    $display("should be fe: %h", out_single);
    $display("should be xx: %h", out_double);

    drive_single <= 1;
    drive_D      <= 0;
    drive_E      <= 1;
    @(posedge clk);
    $display("should be ed: %h", out_single);
    $display("should be xx: %h", out_double);

    drive_single <= 0;
    drive_double <= 1;
    drive_D      <= 1;
    drive_E      <= 1;
    @(posedge clk);
    $display("should be xx: %h", out_single);
    $display("should be feed: %h", out_double);




    $finish;
  end

endmodule: tb
