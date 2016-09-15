module io_tb();

  logic         clk, reset_L;
  wire  [7:0]   data_bus;
  wire  [15:0]  addr_bus;
  logic         IORQ_L, RD_L, WR_L;

  //The VDP puts values out on data_bus and addr_bus based on the
  //signals provided. We need to be careful to match that interface
  //in order not to drive the wire in multiple places
  vdp_top VDP(
    .clk(clk),
    .reset_L(reset_L),
    .data_bus(data_bus),
    .addr_bus(addr_bus),
    .IORQ_L(IORQ_L),
    .RD_L(RD_L),
    .WR_L(WR_L)
  );

  logic [7:0] read_data;
  logic write_in_prog, read_in_prog;
  logic [7:0] data_bus_out_w, data_bus_out_r;
  logic [15:0] addr_bus_out_w, addr_bus_out_r;

  assign data_bus =
    (read_in_prog) ? data_bus_out_r : ((write_in_prog) ? data_bus_out_w : 8'bz);
  assign addr_bus =
    (read_in_prog) ? addr_bus_out_r : ((write_in_prog) ? addr_bus_out_w : 16'bz);

  //clock generation block
  initial begin
    clk = 0;
    forever begin
      #10 clk = ~clk;
    end
  end

  initial begin
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
    reset_L = 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    reset_L <= 1;
    @(posedge clk);

    write_in_prog <= 1;
    io_write(16'h00BE, 8'hDD);
    io_write(16'h00BF, 8'hBB);
    write_in_prog <= 0;
    read_in_prog  <= 1;
    io_read(16'h00BE, read_data);
    io_read(16'h00BF, read_data);
    read_in_prog <= 0;
    #10 $finish;

  end

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
    @(posedge clk); //ends T1

    //-------------------------------------------------------------------------
    //TIME 1-2
    //-------------------------------------------------------------------------
    #5 IORQ_L = 0;
       RD_L   = 0;
    @(posedge clk); //ends T2

    //-------------------------------------------------------------------------
    //TIME 2-W
    //-------------------------------------------------------------------------
    @(posedge clk); //ends TW

    //-------------------------------------------------------------------------
    //TIME W-3
    //-------------------------------------------------------------------------
    #5 IORQ_L = 1;
       RD_L   = 1;
    port_data <= data_bus; //sample the data bus on the end of cycle T3
    @(posedge clk); //ends T3

    read_in_prog = 0;
    $display("Data received from I/O read to %h: %h\n", port_addr, port_data);

  endtask

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
    @(posedge clk); //ends T1

    //-------------------------------------------------------------------------
    //TIME 1-2
    //-------------------------------------------------------------------------
    #5 IORQ_L = 0;
       WR_L   = 0;
    @(posedge clk); //ends T2

    //-------------------------------------------------------------------------
    //TIME 2-W
    //-------------------------------------------------------------------------
    @(posedge clk); //ends TW

    //-------------------------------------------------------------------------
    //TIME W-3
    //-------------------------------------------------------------------------
    #5 IORQ_L = 1;
       WR_L   = 1;
    @(posedge clk); //ends T3

    write_in_prog = 0;
    $display("Data %h written to I/O port %h\n", port_data, port_addr);

  endtask

endmodule: io_tb
