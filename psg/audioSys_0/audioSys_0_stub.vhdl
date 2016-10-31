-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Wed Oct 19 12:24:12 2016
-- Host        : mittlefrueh.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
-- Command     : write_vhdl -force -mode synth_stub
--               /afs/ece.cmu.edu/usr/suyashb/Private/545/psg/audioSys_0/audioSys_0_stub.vhdl
-- Design      : audioSys_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity audioSys_0 is
  Port ( 
    addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    MREQ_N : in STD_LOGIC;
    WR_N : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SDA : inout STD_LOGIC;
    SCL : out STD_LOGIC;
    MCLK : out STD_LOGIC;
    BCLK : out STD_LOGIC;
    LRCLK : out STD_LOGIC;
    SDATA : out STD_LOGIC
  );

end audioSys_0;

architecture stub of audioSys_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "addr[15:0],clk,reset,MREQ_N,WR_N,data[7:0],SDA,SCL,MCLK,BCLK,LRCLK,SDATA";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "audioSys,Vivado 2015.2";
begin
end;
