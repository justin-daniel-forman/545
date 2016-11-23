module io_tb();

  logic         clk_100, clk_25, clk_4, rst_L;
  wire  [7:0]   data_bus_in, data_bus_out;
  wire  [15:0]  addr_bus_in;
  logic         IORQ_L, RD_L, WR_L, BUSY, M1_L, INT_L;

  logic       clkDiv_25;
  logic [3:0] clkDiv_4;

  //The VDP puts values out on data_bus and addr_bus based on the
  //signals provided. We need to be careful to match that interface
  //in order not to drive the wire in multiple places
  vdp_top VDP(
    .clk_100,
    .clk_25,
    .clk_4,
    .rst_L(rst_L),
    .data_bus_in(data_bus_in),
    .addr_bus_in(addr_bus_in[7:0]),
    .data_bus_out(data_bus_out),
    .IORQ_L(IORQ_L),
    .RD_L(RD_L),
    .WR_L(WR_L),
    .VGA_R(), // Disconnected 
    .VGA_G(), 
    .VGA_B(),
    .VGA_HS(),
    .VGA_VS(),
    .BUSY,
    .M1_L, 
    .INT_L,
    .SW(8'd0)
  );

  logic [7:0] read_data;
  logic write_in_prog, read_in_prog;
  logic [7:0] data_bus_out_w, data_bus_out_r;
  logic [15:0] addr_bus_out_w, addr_bus_out_r;

  assign data_bus_in =
    (read_in_prog) ? data_bus_out_r : ((write_in_prog) ? data_bus_out_w : 8'bz);
  assign addr_bus_in =
    (read_in_prog) ? addr_bus_out_r : ((write_in_prog) ? addr_bus_out_w : 16'bz);

  //clock generation block
  initial begin
    clk_100 = 0;
    forever begin
      #1 clk_100 = ~clk_100;
    end
  end

  // Divide the 100 MHz clk to get 25 MHz clk and 4 MHz clk
  always_ff @(posedge clk_100, negedge rst_L) begin
    if (~rst_L) begin 
      clkDiv_4 <= 0;
      clkDiv_25 <= 0;
      clk_4 <= 0;
      clk_25 <= 0;
    end
    else begin
      clkDiv_4 <= (clkDiv_4 == 4'd9) ? 4'd0 : clkDiv_4 + 4'd1;
      clkDiv_25 <= clkDiv_25 + 2'd1;
      clk_4 <= (clkDiv_4 == 4'd9) ? ~clk_4 : clk_4;
      clk_25 <= (clkDiv_25 == 1'd1) ? ~clk_25 : clk_25;
    end
  end 

  initial begin
    $readmemb("VRAM.bin", VDP.VRAM.videoRam.memory);
    data_bus_out_w = 8'bz;
    data_bus_out_r = 8'bz;
    addr_bus_out_w = 16'bz;
    addr_bus_out_r = 16'bz;
    read_in_prog = 0;
    write_in_prog = 0;
    IORQ_L  = 1;
    RD_L    = 1;
    WR_L    = 1;

    $display("Starting tb\n");

    //Z80 requires at least 3 cycles of reset, VDP requires like 300 microseconds
    rst_L = 0;
    @(posedge clk_100);
    @(posedge clk_100);
    @(posedge clk_100);
    rst_L <= 1;
    @(posedge clk_100);

    write_in_prog <= 1;

    // Write to VRAM 
    io_write(16'h00BF, 8'hCE); // Write to VRAM, address 14'h0ACE
    nop;
    io_write(16'h00BF, 8'h4A); // 40 = 01_001010, so write to VRAM
    nop;
    io_write(16'h00BE, 8'h55); // Write 8'h55 in
    nop;
    io_write(16'h00BE, 8'h77); // Write 8'h77 in
    nop;
    io_write(16'h00BE, 8'h99); // Write 8'h99 in
    nop;

    // Read from VRAM
    io_write(16'h00BF, 8'hCF); // Write to VRAM, address 14'h0001
    nop;
    io_write(16'h00BF, 8'h0A); // 0A = 00_001010, so read from VRAM
    nop;
    write_in_prog <= 0;
    read_in_prog  <= 1;
    io_read(16'h00BE, read_data);
    read_in_prog <= 0;
    #10 $finish;

  end

  //Z80 performs 2 OUT commands that signal the VDP to read a byte of
  //VRAM from the address encoded in the command. Then the Z80 issues
  //an IN command to read the VRAM byte that is placed in the data port
  task read_VRAM(
    input   logic [13:0] VRAM_addr,
    output  logic        read_data
  );

    //read VRAM command
    write_in_prog <= 1;
    io_write(16'h00BF, {2'b00, VRAM_addr[13:8]} ); //op code 00
    io_write(16'h00BF, VRAM_addr[7:0] );
    write_in_prog <= 0;

    //read the byte from the data port that the VDP should have available
    read_in_prog  <= 1;
    io_read(16'h00BE, read_data);
    read_in_prog  <= 0;

    $display("VRAM addr: %h, VRAM data: %h\n", VRAM_addr, read_data);

  endtask

  //Z80 performs 2 OUT commands that signal the VDP to write a byte
  //of VRAM from the address encoded in the command
  task write_VRAM(
    input   logic [13:0] VRAM_addr,
    input   logic [7:0]  VRAM_data
  );

    //write VRAM command
    write_in_prog <= 1;
    io_write(16'h00BF, {2'b01, VRAM_addr[13:8]} ); //op code 01
    io_write(16'h00BF, VRAM_addr[7:0] );
    io_write(16'h00BE, VRAM_data);
    write_in_prog <= 0;

  endtask

  //Z80 performs 2 OUT commands that signal the VDP to write an
  //internal register
  task write_VDP_reg(
    input   logic [3:0] reg_addr,
    input   logic [7:0] reg_data
  );

    //write reg command
    write_in_prog <= 1;
    io_write(16'h00BF, {4'b1000, reg_addr[3:0] });
    io_write(16'h00BF, reg_data);
    write_in_prog <= 0;

  endtask

  //TODO: There might be a write to color ram functionality for code 3
  task write_CRAM(
    input   logic [7:0] CRAM_addr,
    input   logic [7:0] CRAM_data
  );

    write_in_prog <= 1;
    io_write(16'h00BF, {2'b11, 6'b0} );
    io_write(16'h00BF, CRAM_addr );
    io_write(16'h00BE, CRAM_data );

  endtask


  //Z80 performs an IN command
  task io_read(
    input   logic [15:0] port_addr,
    output  logic [7:0]  port_data
  );

    //-------------------------------------------------------------------------
    //TIME 0-1
    //-------------------------------------------------------------------------
    read_in_prog = 1;

    //drive both the addr bus and the data bus
    RD_L     = 1;
    WR_L     = 1;
    IORQ_L   = 1;

    #1 addr_bus_out_r = 16'bz;
       data_bus_out_r = 8'bz;

    #4 addr_bus_out_r = port_addr;
    @(posedge clk_4); //ends T1

    //-------------------------------------------------------------------------
    //TIME 1-2
    //-------------------------------------------------------------------------
    #5 IORQ_L = 0;
       RD_L   = 0;
    @(posedge clk_4); //ends T2

    //-------------------------------------------------------------------------
    //TIME 2-W
    //-------------------------------------------------------------------------
    @(posedge clk_4); //ends TW

    //-------------------------------------------------------------------------
    //TIME W-3
    //-------------------------------------------------------------------------
    #5 IORQ_L = 1;
       RD_L   = 1;
    @(posedge clk_4); //ends T3
    #5 port_data <= data_bus_out; //sample the data bus on the end of cycle T3
    
    read_in_prog <= 0;
    #0 $strobe("Data received from I/O read to %h: %h\n", port_addr, port_data);

  endtask


  task nop();
    @(posedge clk_4);@(posedge clk_4);@(posedge clk_4);@(posedge clk_4);@(posedge clk_4);
  endtask;


  //Z80 Performs and OUT command
  task io_write(
    input   logic [15:0]  port_addr,
    input   logic [7:0]   port_data
  );

    //-------------------------------------------------------------------------
    //TIME 0-1
    //-------------------------------------------------------------------------
    write_in_prog = 1;

    //drive both the addr bus and the data bus
    RD_L     = 1;
    WR_L     = 1;
    IORQ_L   = 1;

    #1 addr_bus_out_w = 16'bz;
       data_bus_out_w = 8'bz;

    #4 addr_bus_out_w = port_addr;
       data_bus_out_w = port_data;
    @(posedge clk_4); //ends T1

    //-------------------------------------------------------------------------
    //TIME 1-2
    //-------------------------------------------------------------------------
    #5 IORQ_L = 0;
       WR_L   = 0;
    @(posedge clk_4); //ends T2

    //-------------------------------------------------------------------------
    //TIME 2-W
    //-------------------------------------------------------------------------
    @(posedge clk_4); //ends TW

    //-------------------------------------------------------------------------
    //TIME W-3
    //-------------------------------------------------------------------------
    #5 IORQ_L = 1;
       WR_L   = 1;
    @(posedge clk_4); //ends T3

    write_in_prog = 0;
    $display("Data %h written to I/O port %h\n", port_data, port_addr);

  endtask

endmodule: io_tb
