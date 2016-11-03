// (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:z80:1.0
// IP Revision: 2

(* X_CORE_INFO = "z80,Vivado 2015.2" *)
(* CHECK_LICENSE_TYPE = "z80_0,z80,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module z80_0 (
  clk,
  rst_L,
  data_in,
  data_out,
  addr_bus,
  M1_L,
  INT_L,
  NMI_L,
  WAIT_L,
  MREQ_L,
  IORQ_L,
  RD_L,
  WR_L,
  RFSH_L,
  BUSACK_L,
  BUSREQ_L,
  HALT_L
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
input wire rst_L;
input wire [7 : 0] data_in;
output wire [7 : 0] data_out;
inout wire [15 : 0] addr_bus;
output wire M1_L;
input wire INT_L;
input wire NMI_L;
input wire WAIT_L;
output wire MREQ_L;
output wire IORQ_L;
output wire RD_L;
output wire WR_L;
output wire RFSH_L;
output wire BUSACK_L;
input wire BUSREQ_L;
output wire HALT_L;

  z80 inst (
    .clk(clk),
    .rst_L(rst_L),
    .data_in(data_in),
    .data_out(data_out),
    .addr_bus(addr_bus),
    .M1_L(M1_L),
    .INT_L(INT_L),
    .NMI_L(NMI_L),
    .WAIT_L(WAIT_L),
    .MREQ_L(MREQ_L),
    .IORQ_L(IORQ_L),
    .RD_L(RD_L),
    .WR_L(WR_L),
    .RFSH_L(RFSH_L),
    .BUSACK_L(BUSACK_L),
    .BUSREQ_L(BUSREQ_L),
    .HALT_L(HALT_L)
  );
endmodule
