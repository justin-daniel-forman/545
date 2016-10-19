-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Tue Oct 18 17:24:10 2016
-- Host        : mittlefrueh.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
-- Command     : write_vhdl -force -mode synth_stub
--               /afs/ece.cmu.edu/usr/suyashb/Private/545/mainProject/mainProject.srcs/sources_1/ip/c_add_0/c_add_0_stub.vhdl
-- Design      : c_add_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity c_add_0 is
  Port ( 
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end c_add_0;

architecture stub of c_add_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "A[15:0],B[15:0],S[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "c_addsub_v12_0,Vivado 2015.2";
begin
end;
