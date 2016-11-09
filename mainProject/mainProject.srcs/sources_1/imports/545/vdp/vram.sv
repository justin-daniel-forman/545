// Overclocked RAM, 2 ports:
//   - Read/Write Port
//   - Read Port
// Read latency is 2 clock cycles, writes are 1.
module vram(
  input  logic             clk_100, rst_L,
  input  logic      [7:0]  data_in,
  input  logic      [13:0] io_addr, 
  input  logic [7:0][13:0] vga_addr,
  input  logic             io_we,
  input  logic             io_re,
  input  logic      [7:0]  vga_re,
  input  logic             VRAM_go,
  output logic      [7:0]  io_data_out,
  output logic [7:0][7:0]  vga_data_out);
  
  logic [13:0] addr_a, addr_b;
  logic [7:0]  data_out_a, data_out_b;
  
  logic       we;
  enum logic [2:0] {WOrInit, R0, R1, R2, R3, Wait0, Wait1, Wait2} cs, ns;
  logic [7:0] en;

  // Output and State Logic - ****May need to add a BUSY signal to sync multiple users
  always_comb begin
    addr_a = 0;
    addr_b = 0;
    en = 0;
    we = 0;
    case (cs)
      WOrInit: begin // If both io_re and io_we are low, vga_addr[0]. 
        addr_a = ~(io_re | io_we) ? vga_addr[0] : io_addr;
        addr_b = vga_addr[4];
        we = io_we;
        ns = (VRAM_go) ? R0 : WOrInit; // Waits for a go signal from either the io or VGA interfaces
      end
      R0: begin
        addr_a = vga_addr[1];
        addr_b = vga_addr[5];
        en = 8'h11;
        ns = R1;
      end
      R1: begin
        addr_a = vga_addr[2];
        addr_b = vga_addr[6];
        en = 8'h22;
        ns = R2;
      end
      R2: begin
        addr_a = vga_addr[3];
        addr_b = vga_addr[7];
        en = 8'h44;
        ns = R3;
      end
      R3: begin
        addr_a = vga_addr[3];
        addr_b = vga_addr[7];
        en = 8'h88;
        ns = Wait0;
      end
      Wait0: ns = Wait1;
      Wait1: ns = Wait2;
      Wait2: ns = WOrInit;
      default: begin
        ns = WOrInit;
        addr_a = 0;
        addr_b = 0;
        en = 0;
        we = 0;
      end
    endcase
  end
 
  // 3:0
  register #(8) data_out_latches_A [3:0] (
    .clk(clk_100),
    .rst_L,
    .D(data_out_a),
    .en(en[3:0]),
    .Q(vga_data_out[3:0])
  );

  // 7:4
  register #(8) data_out_latches_B [3:0] (
    .clk(clk_100),
    .rst_L,
    .D(data_out_b),
    .en(en[7:4]),
    .Q(vga_data_out[7:4])
  );
 
  assign io_data_out = vga_data_out[0];
 
  // Memory
  VRAM videoRam(
    .clka(clk_100), // A-port is for io writes and VGA reads
    .wea(we),
    .addra(addr_a),
    .dina(data_in),
    .douta(data_out_a),
    .clkb(clk_100), // B-port is for VGA reads
    .web(1'b0),
    .addrb(addr_b),
    .dinb(8'bz),
    .doutb(data_out_b)
  );
  
  always_ff @(posedge clk_100, negedge rst_L) begin
    if (~rst_L) cs <= WOrInit;
    else        cs <= ns;
  end
  
endmodule

