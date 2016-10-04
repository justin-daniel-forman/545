module tb ();


  logic clk, rst_L;

  logic [7:0]   data_in;

  //Regfile loads
  logic         ld_B;
  logic         ld_C;
  logic         ld_D;
  logic         ld_E;
  logic         ld_H;
  logic         ld_L;
  logic         ld_IXH;
  logic         ld_IXL;
  logic         ld_IYH;
  logic         ld_IYL;
  logic         ld_SPH;
  logic         ld_SPL;
  logic         ld_PCH;
  logic         ld_PCL;

  //Regfile Drives
  //Specifying two of these will cause a 16 bit drive onto the
  //addr bus and specifying one will cause an 8 bit drive onto
  //the data bus
  logic         drive_reg_data;
  logic         drive_reg_addr;
  logic         drive_B;
  logic         drive_C;
  logic         drive_D;
  logic         drive_E;
  logic         drive_H;
  logic         drive_L;
  logic         drive_IXH;
  logic         drive_IXL;
  logic         drive_IYH;
  logic         drive_IYL;
  logic         drive_SPH;
  logic         drive_SPL;
  logic         drive_PCH;
  logic         drive_PCL;

  //Accumulator and Flag loads
  //We can load the flags from either the 16-bit ALU or the
  //8-bit ALU
  logic         ld_A;
  logic         ld_F_data;
  logic         ld_F_addr;

  //Accumulator and Flag drives
  logic         drive_A;
  logic         drive_F;

  //ALU drives and controls
  logic [3:0]   alu_op;
  logic         drive_alu_data; //8bit drive
  logic         drive_alu_addr; //16bit drive

  //Miscellaneous register controls
  logic         switch_context;
  logic         swap_reg;

  //temporary data_bus registers
  logic         ld_MDR1;
  logic         ld_MDR2;
  logic         ld_TEMP;
  logic         drive_MDR1;
  logic         drive_MDR2;
  logic         drive_TEMP;

  //temporary addr_bus registers
  logic         ld_MARH; //load upper byte of MAR
  logic         ld_MARL; //load lower byte of MAR
  logic         drive_MAR;

  //External bus outputs
  logic [7:0]   data_out;
  logic [15:0]  addr_out;

  datapath DUT(.*);

  //generate clock
  initial begin
    clk = 0;
    forever begin
      #10 clk = ~clk;
    end
  end

  initial begin

    data_in = 0;

    //Regfile loads
    ld_B = 0;
    ld_C = 0;
    ld_D = 0;
    ld_E = 0;
    ld_H = 0;
    ld_L = 0;
    ld_IXH = 0;
    ld_IXL = 0;
    ld_IYH = 0;
    ld_IYL = 0;
    ld_SPH = 0;
    ld_SPL = 0;
    ld_PCH = 0;
    ld_PCL = 0;

    //Regfile Drives
    //Specifying two of these will cause a 16 bit drive onto the
    //addr bus and specifying one will cause an 8 bit drive onto
    //the data bus
    drive_reg_data = 0;
    drive_reg_addr = 0;
    drive_B = 0;
    drive_C = 0;
    drive_D = 0;
    drive_E = 0;
    drive_H = 0;
    drive_L = 0;
    drive_IXH = 0;
    drive_IXL = 0;
    drive_IYH = 0;
    drive_IYL = 0;
    drive_SPH = 0;
    drive_SPL = 0;
    drive_PCH = 0;
    drive_PCL = 0;

    //Accumulator and Flag loads
    //We can load the flags from either the 16-bit ALU or the
    //8-bit ALU
    ld_A = 0;
    ld_F_data = 0;
    ld_F_addr = 0;

    //Accumulator and Flag drives
    drive_A = 0;
    drive_F = 0;

    //ALU drives and controls
    alu_op = 0;
    drive_alu_data =0; //8bit drive
    drive_alu_addr = 0; //16bit drive

    //Miscellaneous register controls
    switch_context = 0;
    swap_reg = 0;

    //temporary data_bus registers
    ld_MDR1 = 0;
    ld_MDR2 = 0;
    ld_TEMP = 0;
    drive_MDR1 = 0;
    drive_MDR2 = 0;
    drive_TEMP = 0;

    //temporary addr_bus registers
    ld_MARH = 0; //load upper byte of MAR
    ld_MARL = 0; //load lower byte of MAR
    drive_MAR = 0;

    rst_L = 0;
    @(posedge clk);
    rst_L <= 1;
    @(posedge clk);


    ld_D    <= 1;
    data_in <= 8'hbb;
    @(posedge clk);
    ld_D    <= 0;
    ld_E    <= 1;
    data_in <= 8'haa;
    @(posedge clk);
    ld_H    <= 1;
    ld_E    <= 0;
    data_in <= 8'hcc;
    @(posedge clk);
    ld_L    <= 1;
    ld_H    <= 0;
    data_in <= 8'hdd;
    @(posedge clk);
    ld_L <= 0;
    data_in <= 8'bz;

    //LDI Instruction (DE) <- (HL), DE <- DE + 1, HL <- HL + 1, BC <- BC - 1
    //OCF M1

    //A_BUS <- PC + 1
    ld_PCH = 1;
    ld_PCL = 1;
    drive_PCH = 1;
    drive_PCL = 1;
    drive_reg_addr = 1;
    drive_alu_addr = 1;
    alu_op = `INCR_A;
    @(posedge clk); //end T1

    ld_PCH = 0;
    ld_PCL = 0;
    alu_op = `NOP;
    data_in <= 8'hed; //fake instruction
    @(posedge clk); //end T2

    data_in <= 8'bz;
    drive_PCH = 0;
    drive_PCL = 0;
    drive_reg_addr = 0;
    drive_alu_addr = 0;
    @(posedge clk); //end T3
    @(posedge clk); //end T4

    //OCF M2
    @(posedge clk); //end T1
    data_in <=  8'ha0; //fake instruction
    @(posedge clk);
    data_in <= 8'bz;
    @(posedge clk); //end T3
    @(posedge clk); //end T4

    //M3 M_RD

    //MAR <- HL
    ld_MARH = 1;
    ld_MARL = 1;
    drive_reg_addr = 1;
    drive_alu_addr = 1;
    alu_op = `NOP;
    drive_H = 1;
    drive_L = 1;
    @(posedge clk); //end T1

    ld_MARH = 0;
    ld_MARL = 0;
    drive_reg_addr = 0;
    drive_alu_addr = 0;
    drive_H = 0;
    drive_L = 0;
    drive_MAR = 1;
    data_in <= 8'hee; //Fake data
    @(posedge clk); //end T2

    //MDR1 <- D_BUS
    ld_MDR1 = 1;
    data_in <= 8'bz;
    @(posedge clk); //end T3


    //M4 M_WR

    //D_BUS <- MDR1
    ld_MDR1 = 0;
    drive_MDR1 = 1;

    //MAR <- DE
    ld_MARH = 1;
    ld_MARL = 1;
    drive_reg_addr = 1;
    drive_alu_addr = 1;
    alu_op = `NOP;
    drive_D = 1;
    drive_E = 1;
    @(posedge clk);

    ld_MARH = 0;
    ld_MARL = 0;
    drive_MAR = 1;
    drive_reg_addr = 0;
    drive_alu_addr = 0;
    drive_D = 0;
    drive_E = 0;
    @(posedge clk);

    //HL <- HL + 1
    drive_MAR = 0;
    ld_H = 1;
    ld_L = 1;
    drive_H = 1;
    drive_L = 1;
    drive_alu_addr = 1;
    drive_reg_addr = 1;
    alu_op = `INCR_A;
    @(posedge clk);


    $finish;
  end

endmodule: tb
