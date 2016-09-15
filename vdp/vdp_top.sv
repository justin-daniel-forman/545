module vdp_top (

  input logic       clk,
  input logic       reset_L,

  //---------------------------------------------------------------------------
  //Bus Interface
  //  - data_bus:
  //  - addr_bus:
  //  - IORQ_L:   The data on the bus is part of an I/O request
  //  - RD_L:     Main CPU is ready for memory data to be placed onto data bus
  //  - WR_L:     Main CPU is placing valid data onto bus for write
  //---------------------------------------------------------------------------
  inout wire  [7:0]   data_bus,
  inout wire  [15:0]  addr_bus,
  input logic         IORQ_L,
  input logic         RD_L,
  input logic         WR_L

  //---------------------------------------------------------------------------
  //Interrupt output interface
  //
  //TODO: Define the necessary outputs for VDP generated interrupts
  //---------------------------------------------------------------------------

  //---------------------------------------------------------------------------
  //Board output interface
  //
  //TODO: Define the necessary board outputs for VGA interface
  //---------------------------------------------------------------------------
);

  logic CSW_L, CSR_L, MODE;

  vdp_port_decoder DECODER(
    .clk(clk),
    .reset_L(reset_L),
    .addr_in(addr_bus),
    .data_in(data_bus),
    .IORQ_L(IORQ_L),
    .RD_L(RD_L),
    .WR_L(WR_L),
    .CSW_L(CSW_L),
    .CSR_L(CSR_L),
    .MODE(MODE)
  );

  logic [7:0] cmd_port_out;
  logic [7:0] data_port_out;

  vdp_ports PORTS(
    .clk(clk),
    .reset_L(reset_L),
    .MODE(MODE),
    .CSR_L(CSR_L),
    .CSW_L(CSW_L),
    .data_in(data_bus),
    .data_port_out(data_port_out),
    .cmd_port_out(cmd_port_out)
  );

  //assign the data bus if we are reading from it
  assign data_bus =
    (MODE & ~CSR_L) ? cmd_port_out : ((~MODE & ~CSR_L) ? data_port_out : 8'bz );


endmodule: vdp_top


/* vdp_bus_decoder
 * Description: This module is responsible for generating the control signals
 *              for the command and data ports that interface with the addr and
 *              data bus lines.
 */
module vdp_port_decoder(

  //---------------------------------------------------------------------------
  //Bus Interface
  //  - data_in:
  //  - addr_in:
  //---------------------------------------------------------------------------
  input  logic clk,
  input  logic reset_L,
  input  logic [15:0] addr_in,
  input  logic [7:0]  data_in,

  //---------------------------------------------------------------------------
  //Control Signal Interface
  //  - IORQ_L: Main CPU is in the middle of an I/O request
  //  - RD_L:   Main CPU is ready for data on data bus
  //  - WR_L:   Main CPU is putting a byte of data on the bus
  //  - CSW_L:  When asserted, bus data goes into VDP port
  //  - CSR_L:  When asserted, VDP port is put out onto bus line
  //  - MODE:   Determines if transfer goes to/from control port or data port
  //---------------------------------------------------------------------------
  input   logic IORQ_L,
  input   logic RD_L,
  input   logic WR_L,
  output  logic CSW_L,
  output  logic CSR_L,
  output  logic MODE
);

  enum logic [2:0] {
    WAIT = 3'b000,
    RD0  = 3'b001,
    RD1  = 3'b010,
    WR0  = 3'b011,
    WR1  = 3'b100
  } state, next_state;

  always @(posedge clk) begin
    if(~reset_L) begin
      state <= WAIT;
    end

    else begin
      state <= next_state;
    end
  end

  always_comb begin

    // next state logic
    case (state)

      WAIT: begin
        if(~IORQ_L & ~WR_L) begin
          next_state = WR0;
        end

        else if (~IORQ_L & ~RD_L) begin
          next_state = RD0;
        end
      end

      WR0: next_state = WR1;

      WR1: next_state = WAIT;

      RD0: next_state = RD1;

      RD1: next_state = WAIT;

      default: next_state = WAIT;
    endcase

    // output logic
    case (state)
      WAIT, RD0, WR0: begin
        MODE     = 0;
        CSR_L    = 1;
        CSW_L    = 1;
      end

      RD1: begin
        MODE  = (addr_in[7:0] == 8'hBF); //Command port -> 1, data port -> 0
        CSR_L = 0;
        CSW_L = 1;
      end

      WR1: begin
        MODE  = (addr_in[7:0] == 8'hBF); //Command port -> 1, data port -> 0
        CSR_L = 1;
        CSW_L = 0;
      end

    endcase

  end

endmodule: vdp_port_decoder

module vdp_ports(
  input   logic clk,
  input   logic reset_L,

  input   logic MODE,
  input   logic CSR_L,
  input   logic CSW_L,

  input   logic [7:0]  data_in,
  output  logic [7:0]  data_port_out,
  output  logic [7:0] cmd_port_out
);

  logic [7:0] cmd_port_in;
  logic [7:0] data_port_in;

  register #(8) cmd_port(
    .clk(clk),
    .rst_L(reset_L),
    .D(cmd_port_in),
    .Q(cmd_port_out),
    .en(MODE) // Should only ever be written to on MODE == 1
  );

  register #(8) data_port(
    .clk(clk),
    .rst_L(reset_L),
    .D(data_port_in),
    .Q(data_port_out),
    .en(~MODE) // Should only ever be written to on MODE == 0
  );

  assign data_port_in = (~CSW_L) ? data_in : data_port_out;
  assign cmd_port_in = (~CSW_L) ? data_in : cmd_port_out;

endmodule: vdp_ports

/* command_decoder
 * Description: Interprets the two byte command written to the command port
 *              to generate the appropriate control signals for the specified
 *              read/write sequence
 */
module command_decoder (
);


endmodule: command_decoder
