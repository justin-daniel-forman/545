-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Thu Nov 17 13:46:10 2016
-- Host        : mittlefrueh.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
-- Command     : write_vhdl -force -mode synth_stub
--               /afs/ece.cmu.edu/usr/suyashb/Private/545/mainProject/mainProject.srcs/sources_1/ip/z80_0/z80_0_stub.vhdl
-- Design      : z80_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity z80_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst_L : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    addr_bus : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    M1_L : out STD_LOGIC;
    INT_L : in STD_LOGIC;
    NMI_L : in STD_LOGIC;
    WAIT_L : in STD_LOGIC;
    MREQ_L : out STD_LOGIC;
    IORQ_L : out STD_LOGIC;
    RD_L : out STD_LOGIC;
    WR_L : out STD_LOGIC;
    RFSH_L : out STD_LOGIC;
    BUSACK_L : out STD_LOGIC;
    BUSREQ_L : in STD_LOGIC;
    HALT_L : out STD_LOGIC;
    interrupt_mask : out STD_LOGIC;
    curr_state : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end z80_0;

architecture stub of z80_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_L,data_in[7:0],data_out[7:0],addr_bus[15:0],M1_L,INT_L,NMI_L,WAIT_L,MREQ_L,IORQ_L,RD_L,WR_L,RFSH_L,BUSACK_L,BUSREQ_L,HALT_L,interrupt_mask,curr_state[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "z80,Vivado 2015.2";
begin
end;
