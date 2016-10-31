-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Wed Oct 19 12:24:12 2016
-- Host        : mittlefrueh.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
-- Command     : write_vhdl -force -mode funcsim
--               /afs/ece.cmu.edu/usr/suyashb/Private/545/psg/audioSys_0/audioSys_0_funcsim.vhdl
-- Design      : audioSys_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_BCLKGen is
  port (
    BCLK : out STD_LOGIC;
    MCLK : in STD_LOGIC;
    reset : in STD_LOGIC;
    locked : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_BCLKGen : entity is "BCLKGen";
end audioSys_0_BCLKGen;

architecture STRUCTURE of audioSys_0_BCLKGen is
  signal \^bclk\ : STD_LOGIC;
  signal BCLK_i_1_n_0 : STD_LOGIC;
begin
  BCLK <= \^bclk\;
BCLK_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => locked,
      I1 => \^bclk\,
      O => BCLK_i_1_n_0
    );
BCLK_reg: unisim.vcomponents.FDPE
     port map (
      C => MCLK,
      CE => '1',
      D => BCLK_i_1_n_0,
      PRE => reset,
      Q => \^bclk\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_baseReg is
  port (
    \waveform_atten_freq_reg[0]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    multVal : out STD_LOGIC_VECTOR ( 5 downto 0 );
    step : in STD_LOGIC;
    sent_reg : in STD_LOGIC;
    \waveform_atten_freq_reg[0]_0\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    waveform : in STD_LOGIC_VECTOR ( 8 downto 0 );
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    \received_byte_reg[6]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    atten_mag : in STD_LOGIC_VECTOR ( 3 downto 0 );
    P : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_baseReg : entity is "baseReg";
end audioSys_0_baseReg;

architecture STRUCTURE of audioSys_0_baseReg is
  signal atten_mag_stored : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal shifted_val : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \waveform_atten_freq[0]_i_3_n_0\ : STD_LOGIC;
begin
\atten_mag_stored_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[6]\(0),
      D => atten_mag(0),
      PRE => reset,
      Q => atten_mag_stored(0)
    );
\atten_mag_stored_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[6]\(0),
      D => atten_mag(1),
      PRE => reset,
      Q => atten_mag_stored(1)
    );
\atten_mag_stored_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[6]\(0),
      D => atten_mag(2),
      PRE => reset,
      Q => atten_mag_stored(2)
    );
\atten_mag_stored_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[6]\(0),
      D => atten_mag(3),
      PRE => reset,
      Q => atten_mag_stored(3)
    );
waveMult_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => atten_mag_stored(3),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(0),
      I3 => atten_mag_stored(1),
      O => multVal(5)
    );
waveMult_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0056"
    )
        port map (
      I0 => atten_mag_stored(2),
      I1 => atten_mag_stored(1),
      I2 => atten_mag_stored(0),
      I3 => atten_mag_stored(3),
      O => multVal(4)
    );
waveMult_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"002E"
    )
        port map (
      I0 => atten_mag_stored(2),
      I1 => atten_mag_stored(0),
      I2 => atten_mag_stored(1),
      I3 => atten_mag_stored(3),
      O => multVal(3)
    );
waveMult_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6922"
    )
        port map (
      I0 => atten_mag_stored(3),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(0),
      I3 => atten_mag_stored(1),
      O => multVal(2)
    );
waveMult_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"18A8"
    )
        port map (
      I0 => atten_mag_stored(2),
      I1 => atten_mag_stored(0),
      I2 => atten_mag_stored(3),
      I3 => atten_mag_stored(1),
      O => multVal(1)
    );
waveMult_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A9A6"
    )
        port map (
      I0 => atten_mag_stored(3),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(1),
      I3 => atten_mag_stored(0),
      O => multVal(0)
    );
\waveform_atten_freq[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => shifted_val(0),
      I1 => step,
      I2 => sent_reg,
      I3 => \waveform_atten_freq_reg[0]_0\,
      O => \waveform_atten_freq_reg[0]\
    );
\waveform_atten_freq[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF9F7B0000"
    )
        port map (
      I0 => atten_mag_stored(0),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(3),
      I3 => atten_mag_stored(1),
      I4 => P(0),
      I5 => \waveform_atten_freq[0]_i_3_n_0\,
      O => shifted_val(0)
    );
\waveform_atten_freq[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6084400020840000"
    )
        port map (
      I0 => atten_mag_stored(0),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(3),
      I3 => atten_mag_stored(1),
      I4 => P(1),
      I5 => P(2),
      O => \waveform_atten_freq[0]_i_3_n_0\
    );
\waveform_base_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(0),
      Q => Q(0)
    );
\waveform_base_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(8),
      Q => Q(8)
    );
\waveform_base_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(1),
      Q => Q(1)
    );
\waveform_base_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(2),
      Q => Q(2)
    );
\waveform_base_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(3),
      Q => Q(3)
    );
\waveform_base_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(4),
      Q => Q(4)
    );
\waveform_base_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(5),
      Q => Q(5)
    );
\waveform_base_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(6),
      Q => Q(6)
    );
\waveform_base_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(7),
      Q => Q(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_baseReg_10 is
  port (
    \waveform_atten_freq_reg[0]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    multVal : out STD_LOGIC_VECTOR ( 5 downto 0 );
    step : in STD_LOGIC;
    sent : in STD_LOGIC;
    \waveform_atten_freq_reg[0]_0\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    waveform : in STD_LOGIC_VECTOR ( 8 downto 0 );
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    \received_byte_reg[7]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    atten_mag : in STD_LOGIC_VECTOR ( 3 downto 0 );
    P : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_baseReg_10 : entity is "baseReg";
end audioSys_0_baseReg_10;

architecture STRUCTURE of audioSys_0_baseReg_10 is
  signal atten_mag_stored : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal shifted_val : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \waveform_atten_freq[0]_i_3__1_n_0\ : STD_LOGIC;
begin
\atten_mag_stored_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[7]\(0),
      D => atten_mag(0),
      PRE => reset,
      Q => atten_mag_stored(0)
    );
\atten_mag_stored_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[7]\(0),
      D => atten_mag(1),
      PRE => reset,
      Q => atten_mag_stored(1)
    );
\atten_mag_stored_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[7]\(0),
      D => atten_mag(2),
      PRE => reset,
      Q => atten_mag_stored(2)
    );
\atten_mag_stored_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[7]\(0),
      D => atten_mag(3),
      PRE => reset,
      Q => atten_mag_stored(3)
    );
\waveMult_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => atten_mag_stored(3),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(0),
      I3 => atten_mag_stored(1),
      O => multVal(5)
    );
\waveMult_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0056"
    )
        port map (
      I0 => atten_mag_stored(2),
      I1 => atten_mag_stored(1),
      I2 => atten_mag_stored(0),
      I3 => atten_mag_stored(3),
      O => multVal(4)
    );
\waveMult_i_3__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"002E"
    )
        port map (
      I0 => atten_mag_stored(2),
      I1 => atten_mag_stored(0),
      I2 => atten_mag_stored(1),
      I3 => atten_mag_stored(3),
      O => multVal(3)
    );
\waveMult_i_4__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6922"
    )
        port map (
      I0 => atten_mag_stored(3),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(0),
      I3 => atten_mag_stored(1),
      O => multVal(2)
    );
\waveMult_i_5__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"18A8"
    )
        port map (
      I0 => atten_mag_stored(2),
      I1 => atten_mag_stored(0),
      I2 => atten_mag_stored(3),
      I3 => atten_mag_stored(1),
      O => multVal(1)
    );
\waveMult_i_6__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A9A6"
    )
        port map (
      I0 => atten_mag_stored(3),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(1),
      I3 => atten_mag_stored(0),
      O => multVal(0)
    );
\waveform_atten_freq[0]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => shifted_val(0),
      I1 => step,
      I2 => sent,
      I3 => \waveform_atten_freq_reg[0]_0\,
      O => \waveform_atten_freq_reg[0]\
    );
\waveform_atten_freq[0]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF9F7B0000"
    )
        port map (
      I0 => atten_mag_stored(0),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(3),
      I3 => atten_mag_stored(1),
      I4 => P(0),
      I5 => \waveform_atten_freq[0]_i_3__1_n_0\,
      O => shifted_val(0)
    );
\waveform_atten_freq[0]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6084400020840000"
    )
        port map (
      I0 => atten_mag_stored(0),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(3),
      I3 => atten_mag_stored(1),
      I4 => P(1),
      I5 => P(2),
      O => \waveform_atten_freq[0]_i_3__1_n_0\
    );
\waveform_base_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(0),
      Q => Q(0)
    );
\waveform_base_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(8),
      Q => Q(8)
    );
\waveform_base_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(1),
      Q => Q(1)
    );
\waveform_base_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(2),
      Q => Q(2)
    );
\waveform_base_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(3),
      Q => Q(3)
    );
\waveform_base_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(4),
      Q => Q(4)
    );
\waveform_base_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(5),
      Q => Q(5)
    );
\waveform_base_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(6),
      Q => Q(6)
    );
\waveform_base_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(7),
      Q => Q(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_baseReg_8 is
  port (
    \waveform_atten_freq_reg[0]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    multVal : out STD_LOGIC_VECTOR ( 5 downto 0 );
    step : in STD_LOGIC;
    sent : in STD_LOGIC;
    \waveform_atten_freq_reg[0]_0\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    waveform : in STD_LOGIC_VECTOR ( 8 downto 0 );
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    \received_byte_reg[7]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    atten_mag : in STD_LOGIC_VECTOR ( 3 downto 0 );
    P : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_baseReg_8 : entity is "baseReg";
end audioSys_0_baseReg_8;

architecture STRUCTURE of audioSys_0_baseReg_8 is
  signal atten_mag_stored : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal shifted_val : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \waveform_atten_freq[0]_i_3__0_n_0\ : STD_LOGIC;
begin
\atten_mag_stored_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[7]\(0),
      D => atten_mag(0),
      PRE => reset,
      Q => atten_mag_stored(0)
    );
\atten_mag_stored_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[7]\(0),
      D => atten_mag(1),
      PRE => reset,
      Q => atten_mag_stored(1)
    );
\atten_mag_stored_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[7]\(0),
      D => atten_mag(2),
      PRE => reset,
      Q => atten_mag_stored(2)
    );
\atten_mag_stored_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \received_byte_reg[7]\(0),
      D => atten_mag(3),
      PRE => reset,
      Q => atten_mag_stored(3)
    );
\waveMult_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => atten_mag_stored(3),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(0),
      I3 => atten_mag_stored(1),
      O => multVal(5)
    );
\waveMult_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0056"
    )
        port map (
      I0 => atten_mag_stored(2),
      I1 => atten_mag_stored(1),
      I2 => atten_mag_stored(0),
      I3 => atten_mag_stored(3),
      O => multVal(4)
    );
\waveMult_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"002E"
    )
        port map (
      I0 => atten_mag_stored(2),
      I1 => atten_mag_stored(0),
      I2 => atten_mag_stored(1),
      I3 => atten_mag_stored(3),
      O => multVal(3)
    );
\waveMult_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6922"
    )
        port map (
      I0 => atten_mag_stored(3),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(0),
      I3 => atten_mag_stored(1),
      O => multVal(2)
    );
\waveMult_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"18A8"
    )
        port map (
      I0 => atten_mag_stored(2),
      I1 => atten_mag_stored(0),
      I2 => atten_mag_stored(3),
      I3 => atten_mag_stored(1),
      O => multVal(1)
    );
\waveMult_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A9A6"
    )
        port map (
      I0 => atten_mag_stored(3),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(1),
      I3 => atten_mag_stored(0),
      O => multVal(0)
    );
\waveform_atten_freq[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => shifted_val(0),
      I1 => step,
      I2 => sent,
      I3 => \waveform_atten_freq_reg[0]_0\,
      O => \waveform_atten_freq_reg[0]\
    );
\waveform_atten_freq[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF9F7B0000"
    )
        port map (
      I0 => atten_mag_stored(0),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(3),
      I3 => atten_mag_stored(1),
      I4 => P(0),
      I5 => \waveform_atten_freq[0]_i_3__0_n_0\,
      O => shifted_val(0)
    );
\waveform_atten_freq[0]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6084400020840000"
    )
        port map (
      I0 => atten_mag_stored(0),
      I1 => atten_mag_stored(2),
      I2 => atten_mag_stored(3),
      I3 => atten_mag_stored(1),
      I4 => P(1),
      I5 => P(2),
      O => \waveform_atten_freq[0]_i_3__0_n_0\
    );
\waveform_base_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(0),
      Q => Q(0)
    );
\waveform_base_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(8),
      Q => Q(8)
    );
\waveform_base_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(1),
      Q => Q(1)
    );
\waveform_base_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(2),
      Q => Q(2)
    );
\waveform_base_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(3),
      Q => Q(3)
    );
\waveform_base_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(4),
      Q => Q(4)
    );
\waveform_base_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(5),
      Q => Q(5)
    );
\waveform_base_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(6),
      Q => Q(6)
    );
\waveform_base_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => E(0),
      CLR => reset,
      D => waveform(7),
      Q => Q(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_clk_wiz_0_clk_wiz is
  port (
    clk_main : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_clk_wiz_0_clk_wiz : entity is "clk_wiz_0_clk_wiz";
end audioSys_0_clk_wiz_0_clk_wiz;

architecture STRUCTURE of audioSys_0_clk_wiz_0_clk_wiz is
  signal clk_main_clk_wiz_0 : STD_LOGIC;
  signal clk_out1_clk_wiz_0 : STD_LOGIC;
  signal clkfbout_buf_clk_wiz_0 : STD_LOGIC;
  signal clkfbout_clk_wiz_0 : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_ibufg : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufg : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufg : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufg : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_clk_wiz_0,
      O => clkfbout_buf_clk_wiz_0
    );
clkin1_ibufg: unisim.vcomponents.IBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_main,
      O => clk_main_clk_wiz_0
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out1_clk_wiz_0,
      O => clk_out1
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 48.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 10.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 78.125000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 1,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 5,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_clk_wiz_0,
      CLKFBOUT => clkfbout_clk_wiz_0,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_main_clk_wiz_0,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_out1_clk_wiz_0,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6) => '0',
      DADDR(5) => '0',
      DADDR(4) => '0',
      DADDR(3) => '0',
      DADDR(2) => '0',
      DADDR(1) => '0',
      DADDR(0) => '0',
      DCLK => '0',
      DEN => '0',
      DI(15) => '0',
      DI(14) => '0',
      DI(13) => '0',
      DI(12) => '0',
      DI(11) => '0',
      DI(10) => '0',
      DI(9) => '0',
      DI(8) => '0',
      DI(7) => '0',
      DI(6) => '0',
      DI(5) => '0',
      DI(4) => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_commandDecoder is
  port (
    double_transfer_reg_0 : out STD_LOGIC;
    div_en_reg : out STD_LOGIC;
    div_en_reg_0 : out STD_LOGIC;
    div_en_reg_1 : out STD_LOGIC;
    \data_reg[9]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \data_reg[9]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \data_reg[9]_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \atten_mag_stored_reg[0]\ : out STD_LOGIC;
    \data_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \received_byte_reg[6]\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    div_en_reg_2 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    div_en_reg_3 : in STD_LOGIC;
    \count_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    div_en_reg_4 : in STD_LOGIC;
    \count_reg[4]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \received_byte_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \received_byte_reg[7]\ : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_commandDecoder : entity is "commandDecoder";
end audioSys_0_commandDecoder;

architecture STRUCTURE of audioSys_0_commandDecoder is
  signal \data[9]_i_2_n_0\ : STD_LOGIC;
  signal \^double_transfer_reg_0\ : STD_LOGIC;
  signal \first_byte_reg_n_0_[5]\ : STD_LOGIC;
  signal \first_byte_reg_n_0_[6]\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \atten_mag_stored[3]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \data[9]_i_2\ : label is "soft_lutpair5";
begin
  double_transfer_reg_0 <= \^double_transfer_reg_0\;
\atten_mag_stored[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => \^double_transfer_reg_0\,
      O => \atten_mag_stored_reg[0]\
    );
\data[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => \data[9]_i_2_n_0\,
      I1 => p_1_in,
      I2 => \first_byte_reg_n_0_[6]\,
      I3 => \first_byte_reg_n_0_[5]\,
      I4 => div_en_reg_2,
      O => \data_reg[9]\(0)
    );
\data[9]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \data[9]_i_2_n_0\,
      I1 => \first_byte_reg_n_0_[6]\,
      I2 => p_1_in,
      I3 => \first_byte_reg_n_0_[5]\,
      I4 => div_en_reg_3,
      O => \data_reg[9]_0\(0)
    );
\data[9]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => \data[9]_i_2_n_0\,
      I1 => \first_byte_reg_n_0_[6]\,
      I2 => p_1_in,
      I3 => \first_byte_reg_n_0_[5]\,
      I4 => div_en_reg_4,
      O => \data_reg[9]_1\(0)
    );
\data[9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => \^double_transfer_reg_0\,
      O => \data[9]_i_2_n_0\
    );
div_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF0080"
    )
        port map (
      I0 => \data[9]_i_2_n_0\,
      I1 => p_1_in,
      I2 => \first_byte_reg_n_0_[6]\,
      I3 => \first_byte_reg_n_0_[5]\,
      I4 => div_en_reg_2,
      I5 => E(0),
      O => div_en_reg
    );
\div_en_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF2000"
    )
        port map (
      I0 => \data[9]_i_2_n_0\,
      I1 => \first_byte_reg_n_0_[6]\,
      I2 => p_1_in,
      I3 => \first_byte_reg_n_0_[5]\,
      I4 => div_en_reg_3,
      I5 => \count_reg[4]\(0),
      O => div_en_reg_0
    );
\div_en_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF0020"
    )
        port map (
      I0 => \data[9]_i_2_n_0\,
      I1 => \first_byte_reg_n_0_[6]\,
      I2 => p_1_in,
      I3 => \first_byte_reg_n_0_[5]\,
      I4 => div_en_reg_4,
      I5 => \count_reg[4]_0\(0),
      O => div_en_reg_1
    );
double_transfer_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \received_byte_reg[6]\,
      Q => \^double_transfer_reg_0\
    );
\first_byte_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \received_byte_reg[4]\(0),
      CLR => reset,
      D => \received_byte_reg[7]\(0),
      Q => \data_reg[3]\(0)
    );
\first_byte_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \received_byte_reg[4]\(0),
      CLR => reset,
      D => \received_byte_reg[7]\(1),
      Q => \data_reg[3]\(1)
    );
\first_byte_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \received_byte_reg[4]\(0),
      CLR => reset,
      D => \received_byte_reg[7]\(2),
      Q => \data_reg[3]\(2)
    );
\first_byte_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \received_byte_reg[4]\(0),
      CLR => reset,
      D => \received_byte_reg[7]\(3),
      Q => \data_reg[3]\(3)
    );
\first_byte_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \received_byte_reg[4]\(0),
      CLR => reset,
      D => \received_byte_reg[7]\(4),
      Q => \first_byte_reg_n_0_[5]\
    );
\first_byte_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \received_byte_reg[4]\(0),
      CLR => reset,
      D => \received_byte_reg[7]\(5),
      Q => \first_byte_reg_n_0_[6]\
    );
\first_byte_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \received_byte_reg[4]\(0),
      CLR => reset,
      D => \received_byte_reg[7]\(6),
      Q => p_1_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_counter is
  port (
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    remainder_preview : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \remainder_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset : in STD_LOGIC;
    remainder0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    div_en_reg : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \remainder_reg[6]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \remainder_reg[13]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \remainder_reg[14]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \remainder_reg[16]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \remainder_reg[15]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_counter : entity is "counter";
end audioSys_0_counter;

architecture STRUCTURE of audioSys_0_counter is
  signal \^co\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \count_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \remainder[16]_i_20_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_24_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_25_n_0\ : STD_LOGIC;
  signal \^remainder_preview\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \remainder_reg[16]_i_4_n_0\ : STD_LOGIC;
  signal \remainder_reg[16]_i_4_n_1\ : STD_LOGIC;
  signal \remainder_reg[16]_i_4_n_2\ : STD_LOGIC;
  signal \remainder_reg[16]_i_4_n_3\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8_n_0\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8_n_1\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8_n_2\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8_n_3\ : STD_LOGIC;
  signal \NLW_remainder_reg[16]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_remainder_reg[16]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_remainder_reg[16]_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_remainder_reg[16]_i_8_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__0\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \count[2]_i_1__0\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \count[3]_i_1__0\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \remainder[0]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \remainder[16]_i_25\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \step_size_curr[15]_i_1\ : label is "soft_lutpair68";
begin
  CO(0) <= \^co\(0);
  remainder_preview(0) <= \^remainder_preview\(0);
\count[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0\(0),
      O => p_0_in(0)
    );
\count[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D7"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0\(0),
      I2 => \count_reg__0\(1),
      O => p_0_in(1)
    );
\count[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A802"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0\(1),
      I2 => \count_reg__0\(0),
      I3 => \count_reg__0\(2),
      O => p_0_in(2)
    );
\count[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80002"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0\(2),
      I2 => \count_reg__0\(0),
      I3 => \count_reg__0\(1),
      I4 => \count_reg__0\(3),
      O => p_0_in(3)
    );
\count[4]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD55555557"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0\(3),
      I2 => \count_reg__0\(1),
      I3 => \count_reg__0\(0),
      I4 => \count_reg__0\(2),
      I5 => \count_reg__0\(4),
      O => p_0_in(4)
    );
\count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(0),
      Q => \count_reg__0\(0)
    );
\count_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(1),
      PRE => reset,
      Q => \count_reg__0\(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(2),
      Q => \count_reg__0\(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(3),
      Q => \count_reg__0\(3)
    );
\count_reg[4]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(4),
      PRE => reset,
      Q => \count_reg__0\(4)
    );
\remainder[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => remainder0(0),
      I1 => \^co\(0),
      I2 => div_en_reg,
      I3 => \^remainder_preview\(0),
      O => D(0)
    );
\remainder[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100101100051101"
    )
        port map (
      I0 => reset,
      I1 => \count_reg__0\(4),
      I2 => \count_reg__0\(3),
      I3 => \count_reg__0\(1),
      I4 => \count_reg__0\(0),
      I5 => \count_reg__0\(2),
      O => \^remainder_preview\(0)
    );
\remainder[16]_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"040D000C"
    )
        port map (
      I0 => Q(0),
      I1 => \remainder_reg[0]\(0),
      I2 => reset,
      I3 => Q(1),
      I4 => \remainder[16]_i_25_n_0\,
      O => \remainder[16]_i_20_n_0\
    );
\remainder[16]_i_24\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00823341"
    )
        port map (
      I0 => \remainder[16]_i_25_n_0\,
      I1 => Q(1),
      I2 => \remainder_reg[0]\(0),
      I3 => reset,
      I4 => Q(0),
      O => \remainder[16]_i_24_n_0\
    );
\remainder[16]_i_25\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10450351"
    )
        port map (
      I0 => \count_reg__0\(4),
      I1 => \count_reg__0\(3),
      I2 => \count_reg__0\(1),
      I3 => \count_reg__0\(0),
      I4 => \count_reg__0\(2),
      O => \remainder[16]_i_25_n_0\
    );
\remainder[3]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(0),
      I1 => \^remainder_preview\(0),
      O => S(0)
    );
\remainder_reg[16]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[16]_i_4_n_0\,
      CO(3 downto 1) => \NLW_remainder_reg[16]_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \^co\(0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => \remainder_reg[16]\(0),
      O(3 downto 0) => \NLW_remainder_reg[16]_i_2_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \remainder_reg[15]\(0)
    );
\remainder_reg[16]_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[16]_i_8_n_0\,
      CO(3) => \remainder_reg[16]_i_4_n_0\,
      CO(2) => \remainder_reg[16]_i_4_n_1\,
      CO(1) => \remainder_reg[16]_i_4_n_2\,
      CO(0) => \remainder_reg[16]_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \remainder_reg[13]\(3 downto 0),
      O(3 downto 0) => \NLW_remainder_reg[16]_i_4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => \remainder_reg[14]\(3 downto 0)
    );
\remainder_reg[16]_i_8\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \remainder_reg[16]_i_8_n_0\,
      CO(2) => \remainder_reg[16]_i_8_n_1\,
      CO(1) => \remainder_reg[16]_i_8_n_2\,
      CO(0) => \remainder_reg[16]_i_8_n_3\,
      CYINIT => '1',
      DI(3 downto 1) => DI(2 downto 0),
      DI(0) => \remainder[16]_i_20_n_0\,
      O(3 downto 0) => \NLW_remainder_reg[16]_i_8_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \remainder_reg[6]\(2 downto 0),
      S(0) => \remainder[16]_i_24_n_0\
    );
\step_size_curr[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \count_reg__0\(4),
      I1 => \count_reg__0\(3),
      I2 => \count_reg__0\(2),
      I3 => \count_reg__0\(1),
      I4 => \count_reg__0\(0),
      O => E(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_counterSCL is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \cs_reg[0]\ : out STD_LOGIC;
    sent_reg : out STD_LOGIC;
    SCL : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bitCount_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    byteAck_reg : out STD_LOGIC;
    \byteCount_reg[1]\ : out STD_LOGIC;
    \byteCount_reg[0]\ : out STD_LOGIC;
    SDA : inout STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    sent_reg_0 : in STD_LOGIC;
    byteAck_reg_0 : in STD_LOGIC;
    \byteCount_reg[1]_0\ : in STD_LOGIC;
    \byteCount_reg[0]_0\ : in STD_LOGIC;
    \bitCount_reg[3]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \cs_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \cs_reg[0]_0\ : in STD_LOGIC;
    \bitCount_reg[2]\ : in STD_LOGIC;
    \count_reg[4]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \cs_reg[1]_0\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_counterSCL : entity is "counterSCL";
end audioSys_0_counterSCL;

architecture STRUCTURE of audioSys_0_counterSCL is
  signal SCL_INST_0_i_1_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_1_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_3_n_0 : STD_LOGIC;
  signal \bitCount[3]_i_3__0_n_0\ : STD_LOGIC;
  signal byteAck0 : STD_LOGIC;
  signal byteAck_i_10_n_0 : STD_LOGIC;
  signal byteAck_i_11_n_0 : STD_LOGIC;
  signal byteAck_i_12_n_0 : STD_LOGIC;
  signal byteAck_i_13_n_0 : STD_LOGIC;
  signal byteAck_i_2_n_0 : STD_LOGIC;
  signal byteAck_i_4_n_0 : STD_LOGIC;
  signal byteAck_i_6_n_0 : STD_LOGIC;
  signal byteAck_i_7_n_0 : STD_LOGIC;
  signal byteAck_i_8_n_0 : STD_LOGIC;
  signal byteAck_i_9_n_0 : STD_LOGIC;
  signal \byteCount[1]_i_2_n_0\ : STD_LOGIC;
  signal \byteCount[1]_i_3_n_0\ : STD_LOGIC;
  signal \byteCount[1]_i_4_n_0\ : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal count1 : STD_LOGIC;
  signal \count[4]_i_2_n_0\ : STD_LOGIC;
  signal \count[4]_i_3_n_0\ : STD_LOGIC;
  signal \count[5]_i_2__0_n_0\ : STD_LOGIC;
  signal \count[7]_i_2_n_0\ : STD_LOGIC;
  signal \count[7]_i_3_n_0\ : STD_LOGIC;
  signal \count[7]_i_5_n_0\ : STD_LOGIC;
  signal \cs[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \cs[1]_i_3_n_0\ : STD_LOGIC;
  signal \^cs_reg[0]\ : STD_LOGIC;
  signal ns2 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of SCL_INST_0_i_1 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of SDA_INST_0_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of byteAck_i_10 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of byteAck_i_11 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of byteAck_i_12 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of byteAck_i_13 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of byteAck_i_9 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \byteCount[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \byteCount[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \byteCount[1]_i_4\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \count[5]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count[5]_i_2__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \count[6]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \count[7]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \count[7]_i_3\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \count[7]_i_4\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \count[7]_i_5\ : label is "soft_lutpair10";
begin
  \cs_reg[0]\ <= \^cs_reg[0]\;
SCL_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABABABABABABABB"
    )
        port map (
      I0 => Q(1),
      I1 => count(7),
      I2 => SCL_INST_0_i_1_n_0,
      I3 => count(2),
      I4 => count(4),
      I5 => count(3),
      O => SCL
    );
SCL_INST_0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => count(6),
      I1 => count(5),
      O => SCL_INST_0_i_1_n_0
    );
SDA_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => SDA_INST_0_i_1_n_0,
      I1 => \cs_reg[0]_0\,
      I2 => '0',
      I3 => '0',
      I4 => '0',
      I5 => '0',
      O => SDA
    );
SDA_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFA3F0A3"
    )
        port map (
      I0 => SDA_INST_0_i_3_n_0,
      I1 => \^cs_reg[0]\,
      I2 => Q(1),
      I3 => Q(0),
      I4 => \bitCount_reg[2]\,
      O => SDA_INST_0_i_1_n_0
    );
SDA_INST_0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFF00FF00FF00"
    )
        port map (
      I0 => count(4),
      I1 => count(2),
      I2 => count(3),
      I3 => count(7),
      I4 => count(6),
      I5 => count(5),
      O => SDA_INST_0_i_3_n_0
    );
SDA_INST_0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0444044404444444"
    )
        port map (
      I0 => \cs_reg[1]\(1),
      I1 => \cs_reg[1]\(0),
      I2 => \count_reg[4]_0\(2),
      I3 => \count_reg[4]_0\(3),
      I4 => \count_reg[4]_0\(0),
      I5 => \count_reg[4]_0\(1),
      O => \^cs_reg[0]\
    );
\bitCount[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FDDDDDDD"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => count(7),
      I3 => \bitCount[3]_i_3__0_n_0\,
      I4 => count(6),
      O => \bitCount_reg[0]\(0)
    );
\bitCount[3]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => count(3),
      I1 => count(0),
      I2 => count(2),
      I3 => count(1),
      I4 => count(5),
      I5 => count(4),
      O => \bitCount[3]_i_3__0_n_0\
    );
byteAck_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AFFF0000AC0C"
    )
        port map (
      I0 => byteAck_i_2_n_0,
      I1 => byteAck0,
      I2 => count(7),
      I3 => byteAck_i_4_n_0,
      I4 => \cs_reg[1]_0\,
      I5 => byteAck_reg_0,
      O => byteAck_reg
    );
byteAck_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => count(0),
      I1 => count(2),
      I2 => count(1),
      O => byteAck_i_10_n_0
    );
byteAck_i_11: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5D"
    )
        port map (
      I0 => count(5),
      I1 => count(3),
      I2 => count(4),
      O => byteAck_i_11_n_0
    );
byteAck_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00BF"
    )
        port map (
      I0 => count(1),
      I1 => count(2),
      I2 => count(0),
      I3 => byteAck_i_7_n_0,
      O => byteAck_i_12_n_0
    );
byteAck_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      I2 => count(3),
      I3 => count(2),
      O => byteAck_i_13_n_0
    );
byteAck_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => byteAck_i_6_n_0,
      I1 => SDA,
      O => byteAck_i_2_n_0
    );
byteAck_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => SDA,
      I1 => byteAck_i_7_n_0,
      O => byteAck0
    );
byteAck_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00002000"
    )
        port map (
      I0 => byteAck_i_8_n_0,
      I1 => byteAck_i_9_n_0,
      I2 => count(6),
      I3 => byteAck_i_10_n_0,
      I4 => byteAck_i_11_n_0,
      I5 => byteAck0,
      O => byteAck_i_4_n_0
    );
byteAck_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"04000000FFFBFFFF"
    )
        port map (
      I0 => count(4),
      I1 => count(5),
      I2 => count(3),
      I3 => byteAck_i_12_n_0,
      I4 => count(6),
      I5 => byteAck_i_7_n_0,
      O => byteAck_i_6_n_0
    );
byteAck_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFD"
    )
        port map (
      I0 => \bitCount_reg[3]\(0),
      I1 => byteAck_i_13_n_0,
      I2 => count(6),
      I3 => count(7),
      I4 => count(5),
      I5 => count(4),
      O => byteAck_i_7_n_0
    );
byteAck_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => byteAck_reg_0,
      I1 => byteAck_i_7_n_0,
      I2 => SDA,
      O => byteAck_i_8_n_0
    );
byteAck_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => count(4),
      I1 => count(5),
      O => byteAck_i_9_n_0
    );
\byteCount[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F20"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => \byteCount[1]_i_2_n_0\,
      I3 => \byteCount_reg[0]_0\,
      O => \byteCount_reg[0]\
    );
\byteCount[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04FF0800"
    )
        port map (
      I0 => \byteCount_reg[0]_0\,
      I1 => Q(0),
      I2 => Q(1),
      I3 => \byteCount[1]_i_2_n_0\,
      I4 => \byteCount_reg[1]_0\,
      O => \byteCount_reg[1]\
    );
\byteCount[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFDDFFFFDDDDDDDD"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => count(1),
      I3 => count(0),
      I4 => count(2),
      I5 => \byteCount[1]_i_3_n_0\,
      O => \byteCount[1]_i_2_n_0\
    );
\byteCount[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => byteAck_i_11_n_0,
      I1 => \byteCount[1]_i_4_n_0\,
      I2 => byteAck_i_9_n_0,
      I3 => byteAck_reg_0,
      I4 => count(7),
      I5 => count(6),
      O => \byteCount[1]_i_3_n_0\
    );
\byteCount[1]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => count(1),
      I1 => count(2),
      O => \byteCount[1]_i_4_n_0\
    );
\count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => count(0),
      I1 => \count[7]_i_3_n_0\,
      I2 => count1,
      O => p_0_in(0)
    );
\count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0006"
    )
        port map (
      I0 => count(0),
      I1 => count(1),
      I2 => \count[7]_i_3_n_0\,
      I3 => count1,
      O => p_0_in(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000078"
    )
        port map (
      I0 => count(0),
      I1 => count(1),
      I2 => count(2),
      I3 => \count[7]_i_3_n_0\,
      I4 => count1,
      O => p_0_in(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000007F80"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      I2 => count(2),
      I3 => count(3),
      I4 => \count[7]_i_3_n_0\,
      I5 => count1,
      O => p_0_in(3)
    );
\count[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => \cs_reg[1]\(0),
      I1 => \cs_reg[1]\(1),
      I2 => \count[4]_i_3_n_0\,
      O => E(0)
    );
\count[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000007F80"
    )
        port map (
      I0 => count(2),
      I1 => \count[4]_i_2_n_0\,
      I2 => count(3),
      I3 => count(4),
      I4 => \count[7]_i_3_n_0\,
      I5 => count1,
      O => p_0_in(4)
    );
\count[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      O => \count[4]_i_2_n_0\
    );
\count[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004045"
    )
        port map (
      I0 => Q(0),
      I1 => count1,
      I2 => Q(1),
      I3 => \^cs_reg[0]\,
      I4 => sent_reg_0,
      O => \count[4]_i_3_n_0\
    );
\count[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0006"
    )
        port map (
      I0 => \count[5]_i_2__0_n_0\,
      I1 => count(5),
      I2 => \count[7]_i_3_n_0\,
      I3 => count1,
      O => p_0_in(5)
    );
\count[5]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => count(4),
      I1 => count(2),
      I2 => count(0),
      I3 => count(1),
      I4 => count(3),
      O => \count[5]_i_2__0_n_0\
    );
\count[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0006"
    )
        port map (
      I0 => \count[7]_i_2_n_0\,
      I1 => count(6),
      I2 => \count[7]_i_3_n_0\,
      I3 => count1,
      O => p_0_in(6)
    );
\count[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000078"
    )
        port map (
      I0 => \count[7]_i_2_n_0\,
      I1 => count(6),
      I2 => count(7),
      I3 => \count[7]_i_3_n_0\,
      I4 => count1,
      O => p_0_in(7)
    );
\count[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => count(5),
      I1 => count(3),
      I2 => count(1),
      I3 => count(0),
      I4 => count(2),
      I5 => count(4),
      O => \count[7]_i_2_n_0\
    );
\count[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C1"
    )
        port map (
      I0 => \^cs_reg[0]\,
      I1 => Q(1),
      I2 => Q(0),
      O => \count[7]_i_3_n_0\
    );
\count[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \count[7]_i_5_n_0\,
      I1 => count(5),
      I2 => count(3),
      I3 => count(4),
      O => count1
    );
\count[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => count(0),
      I1 => count(2),
      I2 => count(1),
      I3 => count(6),
      I4 => count(7),
      O => \count[7]_i_5_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(0),
      Q => count(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(1),
      Q => count(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(2),
      Q => count(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(3),
      Q => count(3)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(4),
      Q => count(4)
    );
\count_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(5),
      Q => count(5)
    );
\count_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(6),
      Q => count(6)
    );
\count_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(7),
      Q => count(7)
    );
\cs[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000020FF20"
    )
        port map (
      I0 => \cs[0]_i_2__0_n_0\,
      I1 => SCL_INST_0_i_1_n_0,
      I2 => \^cs_reg[0]\,
      I3 => Q(0),
      I4 => ns2,
      I5 => Q(1),
      O => D(0)
    );
\cs[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      I2 => count(7),
      I3 => count(4),
      I4 => count(2),
      I5 => count(3),
      O => \cs[0]_i_2__0_n_0\
    );
\cs[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0838"
    )
        port map (
      I0 => ns2,
      I1 => Q(0),
      I2 => Q(1),
      I3 => count1,
      O => D(1)
    );
\cs[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => SCL_INST_0_i_1_n_0,
      I1 => count(1),
      I2 => count(0),
      I3 => \cs[1]_i_3_n_0\,
      I4 => byteAck_reg_0,
      I5 => \byteCount_reg[1]_0\,
      O => ns2
    );
\cs[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => \byteCount_reg[0]_0\,
      I1 => \bitCount_reg[3]\(0),
      I2 => count(4),
      I3 => count(7),
      I4 => count(3),
      I5 => count(2),
      O => \cs[1]_i_3_n_0\
    );
\sent_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000D10000"
    )
        port map (
      I0 => \^cs_reg[0]\,
      I1 => Q(1),
      I2 => count1,
      I3 => Q(0),
      I4 => \cs_reg[1]\(0),
      I5 => \cs_reg[1]\(1),
      O => sent_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_counter_4 is
  port (
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    remainder_preview : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \remainder_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset : in STD_LOGIC;
    remainder0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    div_en_reg : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \remainder_reg[6]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \remainder_reg[13]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \remainder_reg[14]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \remainder_reg[16]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \remainder_reg[15]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_counter_4 : entity is "counter";
end audioSys_0_counter_4;

architecture STRUCTURE of audioSys_0_counter_4 is
  signal \^co\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \count_reg__0__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \remainder[16]_i_20__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_24__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_25__0_n_0\ : STD_LOGIC;
  signal \^remainder_preview\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \remainder_reg[16]_i_4__0_n_0\ : STD_LOGIC;
  signal \remainder_reg[16]_i_4__0_n_1\ : STD_LOGIC;
  signal \remainder_reg[16]_i_4__0_n_2\ : STD_LOGIC;
  signal \remainder_reg[16]_i_4__0_n_3\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8__0_n_0\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8__0_n_1\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8__0_n_2\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8__0_n_3\ : STD_LOGIC;
  signal \NLW_remainder_reg[16]_i_2__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_remainder_reg[16]_i_2__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_remainder_reg[16]_i_4__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_remainder_reg[16]_i_8__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \count[2]_i_1__1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \count[3]_i_1__1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \remainder[0]_i_1__0\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \remainder[16]_i_25__0\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \step_size_curr[15]_i_1__0\ : label is "soft_lutpair57";
begin
  CO(0) <= \^co\(0);
  remainder_preview(0) <= \^remainder_preview\(0);
\count[0]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0__0\(0),
      O => p_0_in(0)
    );
\count[1]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D7"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0__0\(0),
      I2 => \count_reg__0__0\(1),
      O => p_0_in(1)
    );
\count[2]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A802"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0__0\(1),
      I2 => \count_reg__0__0\(0),
      I3 => \count_reg__0__0\(2),
      O => p_0_in(2)
    );
\count[3]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80002"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0__0\(2),
      I2 => \count_reg__0__0\(0),
      I3 => \count_reg__0__0\(1),
      I4 => \count_reg__0__0\(3),
      O => p_0_in(3)
    );
\count[4]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD55555557"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0__0\(3),
      I2 => \count_reg__0__0\(1),
      I3 => \count_reg__0__0\(0),
      I4 => \count_reg__0__0\(2),
      I5 => \count_reg__0__0\(4),
      O => p_0_in(4)
    );
\count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(0),
      Q => \count_reg__0__0\(0)
    );
\count_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(1),
      PRE => reset,
      Q => \count_reg__0__0\(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(2),
      Q => \count_reg__0__0\(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(3),
      Q => \count_reg__0__0\(3)
    );
\count_reg[4]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(4),
      PRE => reset,
      Q => \count_reg__0__0\(4)
    );
\remainder[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => remainder0(0),
      I1 => \^co\(0),
      I2 => div_en_reg,
      I3 => \^remainder_preview\(0),
      O => D(0)
    );
\remainder[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100101100051101"
    )
        port map (
      I0 => reset,
      I1 => \count_reg__0__0\(4),
      I2 => \count_reg__0__0\(3),
      I3 => \count_reg__0__0\(1),
      I4 => \count_reg__0__0\(0),
      I5 => \count_reg__0__0\(2),
      O => \^remainder_preview\(0)
    );
\remainder[16]_i_20__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"040D000C"
    )
        port map (
      I0 => Q(0),
      I1 => \remainder_reg[0]\(0),
      I2 => reset,
      I3 => Q(1),
      I4 => \remainder[16]_i_25__0_n_0\,
      O => \remainder[16]_i_20__0_n_0\
    );
\remainder[16]_i_24__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00823341"
    )
        port map (
      I0 => \remainder[16]_i_25__0_n_0\,
      I1 => Q(1),
      I2 => \remainder_reg[0]\(0),
      I3 => reset,
      I4 => Q(0),
      O => \remainder[16]_i_24__0_n_0\
    );
\remainder[16]_i_25__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10450351"
    )
        port map (
      I0 => \count_reg__0__0\(4),
      I1 => \count_reg__0__0\(3),
      I2 => \count_reg__0__0\(1),
      I3 => \count_reg__0__0\(0),
      I4 => \count_reg__0__0\(2),
      O => \remainder[16]_i_25__0_n_0\
    );
\remainder[3]_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(0),
      I1 => \^remainder_preview\(0),
      O => S(0)
    );
\remainder_reg[16]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[16]_i_4__0_n_0\,
      CO(3 downto 1) => \NLW_remainder_reg[16]_i_2__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \^co\(0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => \remainder_reg[16]\(0),
      O(3 downto 0) => \NLW_remainder_reg[16]_i_2__0_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \remainder_reg[15]\(0)
    );
\remainder_reg[16]_i_4__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[16]_i_8__0_n_0\,
      CO(3) => \remainder_reg[16]_i_4__0_n_0\,
      CO(2) => \remainder_reg[16]_i_4__0_n_1\,
      CO(1) => \remainder_reg[16]_i_4__0_n_2\,
      CO(0) => \remainder_reg[16]_i_4__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \remainder_reg[13]\(3 downto 0),
      O(3 downto 0) => \NLW_remainder_reg[16]_i_4__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => \remainder_reg[14]\(3 downto 0)
    );
\remainder_reg[16]_i_8__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \remainder_reg[16]_i_8__0_n_0\,
      CO(2) => \remainder_reg[16]_i_8__0_n_1\,
      CO(1) => \remainder_reg[16]_i_8__0_n_2\,
      CO(0) => \remainder_reg[16]_i_8__0_n_3\,
      CYINIT => '1',
      DI(3 downto 1) => DI(2 downto 0),
      DI(0) => \remainder[16]_i_20__0_n_0\,
      O(3 downto 0) => \NLW_remainder_reg[16]_i_8__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \remainder_reg[6]\(2 downto 0),
      S(0) => \remainder[16]_i_24__0_n_0\
    );
\step_size_curr[15]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \count_reg__0__0\(4),
      I1 => \count_reg__0__0\(3),
      I2 => \count_reg__0__0\(2),
      I3 => \count_reg__0__0\(1),
      I4 => \count_reg__0__0\(0),
      O => E(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_counter_7 is
  port (
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    remainder_preview : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \remainder_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset : in STD_LOGIC;
    remainder0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    div_en_reg : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \remainder_reg[6]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \remainder_reg[13]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \remainder_reg[14]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \remainder_reg[16]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \remainder_reg[15]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_counter_7 : entity is "counter";
end audioSys_0_counter_7;

architecture STRUCTURE of audioSys_0_counter_7 is
  signal \^co\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \count_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \remainder[16]_i_20__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_24__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_25__1_n_0\ : STD_LOGIC;
  signal \^remainder_preview\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \remainder_reg[16]_i_4__1_n_0\ : STD_LOGIC;
  signal \remainder_reg[16]_i_4__1_n_1\ : STD_LOGIC;
  signal \remainder_reg[16]_i_4__1_n_2\ : STD_LOGIC;
  signal \remainder_reg[16]_i_4__1_n_3\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8__1_n_0\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8__1_n_1\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8__1_n_2\ : STD_LOGIC;
  signal \remainder_reg[16]_i_8__1_n_3\ : STD_LOGIC;
  signal \NLW_remainder_reg[16]_i_2__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_remainder_reg[16]_i_2__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_remainder_reg[16]_i_4__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_remainder_reg[16]_i_8__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__2\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \count[2]_i_1__2\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \count[3]_i_1__2\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \remainder[0]_i_1__1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \remainder[16]_i_25__1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \step_size_curr[15]_i_1__1\ : label is "soft_lutpair46";
begin
  CO(0) <= \^co\(0);
  remainder_preview(0) <= \^remainder_preview\(0);
\count[0]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0\(0),
      O => p_0_in(0)
    );
\count[1]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D7"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0\(0),
      I2 => \count_reg__0\(1),
      O => p_0_in(1)
    );
\count[2]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A802"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0\(1),
      I2 => \count_reg__0\(0),
      I3 => \count_reg__0\(2),
      O => p_0_in(2)
    );
\count[3]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80002"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0\(2),
      I2 => \count_reg__0\(0),
      I3 => \count_reg__0\(1),
      I4 => \count_reg__0\(3),
      O => p_0_in(3)
    );
\count[4]_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD55555557"
    )
        port map (
      I0 => div_en_reg,
      I1 => \count_reg__0\(3),
      I2 => \count_reg__0\(1),
      I3 => \count_reg__0\(0),
      I4 => \count_reg__0\(2),
      I5 => \count_reg__0\(4),
      O => p_0_in(4)
    );
\count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(0),
      Q => \count_reg__0\(0)
    );
\count_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(1),
      PRE => reset,
      Q => \count_reg__0\(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(2),
      Q => \count_reg__0\(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => p_0_in(3),
      Q => \count_reg__0\(3)
    );
\count_reg[4]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(4),
      PRE => reset,
      Q => \count_reg__0\(4)
    );
\remainder[0]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => remainder0(0),
      I1 => \^co\(0),
      I2 => div_en_reg,
      I3 => \^remainder_preview\(0),
      O => D(0)
    );
\remainder[0]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100101100051101"
    )
        port map (
      I0 => reset,
      I1 => \count_reg__0\(4),
      I2 => \count_reg__0\(3),
      I3 => \count_reg__0\(1),
      I4 => \count_reg__0\(0),
      I5 => \count_reg__0\(2),
      O => \^remainder_preview\(0)
    );
\remainder[16]_i_20__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"040D000C"
    )
        port map (
      I0 => Q(0),
      I1 => \remainder_reg[0]\(0),
      I2 => reset,
      I3 => Q(1),
      I4 => \remainder[16]_i_25__1_n_0\,
      O => \remainder[16]_i_20__1_n_0\
    );
\remainder[16]_i_24__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00823341"
    )
        port map (
      I0 => \remainder[16]_i_25__1_n_0\,
      I1 => Q(1),
      I2 => \remainder_reg[0]\(0),
      I3 => reset,
      I4 => Q(0),
      O => \remainder[16]_i_24__1_n_0\
    );
\remainder[16]_i_25__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10450351"
    )
        port map (
      I0 => \count_reg__0\(4),
      I1 => \count_reg__0\(3),
      I2 => \count_reg__0\(1),
      I3 => \count_reg__0\(0),
      I4 => \count_reg__0\(2),
      O => \remainder[16]_i_25__1_n_0\
    );
\remainder[3]_i_9__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(0),
      I1 => \^remainder_preview\(0),
      O => S(0)
    );
\remainder_reg[16]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[16]_i_4__1_n_0\,
      CO(3 downto 1) => \NLW_remainder_reg[16]_i_2__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \^co\(0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => \remainder_reg[16]\(0),
      O(3 downto 0) => \NLW_remainder_reg[16]_i_2__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \remainder_reg[15]\(0)
    );
\remainder_reg[16]_i_4__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[16]_i_8__1_n_0\,
      CO(3) => \remainder_reg[16]_i_4__1_n_0\,
      CO(2) => \remainder_reg[16]_i_4__1_n_1\,
      CO(1) => \remainder_reg[16]_i_4__1_n_2\,
      CO(0) => \remainder_reg[16]_i_4__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \remainder_reg[13]\(3 downto 0),
      O(3 downto 0) => \NLW_remainder_reg[16]_i_4__1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => \remainder_reg[14]\(3 downto 0)
    );
\remainder_reg[16]_i_8__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \remainder_reg[16]_i_8__1_n_0\,
      CO(2) => \remainder_reg[16]_i_8__1_n_1\,
      CO(1) => \remainder_reg[16]_i_8__1_n_2\,
      CO(0) => \remainder_reg[16]_i_8__1_n_3\,
      CYINIT => '1',
      DI(3 downto 1) => DI(2 downto 0),
      DI(0) => \remainder[16]_i_20__1_n_0\,
      O(3 downto 0) => \NLW_remainder_reg[16]_i_8__1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \remainder_reg[6]\(2 downto 0),
      S(0) => \remainder[16]_i_24__1_n_0\
    );
\step_size_curr[15]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \count_reg__0\(4),
      I1 => \count_reg__0\(3),
      I2 => \count_reg__0\(2),
      I3 => \count_reg__0\(1),
      I4 => \count_reg__0\(0),
      O => E(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_regReceiver is
  port (
    \received_byte_reg[0]_0\ : out STD_LOGIC;
    \received_byte_reg[0]_1\ : out STD_LOGIC;
    atten_enable : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \first_byte_reg[7]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    double_transfer_reg : out STD_LOGIC;
    MREQ_N : in STD_LOGIC;
    WR_N : in STD_LOGIC;
    addr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    \cs_reg[0]\ : in STD_LOGIC;
    double_transfer_reg_0 : in STD_LOGIC;
    \cs_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_regReceiver : entity is "regReceiver";
end audioSys_0_regReceiver;

architecture STRUCTURE of audioSys_0_regReceiver is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal activated : STD_LOGIC;
  signal \^received_byte_reg[0]_0\ : STD_LOGIC;
  signal \^received_byte_reg[0]_1\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \atten_mag_stored[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \atten_mag_stored[3]_i_1__0\ : label is "soft_lutpair6";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  \received_byte_reg[0]_0\ <= \^received_byte_reg[0]_0\;
  \received_byte_reg[0]_1\ <= \^received_byte_reg[0]_1\;
\atten_mag_stored[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(6),
      I2 => \^q\(4),
      I3 => \^q\(5),
      I4 => \cs_reg[0]\,
      O => atten_enable(0)
    );
\atten_mag_stored[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(6),
      I2 => \^q\(4),
      I3 => \^q\(5),
      I4 => \cs_reg[0]\,
      O => atten_enable(1)
    );
\atten_mag_stored[3]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(7),
      I2 => \^q\(4),
      I3 => \^q\(5),
      I4 => \cs_reg[0]\,
      O => atten_enable(2)
    );
double_transfer_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF000007FF00"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(5),
      I2 => \^q\(4),
      I3 => double_transfer_reg_0,
      I4 => \cs_reg[1]\(1),
      I5 => \cs_reg[1]\(0),
      O => double_transfer_reg
    );
\first_byte[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000150000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(5),
      I2 => \^q\(6),
      I3 => double_transfer_reg_0,
      I4 => \cs_reg[1]\(1),
      I5 => \cs_reg[1]\(0),
      O => \first_byte_reg[7]\(0)
    );
\received_byte[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^received_byte_reg[0]_1\,
      I1 => \^received_byte_reg[0]_0\,
      O => activated
    );
\received_byte[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => addr(5),
      I1 => addr(4),
      I2 => addr(8),
      I3 => addr(9),
      I4 => addr(6),
      I5 => addr(7),
      O => \^received_byte_reg[0]_1\
    );
\received_byte[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => MREQ_N,
      I1 => WR_N,
      I2 => addr(2),
      I3 => addr(3),
      I4 => addr(1),
      I5 => addr(0),
      O => \^received_byte_reg[0]_0\
    );
\received_byte_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => activated,
      CLR => reset,
      D => data(0),
      Q => \^q\(0)
    );
\received_byte_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => activated,
      CLR => reset,
      D => data(1),
      Q => \^q\(1)
    );
\received_byte_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => activated,
      CLR => reset,
      D => data(2),
      Q => \^q\(2)
    );
\received_byte_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => activated,
      CLR => reset,
      D => data(3),
      Q => \^q\(3)
    );
\received_byte_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => activated,
      CLR => reset,
      D => data(4),
      Q => \^q\(4)
    );
\received_byte_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => activated,
      CLR => reset,
      D => data(5),
      Q => \^q\(5)
    );
\received_byte_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => activated,
      CLR => reset,
      D => data(6),
      Q => \^q\(6)
    );
\received_byte_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => activated,
      CLR => reset,
      D => data(7),
      Q => \^q\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_serialInterface is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    SDATA : out STD_LOGIC;
    step : out STD_LOGIC;
    LRCLK : out STD_LOGIC;
    atten_valid_freq : in STD_LOGIC_VECTOR ( 2 downto 0 );
    atten_valid : in STD_LOGIC;
    \waveform_atten_freq_reg[0]\ : in STD_LOGIC;
    \waveform_atten_freq_reg[0]_0\ : in STD_LOGIC;
    \waveform_atten_freq_reg[0]_1\ : in STD_LOGIC;
    \cs_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CLK : in STD_LOGIC;
    reset : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_serialInterface : entity is "serialInterface";
end audioSys_0_serialInterface;

architecture STRUCTURE of audioSys_0_serialInterface is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal SDATA_INST_0_i_1_n_0 : STD_LOGIC;
  signal bitCount : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal bitCount1 : STD_LOGIC;
  signal \bitCount[0]_i_1_n_0\ : STD_LOGIC;
  signal \bitCount[1]_i_1_n_0\ : STD_LOGIC;
  signal \bitCount[2]_i_1_n_0\ : STD_LOGIC;
  signal \bitCount[3]_i_1_n_0\ : STD_LOGIC;
  signal \bitCount[3]_i_2_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__6_n_0\ : STD_LOGIC;
  signal \count[2]_i_1__3_n_0\ : STD_LOGIC;
  signal \count[3]_i_1__3_n_0\ : STD_LOGIC;
  signal \count[4]_i_1__4_n_0\ : STD_LOGIC;
  signal \count[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \count[5]_i_2_n_0\ : STD_LOGIC;
  signal count_reg : STD_LOGIC_VECTOR ( 5 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of LRCLK_INST_0 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \count[3]_i_1__3\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \count[5]_i_1__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \count[5]_i_2\ : label is "soft_lutpair26";
begin
  Q(0) <= \^q\(0);
LRCLK_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_reg(5),
      O => LRCLK
    );
SDATA_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => bitCount(3),
      I1 => SDATA_INST_0_i_1_n_0,
      I2 => count_reg(4),
      O => SDATA
    );
SDATA_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000004114"
    )
        port map (
      I0 => bitCount(1),
      I1 => \waveform_atten_freq_reg[0]\,
      I2 => \waveform_atten_freq_reg[0]_0\,
      I3 => \waveform_atten_freq_reg[0]_1\,
      I4 => bitCount(0),
      I5 => bitCount(2),
      O => SDATA_INST_0_i_1_n_0
    );
\bitCount[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF01FFFF"
    )
        port map (
      I0 => atten_valid_freq(1),
      I1 => atten_valid_freq(0),
      I2 => atten_valid_freq(2),
      I3 => bitCount1,
      I4 => bitCount(0),
      O => \bitCount[0]_i_1_n_0\
    );
\bitCount[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF01FF01FFFF"
    )
        port map (
      I0 => atten_valid_freq(1),
      I1 => atten_valid_freq(0),
      I2 => atten_valid_freq(2),
      I3 => bitCount1,
      I4 => bitCount(0),
      I5 => bitCount(1),
      O => \bitCount[1]_i_1_n_0\
    );
\bitCount[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDDDDF"
    )
        port map (
      I0 => atten_valid,
      I1 => bitCount1,
      I2 => bitCount(1),
      I3 => bitCount(0),
      I4 => bitCount(2),
      O => \bitCount[2]_i_1_n_0\
    );
\bitCount[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF01FFFF"
    )
        port map (
      I0 => atten_valid_freq(1),
      I1 => atten_valid_freq(0),
      I2 => atten_valid_freq(2),
      I3 => bitCount1,
      I4 => count_reg(4),
      O => \bitCount[3]_i_1_n_0\
    );
\bitCount[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFDDDDDDDDF"
    )
        port map (
      I0 => atten_valid,
      I1 => bitCount1,
      I2 => bitCount(2),
      I3 => bitCount(0),
      I4 => bitCount(1),
      I5 => bitCount(3),
      O => \bitCount[3]_i_2_n_0\
    );
\bitCount[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => count_reg(2),
      I1 => count_reg(3),
      I2 => \^q\(0),
      I3 => count_reg(1),
      I4 => count_reg(4),
      O => bitCount1
    );
\bitCount_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => \bitCount[3]_i_1_n_0\,
      D => \bitCount[0]_i_1_n_0\,
      PRE => reset,
      Q => bitCount(0)
    );
\bitCount_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => \bitCount[3]_i_1_n_0\,
      D => \bitCount[1]_i_1_n_0\,
      PRE => reset,
      Q => bitCount(1)
    );
\bitCount_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => \bitCount[3]_i_1_n_0\,
      D => \bitCount[2]_i_1_n_0\,
      PRE => reset,
      Q => bitCount(2)
    );
\bitCount_reg[3]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => \bitCount[3]_i_1_n_0\,
      D => \bitCount[3]_i_2_n_0\,
      PRE => reset,
      Q => bitCount(3)
    );
\count[1]_i_1__6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6666666F"
    )
        port map (
      I0 => count_reg(1),
      I1 => \^q\(0),
      I2 => atten_valid_freq(1),
      I3 => atten_valid_freq(0),
      I4 => atten_valid_freq(2),
      O => \count[1]_i_1__6_n_0\
    );
\count[2]_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A6A6A6A6A6A6AFF"
    )
        port map (
      I0 => count_reg(2),
      I1 => count_reg(1),
      I2 => \^q\(0),
      I3 => atten_valid_freq(1),
      I4 => atten_valid_freq(0),
      I5 => atten_valid_freq(2),
      O => \count[2]_i_1__3_n_0\
    );
\count[3]_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAFFFF"
    )
        port map (
      I0 => count_reg(3),
      I1 => count_reg(2),
      I2 => \^q\(0),
      I3 => count_reg(1),
      I4 => atten_valid,
      O => \count[3]_i_1__3_n_0\
    );
\count[4]_i_1__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAFFFFFFFF"
    )
        port map (
      I0 => count_reg(4),
      I1 => count_reg(3),
      I2 => count_reg(1),
      I3 => \^q\(0),
      I4 => count_reg(2),
      I5 => atten_valid,
      O => \count[4]_i_1__4_n_0\
    );
\count[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAFFFF"
    )
        port map (
      I0 => count_reg(5),
      I1 => count_reg(4),
      I2 => \count[5]_i_2_n_0\,
      I3 => count_reg(3),
      I4 => atten_valid,
      O => \count[5]_i_1__0_n_0\
    );
\count[5]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_reg(2),
      I1 => \^q\(0),
      I2 => count_reg(1),
      O => \count[5]_i_2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(0),
      PRE => reset,
      Q => \^q\(0)
    );
\count_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[1]_i_1__6_n_0\,
      PRE => reset,
      Q => count_reg(1)
    );
\count_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[2]_i_1__3_n_0\,
      PRE => reset,
      Q => count_reg(2)
    );
\count_reg[3]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[3]_i_1__3_n_0\,
      PRE => reset,
      Q => count_reg(3)
    );
\count_reg[4]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[4]_i_1__4_n_0\,
      PRE => reset,
      Q => count_reg(4)
    );
\count_reg[5]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[5]_i_1__0_n_0\,
      PRE => reset,
      Q => count_reg(5)
    );
sent_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => \cs_reg[1]\(0),
      I1 => count_reg(3),
      I2 => count_reg(5),
      I3 => count_reg(4),
      I4 => \count[5]_i_2_n_0\,
      I5 => \cs_reg[1]\(1),
      O => step
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_waveGen is
  port (
    \waveform_base_reg[15]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \cs_reg[1]\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    \cs_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_waveGen : entity is "waveGen";
end audioSys_0_waveGen;

architecture STRUCTURE of audioSys_0_waveGen is
  signal status : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \status[0]_i_10_n_0\ : STD_LOGIC;
  signal \status[0]_i_11_n_0\ : STD_LOGIC;
  signal \status[0]_i_12_n_0\ : STD_LOGIC;
  signal \status[0]_i_1_n_0\ : STD_LOGIC;
  signal \status[0]_i_5_n_0\ : STD_LOGIC;
  signal \status[0]_i_6_n_0\ : STD_LOGIC;
  signal \status[0]_i_7_n_0\ : STD_LOGIC;
  signal \status[0]_i_8_n_0\ : STD_LOGIC;
  signal \status[0]_i_9_n_0\ : STD_LOGIC;
  signal \status_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \status_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \status_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \status_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \status_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \status_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \status_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \status_reg[0]_i_4_n_1\ : STD_LOGIC;
  signal \status_reg[0]_i_4_n_2\ : STD_LOGIC;
  signal \status_reg[0]_i_4_n_3\ : STD_LOGIC;
  signal \status_reg[0]_i_4_n_4\ : STD_LOGIC;
  signal \status_reg[0]_i_4_n_5\ : STD_LOGIC;
  signal \status_reg[0]_i_4_n_6\ : STD_LOGIC;
  signal \status_reg[0]_i_4_n_7\ : STD_LOGIC;
  signal waveform : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \waveform[11]_i_10_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_11_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_4_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_5_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_6_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_7_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_8_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_9_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_10_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_11_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_4_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_5_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_6_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_7_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_8_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_9_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_10_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_11_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_4_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_5_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_6_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_7_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_8_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_9_n_0\ : STD_LOGIC;
  signal \^waveform_base_reg[15]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \waveform_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2_n_1\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2_n_2\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2_n_3\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2_n_4\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2_n_5\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2_n_6\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2_n_7\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3_n_0\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3_n_1\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3_n_2\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3_n_3\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3_n_4\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3_n_5\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3_n_6\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3_n_7\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2_n_1\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2_n_2\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2_n_3\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2_n_4\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2_n_5\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2_n_6\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2_n_7\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3_n_1\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3_n_2\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3_n_3\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3_n_4\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3_n_5\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3_n_6\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3_n_7\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2_n_1\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2_n_2\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2_n_3\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2_n_4\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2_n_5\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2_n_6\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2_n_7\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3_n_1\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3_n_2\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3_n_3\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3_n_4\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3_n_5\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3_n_6\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3_n_7\ : STD_LOGIC;
  signal \waveform_reg_n_0_[0]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[1]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[2]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[3]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[4]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[5]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[6]\ : STD_LOGIC;
  signal \NLW_status_reg[0]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_status_reg[0]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
  \waveform_base_reg[15]\(8 downto 0) <= \^waveform_base_reg[15]\(8 downto 0);
\status[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEFF0050"
    )
        port map (
      I0 => \cs_reg[1]\,
      I1 => \status_reg[0]_i_3_n_4\,
      I2 => \status_reg[0]_i_4_n_4\,
      I3 => \^waveform_base_reg[15]\(8),
      I4 => status(0),
      O => \status[0]_i_1_n_0\
    );
\status[0]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(7),
      I1 => Q(14),
      O => \status[0]_i_10_n_0\
    );
\status[0]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(6),
      I1 => Q(13),
      O => \status[0]_i_11_n_0\
    );
\status[0]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(5),
      I1 => Q(12),
      O => \status[0]_i_12_n_0\
    );
\status[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(15),
      I1 => \^waveform_base_reg[15]\(8),
      O => \status[0]_i_5_n_0\
    );
\status[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(14),
      I1 => \^waveform_base_reg[15]\(7),
      O => \status[0]_i_6_n_0\
    );
\status[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(13),
      I1 => \^waveform_base_reg[15]\(6),
      O => \status[0]_i_7_n_0\
    );
\status[0]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(12),
      I1 => \^waveform_base_reg[15]\(5),
      O => \status[0]_i_8_n_0\
    );
\status[0]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(8),
      I1 => Q(15),
      O => \status[0]_i_9_n_0\
    );
\status_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \status[0]_i_1_n_0\,
      Q => status(0)
    );
\status_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[11]_i_2_n_0\,
      CO(3) => \NLW_status_reg[0]_i_3_CO_UNCONNECTED\(3),
      CO(2) => \status_reg[0]_i_3_n_1\,
      CO(1) => \status_reg[0]_i_3_n_2\,
      CO(0) => \status_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => \^waveform_base_reg[15]\(7 downto 5),
      O(3) => \status_reg[0]_i_3_n_4\,
      O(2) => \status_reg[0]_i_3_n_5\,
      O(1) => \status_reg[0]_i_3_n_6\,
      O(0) => \status_reg[0]_i_3_n_7\,
      S(3) => \status[0]_i_5_n_0\,
      S(2) => \status[0]_i_6_n_0\,
      S(1) => \status[0]_i_7_n_0\,
      S(0) => \status[0]_i_8_n_0\
    );
\status_reg[0]_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[11]_i_3_n_0\,
      CO(3) => \NLW_status_reg[0]_i_4_CO_UNCONNECTED\(3),
      CO(2) => \status_reg[0]_i_4_n_1\,
      CO(1) => \status_reg[0]_i_4_n_2\,
      CO(0) => \status_reg[0]_i_4_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => \^waveform_base_reg[15]\(7 downto 5),
      O(3) => \status_reg[0]_i_4_n_4\,
      O(2) => \status_reg[0]_i_4_n_5\,
      O(1) => \status_reg[0]_i_4_n_6\,
      O(0) => \status_reg[0]_i_4_n_7\,
      S(3) => \status[0]_i_9_n_0\,
      S(2) => \status[0]_i_10_n_0\,
      S(1) => \status[0]_i_11_n_0\,
      S(0) => \status[0]_i_12_n_0\
    );
\waveform[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2_n_7\,
      I3 => \waveform_reg[3]_i_3_n_7\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(0)
    );
\waveform[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2_n_5\,
      I3 => \waveform_reg[11]_i_3_n_5\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(10)
    );
\waveform[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2_n_4\,
      I3 => \waveform_reg[11]_i_3_n_4\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(11)
    );
\waveform[11]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(2),
      I1 => Q(9),
      O => \waveform[11]_i_10_n_0\
    );
\waveform[11]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(1),
      I1 => Q(8),
      O => \waveform[11]_i_11_n_0\
    );
\waveform[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(11),
      I1 => \^waveform_base_reg[15]\(4),
      O => \waveform[11]_i_4_n_0\
    );
\waveform[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(10),
      I1 => \^waveform_base_reg[15]\(3),
      O => \waveform[11]_i_5_n_0\
    );
\waveform[11]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(9),
      I1 => \^waveform_base_reg[15]\(2),
      O => \waveform[11]_i_6_n_0\
    );
\waveform[11]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(8),
      I1 => \^waveform_base_reg[15]\(1),
      O => \waveform[11]_i_7_n_0\
    );
\waveform[11]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(4),
      I1 => Q(11),
      O => \waveform[11]_i_8_n_0\
    );
\waveform[11]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(3),
      I1 => Q(10),
      O => \waveform[11]_i_9_n_0\
    );
\waveform[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \status_reg[0]_i_3_n_7\,
      I3 => \status_reg[0]_i_4_n_7\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(12)
    );
\waveform[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \status_reg[0]_i_3_n_6\,
      I3 => \status_reg[0]_i_4_n_6\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(13)
    );
\waveform[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \status_reg[0]_i_3_n_5\,
      I3 => \status_reg[0]_i_4_n_5\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(14)
    );
\waveform[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F8C8"
    )
        port map (
      I0 => status(0),
      I1 => \status_reg[0]_i_3_n_4\,
      I2 => \status_reg[0]_i_4_n_4\,
      I3 => \^waveform_base_reg[15]\(8),
      O => waveform(15)
    );
\waveform[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2_n_6\,
      I3 => \waveform_reg[3]_i_3_n_6\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(1)
    );
\waveform[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2_n_5\,
      I3 => \waveform_reg[3]_i_3_n_5\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(2)
    );
\waveform[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2_n_4\,
      I3 => \waveform_reg[3]_i_3_n_4\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(3)
    );
\waveform[3]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[1]\,
      I1 => Q(1),
      O => \waveform[3]_i_10_n_0\
    );
\waveform[3]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[0]\,
      I1 => Q(0),
      O => \waveform[3]_i_11_n_0\
    );
\waveform[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(3),
      I1 => \waveform_reg_n_0_[3]\,
      O => \waveform[3]_i_4_n_0\
    );
\waveform[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(2),
      I1 => \waveform_reg_n_0_[2]\,
      O => \waveform[3]_i_5_n_0\
    );
\waveform[3]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(1),
      I1 => \waveform_reg_n_0_[1]\,
      O => \waveform[3]_i_6_n_0\
    );
\waveform[3]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(0),
      I1 => \waveform_reg_n_0_[0]\,
      O => \waveform[3]_i_7_n_0\
    );
\waveform[3]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[3]\,
      I1 => Q(3),
      O => \waveform[3]_i_8_n_0\
    );
\waveform[3]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[2]\,
      I1 => Q(2),
      O => \waveform[3]_i_9_n_0\
    );
\waveform[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2_n_7\,
      I3 => \waveform_reg[7]_i_3_n_7\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(4)
    );
\waveform[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2_n_6\,
      I3 => \waveform_reg[7]_i_3_n_6\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(5)
    );
\waveform[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2_n_5\,
      I3 => \waveform_reg[7]_i_3_n_5\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(6)
    );
\waveform[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2_n_4\,
      I3 => \waveform_reg[7]_i_3_n_4\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(7)
    );
\waveform[7]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[5]\,
      I1 => Q(5),
      O => \waveform[7]_i_10_n_0\
    );
\waveform[7]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[4]\,
      I1 => Q(4),
      O => \waveform[7]_i_11_n_0\
    );
\waveform[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(7),
      I1 => \^waveform_base_reg[15]\(0),
      O => \waveform[7]_i_4_n_0\
    );
\waveform[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(6),
      I1 => \waveform_reg_n_0_[6]\,
      O => \waveform[7]_i_5_n_0\
    );
\waveform[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(5),
      I1 => \waveform_reg_n_0_[5]\,
      O => \waveform[7]_i_6_n_0\
    );
\waveform[7]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(4),
      I1 => \waveform_reg_n_0_[4]\,
      O => \waveform[7]_i_7_n_0\
    );
\waveform[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(0),
      I1 => Q(7),
      O => \waveform[7]_i_8_n_0\
    );
\waveform[7]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[6]\,
      I1 => Q(6),
      O => \waveform[7]_i_9_n_0\
    );
\waveform[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2_n_7\,
      I3 => \waveform_reg[11]_i_3_n_7\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(8)
    );
\waveform[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2_n_6\,
      I3 => \waveform_reg[11]_i_3_n_6\,
      I4 => \status_reg[0]_i_4_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(9)
    );
\waveform_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(0),
      Q => \waveform_reg_n_0_[0]\
    );
\waveform_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(10),
      Q => \^waveform_base_reg[15]\(3)
    );
\waveform_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(11),
      Q => \^waveform_base_reg[15]\(4)
    );
\waveform_reg[11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[7]_i_2_n_0\,
      CO(3) => \waveform_reg[11]_i_2_n_0\,
      CO(2) => \waveform_reg[11]_i_2_n_1\,
      CO(1) => \waveform_reg[11]_i_2_n_2\,
      CO(0) => \waveform_reg[11]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^waveform_base_reg[15]\(4 downto 1),
      O(3) => \waveform_reg[11]_i_2_n_4\,
      O(2) => \waveform_reg[11]_i_2_n_5\,
      O(1) => \waveform_reg[11]_i_2_n_6\,
      O(0) => \waveform_reg[11]_i_2_n_7\,
      S(3) => \waveform[11]_i_4_n_0\,
      S(2) => \waveform[11]_i_5_n_0\,
      S(1) => \waveform[11]_i_6_n_0\,
      S(0) => \waveform[11]_i_7_n_0\
    );
\waveform_reg[11]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[7]_i_3_n_0\,
      CO(3) => \waveform_reg[11]_i_3_n_0\,
      CO(2) => \waveform_reg[11]_i_3_n_1\,
      CO(1) => \waveform_reg[11]_i_3_n_2\,
      CO(0) => \waveform_reg[11]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^waveform_base_reg[15]\(4 downto 1),
      O(3) => \waveform_reg[11]_i_3_n_4\,
      O(2) => \waveform_reg[11]_i_3_n_5\,
      O(1) => \waveform_reg[11]_i_3_n_6\,
      O(0) => \waveform_reg[11]_i_3_n_7\,
      S(3) => \waveform[11]_i_8_n_0\,
      S(2) => \waveform[11]_i_9_n_0\,
      S(1) => \waveform[11]_i_10_n_0\,
      S(0) => \waveform[11]_i_11_n_0\
    );
\waveform_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(12),
      Q => \^waveform_base_reg[15]\(5)
    );
\waveform_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(13),
      Q => \^waveform_base_reg[15]\(6)
    );
\waveform_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(14),
      Q => \^waveform_base_reg[15]\(7)
    );
\waveform_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(15),
      Q => \^waveform_base_reg[15]\(8)
    );
\waveform_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(1),
      Q => \waveform_reg_n_0_[1]\
    );
\waveform_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(2),
      Q => \waveform_reg_n_0_[2]\
    );
\waveform_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(3),
      Q => \waveform_reg_n_0_[3]\
    );
\waveform_reg[3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \waveform_reg[3]_i_2_n_0\,
      CO(2) => \waveform_reg[3]_i_2_n_1\,
      CO(1) => \waveform_reg[3]_i_2_n_2\,
      CO(0) => \waveform_reg[3]_i_2_n_3\,
      CYINIT => '1',
      DI(3) => \waveform_reg_n_0_[3]\,
      DI(2) => \waveform_reg_n_0_[2]\,
      DI(1) => \waveform_reg_n_0_[1]\,
      DI(0) => \waveform_reg_n_0_[0]\,
      O(3) => \waveform_reg[3]_i_2_n_4\,
      O(2) => \waveform_reg[3]_i_2_n_5\,
      O(1) => \waveform_reg[3]_i_2_n_6\,
      O(0) => \waveform_reg[3]_i_2_n_7\,
      S(3) => \waveform[3]_i_4_n_0\,
      S(2) => \waveform[3]_i_5_n_0\,
      S(1) => \waveform[3]_i_6_n_0\,
      S(0) => \waveform[3]_i_7_n_0\
    );
\waveform_reg[3]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \waveform_reg[3]_i_3_n_0\,
      CO(2) => \waveform_reg[3]_i_3_n_1\,
      CO(1) => \waveform_reg[3]_i_3_n_2\,
      CO(0) => \waveform_reg[3]_i_3_n_3\,
      CYINIT => '0',
      DI(3) => \waveform_reg_n_0_[3]\,
      DI(2) => \waveform_reg_n_0_[2]\,
      DI(1) => \waveform_reg_n_0_[1]\,
      DI(0) => \waveform_reg_n_0_[0]\,
      O(3) => \waveform_reg[3]_i_3_n_4\,
      O(2) => \waveform_reg[3]_i_3_n_5\,
      O(1) => \waveform_reg[3]_i_3_n_6\,
      O(0) => \waveform_reg[3]_i_3_n_7\,
      S(3) => \waveform[3]_i_8_n_0\,
      S(2) => \waveform[3]_i_9_n_0\,
      S(1) => \waveform[3]_i_10_n_0\,
      S(0) => \waveform[3]_i_11_n_0\
    );
\waveform_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(4),
      Q => \waveform_reg_n_0_[4]\
    );
\waveform_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(5),
      Q => \waveform_reg_n_0_[5]\
    );
\waveform_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(6),
      Q => \waveform_reg_n_0_[6]\
    );
\waveform_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(7),
      Q => \^waveform_base_reg[15]\(0)
    );
\waveform_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[3]_i_2_n_0\,
      CO(3) => \waveform_reg[7]_i_2_n_0\,
      CO(2) => \waveform_reg[7]_i_2_n_1\,
      CO(1) => \waveform_reg[7]_i_2_n_2\,
      CO(0) => \waveform_reg[7]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => \^waveform_base_reg[15]\(0),
      DI(2) => \waveform_reg_n_0_[6]\,
      DI(1) => \waveform_reg_n_0_[5]\,
      DI(0) => \waveform_reg_n_0_[4]\,
      O(3) => \waveform_reg[7]_i_2_n_4\,
      O(2) => \waveform_reg[7]_i_2_n_5\,
      O(1) => \waveform_reg[7]_i_2_n_6\,
      O(0) => \waveform_reg[7]_i_2_n_7\,
      S(3) => \waveform[7]_i_4_n_0\,
      S(2) => \waveform[7]_i_5_n_0\,
      S(1) => \waveform[7]_i_6_n_0\,
      S(0) => \waveform[7]_i_7_n_0\
    );
\waveform_reg[7]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[3]_i_3_n_0\,
      CO(3) => \waveform_reg[7]_i_3_n_0\,
      CO(2) => \waveform_reg[7]_i_3_n_1\,
      CO(1) => \waveform_reg[7]_i_3_n_2\,
      CO(0) => \waveform_reg[7]_i_3_n_3\,
      CYINIT => '0',
      DI(3) => \^waveform_base_reg[15]\(0),
      DI(2) => \waveform_reg_n_0_[6]\,
      DI(1) => \waveform_reg_n_0_[5]\,
      DI(0) => \waveform_reg_n_0_[4]\,
      O(3) => \waveform_reg[7]_i_3_n_4\,
      O(2) => \waveform_reg[7]_i_3_n_5\,
      O(1) => \waveform_reg[7]_i_3_n_6\,
      O(0) => \waveform_reg[7]_i_3_n_7\,
      S(3) => \waveform[7]_i_8_n_0\,
      S(2) => \waveform[7]_i_9_n_0\,
      S(1) => \waveform[7]_i_10_n_0\,
      S(0) => \waveform[7]_i_11_n_0\
    );
\waveform_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(8),
      Q => \^waveform_base_reg[15]\(1)
    );
\waveform_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(9),
      Q => \^waveform_base_reg[15]\(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_waveGen_3 is
  port (
    \waveform_base_reg[15]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \cs_reg[1]\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    \cs_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_waveGen_3 : entity is "waveGen";
end audioSys_0_waveGen_3;

architecture STRUCTURE of audioSys_0_waveGen_3 is
  signal status : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \status[0]_i_10__0_n_0\ : STD_LOGIC;
  signal \status[0]_i_11__0_n_0\ : STD_LOGIC;
  signal \status[0]_i_12__0_n_0\ : STD_LOGIC;
  signal \status[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \status[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \status[0]_i_6__0_n_0\ : STD_LOGIC;
  signal \status[0]_i_7__0_n_0\ : STD_LOGIC;
  signal \status[0]_i_8__0_n_0\ : STD_LOGIC;
  signal \status[0]_i_9__0_n_0\ : STD_LOGIC;
  signal \status_reg[0]_i_3__0_n_1\ : STD_LOGIC;
  signal \status_reg[0]_i_3__0_n_2\ : STD_LOGIC;
  signal \status_reg[0]_i_3__0_n_3\ : STD_LOGIC;
  signal \status_reg[0]_i_3__0_n_4\ : STD_LOGIC;
  signal \status_reg[0]_i_3__0_n_5\ : STD_LOGIC;
  signal \status_reg[0]_i_3__0_n_6\ : STD_LOGIC;
  signal \status_reg[0]_i_3__0_n_7\ : STD_LOGIC;
  signal \status_reg[0]_i_4__0_n_1\ : STD_LOGIC;
  signal \status_reg[0]_i_4__0_n_2\ : STD_LOGIC;
  signal \status_reg[0]_i_4__0_n_3\ : STD_LOGIC;
  signal \status_reg[0]_i_4__0_n_4\ : STD_LOGIC;
  signal \status_reg[0]_i_4__0_n_5\ : STD_LOGIC;
  signal \status_reg[0]_i_4__0_n_6\ : STD_LOGIC;
  signal \status_reg[0]_i_4__0_n_7\ : STD_LOGIC;
  signal waveform : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \waveform[11]_i_10__0_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_11__0_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_4__0_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_5__0_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_6__0_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_7__0_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_8__0_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_9__0_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_10__0_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_11__0_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_4__0_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_5__0_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_6__0_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_7__0_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_8__0_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_9__0_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_10__0_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_11__0_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_4__0_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_5__0_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_6__0_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_7__0_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_8__0_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_9__0_n_0\ : STD_LOGIC;
  signal \^waveform_base_reg[15]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \waveform_reg[11]_i_2__0_n_0\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__0_n_1\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__0_n_2\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__0_n_3\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__0_n_4\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__0_n_5\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__0_n_6\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__0_n_7\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__0_n_0\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__0_n_1\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__0_n_2\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__0_n_3\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__0_n_4\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__0_n_5\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__0_n_6\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__0_n_7\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__0_n_1\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__0_n_2\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__0_n_3\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__0_n_4\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__0_n_5\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__0_n_6\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__0_n_7\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__0_n_1\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__0_n_2\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__0_n_3\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__0_n_4\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__0_n_5\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__0_n_6\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__0_n_7\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__0_n_1\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__0_n_2\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__0_n_3\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__0_n_4\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__0_n_5\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__0_n_6\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__0_n_7\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__0_n_0\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__0_n_1\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__0_n_2\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__0_n_3\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__0_n_4\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__0_n_5\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__0_n_6\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__0_n_7\ : STD_LOGIC;
  signal \waveform_reg_n_0_[0]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[1]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[2]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[3]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[4]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[5]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[6]\ : STD_LOGIC;
  signal \NLW_status_reg[0]_i_3__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_status_reg[0]_i_4__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
  \waveform_base_reg[15]\(8 downto 0) <= \^waveform_base_reg[15]\(8 downto 0);
\status[0]_i_10__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(7),
      I1 => Q(14),
      O => \status[0]_i_10__0_n_0\
    );
\status[0]_i_11__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(6),
      I1 => Q(13),
      O => \status[0]_i_11__0_n_0\
    );
\status[0]_i_12__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(5),
      I1 => Q(12),
      O => \status[0]_i_12__0_n_0\
    );
\status[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEFF0050"
    )
        port map (
      I0 => \cs_reg[1]\,
      I1 => \status_reg[0]_i_3__0_n_4\,
      I2 => \status_reg[0]_i_4__0_n_4\,
      I3 => \^waveform_base_reg[15]\(8),
      I4 => status(0),
      O => \status[0]_i_1__0_n_0\
    );
\status[0]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(15),
      I1 => \^waveform_base_reg[15]\(8),
      O => \status[0]_i_5__0_n_0\
    );
\status[0]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(14),
      I1 => \^waveform_base_reg[15]\(7),
      O => \status[0]_i_6__0_n_0\
    );
\status[0]_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(13),
      I1 => \^waveform_base_reg[15]\(6),
      O => \status[0]_i_7__0_n_0\
    );
\status[0]_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(12),
      I1 => \^waveform_base_reg[15]\(5),
      O => \status[0]_i_8__0_n_0\
    );
\status[0]_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(8),
      I1 => Q(15),
      O => \status[0]_i_9__0_n_0\
    );
\status_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \status[0]_i_1__0_n_0\,
      Q => status(0)
    );
\status_reg[0]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[11]_i_2__0_n_0\,
      CO(3) => \NLW_status_reg[0]_i_3__0_CO_UNCONNECTED\(3),
      CO(2) => \status_reg[0]_i_3__0_n_1\,
      CO(1) => \status_reg[0]_i_3__0_n_2\,
      CO(0) => \status_reg[0]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => \^waveform_base_reg[15]\(7 downto 5),
      O(3) => \status_reg[0]_i_3__0_n_4\,
      O(2) => \status_reg[0]_i_3__0_n_5\,
      O(1) => \status_reg[0]_i_3__0_n_6\,
      O(0) => \status_reg[0]_i_3__0_n_7\,
      S(3) => \status[0]_i_5__0_n_0\,
      S(2) => \status[0]_i_6__0_n_0\,
      S(1) => \status[0]_i_7__0_n_0\,
      S(0) => \status[0]_i_8__0_n_0\
    );
\status_reg[0]_i_4__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[11]_i_3__0_n_0\,
      CO(3) => \NLW_status_reg[0]_i_4__0_CO_UNCONNECTED\(3),
      CO(2) => \status_reg[0]_i_4__0_n_1\,
      CO(1) => \status_reg[0]_i_4__0_n_2\,
      CO(0) => \status_reg[0]_i_4__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => \^waveform_base_reg[15]\(7 downto 5),
      O(3) => \status_reg[0]_i_4__0_n_4\,
      O(2) => \status_reg[0]_i_4__0_n_5\,
      O(1) => \status_reg[0]_i_4__0_n_6\,
      O(0) => \status_reg[0]_i_4__0_n_7\,
      S(3) => \status[0]_i_9__0_n_0\,
      S(2) => \status[0]_i_10__0_n_0\,
      S(1) => \status[0]_i_11__0_n_0\,
      S(0) => \status[0]_i_12__0_n_0\
    );
\waveform[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2__0_n_7\,
      I3 => \waveform_reg[3]_i_3__0_n_7\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(0)
    );
\waveform[10]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2__0_n_5\,
      I3 => \waveform_reg[11]_i_3__0_n_5\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(10)
    );
\waveform[11]_i_10__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(2),
      I1 => Q(9),
      O => \waveform[11]_i_10__0_n_0\
    );
\waveform[11]_i_11__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(1),
      I1 => Q(8),
      O => \waveform[11]_i_11__0_n_0\
    );
\waveform[11]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2__0_n_4\,
      I3 => \waveform_reg[11]_i_3__0_n_4\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(11)
    );
\waveform[11]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(11),
      I1 => \^waveform_base_reg[15]\(4),
      O => \waveform[11]_i_4__0_n_0\
    );
\waveform[11]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(10),
      I1 => \^waveform_base_reg[15]\(3),
      O => \waveform[11]_i_5__0_n_0\
    );
\waveform[11]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(9),
      I1 => \^waveform_base_reg[15]\(2),
      O => \waveform[11]_i_6__0_n_0\
    );
\waveform[11]_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(8),
      I1 => \^waveform_base_reg[15]\(1),
      O => \waveform[11]_i_7__0_n_0\
    );
\waveform[11]_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(4),
      I1 => Q(11),
      O => \waveform[11]_i_8__0_n_0\
    );
\waveform[11]_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(3),
      I1 => Q(10),
      O => \waveform[11]_i_9__0_n_0\
    );
\waveform[12]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \status_reg[0]_i_3__0_n_7\,
      I3 => \status_reg[0]_i_4__0_n_7\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(12)
    );
\waveform[13]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \status_reg[0]_i_3__0_n_6\,
      I3 => \status_reg[0]_i_4__0_n_6\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(13)
    );
\waveform[14]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \status_reg[0]_i_3__0_n_5\,
      I3 => \status_reg[0]_i_4__0_n_5\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(14)
    );
\waveform[15]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F8C8"
    )
        port map (
      I0 => status(0),
      I1 => \status_reg[0]_i_3__0_n_4\,
      I2 => \status_reg[0]_i_4__0_n_4\,
      I3 => \^waveform_base_reg[15]\(8),
      O => waveform(15)
    );
\waveform[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2__0_n_6\,
      I3 => \waveform_reg[3]_i_3__0_n_6\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(1)
    );
\waveform[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2__0_n_5\,
      I3 => \waveform_reg[3]_i_3__0_n_5\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(2)
    );
\waveform[3]_i_10__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[1]\,
      I1 => Q(1),
      O => \waveform[3]_i_10__0_n_0\
    );
\waveform[3]_i_11__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[0]\,
      I1 => Q(0),
      O => \waveform[3]_i_11__0_n_0\
    );
\waveform[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2__0_n_4\,
      I3 => \waveform_reg[3]_i_3__0_n_4\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(3)
    );
\waveform[3]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(3),
      I1 => \waveform_reg_n_0_[3]\,
      O => \waveform[3]_i_4__0_n_0\
    );
\waveform[3]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(2),
      I1 => \waveform_reg_n_0_[2]\,
      O => \waveform[3]_i_5__0_n_0\
    );
\waveform[3]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(1),
      I1 => \waveform_reg_n_0_[1]\,
      O => \waveform[3]_i_6__0_n_0\
    );
\waveform[3]_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(0),
      I1 => \waveform_reg_n_0_[0]\,
      O => \waveform[3]_i_7__0_n_0\
    );
\waveform[3]_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[3]\,
      I1 => Q(3),
      O => \waveform[3]_i_8__0_n_0\
    );
\waveform[3]_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[2]\,
      I1 => Q(2),
      O => \waveform[3]_i_9__0_n_0\
    );
\waveform[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2__0_n_7\,
      I3 => \waveform_reg[7]_i_3__0_n_7\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(4)
    );
\waveform[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2__0_n_6\,
      I3 => \waveform_reg[7]_i_3__0_n_6\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(5)
    );
\waveform[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2__0_n_5\,
      I3 => \waveform_reg[7]_i_3__0_n_5\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(6)
    );
\waveform[7]_i_10__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[5]\,
      I1 => Q(5),
      O => \waveform[7]_i_10__0_n_0\
    );
\waveform[7]_i_11__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[4]\,
      I1 => Q(4),
      O => \waveform[7]_i_11__0_n_0\
    );
\waveform[7]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2__0_n_4\,
      I3 => \waveform_reg[7]_i_3__0_n_4\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(7)
    );
\waveform[7]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(7),
      I1 => \^waveform_base_reg[15]\(0),
      O => \waveform[7]_i_4__0_n_0\
    );
\waveform[7]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(6),
      I1 => \waveform_reg_n_0_[6]\,
      O => \waveform[7]_i_5__0_n_0\
    );
\waveform[7]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(5),
      I1 => \waveform_reg_n_0_[5]\,
      O => \waveform[7]_i_6__0_n_0\
    );
\waveform[7]_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(4),
      I1 => \waveform_reg_n_0_[4]\,
      O => \waveform[7]_i_7__0_n_0\
    );
\waveform[7]_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(0),
      I1 => Q(7),
      O => \waveform[7]_i_8__0_n_0\
    );
\waveform[7]_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[6]\,
      I1 => Q(6),
      O => \waveform[7]_i_9__0_n_0\
    );
\waveform[8]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2__0_n_7\,
      I3 => \waveform_reg[11]_i_3__0_n_7\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(8)
    );
\waveform[9]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__0_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2__0_n_6\,
      I3 => \waveform_reg[11]_i_3__0_n_6\,
      I4 => \status_reg[0]_i_4__0_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(9)
    );
\waveform_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(0),
      Q => \waveform_reg_n_0_[0]\
    );
\waveform_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(10),
      Q => \^waveform_base_reg[15]\(3)
    );
\waveform_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(11),
      Q => \^waveform_base_reg[15]\(4)
    );
\waveform_reg[11]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[7]_i_2__0_n_0\,
      CO(3) => \waveform_reg[11]_i_2__0_n_0\,
      CO(2) => \waveform_reg[11]_i_2__0_n_1\,
      CO(1) => \waveform_reg[11]_i_2__0_n_2\,
      CO(0) => \waveform_reg[11]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^waveform_base_reg[15]\(4 downto 1),
      O(3) => \waveform_reg[11]_i_2__0_n_4\,
      O(2) => \waveform_reg[11]_i_2__0_n_5\,
      O(1) => \waveform_reg[11]_i_2__0_n_6\,
      O(0) => \waveform_reg[11]_i_2__0_n_7\,
      S(3) => \waveform[11]_i_4__0_n_0\,
      S(2) => \waveform[11]_i_5__0_n_0\,
      S(1) => \waveform[11]_i_6__0_n_0\,
      S(0) => \waveform[11]_i_7__0_n_0\
    );
\waveform_reg[11]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[7]_i_3__0_n_0\,
      CO(3) => \waveform_reg[11]_i_3__0_n_0\,
      CO(2) => \waveform_reg[11]_i_3__0_n_1\,
      CO(1) => \waveform_reg[11]_i_3__0_n_2\,
      CO(0) => \waveform_reg[11]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^waveform_base_reg[15]\(4 downto 1),
      O(3) => \waveform_reg[11]_i_3__0_n_4\,
      O(2) => \waveform_reg[11]_i_3__0_n_5\,
      O(1) => \waveform_reg[11]_i_3__0_n_6\,
      O(0) => \waveform_reg[11]_i_3__0_n_7\,
      S(3) => \waveform[11]_i_8__0_n_0\,
      S(2) => \waveform[11]_i_9__0_n_0\,
      S(1) => \waveform[11]_i_10__0_n_0\,
      S(0) => \waveform[11]_i_11__0_n_0\
    );
\waveform_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(12),
      Q => \^waveform_base_reg[15]\(5)
    );
\waveform_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(13),
      Q => \^waveform_base_reg[15]\(6)
    );
\waveform_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(14),
      Q => \^waveform_base_reg[15]\(7)
    );
\waveform_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(15),
      Q => \^waveform_base_reg[15]\(8)
    );
\waveform_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(1),
      Q => \waveform_reg_n_0_[1]\
    );
\waveform_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(2),
      Q => \waveform_reg_n_0_[2]\
    );
\waveform_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(3),
      Q => \waveform_reg_n_0_[3]\
    );
\waveform_reg[3]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \waveform_reg[3]_i_2__0_n_0\,
      CO(2) => \waveform_reg[3]_i_2__0_n_1\,
      CO(1) => \waveform_reg[3]_i_2__0_n_2\,
      CO(0) => \waveform_reg[3]_i_2__0_n_3\,
      CYINIT => '1',
      DI(3) => \waveform_reg_n_0_[3]\,
      DI(2) => \waveform_reg_n_0_[2]\,
      DI(1) => \waveform_reg_n_0_[1]\,
      DI(0) => \waveform_reg_n_0_[0]\,
      O(3) => \waveform_reg[3]_i_2__0_n_4\,
      O(2) => \waveform_reg[3]_i_2__0_n_5\,
      O(1) => \waveform_reg[3]_i_2__0_n_6\,
      O(0) => \waveform_reg[3]_i_2__0_n_7\,
      S(3) => \waveform[3]_i_4__0_n_0\,
      S(2) => \waveform[3]_i_5__0_n_0\,
      S(1) => \waveform[3]_i_6__0_n_0\,
      S(0) => \waveform[3]_i_7__0_n_0\
    );
\waveform_reg[3]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \waveform_reg[3]_i_3__0_n_0\,
      CO(2) => \waveform_reg[3]_i_3__0_n_1\,
      CO(1) => \waveform_reg[3]_i_3__0_n_2\,
      CO(0) => \waveform_reg[3]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3) => \waveform_reg_n_0_[3]\,
      DI(2) => \waveform_reg_n_0_[2]\,
      DI(1) => \waveform_reg_n_0_[1]\,
      DI(0) => \waveform_reg_n_0_[0]\,
      O(3) => \waveform_reg[3]_i_3__0_n_4\,
      O(2) => \waveform_reg[3]_i_3__0_n_5\,
      O(1) => \waveform_reg[3]_i_3__0_n_6\,
      O(0) => \waveform_reg[3]_i_3__0_n_7\,
      S(3) => \waveform[3]_i_8__0_n_0\,
      S(2) => \waveform[3]_i_9__0_n_0\,
      S(1) => \waveform[3]_i_10__0_n_0\,
      S(0) => \waveform[3]_i_11__0_n_0\
    );
\waveform_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(4),
      Q => \waveform_reg_n_0_[4]\
    );
\waveform_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(5),
      Q => \waveform_reg_n_0_[5]\
    );
\waveform_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(6),
      Q => \waveform_reg_n_0_[6]\
    );
\waveform_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(7),
      Q => \^waveform_base_reg[15]\(0)
    );
\waveform_reg[7]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[3]_i_2__0_n_0\,
      CO(3) => \waveform_reg[7]_i_2__0_n_0\,
      CO(2) => \waveform_reg[7]_i_2__0_n_1\,
      CO(1) => \waveform_reg[7]_i_2__0_n_2\,
      CO(0) => \waveform_reg[7]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3) => \^waveform_base_reg[15]\(0),
      DI(2) => \waveform_reg_n_0_[6]\,
      DI(1) => \waveform_reg_n_0_[5]\,
      DI(0) => \waveform_reg_n_0_[4]\,
      O(3) => \waveform_reg[7]_i_2__0_n_4\,
      O(2) => \waveform_reg[7]_i_2__0_n_5\,
      O(1) => \waveform_reg[7]_i_2__0_n_6\,
      O(0) => \waveform_reg[7]_i_2__0_n_7\,
      S(3) => \waveform[7]_i_4__0_n_0\,
      S(2) => \waveform[7]_i_5__0_n_0\,
      S(1) => \waveform[7]_i_6__0_n_0\,
      S(0) => \waveform[7]_i_7__0_n_0\
    );
\waveform_reg[7]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[3]_i_3__0_n_0\,
      CO(3) => \waveform_reg[7]_i_3__0_n_0\,
      CO(2) => \waveform_reg[7]_i_3__0_n_1\,
      CO(1) => \waveform_reg[7]_i_3__0_n_2\,
      CO(0) => \waveform_reg[7]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3) => \^waveform_base_reg[15]\(0),
      DI(2) => \waveform_reg_n_0_[6]\,
      DI(1) => \waveform_reg_n_0_[5]\,
      DI(0) => \waveform_reg_n_0_[4]\,
      O(3) => \waveform_reg[7]_i_3__0_n_4\,
      O(2) => \waveform_reg[7]_i_3__0_n_5\,
      O(1) => \waveform_reg[7]_i_3__0_n_6\,
      O(0) => \waveform_reg[7]_i_3__0_n_7\,
      S(3) => \waveform[7]_i_8__0_n_0\,
      S(2) => \waveform[7]_i_9__0_n_0\,
      S(1) => \waveform[7]_i_10__0_n_0\,
      S(0) => \waveform[7]_i_11__0_n_0\
    );
\waveform_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(8),
      Q => \^waveform_base_reg[15]\(1)
    );
\waveform_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(9),
      Q => \^waveform_base_reg[15]\(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_waveGen_6 is
  port (
    \waveform_base_reg[15]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \cs_reg[1]\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    \cs_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_waveGen_6 : entity is "waveGen";
end audioSys_0_waveGen_6;

architecture STRUCTURE of audioSys_0_waveGen_6 is
  signal status : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \status[0]_i_10__1_n_0\ : STD_LOGIC;
  signal \status[0]_i_11__1_n_0\ : STD_LOGIC;
  signal \status[0]_i_12__1_n_0\ : STD_LOGIC;
  signal \status[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \status[0]_i_5__1_n_0\ : STD_LOGIC;
  signal \status[0]_i_6__1_n_0\ : STD_LOGIC;
  signal \status[0]_i_7__1_n_0\ : STD_LOGIC;
  signal \status[0]_i_8__1_n_0\ : STD_LOGIC;
  signal \status[0]_i_9__1_n_0\ : STD_LOGIC;
  signal \status_reg[0]_i_3__1_n_1\ : STD_LOGIC;
  signal \status_reg[0]_i_3__1_n_2\ : STD_LOGIC;
  signal \status_reg[0]_i_3__1_n_3\ : STD_LOGIC;
  signal \status_reg[0]_i_3__1_n_4\ : STD_LOGIC;
  signal \status_reg[0]_i_3__1_n_5\ : STD_LOGIC;
  signal \status_reg[0]_i_3__1_n_6\ : STD_LOGIC;
  signal \status_reg[0]_i_3__1_n_7\ : STD_LOGIC;
  signal \status_reg[0]_i_4__1_n_1\ : STD_LOGIC;
  signal \status_reg[0]_i_4__1_n_2\ : STD_LOGIC;
  signal \status_reg[0]_i_4__1_n_3\ : STD_LOGIC;
  signal \status_reg[0]_i_4__1_n_4\ : STD_LOGIC;
  signal \status_reg[0]_i_4__1_n_5\ : STD_LOGIC;
  signal \status_reg[0]_i_4__1_n_6\ : STD_LOGIC;
  signal \status_reg[0]_i_4__1_n_7\ : STD_LOGIC;
  signal waveform : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \waveform[11]_i_10__1_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_11__1_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_4__1_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_5__1_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_6__1_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_7__1_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_8__1_n_0\ : STD_LOGIC;
  signal \waveform[11]_i_9__1_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_10__1_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_11__1_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_4__1_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_5__1_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_6__1_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_7__1_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_8__1_n_0\ : STD_LOGIC;
  signal \waveform[3]_i_9__1_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_10__1_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_11__1_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_4__1_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_5__1_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_6__1_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_7__1_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_8__1_n_0\ : STD_LOGIC;
  signal \waveform[7]_i_9__1_n_0\ : STD_LOGIC;
  signal \^waveform_base_reg[15]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \waveform_reg[11]_i_2__1_n_0\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__1_n_1\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__1_n_2\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__1_n_3\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__1_n_4\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__1_n_5\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__1_n_6\ : STD_LOGIC;
  signal \waveform_reg[11]_i_2__1_n_7\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__1_n_0\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__1_n_1\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__1_n_2\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__1_n_3\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__1_n_4\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__1_n_5\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__1_n_6\ : STD_LOGIC;
  signal \waveform_reg[11]_i_3__1_n_7\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__1_n_1\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__1_n_2\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__1_n_3\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__1_n_4\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__1_n_5\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__1_n_6\ : STD_LOGIC;
  signal \waveform_reg[3]_i_2__1_n_7\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__1_n_1\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__1_n_2\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__1_n_3\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__1_n_4\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__1_n_5\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__1_n_6\ : STD_LOGIC;
  signal \waveform_reg[3]_i_3__1_n_7\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__1_n_0\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__1_n_1\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__1_n_2\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__1_n_3\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__1_n_4\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__1_n_5\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__1_n_6\ : STD_LOGIC;
  signal \waveform_reg[7]_i_2__1_n_7\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__1_n_0\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__1_n_1\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__1_n_2\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__1_n_3\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__1_n_4\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__1_n_5\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__1_n_6\ : STD_LOGIC;
  signal \waveform_reg[7]_i_3__1_n_7\ : STD_LOGIC;
  signal \waveform_reg_n_0_[0]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[1]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[2]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[3]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[4]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[5]\ : STD_LOGIC;
  signal \waveform_reg_n_0_[6]\ : STD_LOGIC;
  signal \NLW_status_reg[0]_i_3__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_status_reg[0]_i_4__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
  \waveform_base_reg[15]\(8 downto 0) <= \^waveform_base_reg[15]\(8 downto 0);
\status[0]_i_10__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(7),
      I1 => Q(14),
      O => \status[0]_i_10__1_n_0\
    );
\status[0]_i_11__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(6),
      I1 => Q(13),
      O => \status[0]_i_11__1_n_0\
    );
\status[0]_i_12__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(5),
      I1 => Q(12),
      O => \status[0]_i_12__1_n_0\
    );
\status[0]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEFF0050"
    )
        port map (
      I0 => \cs_reg[1]\,
      I1 => \status_reg[0]_i_3__1_n_4\,
      I2 => \status_reg[0]_i_4__1_n_4\,
      I3 => \^waveform_base_reg[15]\(8),
      I4 => status(0),
      O => \status[0]_i_1__1_n_0\
    );
\status[0]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(15),
      I1 => \^waveform_base_reg[15]\(8),
      O => \status[0]_i_5__1_n_0\
    );
\status[0]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(14),
      I1 => \^waveform_base_reg[15]\(7),
      O => \status[0]_i_6__1_n_0\
    );
\status[0]_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(13),
      I1 => \^waveform_base_reg[15]\(6),
      O => \status[0]_i_7__1_n_0\
    );
\status[0]_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(12),
      I1 => \^waveform_base_reg[15]\(5),
      O => \status[0]_i_8__1_n_0\
    );
\status[0]_i_9__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(8),
      I1 => Q(15),
      O => \status[0]_i_9__1_n_0\
    );
\status_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \status[0]_i_1__1_n_0\,
      Q => status(0)
    );
\status_reg[0]_i_3__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[11]_i_2__1_n_0\,
      CO(3) => \NLW_status_reg[0]_i_3__1_CO_UNCONNECTED\(3),
      CO(2) => \status_reg[0]_i_3__1_n_1\,
      CO(1) => \status_reg[0]_i_3__1_n_2\,
      CO(0) => \status_reg[0]_i_3__1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => \^waveform_base_reg[15]\(7 downto 5),
      O(3) => \status_reg[0]_i_3__1_n_4\,
      O(2) => \status_reg[0]_i_3__1_n_5\,
      O(1) => \status_reg[0]_i_3__1_n_6\,
      O(0) => \status_reg[0]_i_3__1_n_7\,
      S(3) => \status[0]_i_5__1_n_0\,
      S(2) => \status[0]_i_6__1_n_0\,
      S(1) => \status[0]_i_7__1_n_0\,
      S(0) => \status[0]_i_8__1_n_0\
    );
\status_reg[0]_i_4__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[11]_i_3__1_n_0\,
      CO(3) => \NLW_status_reg[0]_i_4__1_CO_UNCONNECTED\(3),
      CO(2) => \status_reg[0]_i_4__1_n_1\,
      CO(1) => \status_reg[0]_i_4__1_n_2\,
      CO(0) => \status_reg[0]_i_4__1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => \^waveform_base_reg[15]\(7 downto 5),
      O(3) => \status_reg[0]_i_4__1_n_4\,
      O(2) => \status_reg[0]_i_4__1_n_5\,
      O(1) => \status_reg[0]_i_4__1_n_6\,
      O(0) => \status_reg[0]_i_4__1_n_7\,
      S(3) => \status[0]_i_9__1_n_0\,
      S(2) => \status[0]_i_10__1_n_0\,
      S(1) => \status[0]_i_11__1_n_0\,
      S(0) => \status[0]_i_12__1_n_0\
    );
\waveform[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2__1_n_7\,
      I3 => \waveform_reg[3]_i_3__1_n_7\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(0)
    );
\waveform[10]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2__1_n_5\,
      I3 => \waveform_reg[11]_i_3__1_n_5\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(10)
    );
\waveform[11]_i_10__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(2),
      I1 => Q(9),
      O => \waveform[11]_i_10__1_n_0\
    );
\waveform[11]_i_11__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(1),
      I1 => Q(8),
      O => \waveform[11]_i_11__1_n_0\
    );
\waveform[11]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2__1_n_4\,
      I3 => \waveform_reg[11]_i_3__1_n_4\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(11)
    );
\waveform[11]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(11),
      I1 => \^waveform_base_reg[15]\(4),
      O => \waveform[11]_i_4__1_n_0\
    );
\waveform[11]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(10),
      I1 => \^waveform_base_reg[15]\(3),
      O => \waveform[11]_i_5__1_n_0\
    );
\waveform[11]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(9),
      I1 => \^waveform_base_reg[15]\(2),
      O => \waveform[11]_i_6__1_n_0\
    );
\waveform[11]_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(8),
      I1 => \^waveform_base_reg[15]\(1),
      O => \waveform[11]_i_7__1_n_0\
    );
\waveform[11]_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(4),
      I1 => Q(11),
      O => \waveform[11]_i_8__1_n_0\
    );
\waveform[11]_i_9__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(3),
      I1 => Q(10),
      O => \waveform[11]_i_9__1_n_0\
    );
\waveform[12]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \status_reg[0]_i_3__1_n_7\,
      I3 => \status_reg[0]_i_4__1_n_7\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(12)
    );
\waveform[13]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \status_reg[0]_i_3__1_n_6\,
      I3 => \status_reg[0]_i_4__1_n_6\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(13)
    );
\waveform[14]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \status_reg[0]_i_3__1_n_5\,
      I3 => \status_reg[0]_i_4__1_n_5\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(14)
    );
\waveform[15]_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F8C8"
    )
        port map (
      I0 => status(0),
      I1 => \status_reg[0]_i_3__1_n_4\,
      I2 => \status_reg[0]_i_4__1_n_4\,
      I3 => \^waveform_base_reg[15]\(8),
      O => waveform(15)
    );
\waveform[1]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2__1_n_6\,
      I3 => \waveform_reg[3]_i_3__1_n_6\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(1)
    );
\waveform[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2__1_n_5\,
      I3 => \waveform_reg[3]_i_3__1_n_5\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(2)
    );
\waveform[3]_i_10__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[1]\,
      I1 => Q(1),
      O => \waveform[3]_i_10__1_n_0\
    );
\waveform[3]_i_11__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[0]\,
      I1 => Q(0),
      O => \waveform[3]_i_11__1_n_0\
    );
\waveform[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[3]_i_2__1_n_4\,
      I3 => \waveform_reg[3]_i_3__1_n_4\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(3)
    );
\waveform[3]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(3),
      I1 => \waveform_reg_n_0_[3]\,
      O => \waveform[3]_i_4__1_n_0\
    );
\waveform[3]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(2),
      I1 => \waveform_reg_n_0_[2]\,
      O => \waveform[3]_i_5__1_n_0\
    );
\waveform[3]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(1),
      I1 => \waveform_reg_n_0_[1]\,
      O => \waveform[3]_i_6__1_n_0\
    );
\waveform[3]_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(0),
      I1 => \waveform_reg_n_0_[0]\,
      O => \waveform[3]_i_7__1_n_0\
    );
\waveform[3]_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[3]\,
      I1 => Q(3),
      O => \waveform[3]_i_8__1_n_0\
    );
\waveform[3]_i_9__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[2]\,
      I1 => Q(2),
      O => \waveform[3]_i_9__1_n_0\
    );
\waveform[4]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2__1_n_7\,
      I3 => \waveform_reg[7]_i_3__1_n_7\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(4)
    );
\waveform[5]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2__1_n_6\,
      I3 => \waveform_reg[7]_i_3__1_n_6\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(5)
    );
\waveform[6]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2__1_n_5\,
      I3 => \waveform_reg[7]_i_3__1_n_5\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(6)
    );
\waveform[7]_i_10__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[5]\,
      I1 => Q(5),
      O => \waveform[7]_i_10__1_n_0\
    );
\waveform[7]_i_11__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[4]\,
      I1 => Q(4),
      O => \waveform[7]_i_11__1_n_0\
    );
\waveform[7]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[7]_i_2__1_n_4\,
      I3 => \waveform_reg[7]_i_3__1_n_4\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(7)
    );
\waveform[7]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(7),
      I1 => \^waveform_base_reg[15]\(0),
      O => \waveform[7]_i_4__1_n_0\
    );
\waveform[7]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(6),
      I1 => \waveform_reg_n_0_[6]\,
      O => \waveform[7]_i_5__1_n_0\
    );
\waveform[7]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(5),
      I1 => \waveform_reg_n_0_[5]\,
      O => \waveform[7]_i_6__1_n_0\
    );
\waveform[7]_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(4),
      I1 => \waveform_reg_n_0_[4]\,
      O => \waveform[7]_i_7__1_n_0\
    );
\waveform[7]_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^waveform_base_reg[15]\(0),
      I1 => Q(7),
      O => \waveform[7]_i_8__1_n_0\
    );
\waveform[7]_i_9__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \waveform_reg_n_0_[6]\,
      I1 => Q(6),
      O => \waveform[7]_i_9__1_n_0\
    );
\waveform[8]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2__1_n_7\,
      I3 => \waveform_reg[11]_i_3__1_n_7\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(8)
    );
\waveform[9]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F780F780F0F0F3C0"
    )
        port map (
      I0 => \status_reg[0]_i_3__1_n_4\,
      I1 => status(0),
      I2 => \waveform_reg[11]_i_2__1_n_6\,
      I3 => \waveform_reg[11]_i_3__1_n_6\,
      I4 => \status_reg[0]_i_4__1_n_4\,
      I5 => \^waveform_base_reg[15]\(8),
      O => waveform(9)
    );
\waveform_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(0),
      Q => \waveform_reg_n_0_[0]\
    );
\waveform_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(10),
      Q => \^waveform_base_reg[15]\(3)
    );
\waveform_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(11),
      Q => \^waveform_base_reg[15]\(4)
    );
\waveform_reg[11]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[7]_i_2__1_n_0\,
      CO(3) => \waveform_reg[11]_i_2__1_n_0\,
      CO(2) => \waveform_reg[11]_i_2__1_n_1\,
      CO(1) => \waveform_reg[11]_i_2__1_n_2\,
      CO(0) => \waveform_reg[11]_i_2__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^waveform_base_reg[15]\(4 downto 1),
      O(3) => \waveform_reg[11]_i_2__1_n_4\,
      O(2) => \waveform_reg[11]_i_2__1_n_5\,
      O(1) => \waveform_reg[11]_i_2__1_n_6\,
      O(0) => \waveform_reg[11]_i_2__1_n_7\,
      S(3) => \waveform[11]_i_4__1_n_0\,
      S(2) => \waveform[11]_i_5__1_n_0\,
      S(1) => \waveform[11]_i_6__1_n_0\,
      S(0) => \waveform[11]_i_7__1_n_0\
    );
\waveform_reg[11]_i_3__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[7]_i_3__1_n_0\,
      CO(3) => \waveform_reg[11]_i_3__1_n_0\,
      CO(2) => \waveform_reg[11]_i_3__1_n_1\,
      CO(1) => \waveform_reg[11]_i_3__1_n_2\,
      CO(0) => \waveform_reg[11]_i_3__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^waveform_base_reg[15]\(4 downto 1),
      O(3) => \waveform_reg[11]_i_3__1_n_4\,
      O(2) => \waveform_reg[11]_i_3__1_n_5\,
      O(1) => \waveform_reg[11]_i_3__1_n_6\,
      O(0) => \waveform_reg[11]_i_3__1_n_7\,
      S(3) => \waveform[11]_i_8__1_n_0\,
      S(2) => \waveform[11]_i_9__1_n_0\,
      S(1) => \waveform[11]_i_10__1_n_0\,
      S(0) => \waveform[11]_i_11__1_n_0\
    );
\waveform_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(12),
      Q => \^waveform_base_reg[15]\(5)
    );
\waveform_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(13),
      Q => \^waveform_base_reg[15]\(6)
    );
\waveform_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(14),
      Q => \^waveform_base_reg[15]\(7)
    );
\waveform_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(15),
      Q => \^waveform_base_reg[15]\(8)
    );
\waveform_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(1),
      Q => \waveform_reg_n_0_[1]\
    );
\waveform_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(2),
      Q => \waveform_reg_n_0_[2]\
    );
\waveform_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(3),
      Q => \waveform_reg_n_0_[3]\
    );
\waveform_reg[3]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \waveform_reg[3]_i_2__1_n_0\,
      CO(2) => \waveform_reg[3]_i_2__1_n_1\,
      CO(1) => \waveform_reg[3]_i_2__1_n_2\,
      CO(0) => \waveform_reg[3]_i_2__1_n_3\,
      CYINIT => '1',
      DI(3) => \waveform_reg_n_0_[3]\,
      DI(2) => \waveform_reg_n_0_[2]\,
      DI(1) => \waveform_reg_n_0_[1]\,
      DI(0) => \waveform_reg_n_0_[0]\,
      O(3) => \waveform_reg[3]_i_2__1_n_4\,
      O(2) => \waveform_reg[3]_i_2__1_n_5\,
      O(1) => \waveform_reg[3]_i_2__1_n_6\,
      O(0) => \waveform_reg[3]_i_2__1_n_7\,
      S(3) => \waveform[3]_i_4__1_n_0\,
      S(2) => \waveform[3]_i_5__1_n_0\,
      S(1) => \waveform[3]_i_6__1_n_0\,
      S(0) => \waveform[3]_i_7__1_n_0\
    );
\waveform_reg[3]_i_3__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \waveform_reg[3]_i_3__1_n_0\,
      CO(2) => \waveform_reg[3]_i_3__1_n_1\,
      CO(1) => \waveform_reg[3]_i_3__1_n_2\,
      CO(0) => \waveform_reg[3]_i_3__1_n_3\,
      CYINIT => '0',
      DI(3) => \waveform_reg_n_0_[3]\,
      DI(2) => \waveform_reg_n_0_[2]\,
      DI(1) => \waveform_reg_n_0_[1]\,
      DI(0) => \waveform_reg_n_0_[0]\,
      O(3) => \waveform_reg[3]_i_3__1_n_4\,
      O(2) => \waveform_reg[3]_i_3__1_n_5\,
      O(1) => \waveform_reg[3]_i_3__1_n_6\,
      O(0) => \waveform_reg[3]_i_3__1_n_7\,
      S(3) => \waveform[3]_i_8__1_n_0\,
      S(2) => \waveform[3]_i_9__1_n_0\,
      S(1) => \waveform[3]_i_10__1_n_0\,
      S(0) => \waveform[3]_i_11__1_n_0\
    );
\waveform_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(4),
      Q => \waveform_reg_n_0_[4]\
    );
\waveform_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(5),
      Q => \waveform_reg_n_0_[5]\
    );
\waveform_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(6),
      Q => \waveform_reg_n_0_[6]\
    );
\waveform_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(7),
      Q => \^waveform_base_reg[15]\(0)
    );
\waveform_reg[7]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[3]_i_2__1_n_0\,
      CO(3) => \waveform_reg[7]_i_2__1_n_0\,
      CO(2) => \waveform_reg[7]_i_2__1_n_1\,
      CO(1) => \waveform_reg[7]_i_2__1_n_2\,
      CO(0) => \waveform_reg[7]_i_2__1_n_3\,
      CYINIT => '0',
      DI(3) => \^waveform_base_reg[15]\(0),
      DI(2) => \waveform_reg_n_0_[6]\,
      DI(1) => \waveform_reg_n_0_[5]\,
      DI(0) => \waveform_reg_n_0_[4]\,
      O(3) => \waveform_reg[7]_i_2__1_n_4\,
      O(2) => \waveform_reg[7]_i_2__1_n_5\,
      O(1) => \waveform_reg[7]_i_2__1_n_6\,
      O(0) => \waveform_reg[7]_i_2__1_n_7\,
      S(3) => \waveform[7]_i_4__1_n_0\,
      S(2) => \waveform[7]_i_5__1_n_0\,
      S(1) => \waveform[7]_i_6__1_n_0\,
      S(0) => \waveform[7]_i_7__1_n_0\
    );
\waveform_reg[7]_i_3__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \waveform_reg[3]_i_3__1_n_0\,
      CO(3) => \waveform_reg[7]_i_3__1_n_0\,
      CO(2) => \waveform_reg[7]_i_3__1_n_1\,
      CO(1) => \waveform_reg[7]_i_3__1_n_2\,
      CO(0) => \waveform_reg[7]_i_3__1_n_3\,
      CYINIT => '0',
      DI(3) => \^waveform_base_reg[15]\(0),
      DI(2) => \waveform_reg_n_0_[6]\,
      DI(1) => \waveform_reg_n_0_[5]\,
      DI(0) => \waveform_reg_n_0_[4]\,
      O(3) => \waveform_reg[7]_i_3__1_n_4\,
      O(2) => \waveform_reg[7]_i_3__1_n_5\,
      O(1) => \waveform_reg[7]_i_3__1_n_6\,
      O(0) => \waveform_reg[7]_i_3__1_n_7\,
      S(3) => \waveform[7]_i_8__1_n_0\,
      S(2) => \waveform[7]_i_9__1_n_0\,
      S(1) => \waveform[7]_i_10__1_n_0\,
      S(0) => \waveform[7]_i_11__1_n_0\
    );
\waveform_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(8),
      Q => \^waveform_base_reg[15]\(1)
    );
\waveform_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \cs_reg[0]\(0),
      CLR => reset,
      D => waveform(9),
      Q => \^waveform_base_reg[15]\(2)
    );
end STRUCTURE;
`protect begin_protected
`protect version = 1
`protect encrypt_agent = "XILINX"
`protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`protect key_block
arnh+KKoDgsw4/tPEYwnnPGDRbVikesong6+Q2OyHujI0sMs8SCxocYLiXw5FQrlRM68qU6J4fD5
u2TxpWpRVQ==


`protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`protect key_block
Yq/vnjZLCL1QwIH7cUbwc5FvSHLhapSL6t8LSQJUEHtxWu+KSjh1dhPJmktrgDFaXac705ujvztl
+YNsaRHfN24YRZgfmuNNkTYC/UuSjXT5p/OoHt34ja5+sL1swpkd0kS4KoUu1L5VgNu5PzU1KlJu
xNTTz0V55se0kA3xWGQ=


`protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`protect key_block
eoHGlvGv7vY3KM2pS9QmvseVWbTY70mMUJ3dA0VjqlsHyDJxtnekm0x4ES3HnmtT6I31arKf6/ET
ILLvECnH2OOJH68Mcf4J7JFoX45Zwa7B7KIjwEYTSxi92dQiphR/l29FqZuSejHT7E7bMi4sclKz
j+vGrH1SqUduR0rwKN9CPHaVuDw/oVW2lWa9c3BvcGgxPZYlQfuBzMSoT7ADN6SHXTy8LugMRN19
ZeoXElJXwG4eJoi81sjzUnliKzvxYAUg5fobuuhqHUtJVxrVPTQmR3/xJ4qtPwhElOZ3/puQnm50
9DRgrlf21WXL7TGNp7fuSABNGeZz8AwBEp0Vrg==


`protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`protect key_block
TeLIf/zkpCY4yQD/TbVP7xhsSq6QqpAxE+H0wAcGmKjkx1YJ+YQD83Gi50v2Dxag9LF0iTX0QwAQ
/QvIx7YohUWqQvk+r2+0yK1URFJmBCNFEEivz+FDjQlbO1RDN1XaKdHoCL25pyeg1dtt9P7mQ33V
nqRohJY9ZYEdwnXPBdY=


`protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`protect key_block
fOxmOBbj/YQDvu07VmpBaNFeLYg0SbTKg02Kj6lBe0YdruMt8S7cfJlbx82jKhkR/NlBv2HbJo+e
TUO8AOppQbnS+cHMa8q6CqMi4aTf38ur9dGrsWfXdqtFgwbHnesqIWvZJGaoWSctLiHT6GsQM0GG
Tru90EZL56azfqnVDZxXIapp7tYbdgZBFhdsrGDFzAx7l+LUsYAqJ0L8llIw9IWY+8q/E3Gy9rpS
YPICwHReFMwy12AIuCLjzneQvBv1J7TzX7xOGO9D6usPWzR3Ig03iZPhbgu4HfeKyk4x8fM5TrTw
4E17UpHtFJ/o6MADz00WRJLpGrki4atbYJ7OPg==


`protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`protect key_block
WYdv5f4jx9I0SIVo0LvWz+8BURoRGiMZaPS9tSfBda5/N0ZAmlK2TM3BByWmJP0V9DrfXlY/cjfI
2YLAU/dPVKYYZvgH4A3ckj+qYax0JcQe5qyZdvxP8RBzy2Y7htbXvH9Fd7NuQaF4mYQvPmJx4ABQ
a1GSGFm85DNg5au4kKbZGiHIhuQNmSZ1w1MEBMlZjvHB3XGxxPKd79lGcXWD0Ozeon0ppivI9uAZ
xW88YFDo67GrvFopQl5HvQCYNvvjpsw+gTG7FhqgPGiJ7KmKD1S8KWy3eOxugZ2g7/A7kGpFpaCa
bkaYI+2Rs8uZFPJiIfJC7fNXcidAV3uMMQM5fw==


`protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`protect key_block
sZgfojMcSe/aeVghr9GzO18ieRawBO/3e1YB90POMgmzKapmvMF3jW14A8sTZqY8Kyxgiy813f7L
skQ1lpvY2gv7EqHqRJz4XRrGs4anjV8FgFlwc34GyEtIIuo4CLK8qSrttLg09u4pFkmRQ+KQuCFe
b5gy3dT6IAFOD5G0yN7NtjJq450ox2Ghuy9w2GNvGHn9jsdP/CayhOeuYld5+RBeMzI370GAgnpa
tEvWox3IwNNnW3y2fhqIExjozRwyoTdcx4LEUp3vDVt6i4shsMP5ktElxh7qN4LkNlG2fOocIGbD
SQmrsCJNsTC3HO7CMgTCz9FswikwbMHi5JEw2A==


`protect data_method = "AES128-CBC"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 25712)
`protect data_block
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
FOipO14=
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_I2C is
  port (
    sent_reg : out STD_LOGIC;
    SCL : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    SDA : inout STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    sent_reg_0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    \cs_reg[1]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_I2C : entity is "I2C";
end audioSys_0_I2C;

architecture STRUCTURE of audioSys_0_I2C is
  signal SCLCount_n_0 : STD_LOGIC;
  signal SCLCount_n_1 : STD_LOGIC;
  signal SCLCount_n_2 : STD_LOGIC;
  signal SCLCount_n_6 : STD_LOGIC;
  signal SCLCount_n_7 : STD_LOGIC;
  signal SCLCount_n_8 : STD_LOGIC;
  signal SCLCount_n_9 : STD_LOGIC;
  signal SDA_INST_0_i_10_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_11_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_12_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_13_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_14_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_15_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_16_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_17_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_18_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_19_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_20_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_21_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_22_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_23_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_24_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_25_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_26_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_27_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_28_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_29_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_2_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_30_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_31_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_32_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_33_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_34_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_35_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_36_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_5_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_6_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_7_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_8_n_0 : STD_LOGIC;
  signal SDA_INST_0_i_9_n_0 : STD_LOGIC;
  signal \bitCount[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \bitCount[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \bitCount[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \bitCount[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \bitCount[3]_i_4_n_0\ : STD_LOGIC;
  signal \bitCount_reg_n_0_[0]\ : STD_LOGIC;
  signal \bitCount_reg_n_0_[1]\ : STD_LOGIC;
  signal \bitCount_reg_n_0_[2]\ : STD_LOGIC;
  signal byteAck_i_5_n_0 : STD_LOGIC;
  signal byteAck_reg_n_0 : STD_LOGIC;
  signal \byteCount_reg_n_0_[0]\ : STD_LOGIC;
  signal \byteCount_reg_n_0_[1]\ : STD_LOGIC;
  signal byteDone : STD_LOGIC;
  signal cs : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of SDA_INST_0_i_2 : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of SDA_INST_0_i_21 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of SDA_INST_0_i_24 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of SDA_INST_0_i_25 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of SDA_INST_0_i_26 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of SDA_INST_0_i_28 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of SDA_INST_0_i_31 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of SDA_INST_0_i_32 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of SDA_INST_0_i_33 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of SDA_INST_0_i_34 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of SDA_INST_0_i_36 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \bitCount[0]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \bitCount[1]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of byteAck_i_5 : label is "soft_lutpair24";
begin
SCLCount: entity work.audioSys_0_counterSCL
     port map (
      D(1) => SCLCount_n_0,
      D(0) => SCLCount_n_1,
      E(0) => E(0),
      Q(1 downto 0) => cs(1 downto 0),
      SCL => SCL,
      SDA => SDA,
      \bitCount_reg[0]\(0) => SCLCount_n_6,
      \bitCount_reg[2]\ => SDA_INST_0_i_5_n_0,
      \bitCount_reg[3]\(0) => byteDone,
      byteAck_reg => SCLCount_n_7,
      byteAck_reg_0 => byteAck_reg_n_0,
      \byteCount_reg[0]\ => SCLCount_n_9,
      \byteCount_reg[0]_0\ => \byteCount_reg_n_0_[0]\,
      \byteCount_reg[1]\ => SCLCount_n_8,
      \byteCount_reg[1]_0\ => \byteCount_reg_n_0_[1]\,
      clk => clk,
      \count_reg[4]_0\(3 downto 0) => Q(4 downto 1),
      \cs_reg[0]\ => SCLCount_n_2,
      \cs_reg[0]_0\ => SDA_INST_0_i_2_n_0,
      \cs_reg[1]\(1 downto 0) => \cs_reg[1]_0\(1 downto 0),
      \cs_reg[1]_0\ => byteAck_i_5_n_0,
      reset => reset,
      sent_reg => sent_reg,
      sent_reg_0 => sent_reg_0
    );
SDA_INST_0_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000560000000000"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => Q(0),
      I3 => SDA_INST_0_i_23_n_0,
      I4 => Q(3),
      I5 => Q(4),
      O => SDA_INST_0_i_10_n_0
    );
SDA_INST_0_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000020310C36"
    )
        port map (
      I0 => Q(0),
      I1 => Q(3),
      I2 => Q(1),
      I3 => Q(4),
      I4 => Q(2),
      I5 => SDA_INST_0_i_24_n_0,
      O => SDA_INST_0_i_11_n_0
    );
SDA_INST_0_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAC0FF00AAC0FF"
    )
        port map (
      I0 => SCLCount_n_2,
      I1 => SDA_INST_0_i_23_n_0,
      I2 => SDA_INST_0_i_25_n_0,
      I3 => \byteCount_reg_n_0_[1]\,
      I4 => \byteCount_reg_n_0_[0]\,
      I5 => SDA_INST_0_i_26_n_0,
      O => SDA_INST_0_i_12_n_0
    );
SDA_INST_0_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCFCFCFC4C7CFCFC"
    )
        port map (
      I0 => SDA_INST_0_i_27_n_0,
      I1 => \byteCount_reg_n_0_[0]\,
      I2 => \byteCount_reg_n_0_[1]\,
      I3 => SDA_INST_0_i_28_n_0,
      I4 => \cs_reg[1]_0\(0),
      I5 => \cs_reg[1]_0\(1),
      O => SDA_INST_0_i_13_n_0
    );
SDA_INST_0_i_14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \bitCount_reg_n_0_[0]\,
      I1 => SDA_INST_0_i_29_n_0,
      I2 => \byteCount_reg_n_0_[1]\,
      I3 => Q(0),
      I4 => Q(1),
      O => SDA_INST_0_i_14_n_0
    );
SDA_INST_0_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F481B600000000"
    )
        port map (
      I0 => Q(2),
      I1 => Q(0),
      I2 => Q(1),
      I3 => Q(4),
      I4 => Q(3),
      I5 => SDA_INST_0_i_23_n_0,
      O => SDA_INST_0_i_15_n_0
    );
SDA_INST_0_i_16: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001011"
    )
        port map (
      I0 => Q(2),
      I1 => \cs_reg[1]_0\(1),
      I2 => Q(4),
      I3 => Q(3),
      I4 => SDA_INST_0_i_30_n_0,
      O => SDA_INST_0_i_16_n_0
    );
SDA_INST_0_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88AAAA8208802880"
    )
        port map (
      I0 => SDA_INST_0_i_31_n_0,
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(4),
      I5 => Q(3),
      O => SDA_INST_0_i_17_n_0
    );
SDA_INST_0_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000008CBCFCFC"
    )
        port map (
      I0 => SDA_INST_0_i_32_n_0,
      I1 => \byteCount_reg_n_0_[0]\,
      I2 => \byteCount_reg_n_0_[1]\,
      I3 => SDA_INST_0_i_33_n_0,
      I4 => SDA_INST_0_i_23_n_0,
      I5 => \bitCount_reg_n_0_[0]\,
      O => SDA_INST_0_i_18_n_0
    );
SDA_INST_0_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FF070F07FF07FF0"
    )
        port map (
      I0 => SDA_INST_0_i_34_n_0,
      I1 => SDA_INST_0_i_23_n_0,
      I2 => \byteCount_reg_n_0_[0]\,
      I3 => \byteCount_reg_n_0_[1]\,
      I4 => SDA_INST_0_i_35_n_0,
      I5 => SDA_INST_0_i_36_n_0,
      O => SDA_INST_0_i_19_n_0
    );
SDA_INST_0_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => cs(0),
      I1 => cs(1),
      I2 => byteDone,
      O => SDA_INST_0_i_2_n_0
    );
SDA_INST_0_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033332303323023"
    )
        port map (
      I0 => Q(0),
      I1 => SDA_INST_0_i_24_n_0,
      I2 => Q(2),
      I3 => Q(3),
      I4 => Q(4),
      I5 => Q(1),
      O => SDA_INST_0_i_20_n_0
    );
SDA_INST_0_i_21: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C1F1FDFD"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(3),
      I4 => Q(4),
      O => SDA_INST_0_i_21_n_0
    );
SDA_INST_0_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F5D5F5DFFFFFFFFF"
    )
        port map (
      I0 => SDA_INST_0_i_23_n_0,
      I1 => Q(2),
      I2 => Q(1),
      I3 => Q(3),
      I4 => Q(4),
      I5 => \byteCount_reg_n_0_[1]\,
      O => SDA_INST_0_i_22_n_0
    );
SDA_INST_0_i_23: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cs_reg[1]_0\(0),
      I1 => \cs_reg[1]_0\(1),
      O => SDA_INST_0_i_23_n_0
    );
SDA_INST_0_i_24: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \cs_reg[1]_0\(1),
      I1 => \cs_reg[1]_0\(0),
      I2 => \byteCount_reg_n_0_[1]\,
      O => SDA_INST_0_i_24_n_0
    );
SDA_INST_0_i_25: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04B10532"
    )
        port map (
      I0 => Q(2),
      I1 => Q(4),
      I2 => Q(1),
      I3 => Q(3),
      I4 => Q(0),
      O => SDA_INST_0_i_25_n_0
    );
SDA_INST_0_i_26: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14101060"
    )
        port map (
      I0 => Q(2),
      I1 => Q(3),
      I2 => Q(4),
      I3 => Q(1),
      I4 => Q(0),
      O => SDA_INST_0_i_26_n_0
    );
SDA_INST_0_i_27: unisim.vcomponents.LUT5
    generic map(
      INIT => X"001014E0"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => Q(4),
      I3 => Q(3),
      I4 => Q(2),
      O => SDA_INST_0_i_27_n_0
    );
SDA_INST_0_i_28: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1145FEFE"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(4),
      I4 => Q(3),
      O => SDA_INST_0_i_28_n_0
    );
SDA_INST_0_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \cs_reg[1]_0\(0),
      I1 => \byteCount_reg_n_0_[0]\,
      I2 => Q(4),
      I3 => Q(3),
      I4 => \cs_reg[1]_0\(1),
      I5 => Q(2),
      O => SDA_INST_0_i_29_n_0
    );
SDA_INST_0_i_30: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DBFFFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(4),
      I2 => Q(0),
      I3 => \byteCount_reg_n_0_[1]\,
      I4 => \cs_reg[1]_0\(0),
      O => SDA_INST_0_i_30_n_0
    );
SDA_INST_0_i_31: unisim.vcomponents.LUT5
    generic map(
      INIT => X"07000000"
    )
        port map (
      I0 => Q(2),
      I1 => Q(3),
      I2 => \cs_reg[1]_0\(1),
      I3 => \cs_reg[1]_0\(0),
      I4 => \byteCount_reg_n_0_[1]\,
      O => SDA_INST_0_i_31_n_0
    );
SDA_INST_0_i_32: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEBED17"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => Q(4),
      I3 => Q(3),
      I4 => Q(2),
      O => SDA_INST_0_i_32_n_0
    );
SDA_INST_0_i_33: unisim.vcomponents.LUT5
    generic map(
      INIT => X"454B4432"
    )
        port map (
      I0 => Q(4),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(3),
      I4 => Q(1),
      O => SDA_INST_0_i_33_n_0
    );
SDA_INST_0_i_34: unisim.vcomponents.LUT5
    generic map(
      INIT => X"15561E40"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(1),
      I3 => Q(0),
      I4 => Q(4),
      O => SDA_INST_0_i_34_n_0
    );
SDA_INST_0_i_35: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFB800FFFFFFFF"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(1),
      I3 => Q(4),
      I4 => \cs_reg[1]_0\(1),
      I5 => \cs_reg[1]_0\(0),
      O => SDA_INST_0_i_35_n_0
    );
SDA_INST_0_i_36: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F5EFFFA4"
    )
        port map (
      I0 => Q(4),
      I1 => Q(3),
      I2 => Q(1),
      I3 => Q(0),
      I4 => Q(2),
      O => SDA_INST_0_i_36_n_0
    );
SDA_INST_0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => SDA_INST_0_i_6_n_0,
      I1 => SDA_INST_0_i_7_n_0,
      I2 => \bitCount_reg_n_0_[2]\,
      I3 => SDA_INST_0_i_8_n_0,
      I4 => \bitCount_reg_n_0_[1]\,
      I5 => SDA_INST_0_i_9_n_0,
      O => SDA_INST_0_i_5_n_0
    );
SDA_INST_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F80FFFF8F800000"
    )
        port map (
      I0 => \byteCount_reg_n_0_[1]\,
      I1 => SDA_INST_0_i_10_n_0,
      I2 => \byteCount_reg_n_0_[0]\,
      I3 => SDA_INST_0_i_11_n_0,
      I4 => \bitCount_reg_n_0_[0]\,
      I5 => SDA_INST_0_i_12_n_0,
      O => SDA_INST_0_i_6_n_0
    );
SDA_INST_0_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7070777070707777"
    )
        port map (
      I0 => \bitCount_reg_n_0_[0]\,
      I1 => SDA_INST_0_i_13_n_0,
      I2 => SDA_INST_0_i_14_n_0,
      I3 => SDA_INST_0_i_15_n_0,
      I4 => \byteCount_reg_n_0_[0]\,
      I5 => \byteCount_reg_n_0_[1]\,
      O => SDA_INST_0_i_7_n_0
    );
SDA_INST_0_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000DFD5"
    )
        port map (
      I0 => \bitCount_reg_n_0_[0]\,
      I1 => SDA_INST_0_i_16_n_0,
      I2 => \byteCount_reg_n_0_[0]\,
      I3 => SDA_INST_0_i_17_n_0,
      I4 => SDA_INST_0_i_18_n_0,
      O => SDA_INST_0_i_8_n_0
    );
SDA_INST_0_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7444744474777444"
    )
        port map (
      I0 => SDA_INST_0_i_19_n_0,
      I1 => \bitCount_reg_n_0_[0]\,
      I2 => SDA_INST_0_i_20_n_0,
      I3 => \byteCount_reg_n_0_[0]\,
      I4 => SDA_INST_0_i_21_n_0,
      I5 => SDA_INST_0_i_22_n_0,
      O => SDA_INST_0_i_9_n_0
    );
\bitCount[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDFF"
    )
        port map (
      I0 => cs(0),
      I1 => cs(1),
      I2 => byteAck_reg_n_0,
      I3 => \bitCount_reg_n_0_[0]\,
      O => \bitCount[0]_i_1__0_n_0\
    );
\bitCount[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFDFF"
    )
        port map (
      I0 => cs(0),
      I1 => cs(1),
      I2 => byteAck_reg_n_0,
      I3 => \bitCount_reg_n_0_[1]\,
      I4 => \bitCount_reg_n_0_[0]\,
      O => \bitCount[1]_i_1__0_n_0\
    );
\bitCount[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFDFFFDFFFDFDFF"
    )
        port map (
      I0 => cs(0),
      I1 => cs(1),
      I2 => byteAck_reg_n_0,
      I3 => \bitCount_reg_n_0_[2]\,
      I4 => \bitCount_reg_n_0_[0]\,
      I5 => \bitCount_reg_n_0_[1]\,
      O => \bitCount[2]_i_1__0_n_0\
    );
\bitCount[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000044410000"
    )
        port map (
      I0 => byteAck_reg_n_0,
      I1 => byteDone,
      I2 => \bitCount[3]_i_4_n_0\,
      I3 => \bitCount_reg_n_0_[2]\,
      I4 => cs(0),
      I5 => cs(1),
      O => \bitCount[3]_i_2__0_n_0\
    );
\bitCount[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \bitCount_reg_n_0_[0]\,
      I1 => \bitCount_reg_n_0_[1]\,
      O => \bitCount[3]_i_4_n_0\
    );
\bitCount_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => SCLCount_n_6,
      D => \bitCount[0]_i_1__0_n_0\,
      PRE => reset,
      Q => \bitCount_reg_n_0_[0]\
    );
\bitCount_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => SCLCount_n_6,
      D => \bitCount[1]_i_1__0_n_0\,
      PRE => reset,
      Q => \bitCount_reg_n_0_[1]\
    );
\bitCount_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => SCLCount_n_6,
      D => \bitCount[2]_i_1__0_n_0\,
      PRE => reset,
      Q => \bitCount_reg_n_0_[2]\
    );
\bitCount_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => SCLCount_n_6,
      CLR => reset,
      D => \bitCount[3]_i_2__0_n_0\,
      Q => byteDone
    );
byteAck_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => cs(1),
      I1 => cs(0),
      O => byteAck_i_5_n_0
    );
byteAck_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => SCLCount_n_7,
      Q => byteAck_reg_n_0
    );
\byteCount_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => SCLCount_n_9,
      Q => \byteCount_reg_n_0_[0]\
    );
\byteCount_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => SCLCount_n_8,
      Q => \byteCount_reg_n_0_[1]\
    );
\cs_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => SCLCount_n_1,
      Q => cs(0)
    );
\cs_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => SCLCount_n_0,
      Q => cs(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_clk_wiz_0 is
  port (
    clk_main : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of audioSys_0_clk_wiz_0 : entity is "clk_wiz_0,clk_wiz_v5_1,{component_name=clk_wiz_0,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=1,clkin1_period=10.0,clkin2_period=10.0,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_clk_wiz_0 : entity is "clk_wiz_0";
end audioSys_0_clk_wiz_0;

architecture STRUCTURE of audioSys_0_clk_wiz_0 is
begin
inst: entity work.audioSys_0_clk_wiz_0_clk_wiz
     port map (
      clk_main => clk_main,
      clk_out1 => clk_out1,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_comInterface is
  port (
    div_en_reg : out STD_LOGIC;
    div_en_reg_0 : out STD_LOGIC;
    div_en_reg_1 : out STD_LOGIC;
    \data_reg[9]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \data_reg[9]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \data_reg[9]_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \data_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    atten_enable : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MREQ_N : in STD_LOGIC;
    WR_N : in STD_LOGIC;
    addr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    div_en_reg_2 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    div_en_reg_3 : in STD_LOGIC;
    \count_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    div_en_reg_4 : in STD_LOGIC;
    \count_reg[4]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_comInterface : entity is "comInterface";
end audioSys_0_comInterface;

architecture STRUCTURE of audioSys_0_comInterface is
  signal \^q\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal command_stored_n_0 : STD_LOGIC;
  signal command_stored_n_7 : STD_LOGIC;
  signal cs : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \cs[0]_i_1__4_n_0\ : STD_LOGIC;
  signal \cs[1]_i_1__4_n_0\ : STD_LOGIC;
  signal received_byte : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal received_stored_n_0 : STD_LOGIC;
  signal received_stored_n_1 : STD_LOGIC;
  signal received_stored_n_13 : STD_LOGIC;
  signal received_stored_n_14 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cs[0]_i_1__4\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \cs[1]_i_1__4\ : label is "soft_lutpair7";
begin
  Q(5 downto 0) <= \^q\(5 downto 0);
command_stored: entity work.audioSys_0_commandDecoder
     port map (
      E(0) => E(0),
      Q(1 downto 0) => cs(1 downto 0),
      \atten_mag_stored_reg[0]\ => command_stored_n_7,
      clk => clk,
      \count_reg[4]\(0) => \count_reg[4]\(0),
      \count_reg[4]_0\(0) => \count_reg[4]_0\(0),
      \data_reg[3]\(3 downto 0) => \data_reg[3]\(3 downto 0),
      \data_reg[9]\(0) => \data_reg[9]\(0),
      \data_reg[9]_0\(0) => \data_reg[9]_0\(0),
      \data_reg[9]_1\(0) => \data_reg[9]_1\(0),
      div_en_reg => div_en_reg,
      div_en_reg_0 => div_en_reg_0,
      div_en_reg_1 => div_en_reg_1,
      div_en_reg_2 => div_en_reg_2,
      div_en_reg_3 => div_en_reg_3,
      div_en_reg_4 => div_en_reg_4,
      double_transfer_reg_0 => command_stored_n_0,
      \received_byte_reg[4]\(0) => received_stored_n_13,
      \received_byte_reg[6]\ => received_stored_n_14,
      \received_byte_reg[7]\(6 downto 5) => received_byte(7 downto 6),
      \received_byte_reg[7]\(4) => \^q\(5),
      \received_byte_reg[7]\(3 downto 0) => \^q\(3 downto 0),
      reset => reset
    );
\cs[0]_i_1__4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0111"
    )
        port map (
      I0 => received_stored_n_1,
      I1 => received_stored_n_0,
      I2 => cs(1),
      I3 => cs(0),
      O => \cs[0]_i_1__4_n_0\
    );
\cs[1]_i_1__4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E00"
    )
        port map (
      I0 => received_stored_n_1,
      I1 => received_stored_n_0,
      I2 => cs(1),
      I3 => cs(0),
      O => \cs[1]_i_1__4_n_0\
    );
\cs_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \cs[0]_i_1__4_n_0\,
      Q => cs(0)
    );
\cs_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \cs[1]_i_1__4_n_0\,
      Q => cs(1)
    );
received_stored: entity work.audioSys_0_regReceiver
     port map (
      MREQ_N => MREQ_N,
      Q(7 downto 6) => received_byte(7 downto 6),
      Q(5 downto 0) => \^q\(5 downto 0),
      WR_N => WR_N,
      addr(9 downto 0) => addr(9 downto 0),
      atten_enable(2 downto 0) => atten_enable(2 downto 0),
      clk => clk,
      \cs_reg[0]\ => command_stored_n_7,
      \cs_reg[1]\(1 downto 0) => cs(1 downto 0),
      data(7 downto 0) => data(7 downto 0),
      double_transfer_reg => received_stored_n_14,
      double_transfer_reg_0 => command_stored_n_0,
      \first_byte_reg[7]\(0) => received_stored_n_13,
      \received_byte_reg[0]_0\ => received_stored_n_0,
      \received_byte_reg[0]_1\ => received_stored_n_1,
      reset => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_divider is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \step_size_curr_reg[15]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    reset : in STD_LOGIC;
    div_en_reg : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_divider : entity is "divider";
end audioSys_0_divider;

architecture STRUCTURE of audioSys_0_divider is
  signal div_cnt_n_0 : STD_LOGIC;
  signal div_cnt_n_1 : STD_LOGIC;
  signal div_cnt_n_2 : STD_LOGIC;
  signal remainder : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal remainder0 : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \remainder[10]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_10_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_7_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_8_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_9_n_0\ : STD_LOGIC;
  signal \remainder[12]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[13]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[14]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_10_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_7_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_8_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_9_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_10_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_11_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_12_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_13_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_14_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_15_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_16_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_17_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_18_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_19_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_21_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_22_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_23_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_5_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_6_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_7_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_9_n_0\ : STD_LOGIC;
  signal \remainder[1]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[2]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_5_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_6_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_7_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_8_n_0\ : STD_LOGIC;
  signal \remainder[4]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[5]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[6]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_10_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_7_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_8_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_9_n_0\ : STD_LOGIC;
  signal \remainder[8]_i_1_n_0\ : STD_LOGIC;
  signal \remainder[9]_i_1_n_0\ : STD_LOGIC;
  signal remainder_preview : STD_LOGIC_VECTOR ( 15 downto 2 );
  signal \remainder_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \remainder_reg[11]_i_2_n_1\ : STD_LOGIC;
  signal \remainder_reg[11]_i_2_n_2\ : STD_LOGIC;
  signal \remainder_reg[11]_i_2_n_3\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2_n_0\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2_n_1\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2_n_2\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2_n_3\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2_n_1\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2_n_2\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2_n_3\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2_n_1\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2_n_2\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2_n_3\ : STD_LOGIC;
  signal step_size1 : STD_LOGIC;
  signal \step_size[0]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[10]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[11]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[12]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[13]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[14]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[15]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[1]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[2]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[3]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[4]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[5]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[6]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[7]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[8]_i_1_n_0\ : STD_LOGIC;
  signal \step_size[9]_i_1_n_0\ : STD_LOGIC;
  signal \^step_size_curr_reg[15]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_remainder_reg[16]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_remainder_reg[16]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \remainder[7]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \step_size[0]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \step_size[10]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \step_size[11]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \step_size[12]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \step_size[13]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \step_size[14]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \step_size[15]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \step_size[2]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \step_size[3]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \step_size[4]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \step_size[5]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \step_size[6]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \step_size[7]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \step_size[8]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \step_size[9]_i_1\ : label is "soft_lutpair75";
begin
  \step_size_curr_reg[15]\(15 downto 0) <= \^step_size_curr_reg[15]\(15 downto 0);
div_cnt: entity work.audioSys_0_counter
     port map (
      CO(0) => step_size1,
      D(0) => div_cnt_n_2,
      DI(2) => \remainder[16]_i_17_n_0\,
      DI(1) => \remainder[16]_i_18_n_0\,
      DI(0) => \remainder[16]_i_19_n_0\,
      E(0) => E(0),
      Q(1 downto 0) => Q(1 downto 0),
      S(0) => div_cnt_n_0,
      clk => clk,
      div_en_reg => div_en_reg,
      remainder0(0) => remainder0(0),
      remainder_preview(0) => div_cnt_n_1,
      \remainder_reg[0]\(0) => remainder(0),
      \remainder_reg[13]\(3) => \remainder[16]_i_9_n_0\,
      \remainder_reg[13]\(2) => \remainder[16]_i_10_n_0\,
      \remainder_reg[13]\(1) => \remainder[16]_i_11_n_0\,
      \remainder_reg[13]\(0) => \remainder[16]_i_12_n_0\,
      \remainder_reg[14]\(3) => \remainder[16]_i_13_n_0\,
      \remainder_reg[14]\(2) => \remainder[16]_i_14_n_0\,
      \remainder_reg[14]\(1) => \remainder[16]_i_15_n_0\,
      \remainder_reg[14]\(0) => \remainder[16]_i_16_n_0\,
      \remainder_reg[15]\(0) => \remainder[16]_i_6_n_0\,
      \remainder_reg[16]\(0) => \remainder[16]_i_5_n_0\,
      \remainder_reg[6]\(2) => \remainder[16]_i_21_n_0\,
      \remainder_reg[6]\(1) => \remainder[16]_i_22_n_0\,
      \remainder_reg[6]\(0) => \remainder[16]_i_23_n_0\,
      reset => reset
    );
\remainder[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(10),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(9),
      O => \remainder[10]_i_1_n_0\
    );
\remainder[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(11),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(10),
      O => \remainder[11]_i_1_n_0\
    );
\remainder[11]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(7),
      I1 => reset,
      I2 => Q(8),
      O => \remainder[11]_i_10_n_0\
    );
\remainder[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(10),
      I1 => reset,
      O => remainder_preview(11)
    );
\remainder[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(9),
      I1 => reset,
      O => remainder_preview(10)
    );
\remainder[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(8),
      I1 => reset,
      O => remainder_preview(9)
    );
\remainder[11]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(7),
      I1 => reset,
      O => remainder_preview(8)
    );
\remainder[11]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(10),
      O => \remainder[11]_i_7_n_0\
    );
\remainder[11]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(9),
      O => \remainder[11]_i_8_n_0\
    );
\remainder[11]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(8),
      I2 => Q(9),
      O => \remainder[11]_i_9_n_0\
    );
\remainder[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(12),
      I1 => remainder(11),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[12]_i_1_n_0\
    );
\remainder[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(13),
      I1 => remainder(12),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[13]_i_1_n_0\
    );
\remainder[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(14),
      I1 => remainder(13),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[14]_i_1_n_0\
    );
\remainder[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(15),
      I1 => remainder(14),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[15]_i_1_n_0\
    );
\remainder[15]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(11),
      O => \remainder[15]_i_10_n_0\
    );
\remainder[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(14),
      I1 => reset,
      O => remainder_preview(15)
    );
\remainder[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(13),
      I1 => reset,
      O => remainder_preview(14)
    );
\remainder[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(12),
      I1 => reset,
      O => remainder_preview(13)
    );
\remainder[15]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(11),
      I1 => reset,
      O => remainder_preview(12)
    );
\remainder[15]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(14),
      O => \remainder[15]_i_7_n_0\
    );
\remainder[15]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(13),
      O => \remainder[15]_i_8_n_0\
    );
\remainder[15]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(12),
      O => \remainder[15]_i_9_n_0\
    );
\remainder[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4000400"
    )
        port map (
      I0 => reset,
      I1 => remainder(15),
      I2 => step_size1,
      I3 => div_en_reg,
      I4 => remainder0(16),
      O => \remainder[16]_i_1_n_0\
    );
\remainder[16]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => remainder(11),
      I1 => reset,
      I2 => remainder(12),
      O => \remainder[16]_i_10_n_0\
    );
\remainder[16]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => remainder(9),
      I1 => reset,
      I2 => remainder(10),
      O => \remainder[16]_i_11_n_0\
    );
\remainder[16]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(9),
      I1 => reset,
      I2 => remainder(8),
      I3 => remainder(7),
      I4 => Q(8),
      O => \remainder[16]_i_12_n_0\
    );
\remainder[16]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CD"
    )
        port map (
      I0 => remainder(14),
      I1 => reset,
      I2 => remainder(13),
      O => \remainder[16]_i_13_n_0\
    );
\remainder[16]_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CD"
    )
        port map (
      I0 => remainder(12),
      I1 => reset,
      I2 => remainder(11),
      O => \remainder[16]_i_14_n_0\
    );
\remainder[16]_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CD"
    )
        port map (
      I0 => remainder(10),
      I1 => reset,
      I2 => remainder(9),
      O => \remainder[16]_i_15_n_0\
    );
\remainder[16]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(8),
      I1 => Q(9),
      I2 => remainder(7),
      I3 => reset,
      I4 => Q(8),
      O => \remainder[16]_i_16_n_0\
    );
\remainder[16]_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(7),
      I1 => reset,
      I2 => remainder(6),
      I3 => remainder(5),
      I4 => Q(6),
      O => \remainder[16]_i_17_n_0\
    );
\remainder[16]_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(5),
      I1 => reset,
      I2 => remainder(4),
      I3 => remainder(3),
      I4 => Q(4),
      O => \remainder[16]_i_18_n_0\
    );
\remainder[16]_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(3),
      I1 => reset,
      I2 => remainder(2),
      I3 => remainder(1),
      I4 => Q(2),
      O => \remainder[16]_i_19_n_0\
    );
\remainder[16]_i_21\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(6),
      I1 => Q(7),
      I2 => remainder(5),
      I3 => reset,
      I4 => Q(6),
      O => \remainder[16]_i_21_n_0\
    );
\remainder[16]_i_22\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(4),
      I1 => Q(5),
      I2 => remainder(3),
      I3 => reset,
      I4 => Q(4),
      O => \remainder[16]_i_22_n_0\
    );
\remainder[16]_i_23\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(2),
      I1 => Q(3),
      I2 => remainder(1),
      I3 => reset,
      I4 => Q(2),
      O => \remainder[16]_i_23_n_0\
    );
\remainder[16]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => reset,
      I1 => remainder(16),
      I2 => remainder(15),
      O => \remainder[16]_i_5_n_0\
    );
\remainder[16]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F1"
    )
        port map (
      I0 => remainder(15),
      I1 => remainder(16),
      I2 => reset,
      O => \remainder[16]_i_6_n_0\
    );
\remainder[16]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(15),
      O => \remainder[16]_i_7_n_0\
    );
\remainder[16]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => remainder(13),
      I1 => reset,
      I2 => remainder(14),
      O => \remainder[16]_i_9_n_0\
    );
\remainder[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(1),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(0),
      O => \remainder[1]_i_1_n_0\
    );
\remainder[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(2),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(1),
      O => \remainder[2]_i_1_n_0\
    );
\remainder[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(3),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(2),
      O => \remainder[3]_i_1_n_0\
    );
\remainder[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(2),
      I1 => reset,
      O => remainder_preview(3)
    );
\remainder[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(1),
      I1 => reset,
      O => remainder_preview(2)
    );
\remainder[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(0),
      I1 => reset,
      O => \remainder[3]_i_5_n_0\
    );
\remainder[3]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(2),
      I2 => Q(3),
      O => \remainder[3]_i_6_n_0\
    );
\remainder[3]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(1),
      I1 => reset,
      I2 => Q(2),
      O => \remainder[3]_i_7_n_0\
    );
\remainder[3]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(0),
      I1 => reset,
      I2 => Q(1),
      O => \remainder[3]_i_8_n_0\
    );
\remainder[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(4),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(3),
      O => \remainder[4]_i_1_n_0\
    );
\remainder[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(5),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(4),
      O => \remainder[5]_i_1_n_0\
    );
\remainder[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(6),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(5),
      O => \remainder[6]_i_1_n_0\
    );
\remainder[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(7),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(6),
      O => \remainder[7]_i_1_n_0\
    );
\remainder[7]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(3),
      I1 => reset,
      I2 => Q(4),
      O => \remainder[7]_i_10_n_0\
    );
\remainder[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(6),
      I1 => reset,
      O => remainder_preview(7)
    );
\remainder[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(5),
      I1 => reset,
      O => remainder_preview(6)
    );
\remainder[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(4),
      I1 => reset,
      O => remainder_preview(5)
    );
\remainder[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(3),
      I1 => reset,
      O => remainder_preview(4)
    );
\remainder[7]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(6),
      I2 => Q(7),
      O => \remainder[7]_i_7_n_0\
    );
\remainder[7]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(5),
      I1 => reset,
      I2 => Q(6),
      O => \remainder[7]_i_8_n_0\
    );
\remainder[7]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(4),
      I2 => Q(5),
      O => \remainder[7]_i_9_n_0\
    );
\remainder[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(8),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(7),
      O => \remainder[8]_i_1_n_0\
    );
\remainder[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(9),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(8),
      O => \remainder[9]_i_1_n_0\
    );
\remainder_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => div_cnt_n_2,
      Q => remainder(0)
    );
\remainder_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[10]_i_1_n_0\,
      Q => remainder(10)
    );
\remainder_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[11]_i_1_n_0\,
      Q => remainder(11)
    );
\remainder_reg[11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[7]_i_2_n_0\,
      CO(3) => \remainder_reg[11]_i_2_n_0\,
      CO(2) => \remainder_reg[11]_i_2_n_1\,
      CO(1) => \remainder_reg[11]_i_2_n_2\,
      CO(0) => \remainder_reg[11]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => remainder_preview(11 downto 8),
      O(3 downto 0) => remainder0(11 downto 8),
      S(3) => \remainder[11]_i_7_n_0\,
      S(2) => \remainder[11]_i_8_n_0\,
      S(1) => \remainder[11]_i_9_n_0\,
      S(0) => \remainder[11]_i_10_n_0\
    );
\remainder_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[12]_i_1_n_0\,
      Q => remainder(12)
    );
\remainder_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[13]_i_1_n_0\,
      Q => remainder(13)
    );
\remainder_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[14]_i_1_n_0\,
      Q => remainder(14)
    );
\remainder_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[15]_i_1_n_0\,
      Q => remainder(15)
    );
\remainder_reg[15]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[11]_i_2_n_0\,
      CO(3) => \remainder_reg[15]_i_2_n_0\,
      CO(2) => \remainder_reg[15]_i_2_n_1\,
      CO(1) => \remainder_reg[15]_i_2_n_2\,
      CO(0) => \remainder_reg[15]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => remainder_preview(15 downto 12),
      O(3 downto 0) => remainder0(15 downto 12),
      S(3) => \remainder[15]_i_7_n_0\,
      S(2) => \remainder[15]_i_8_n_0\,
      S(1) => \remainder[15]_i_9_n_0\,
      S(0) => \remainder[15]_i_10_n_0\
    );
\remainder_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[16]_i_1_n_0\,
      Q => remainder(16)
    );
\remainder_reg[16]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[15]_i_2_n_0\,
      CO(3 downto 0) => \NLW_remainder_reg[16]_i_3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_remainder_reg[16]_i_3_O_UNCONNECTED\(3 downto 1),
      O(0) => remainder0(16),
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \remainder[16]_i_7_n_0\
    );
\remainder_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[1]_i_1_n_0\,
      Q => remainder(1)
    );
\remainder_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[2]_i_1_n_0\,
      Q => remainder(2)
    );
\remainder_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[3]_i_1_n_0\,
      Q => remainder(3)
    );
\remainder_reg[3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \remainder_reg[3]_i_2_n_0\,
      CO(2) => \remainder_reg[3]_i_2_n_1\,
      CO(1) => \remainder_reg[3]_i_2_n_2\,
      CO(0) => \remainder_reg[3]_i_2_n_3\,
      CYINIT => '1',
      DI(3 downto 2) => remainder_preview(3 downto 2),
      DI(1) => \remainder[3]_i_5_n_0\,
      DI(0) => div_cnt_n_1,
      O(3 downto 0) => remainder0(3 downto 0),
      S(3) => \remainder[3]_i_6_n_0\,
      S(2) => \remainder[3]_i_7_n_0\,
      S(1) => \remainder[3]_i_8_n_0\,
      S(0) => div_cnt_n_0
    );
\remainder_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[4]_i_1_n_0\,
      Q => remainder(4)
    );
\remainder_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[5]_i_1_n_0\,
      Q => remainder(5)
    );
\remainder_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[6]_i_1_n_0\,
      Q => remainder(6)
    );
\remainder_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[7]_i_1_n_0\,
      Q => remainder(7)
    );
\remainder_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[3]_i_2_n_0\,
      CO(3) => \remainder_reg[7]_i_2_n_0\,
      CO(2) => \remainder_reg[7]_i_2_n_1\,
      CO(1) => \remainder_reg[7]_i_2_n_2\,
      CO(0) => \remainder_reg[7]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => remainder_preview(7 downto 4),
      O(3 downto 0) => remainder0(7 downto 4),
      S(3) => \remainder[7]_i_7_n_0\,
      S(2) => \remainder[7]_i_8_n_0\,
      S(1) => \remainder[7]_i_9_n_0\,
      S(0) => \remainder[7]_i_10_n_0\
    );
\remainder_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[8]_i_1_n_0\,
      Q => remainder(8)
    );
\remainder_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[9]_i_1_n_0\,
      Q => remainder(9)
    );
\step_size[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => step_size1,
      O => \step_size[0]_i_1_n_0\
    );
\step_size[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(9),
      O => \step_size[10]_i_1_n_0\
    );
\step_size[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(10),
      O => \step_size[11]_i_1_n_0\
    );
\step_size[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(11),
      O => \step_size[12]_i_1_n_0\
    );
\step_size[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(12),
      O => \step_size[13]_i_1_n_0\
    );
\step_size[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(13),
      O => \step_size[14]_i_1_n_0\
    );
\step_size[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(14),
      O => \step_size[15]_i_1_n_0\
    );
\step_size[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(0),
      O => \step_size[1]_i_1_n_0\
    );
\step_size[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(1),
      O => \step_size[2]_i_1_n_0\
    );
\step_size[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(2),
      O => \step_size[3]_i_1_n_0\
    );
\step_size[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(3),
      O => \step_size[4]_i_1_n_0\
    );
\step_size[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(4),
      O => \step_size[5]_i_1_n_0\
    );
\step_size[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(5),
      O => \step_size[6]_i_1_n_0\
    );
\step_size[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(6),
      O => \step_size[7]_i_1_n_0\
    );
\step_size[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(7),
      O => \step_size[8]_i_1_n_0\
    );
\step_size[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(8),
      O => \step_size[9]_i_1_n_0\
    );
\step_size_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[0]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(0)
    );
\step_size_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[10]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(10)
    );
\step_size_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[11]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(11)
    );
\step_size_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[12]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(12)
    );
\step_size_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[13]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(13)
    );
\step_size_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[14]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(14)
    );
\step_size_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[15]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(15)
    );
\step_size_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[1]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(1)
    );
\step_size_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[2]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(2)
    );
\step_size_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[3]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(3)
    );
\step_size_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[4]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(4)
    );
\step_size_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[5]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(5)
    );
\step_size_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[6]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(6)
    );
\step_size_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[7]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(7)
    );
\step_size_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[8]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(8)
    );
\step_size_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[9]_i_1_n_0\,
      Q => \^step_size_curr_reg[15]\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_divider_2 is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \step_size_curr_reg[15]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    reset : in STD_LOGIC;
    div_en_reg : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_divider_2 : entity is "divider";
end audioSys_0_divider_2;

architecture STRUCTURE of audioSys_0_divider_2 is
  signal div_cnt_n_0 : STD_LOGIC;
  signal div_cnt_n_1 : STD_LOGIC;
  signal div_cnt_n_2 : STD_LOGIC;
  signal remainder : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal remainder0 : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \remainder[10]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_10__0_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_7__0_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_8__0_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_9__0_n_0\ : STD_LOGIC;
  signal \remainder[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[13]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[14]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_10__0_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_7__0_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_8__0_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_9__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_10__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_11__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_12__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_13__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_14__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_15__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_16__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_17__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_18__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_19__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_21__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_22__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_23__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_5__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_6__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_7__0_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_9__0_n_0\ : STD_LOGIC;
  signal \remainder[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_5__0_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_6__0_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_7__0_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_8__0_n_0\ : STD_LOGIC;
  signal \remainder[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_10__0_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_7__0_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_8__0_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_9__0_n_0\ : STD_LOGIC;
  signal \remainder[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \remainder[9]_i_1__0_n_0\ : STD_LOGIC;
  signal remainder_preview : STD_LOGIC_VECTOR ( 15 downto 2 );
  signal \remainder_reg[11]_i_2__0_n_0\ : STD_LOGIC;
  signal \remainder_reg[11]_i_2__0_n_1\ : STD_LOGIC;
  signal \remainder_reg[11]_i_2__0_n_2\ : STD_LOGIC;
  signal \remainder_reg[11]_i_2__0_n_3\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2__0_n_0\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2__0_n_1\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2__0_n_2\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2__0_n_3\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2__0_n_1\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2__0_n_2\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2__0_n_3\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2__0_n_1\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2__0_n_2\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2__0_n_3\ : STD_LOGIC;
  signal step_size1 : STD_LOGIC;
  signal \step_size[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[10]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[13]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[14]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[15]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \step_size[9]_i_1__0_n_0\ : STD_LOGIC;
  signal \^step_size_curr_reg[15]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_remainder_reg[16]_i_3__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_remainder_reg[16]_i_3__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \remainder[7]_i_1__0\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \step_size[0]_i_1__0\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \step_size[10]_i_1__0\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \step_size[11]_i_1__0\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \step_size[12]_i_1__0\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \step_size[13]_i_1__0\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \step_size[14]_i_1__0\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \step_size[15]_i_1__0\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \step_size[2]_i_1__0\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \step_size[3]_i_1__0\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \step_size[4]_i_1__0\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \step_size[5]_i_1__0\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \step_size[6]_i_1__0\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \step_size[7]_i_1__0\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \step_size[8]_i_1__0\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \step_size[9]_i_1__0\ : label is "soft_lutpair64";
begin
  \step_size_curr_reg[15]\(15 downto 0) <= \^step_size_curr_reg[15]\(15 downto 0);
div_cnt: entity work.audioSys_0_counter_4
     port map (
      CO(0) => step_size1,
      D(0) => div_cnt_n_2,
      DI(2) => \remainder[16]_i_17__0_n_0\,
      DI(1) => \remainder[16]_i_18__0_n_0\,
      DI(0) => \remainder[16]_i_19__0_n_0\,
      E(0) => E(0),
      Q(1 downto 0) => Q(1 downto 0),
      S(0) => div_cnt_n_0,
      clk => clk,
      div_en_reg => div_en_reg,
      remainder0(0) => remainder0(0),
      remainder_preview(0) => div_cnt_n_1,
      \remainder_reg[0]\(0) => remainder(0),
      \remainder_reg[13]\(3) => \remainder[16]_i_9__0_n_0\,
      \remainder_reg[13]\(2) => \remainder[16]_i_10__0_n_0\,
      \remainder_reg[13]\(1) => \remainder[16]_i_11__0_n_0\,
      \remainder_reg[13]\(0) => \remainder[16]_i_12__0_n_0\,
      \remainder_reg[14]\(3) => \remainder[16]_i_13__0_n_0\,
      \remainder_reg[14]\(2) => \remainder[16]_i_14__0_n_0\,
      \remainder_reg[14]\(1) => \remainder[16]_i_15__0_n_0\,
      \remainder_reg[14]\(0) => \remainder[16]_i_16__0_n_0\,
      \remainder_reg[15]\(0) => \remainder[16]_i_6__0_n_0\,
      \remainder_reg[16]\(0) => \remainder[16]_i_5__0_n_0\,
      \remainder_reg[6]\(2) => \remainder[16]_i_21__0_n_0\,
      \remainder_reg[6]\(1) => \remainder[16]_i_22__0_n_0\,
      \remainder_reg[6]\(0) => \remainder[16]_i_23__0_n_0\,
      reset => reset
    );
\remainder[10]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(10),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(9),
      O => \remainder[10]_i_1__0_n_0\
    );
\remainder[11]_i_10__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(7),
      I1 => reset,
      I2 => Q(8),
      O => \remainder[11]_i_10__0_n_0\
    );
\remainder[11]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(11),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(10),
      O => \remainder[11]_i_1__0_n_0\
    );
\remainder[11]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(10),
      I1 => reset,
      O => remainder_preview(11)
    );
\remainder[11]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(9),
      I1 => reset,
      O => remainder_preview(10)
    );
\remainder[11]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(8),
      I1 => reset,
      O => remainder_preview(9)
    );
\remainder[11]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(7),
      I1 => reset,
      O => remainder_preview(8)
    );
\remainder[11]_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(10),
      O => \remainder[11]_i_7__0_n_0\
    );
\remainder[11]_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(9),
      O => \remainder[11]_i_8__0_n_0\
    );
\remainder[11]_i_9__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(8),
      I2 => Q(9),
      O => \remainder[11]_i_9__0_n_0\
    );
\remainder[12]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(12),
      I1 => remainder(11),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[12]_i_1__0_n_0\
    );
\remainder[13]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(13),
      I1 => remainder(12),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[13]_i_1__0_n_0\
    );
\remainder[14]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(14),
      I1 => remainder(13),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[14]_i_1__0_n_0\
    );
\remainder[15]_i_10__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(11),
      O => \remainder[15]_i_10__0_n_0\
    );
\remainder[15]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(15),
      I1 => remainder(14),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[15]_i_1__0_n_0\
    );
\remainder[15]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(14),
      I1 => reset,
      O => remainder_preview(15)
    );
\remainder[15]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(13),
      I1 => reset,
      O => remainder_preview(14)
    );
\remainder[15]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(12),
      I1 => reset,
      O => remainder_preview(13)
    );
\remainder[15]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(11),
      I1 => reset,
      O => remainder_preview(12)
    );
\remainder[15]_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(14),
      O => \remainder[15]_i_7__0_n_0\
    );
\remainder[15]_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(13),
      O => \remainder[15]_i_8__0_n_0\
    );
\remainder[15]_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(12),
      O => \remainder[15]_i_9__0_n_0\
    );
\remainder[16]_i_10__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => remainder(11),
      I1 => reset,
      I2 => remainder(12),
      O => \remainder[16]_i_10__0_n_0\
    );
\remainder[16]_i_11__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => remainder(9),
      I1 => reset,
      I2 => remainder(10),
      O => \remainder[16]_i_11__0_n_0\
    );
\remainder[16]_i_12__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(9),
      I1 => reset,
      I2 => remainder(8),
      I3 => remainder(7),
      I4 => Q(8),
      O => \remainder[16]_i_12__0_n_0\
    );
\remainder[16]_i_13__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CD"
    )
        port map (
      I0 => remainder(14),
      I1 => reset,
      I2 => remainder(13),
      O => \remainder[16]_i_13__0_n_0\
    );
\remainder[16]_i_14__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CD"
    )
        port map (
      I0 => remainder(12),
      I1 => reset,
      I2 => remainder(11),
      O => \remainder[16]_i_14__0_n_0\
    );
\remainder[16]_i_15__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CD"
    )
        port map (
      I0 => remainder(10),
      I1 => reset,
      I2 => remainder(9),
      O => \remainder[16]_i_15__0_n_0\
    );
\remainder[16]_i_16__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(8),
      I1 => Q(9),
      I2 => remainder(7),
      I3 => reset,
      I4 => Q(8),
      O => \remainder[16]_i_16__0_n_0\
    );
\remainder[16]_i_17__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(7),
      I1 => reset,
      I2 => remainder(6),
      I3 => remainder(5),
      I4 => Q(6),
      O => \remainder[16]_i_17__0_n_0\
    );
\remainder[16]_i_18__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(5),
      I1 => reset,
      I2 => remainder(4),
      I3 => remainder(3),
      I4 => Q(4),
      O => \remainder[16]_i_18__0_n_0\
    );
\remainder[16]_i_19__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(3),
      I1 => reset,
      I2 => remainder(2),
      I3 => remainder(1),
      I4 => Q(2),
      O => \remainder[16]_i_19__0_n_0\
    );
\remainder[16]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4000400"
    )
        port map (
      I0 => reset,
      I1 => remainder(15),
      I2 => step_size1,
      I3 => div_en_reg,
      I4 => remainder0(16),
      O => \remainder[16]_i_1__0_n_0\
    );
\remainder[16]_i_21__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(6),
      I1 => Q(7),
      I2 => remainder(5),
      I3 => reset,
      I4 => Q(6),
      O => \remainder[16]_i_21__0_n_0\
    );
\remainder[16]_i_22__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(4),
      I1 => Q(5),
      I2 => remainder(3),
      I3 => reset,
      I4 => Q(4),
      O => \remainder[16]_i_22__0_n_0\
    );
\remainder[16]_i_23__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(2),
      I1 => Q(3),
      I2 => remainder(1),
      I3 => reset,
      I4 => Q(2),
      O => \remainder[16]_i_23__0_n_0\
    );
\remainder[16]_i_5__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => reset,
      I1 => remainder(16),
      I2 => remainder(15),
      O => \remainder[16]_i_5__0_n_0\
    );
\remainder[16]_i_6__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F1"
    )
        port map (
      I0 => remainder(15),
      I1 => remainder(16),
      I2 => reset,
      O => \remainder[16]_i_6__0_n_0\
    );
\remainder[16]_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(15),
      O => \remainder[16]_i_7__0_n_0\
    );
\remainder[16]_i_9__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => remainder(13),
      I1 => reset,
      I2 => remainder(14),
      O => \remainder[16]_i_9__0_n_0\
    );
\remainder[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(1),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(0),
      O => \remainder[1]_i_1__0_n_0\
    );
\remainder[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(2),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(1),
      O => \remainder[2]_i_1__0_n_0\
    );
\remainder[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(3),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(2),
      O => \remainder[3]_i_1__0_n_0\
    );
\remainder[3]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(2),
      I1 => reset,
      O => remainder_preview(3)
    );
\remainder[3]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(1),
      I1 => reset,
      O => remainder_preview(2)
    );
\remainder[3]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(0),
      I1 => reset,
      O => \remainder[3]_i_5__0_n_0\
    );
\remainder[3]_i_6__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(2),
      I2 => Q(3),
      O => \remainder[3]_i_6__0_n_0\
    );
\remainder[3]_i_7__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(1),
      I1 => reset,
      I2 => Q(2),
      O => \remainder[3]_i_7__0_n_0\
    );
\remainder[3]_i_8__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(0),
      I1 => reset,
      I2 => Q(1),
      O => \remainder[3]_i_8__0_n_0\
    );
\remainder[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(4),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(3),
      O => \remainder[4]_i_1__0_n_0\
    );
\remainder[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(5),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(4),
      O => \remainder[5]_i_1__0_n_0\
    );
\remainder[6]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(6),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(5),
      O => \remainder[6]_i_1__0_n_0\
    );
\remainder[7]_i_10__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(3),
      I1 => reset,
      I2 => Q(4),
      O => \remainder[7]_i_10__0_n_0\
    );
\remainder[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(7),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(6),
      O => \remainder[7]_i_1__0_n_0\
    );
\remainder[7]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(6),
      I1 => reset,
      O => remainder_preview(7)
    );
\remainder[7]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(5),
      I1 => reset,
      O => remainder_preview(6)
    );
\remainder[7]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(4),
      I1 => reset,
      O => remainder_preview(5)
    );
\remainder[7]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(3),
      I1 => reset,
      O => remainder_preview(4)
    );
\remainder[7]_i_7__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(6),
      I2 => Q(7),
      O => \remainder[7]_i_7__0_n_0\
    );
\remainder[7]_i_8__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(5),
      I1 => reset,
      I2 => Q(6),
      O => \remainder[7]_i_8__0_n_0\
    );
\remainder[7]_i_9__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(4),
      I2 => Q(5),
      O => \remainder[7]_i_9__0_n_0\
    );
\remainder[8]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(8),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(7),
      O => \remainder[8]_i_1__0_n_0\
    );
\remainder[9]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(9),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(8),
      O => \remainder[9]_i_1__0_n_0\
    );
\remainder_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => div_cnt_n_2,
      Q => remainder(0)
    );
\remainder_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[10]_i_1__0_n_0\,
      Q => remainder(10)
    );
\remainder_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[11]_i_1__0_n_0\,
      Q => remainder(11)
    );
\remainder_reg[11]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[7]_i_2__0_n_0\,
      CO(3) => \remainder_reg[11]_i_2__0_n_0\,
      CO(2) => \remainder_reg[11]_i_2__0_n_1\,
      CO(1) => \remainder_reg[11]_i_2__0_n_2\,
      CO(0) => \remainder_reg[11]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => remainder_preview(11 downto 8),
      O(3 downto 0) => remainder0(11 downto 8),
      S(3) => \remainder[11]_i_7__0_n_0\,
      S(2) => \remainder[11]_i_8__0_n_0\,
      S(1) => \remainder[11]_i_9__0_n_0\,
      S(0) => \remainder[11]_i_10__0_n_0\
    );
\remainder_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[12]_i_1__0_n_0\,
      Q => remainder(12)
    );
\remainder_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[13]_i_1__0_n_0\,
      Q => remainder(13)
    );
\remainder_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[14]_i_1__0_n_0\,
      Q => remainder(14)
    );
\remainder_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[15]_i_1__0_n_0\,
      Q => remainder(15)
    );
\remainder_reg[15]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[11]_i_2__0_n_0\,
      CO(3) => \remainder_reg[15]_i_2__0_n_0\,
      CO(2) => \remainder_reg[15]_i_2__0_n_1\,
      CO(1) => \remainder_reg[15]_i_2__0_n_2\,
      CO(0) => \remainder_reg[15]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => remainder_preview(15 downto 12),
      O(3 downto 0) => remainder0(15 downto 12),
      S(3) => \remainder[15]_i_7__0_n_0\,
      S(2) => \remainder[15]_i_8__0_n_0\,
      S(1) => \remainder[15]_i_9__0_n_0\,
      S(0) => \remainder[15]_i_10__0_n_0\
    );
\remainder_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[16]_i_1__0_n_0\,
      Q => remainder(16)
    );
\remainder_reg[16]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[15]_i_2__0_n_0\,
      CO(3 downto 0) => \NLW_remainder_reg[16]_i_3__0_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_remainder_reg[16]_i_3__0_O_UNCONNECTED\(3 downto 1),
      O(0) => remainder0(16),
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \remainder[16]_i_7__0_n_0\
    );
\remainder_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[1]_i_1__0_n_0\,
      Q => remainder(1)
    );
\remainder_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[2]_i_1__0_n_0\,
      Q => remainder(2)
    );
\remainder_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[3]_i_1__0_n_0\,
      Q => remainder(3)
    );
\remainder_reg[3]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \remainder_reg[3]_i_2__0_n_0\,
      CO(2) => \remainder_reg[3]_i_2__0_n_1\,
      CO(1) => \remainder_reg[3]_i_2__0_n_2\,
      CO(0) => \remainder_reg[3]_i_2__0_n_3\,
      CYINIT => '1',
      DI(3 downto 2) => remainder_preview(3 downto 2),
      DI(1) => \remainder[3]_i_5__0_n_0\,
      DI(0) => div_cnt_n_1,
      O(3 downto 0) => remainder0(3 downto 0),
      S(3) => \remainder[3]_i_6__0_n_0\,
      S(2) => \remainder[3]_i_7__0_n_0\,
      S(1) => \remainder[3]_i_8__0_n_0\,
      S(0) => div_cnt_n_0
    );
\remainder_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[4]_i_1__0_n_0\,
      Q => remainder(4)
    );
\remainder_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[5]_i_1__0_n_0\,
      Q => remainder(5)
    );
\remainder_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[6]_i_1__0_n_0\,
      Q => remainder(6)
    );
\remainder_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[7]_i_1__0_n_0\,
      Q => remainder(7)
    );
\remainder_reg[7]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[3]_i_2__0_n_0\,
      CO(3) => \remainder_reg[7]_i_2__0_n_0\,
      CO(2) => \remainder_reg[7]_i_2__0_n_1\,
      CO(1) => \remainder_reg[7]_i_2__0_n_2\,
      CO(0) => \remainder_reg[7]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => remainder_preview(7 downto 4),
      O(3 downto 0) => remainder0(7 downto 4),
      S(3) => \remainder[7]_i_7__0_n_0\,
      S(2) => \remainder[7]_i_8__0_n_0\,
      S(1) => \remainder[7]_i_9__0_n_0\,
      S(0) => \remainder[7]_i_10__0_n_0\
    );
\remainder_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[8]_i_1__0_n_0\,
      Q => remainder(8)
    );
\remainder_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[9]_i_1__0_n_0\,
      Q => remainder(9)
    );
\step_size[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => step_size1,
      O => \step_size[0]_i_1__0_n_0\
    );
\step_size[10]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(9),
      O => \step_size[10]_i_1__0_n_0\
    );
\step_size[11]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(10),
      O => \step_size[11]_i_1__0_n_0\
    );
\step_size[12]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(11),
      O => \step_size[12]_i_1__0_n_0\
    );
\step_size[13]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(12),
      O => \step_size[13]_i_1__0_n_0\
    );
\step_size[14]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(13),
      O => \step_size[14]_i_1__0_n_0\
    );
\step_size[15]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(14),
      O => \step_size[15]_i_1__0_n_0\
    );
\step_size[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(0),
      O => \step_size[1]_i_1__0_n_0\
    );
\step_size[2]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(1),
      O => \step_size[2]_i_1__0_n_0\
    );
\step_size[3]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(2),
      O => \step_size[3]_i_1__0_n_0\
    );
\step_size[4]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(3),
      O => \step_size[4]_i_1__0_n_0\
    );
\step_size[5]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(4),
      O => \step_size[5]_i_1__0_n_0\
    );
\step_size[6]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(5),
      O => \step_size[6]_i_1__0_n_0\
    );
\step_size[7]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(6),
      O => \step_size[7]_i_1__0_n_0\
    );
\step_size[8]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(7),
      O => \step_size[8]_i_1__0_n_0\
    );
\step_size[9]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(8),
      O => \step_size[9]_i_1__0_n_0\
    );
\step_size_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[0]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(0)
    );
\step_size_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[10]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(10)
    );
\step_size_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[11]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(11)
    );
\step_size_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[12]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(12)
    );
\step_size_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[13]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(13)
    );
\step_size_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[14]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(14)
    );
\step_size_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[15]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(15)
    );
\step_size_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[1]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(1)
    );
\step_size_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[2]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(2)
    );
\step_size_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[3]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(3)
    );
\step_size_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[4]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(4)
    );
\step_size_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[5]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(5)
    );
\step_size_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[6]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(6)
    );
\step_size_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[7]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(7)
    );
\step_size_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[8]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(8)
    );
\step_size_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[9]_i_1__0_n_0\,
      Q => \^step_size_curr_reg[15]\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_divider_5 is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \step_size_curr_reg[15]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    reset : in STD_LOGIC;
    div_en_reg : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_divider_5 : entity is "divider";
end audioSys_0_divider_5;

architecture STRUCTURE of audioSys_0_divider_5 is
  signal div_cnt_n_0 : STD_LOGIC;
  signal div_cnt_n_1 : STD_LOGIC;
  signal div_cnt_n_2 : STD_LOGIC;
  signal remainder : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal remainder0 : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \remainder[10]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_10__1_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_7__1_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_8__1_n_0\ : STD_LOGIC;
  signal \remainder[11]_i_9__1_n_0\ : STD_LOGIC;
  signal \remainder[12]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[13]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[14]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_10__1_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_7__1_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_8__1_n_0\ : STD_LOGIC;
  signal \remainder[15]_i_9__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_10__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_11__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_12__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_13__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_14__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_15__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_16__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_17__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_18__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_19__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_21__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_22__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_23__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_5__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_6__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_7__1_n_0\ : STD_LOGIC;
  signal \remainder[16]_i_9__1_n_0\ : STD_LOGIC;
  signal \remainder[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_5__1_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_6__1_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_7__1_n_0\ : STD_LOGIC;
  signal \remainder[3]_i_8__1_n_0\ : STD_LOGIC;
  signal \remainder[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[5]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[6]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_10__1_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_7__1_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_8__1_n_0\ : STD_LOGIC;
  signal \remainder[7]_i_9__1_n_0\ : STD_LOGIC;
  signal \remainder[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \remainder[9]_i_1__1_n_0\ : STD_LOGIC;
  signal remainder_preview : STD_LOGIC_VECTOR ( 15 downto 2 );
  signal \remainder_reg[11]_i_2__1_n_0\ : STD_LOGIC;
  signal \remainder_reg[11]_i_2__1_n_1\ : STD_LOGIC;
  signal \remainder_reg[11]_i_2__1_n_2\ : STD_LOGIC;
  signal \remainder_reg[11]_i_2__1_n_3\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2__1_n_0\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2__1_n_1\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2__1_n_2\ : STD_LOGIC;
  signal \remainder_reg[15]_i_2__1_n_3\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2__1_n_1\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2__1_n_2\ : STD_LOGIC;
  signal \remainder_reg[3]_i_2__1_n_3\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2__1_n_0\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2__1_n_1\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2__1_n_2\ : STD_LOGIC;
  signal \remainder_reg[7]_i_2__1_n_3\ : STD_LOGIC;
  signal step_size1 : STD_LOGIC;
  signal \step_size[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[10]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[11]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[12]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[13]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[14]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[15]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[5]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[6]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \step_size[9]_i_1__1_n_0\ : STD_LOGIC;
  signal \^step_size_curr_reg[15]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_remainder_reg[16]_i_3__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_remainder_reg[16]_i_3__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \remainder[7]_i_1__1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \step_size[0]_i_1__1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \step_size[10]_i_1__1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \step_size[11]_i_1__1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \step_size[12]_i_1__1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \step_size[13]_i_1__1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \step_size[14]_i_1__1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \step_size[15]_i_1__1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \step_size[2]_i_1__1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \step_size[3]_i_1__1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \step_size[4]_i_1__1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \step_size[5]_i_1__1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \step_size[6]_i_1__1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \step_size[7]_i_1__1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \step_size[8]_i_1__1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \step_size[9]_i_1__1\ : label is "soft_lutpair53";
begin
  \step_size_curr_reg[15]\(15 downto 0) <= \^step_size_curr_reg[15]\(15 downto 0);
div_cnt: entity work.audioSys_0_counter_7
     port map (
      CO(0) => step_size1,
      D(0) => div_cnt_n_2,
      DI(2) => \remainder[16]_i_17__1_n_0\,
      DI(1) => \remainder[16]_i_18__1_n_0\,
      DI(0) => \remainder[16]_i_19__1_n_0\,
      E(0) => E(0),
      Q(1 downto 0) => Q(1 downto 0),
      S(0) => div_cnt_n_0,
      clk => clk,
      div_en_reg => div_en_reg,
      remainder0(0) => remainder0(0),
      remainder_preview(0) => div_cnt_n_1,
      \remainder_reg[0]\(0) => remainder(0),
      \remainder_reg[13]\(3) => \remainder[16]_i_9__1_n_0\,
      \remainder_reg[13]\(2) => \remainder[16]_i_10__1_n_0\,
      \remainder_reg[13]\(1) => \remainder[16]_i_11__1_n_0\,
      \remainder_reg[13]\(0) => \remainder[16]_i_12__1_n_0\,
      \remainder_reg[14]\(3) => \remainder[16]_i_13__1_n_0\,
      \remainder_reg[14]\(2) => \remainder[16]_i_14__1_n_0\,
      \remainder_reg[14]\(1) => \remainder[16]_i_15__1_n_0\,
      \remainder_reg[14]\(0) => \remainder[16]_i_16__1_n_0\,
      \remainder_reg[15]\(0) => \remainder[16]_i_6__1_n_0\,
      \remainder_reg[16]\(0) => \remainder[16]_i_5__1_n_0\,
      \remainder_reg[6]\(2) => \remainder[16]_i_21__1_n_0\,
      \remainder_reg[6]\(1) => \remainder[16]_i_22__1_n_0\,
      \remainder_reg[6]\(0) => \remainder[16]_i_23__1_n_0\,
      reset => reset
    );
\remainder[10]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(10),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(9),
      O => \remainder[10]_i_1__1_n_0\
    );
\remainder[11]_i_10__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(7),
      I1 => reset,
      I2 => Q(8),
      O => \remainder[11]_i_10__1_n_0\
    );
\remainder[11]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(11),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(10),
      O => \remainder[11]_i_1__1_n_0\
    );
\remainder[11]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(10),
      I1 => reset,
      O => remainder_preview(11)
    );
\remainder[11]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(9),
      I1 => reset,
      O => remainder_preview(10)
    );
\remainder[11]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(8),
      I1 => reset,
      O => remainder_preview(9)
    );
\remainder[11]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(7),
      I1 => reset,
      O => remainder_preview(8)
    );
\remainder[11]_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(10),
      O => \remainder[11]_i_7__1_n_0\
    );
\remainder[11]_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(9),
      O => \remainder[11]_i_8__1_n_0\
    );
\remainder[11]_i_9__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(8),
      I2 => Q(9),
      O => \remainder[11]_i_9__1_n_0\
    );
\remainder[12]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(12),
      I1 => remainder(11),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[12]_i_1__1_n_0\
    );
\remainder[13]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(13),
      I1 => remainder(12),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[13]_i_1__1_n_0\
    );
\remainder[14]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(14),
      I1 => remainder(13),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[14]_i_1__1_n_0\
    );
\remainder[15]_i_10__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(11),
      O => \remainder[15]_i_10__1_n_0\
    );
\remainder[15]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA000C00"
    )
        port map (
      I0 => remainder0(15),
      I1 => remainder(14),
      I2 => reset,
      I3 => div_en_reg,
      I4 => step_size1,
      O => \remainder[15]_i_1__1_n_0\
    );
\remainder[15]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(14),
      I1 => reset,
      O => remainder_preview(15)
    );
\remainder[15]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(13),
      I1 => reset,
      O => remainder_preview(14)
    );
\remainder[15]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(12),
      I1 => reset,
      O => remainder_preview(13)
    );
\remainder[15]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(11),
      I1 => reset,
      O => remainder_preview(12)
    );
\remainder[15]_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(14),
      O => \remainder[15]_i_7__1_n_0\
    );
\remainder[15]_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(13),
      O => \remainder[15]_i_8__1_n_0\
    );
\remainder[15]_i_9__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(12),
      O => \remainder[15]_i_9__1_n_0\
    );
\remainder[16]_i_10__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => remainder(11),
      I1 => reset,
      I2 => remainder(12),
      O => \remainder[16]_i_10__1_n_0\
    );
\remainder[16]_i_11__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => remainder(9),
      I1 => reset,
      I2 => remainder(10),
      O => \remainder[16]_i_11__1_n_0\
    );
\remainder[16]_i_12__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(9),
      I1 => reset,
      I2 => remainder(8),
      I3 => remainder(7),
      I4 => Q(8),
      O => \remainder[16]_i_12__1_n_0\
    );
\remainder[16]_i_13__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CD"
    )
        port map (
      I0 => remainder(14),
      I1 => reset,
      I2 => remainder(13),
      O => \remainder[16]_i_13__1_n_0\
    );
\remainder[16]_i_14__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CD"
    )
        port map (
      I0 => remainder(12),
      I1 => reset,
      I2 => remainder(11),
      O => \remainder[16]_i_14__1_n_0\
    );
\remainder[16]_i_15__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CD"
    )
        port map (
      I0 => remainder(10),
      I1 => reset,
      I2 => remainder(9),
      O => \remainder[16]_i_15__1_n_0\
    );
\remainder[16]_i_16__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(8),
      I1 => Q(9),
      I2 => remainder(7),
      I3 => reset,
      I4 => Q(8),
      O => \remainder[16]_i_16__1_n_0\
    );
\remainder[16]_i_17__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(7),
      I1 => reset,
      I2 => remainder(6),
      I3 => remainder(5),
      I4 => Q(6),
      O => \remainder[16]_i_17__1_n_0\
    );
\remainder[16]_i_18__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(5),
      I1 => reset,
      I2 => remainder(4),
      I3 => remainder(3),
      I4 => Q(4),
      O => \remainder[16]_i_18__1_n_0\
    );
\remainder[16]_i_19__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10103110"
    )
        port map (
      I0 => Q(3),
      I1 => reset,
      I2 => remainder(2),
      I3 => remainder(1),
      I4 => Q(2),
      O => \remainder[16]_i_19__1_n_0\
    );
\remainder[16]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4000400"
    )
        port map (
      I0 => reset,
      I1 => remainder(15),
      I2 => step_size1,
      I3 => div_en_reg,
      I4 => remainder0(16),
      O => \remainder[16]_i_1__1_n_0\
    );
\remainder[16]_i_21__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(6),
      I1 => Q(7),
      I2 => remainder(5),
      I3 => reset,
      I4 => Q(6),
      O => \remainder[16]_i_21__1_n_0\
    );
\remainder[16]_i_22__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(4),
      I1 => Q(5),
      I2 => remainder(3),
      I3 => reset,
      I4 => Q(4),
      O => \remainder[16]_i_22__1_n_0\
    );
\remainder[16]_i_23__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00903309"
    )
        port map (
      I0 => remainder(2),
      I1 => Q(3),
      I2 => remainder(1),
      I3 => reset,
      I4 => Q(2),
      O => \remainder[16]_i_23__1_n_0\
    );
\remainder[16]_i_5__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => reset,
      I1 => remainder(16),
      I2 => remainder(15),
      O => \remainder[16]_i_5__1_n_0\
    );
\remainder[16]_i_6__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F1"
    )
        port map (
      I0 => remainder(15),
      I1 => remainder(16),
      I2 => reset,
      O => \remainder[16]_i_6__1_n_0\
    );
\remainder[16]_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset,
      I1 => remainder(15),
      O => \remainder[16]_i_7__1_n_0\
    );
\remainder[16]_i_9__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => remainder(13),
      I1 => reset,
      I2 => remainder(14),
      O => \remainder[16]_i_9__1_n_0\
    );
\remainder[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(1),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(0),
      O => \remainder[1]_i_1__1_n_0\
    );
\remainder[2]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(2),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(1),
      O => \remainder[2]_i_1__1_n_0\
    );
\remainder[3]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(3),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(2),
      O => \remainder[3]_i_1__1_n_0\
    );
\remainder[3]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(2),
      I1 => reset,
      O => remainder_preview(3)
    );
\remainder[3]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(1),
      I1 => reset,
      O => remainder_preview(2)
    );
\remainder[3]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(0),
      I1 => reset,
      O => \remainder[3]_i_5__1_n_0\
    );
\remainder[3]_i_6__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(2),
      I2 => Q(3),
      O => \remainder[3]_i_6__1_n_0\
    );
\remainder[3]_i_7__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(1),
      I1 => reset,
      I2 => Q(2),
      O => \remainder[3]_i_7__1_n_0\
    );
\remainder[3]_i_8__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(0),
      I1 => reset,
      I2 => Q(1),
      O => \remainder[3]_i_8__1_n_0\
    );
\remainder[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(4),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(3),
      O => \remainder[4]_i_1__1_n_0\
    );
\remainder[5]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(5),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(4),
      O => \remainder[5]_i_1__1_n_0\
    );
\remainder[6]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(6),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(5),
      O => \remainder[6]_i_1__1_n_0\
    );
\remainder[7]_i_10__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(3),
      I1 => reset,
      I2 => Q(4),
      O => \remainder[7]_i_10__1_n_0\
    );
\remainder[7]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(7),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(6),
      O => \remainder[7]_i_1__1_n_0\
    );
\remainder[7]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(6),
      I1 => reset,
      O => remainder_preview(7)
    );
\remainder[7]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(5),
      I1 => reset,
      O => remainder_preview(6)
    );
\remainder[7]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(4),
      I1 => reset,
      O => remainder_preview(5)
    );
\remainder[7]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => remainder(3),
      I1 => reset,
      O => remainder_preview(4)
    );
\remainder[7]_i_7__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(6),
      I2 => Q(7),
      O => \remainder[7]_i_7__1_n_0\
    );
\remainder[7]_i_8__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => remainder(5),
      I1 => reset,
      I2 => Q(6),
      O => \remainder[7]_i_8__1_n_0\
    );
\remainder[7]_i_9__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => reset,
      I1 => remainder(4),
      I2 => Q(5),
      O => \remainder[7]_i_9__1_n_0\
    );
\remainder[8]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(8),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(7),
      O => \remainder[8]_i_1__1_n_0\
    );
\remainder[9]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80B08080"
    )
        port map (
      I0 => remainder0(9),
      I1 => step_size1,
      I2 => div_en_reg,
      I3 => reset,
      I4 => remainder(8),
      O => \remainder[9]_i_1__1_n_0\
    );
\remainder_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => div_cnt_n_2,
      Q => remainder(0)
    );
\remainder_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[10]_i_1__1_n_0\,
      Q => remainder(10)
    );
\remainder_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[11]_i_1__1_n_0\,
      Q => remainder(11)
    );
\remainder_reg[11]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[7]_i_2__1_n_0\,
      CO(3) => \remainder_reg[11]_i_2__1_n_0\,
      CO(2) => \remainder_reg[11]_i_2__1_n_1\,
      CO(1) => \remainder_reg[11]_i_2__1_n_2\,
      CO(0) => \remainder_reg[11]_i_2__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => remainder_preview(11 downto 8),
      O(3 downto 0) => remainder0(11 downto 8),
      S(3) => \remainder[11]_i_7__1_n_0\,
      S(2) => \remainder[11]_i_8__1_n_0\,
      S(1) => \remainder[11]_i_9__1_n_0\,
      S(0) => \remainder[11]_i_10__1_n_0\
    );
\remainder_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[12]_i_1__1_n_0\,
      Q => remainder(12)
    );
\remainder_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[13]_i_1__1_n_0\,
      Q => remainder(13)
    );
\remainder_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[14]_i_1__1_n_0\,
      Q => remainder(14)
    );
\remainder_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[15]_i_1__1_n_0\,
      Q => remainder(15)
    );
\remainder_reg[15]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[11]_i_2__1_n_0\,
      CO(3) => \remainder_reg[15]_i_2__1_n_0\,
      CO(2) => \remainder_reg[15]_i_2__1_n_1\,
      CO(1) => \remainder_reg[15]_i_2__1_n_2\,
      CO(0) => \remainder_reg[15]_i_2__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => remainder_preview(15 downto 12),
      O(3 downto 0) => remainder0(15 downto 12),
      S(3) => \remainder[15]_i_7__1_n_0\,
      S(2) => \remainder[15]_i_8__1_n_0\,
      S(1) => \remainder[15]_i_9__1_n_0\,
      S(0) => \remainder[15]_i_10__1_n_0\
    );
\remainder_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[16]_i_1__1_n_0\,
      Q => remainder(16)
    );
\remainder_reg[16]_i_3__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[15]_i_2__1_n_0\,
      CO(3 downto 0) => \NLW_remainder_reg[16]_i_3__1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_remainder_reg[16]_i_3__1_O_UNCONNECTED\(3 downto 1),
      O(0) => remainder0(16),
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \remainder[16]_i_7__1_n_0\
    );
\remainder_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[1]_i_1__1_n_0\,
      Q => remainder(1)
    );
\remainder_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[2]_i_1__1_n_0\,
      Q => remainder(2)
    );
\remainder_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[3]_i_1__1_n_0\,
      Q => remainder(3)
    );
\remainder_reg[3]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \remainder_reg[3]_i_2__1_n_0\,
      CO(2) => \remainder_reg[3]_i_2__1_n_1\,
      CO(1) => \remainder_reg[3]_i_2__1_n_2\,
      CO(0) => \remainder_reg[3]_i_2__1_n_3\,
      CYINIT => '1',
      DI(3 downto 2) => remainder_preview(3 downto 2),
      DI(1) => \remainder[3]_i_5__1_n_0\,
      DI(0) => div_cnt_n_1,
      O(3 downto 0) => remainder0(3 downto 0),
      S(3) => \remainder[3]_i_6__1_n_0\,
      S(2) => \remainder[3]_i_7__1_n_0\,
      S(1) => \remainder[3]_i_8__1_n_0\,
      S(0) => div_cnt_n_0
    );
\remainder_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[4]_i_1__1_n_0\,
      Q => remainder(4)
    );
\remainder_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[5]_i_1__1_n_0\,
      Q => remainder(5)
    );
\remainder_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[6]_i_1__1_n_0\,
      Q => remainder(6)
    );
\remainder_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[7]_i_1__1_n_0\,
      Q => remainder(7)
    );
\remainder_reg[7]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \remainder_reg[3]_i_2__1_n_0\,
      CO(3) => \remainder_reg[7]_i_2__1_n_0\,
      CO(2) => \remainder_reg[7]_i_2__1_n_1\,
      CO(1) => \remainder_reg[7]_i_2__1_n_2\,
      CO(0) => \remainder_reg[7]_i_2__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => remainder_preview(7 downto 4),
      O(3 downto 0) => remainder0(7 downto 4),
      S(3) => \remainder[7]_i_7__1_n_0\,
      S(2) => \remainder[7]_i_8__1_n_0\,
      S(1) => \remainder[7]_i_9__1_n_0\,
      S(0) => \remainder[7]_i_10__1_n_0\
    );
\remainder_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[8]_i_1__1_n_0\,
      Q => remainder(8)
    );
\remainder_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \remainder[9]_i_1__1_n_0\,
      Q => remainder(9)
    );
\step_size[0]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => step_size1,
      O => \step_size[0]_i_1__1_n_0\
    );
\step_size[10]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(9),
      O => \step_size[10]_i_1__1_n_0\
    );
\step_size[11]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(10),
      O => \step_size[11]_i_1__1_n_0\
    );
\step_size[12]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(11),
      O => \step_size[12]_i_1__1_n_0\
    );
\step_size[13]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(12),
      O => \step_size[13]_i_1__1_n_0\
    );
\step_size[14]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(13),
      O => \step_size[14]_i_1__1_n_0\
    );
\step_size[15]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(14),
      O => \step_size[15]_i_1__1_n_0\
    );
\step_size[1]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(0),
      O => \step_size[1]_i_1__1_n_0\
    );
\step_size[2]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(1),
      O => \step_size[2]_i_1__1_n_0\
    );
\step_size[3]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(2),
      O => \step_size[3]_i_1__1_n_0\
    );
\step_size[4]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(3),
      O => \step_size[4]_i_1__1_n_0\
    );
\step_size[5]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(4),
      O => \step_size[5]_i_1__1_n_0\
    );
\step_size[6]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(5),
      O => \step_size[6]_i_1__1_n_0\
    );
\step_size[7]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(6),
      O => \step_size[7]_i_1__1_n_0\
    );
\step_size[8]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(7),
      O => \step_size[8]_i_1__1_n_0\
    );
\step_size[9]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => div_en_reg,
      I1 => \^step_size_curr_reg[15]\(8),
      O => \step_size[9]_i_1__1_n_0\
    );
\step_size_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[0]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(0)
    );
\step_size_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[10]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(10)
    );
\step_size_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[11]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(11)
    );
\step_size_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[12]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(12)
    );
\step_size_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[13]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(13)
    );
\step_size_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[14]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(14)
    );
\step_size_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[15]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(15)
    );
\step_size_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[1]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(1)
    );
\step_size_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[2]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(2)
    );
\step_size_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[3]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(3)
    );
\step_size_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[4]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(4)
    );
\step_size_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[5]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(5)
    );
\step_size_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[6]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(6)
    );
\step_size_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[7]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(7)
    );
\step_size_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[8]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(8)
    );
\step_size_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \step_size[9]_i_1__1_n_0\,
      Q => \^step_size_curr_reg[15]\(9)
    );
end STRUCTURE;
`protect begin_protected
`protect version = 1
`protect encrypt_agent = "XILINX"
`protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`protect key_block
arnh+KKoDgsw4/tPEYwnnPGDRbVikesong6+Q2OyHujI0sMs8SCxocYLiXw5FQrlRM68qU6J4fD5
u2TxpWpRVQ==


`protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`protect key_block
Yq/vnjZLCL1QwIH7cUbwc5FvSHLhapSL6t8LSQJUEHtxWu+KSjh1dhPJmktrgDFaXac705ujvztl
+YNsaRHfN24YRZgfmuNNkTYC/UuSjXT5p/OoHt34ja5+sL1swpkd0kS4KoUu1L5VgNu5PzU1KlJu
xNTTz0V55se0kA3xWGQ=


`protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`protect key_block
eoHGlvGv7vY3KM2pS9QmvseVWbTY70mMUJ3dA0VjqlsHyDJxtnekm0x4ES3HnmtT6I31arKf6/ET
ILLvECnH2OOJH68Mcf4J7JFoX45Zwa7B7KIjwEYTSxi92dQiphR/l29FqZuSejHT7E7bMi4sclKz
j+vGrH1SqUduR0rwKN9CPHaVuDw/oVW2lWa9c3BvcGgxPZYlQfuBzMSoT7ADN6SHXTy8LugMRN19
ZeoXElJXwG4eJoi81sjzUnliKzvxYAUg5fobuuhqHUtJVxrVPTQmR3/xJ4qtPwhElOZ3/puQnm50
9DRgrlf21WXL7TGNp7fuSABNGeZz8AwBEp0Vrg==


`protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`protect key_block
TeLIf/zkpCY4yQD/TbVP7xhsSq6QqpAxE+H0wAcGmKjkx1YJ+YQD83Gi50v2Dxag9LF0iTX0QwAQ
/QvIx7YohUWqQvk+r2+0yK1URFJmBCNFEEivz+FDjQlbO1RDN1XaKdHoCL25pyeg1dtt9P7mQ33V
nqRohJY9ZYEdwnXPBdY=


`protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`protect key_block
fOxmOBbj/YQDvu07VmpBaNFeLYg0SbTKg02Kj6lBe0YdruMt8S7cfJlbx82jKhkR/NlBv2HbJo+e
TUO8AOppQbnS+cHMa8q6CqMi4aTf38ur9dGrsWfXdqtFgwbHnesqIWvZJGaoWSctLiHT6GsQM0GG
Tru90EZL56azfqnVDZxXIapp7tYbdgZBFhdsrGDFzAx7l+LUsYAqJ0L8llIw9IWY+8q/E3Gy9rpS
YPICwHReFMwy12AIuCLjzneQvBv1J7TzX7xOGO9D6usPWzR3Ig03iZPhbgu4HfeKyk4x8fM5TrTw
4E17UpHtFJ/o6MADz00WRJLpGrki4atbYJ7OPg==


`protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`protect key_block
WYdv5f4jx9I0SIVo0LvWz+8BURoRGiMZaPS9tSfBda5/N0ZAmlK2TM3BByWmJP0V9DrfXlY/cjfI
2YLAU/dPVKYYZvgH4A3ckj+qYax0JcQe5qyZdvxP8RBzy2Y7htbXvH9Fd7NuQaF4mYQvPmJx4ABQ
a1GSGFm85DNg5au4kKbZGiHIhuQNmSZ1w1MEBMlZjvHB3XGxxPKd79lGcXWD0Ozeon0ppivI9uAZ
xW88YFDo67GrvFopQl5HvQCYNvvjpsw+gTG7FhqgPGiJ7KmKD1S8KWy3eOxugZ2g7/A7kGpFpaCa
bkaYI+2Rs8uZFPJiIfJC7fNXcidAV3uMMQM5fw==


`protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`protect key_block
sZgfojMcSe/aeVghr9GzO18ieRawBO/3e1YB90POMgmzKapmvMF3jW14A8sTZqY8Kyxgiy813f7L
skQ1lpvY2gv7EqHqRJz4XRrGs4anjV8FgFlwc34GyEtIIuo4CLK8qSrttLg09u4pFkmRQ+KQuCFe
b5gy3dT6IAFOD5G0yN7NtjJq450ox2Ghuy9w2GNvGHn9jsdP/CayhOeuYld5+RBeMzI370GAgnpa
tEvWox3IwNNnW3y2fhqIExjozRwyoTdcx4LEUp3vDVt6i4shsMP5ktElxh7qN4LkNlG2fOocIGbD
SQmrsCJNsTC3HO7CMgTCz9FswikwbMHi5JEw2A==


`protect data_method = "AES128-CBC"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 15056)
`protect data_block
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
rxXjP2L41Gc=
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_dacInterface is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    SDATA : out STD_LOGIC;
    BCLK : out STD_LOGIC;
    MCLK : out STD_LOGIC;
    SCL : out STD_LOGIC;
    step : out STD_LOGIC;
    LRCLK : out STD_LOGIC;
    SDA : inout STD_LOGIC;
    atten_valid_freq : in STD_LOGIC_VECTOR ( 2 downto 0 );
    atten_valid : in STD_LOGIC;
    \waveform_atten_freq_reg[0]\ : in STD_LOGIC;
    \waveform_atten_freq_reg[0]_0\ : in STD_LOGIC;
    \waveform_atten_freq_reg[0]_1\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_dacInterface : entity is "dacInterface";
end audioSys_0_dacInterface;

architecture STRUCTURE of audioSys_0_dacInterface is
  signal \^bclk\ : STD_LOGIC;
  signal \^mclk\ : STD_LOGIC;
  signal control_n_0 : STD_LOGIC;
  signal control_n_2 : STD_LOGIC;
  signal \count[0]_i_1__4_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__7_n_0\ : STD_LOGIC;
  signal \count[2]_i_1__4_n_0\ : STD_LOGIC;
  signal \count[3]_i_1__4_n_0\ : STD_LOGIC;
  signal \count[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \count[4]_i_4_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_reg_n_0_[4]\ : STD_LOGIC;
  signal cs : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \cs[0]_i_10_n_0\ : STD_LOGIC;
  signal \cs[0]_i_11_n_0\ : STD_LOGIC;
  signal \cs[0]_i_12_n_0\ : STD_LOGIC;
  signal \cs[0]_i_1_n_0\ : STD_LOGIC;
  signal \cs[0]_i_2_n_0\ : STD_LOGIC;
  signal \cs[0]_i_3_n_0\ : STD_LOGIC;
  signal \cs[0]_i_4_n_0\ : STD_LOGIC;
  signal \cs[0]_i_5_n_0\ : STD_LOGIC;
  signal \cs[0]_i_6_n_0\ : STD_LOGIC;
  signal \cs[0]_i_7_n_0\ : STD_LOGIC;
  signal \cs[0]_i_8_n_0\ : STD_LOGIC;
  signal \cs[0]_i_9_n_0\ : STD_LOGIC;
  signal \cs[1]_i_1__0_n_0\ : STD_LOGIC;
  signal initialization : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \initialization[0]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[10]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[11]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[12]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[12]_i_3_n_0\ : STD_LOGIC;
  signal \initialization[12]_i_4_n_0\ : STD_LOGIC;
  signal \initialization[12]_i_5_n_0\ : STD_LOGIC;
  signal \initialization[12]_i_6_n_0\ : STD_LOGIC;
  signal \initialization[13]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[14]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[15]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[16]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[16]_i_3_n_0\ : STD_LOGIC;
  signal \initialization[16]_i_4_n_0\ : STD_LOGIC;
  signal \initialization[16]_i_5_n_0\ : STD_LOGIC;
  signal \initialization[16]_i_6_n_0\ : STD_LOGIC;
  signal \initialization[17]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[18]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[19]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[1]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[20]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[20]_i_3_n_0\ : STD_LOGIC;
  signal \initialization[20]_i_4_n_0\ : STD_LOGIC;
  signal \initialization[20]_i_5_n_0\ : STD_LOGIC;
  signal \initialization[20]_i_6_n_0\ : STD_LOGIC;
  signal \initialization[21]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[22]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[23]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[24]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[24]_i_3_n_0\ : STD_LOGIC;
  signal \initialization[24]_i_4_n_0\ : STD_LOGIC;
  signal \initialization[24]_i_5_n_0\ : STD_LOGIC;
  signal \initialization[24]_i_6_n_0\ : STD_LOGIC;
  signal \initialization[25]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[26]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[27]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[28]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[28]_i_3_n_0\ : STD_LOGIC;
  signal \initialization[28]_i_4_n_0\ : STD_LOGIC;
  signal \initialization[28]_i_5_n_0\ : STD_LOGIC;
  signal \initialization[28]_i_6_n_0\ : STD_LOGIC;
  signal \initialization[29]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[2]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[30]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[31]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[31]_i_3_n_0\ : STD_LOGIC;
  signal \initialization[31]_i_4_n_0\ : STD_LOGIC;
  signal \initialization[31]_i_5_n_0\ : STD_LOGIC;
  signal \initialization[3]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[4]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[4]_i_3_n_0\ : STD_LOGIC;
  signal \initialization[4]_i_4_n_0\ : STD_LOGIC;
  signal \initialization[4]_i_5_n_0\ : STD_LOGIC;
  signal \initialization[4]_i_6_n_0\ : STD_LOGIC;
  signal \initialization[5]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[6]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[7]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[8]_i_1_n_0\ : STD_LOGIC;
  signal \initialization[8]_i_3_n_0\ : STD_LOGIC;
  signal \initialization[8]_i_4_n_0\ : STD_LOGIC;
  signal \initialization[8]_i_5_n_0\ : STD_LOGIC;
  signal \initialization[8]_i_6_n_0\ : STD_LOGIC;
  signal \initialization[9]_i_1_n_0\ : STD_LOGIC;
  signal \initialization_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \initialization_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \initialization_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \initialization_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \initialization_reg[12]_i_2_n_4\ : STD_LOGIC;
  signal \initialization_reg[12]_i_2_n_5\ : STD_LOGIC;
  signal \initialization_reg[12]_i_2_n_6\ : STD_LOGIC;
  signal \initialization_reg[12]_i_2_n_7\ : STD_LOGIC;
  signal \initialization_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \initialization_reg[16]_i_2_n_1\ : STD_LOGIC;
  signal \initialization_reg[16]_i_2_n_2\ : STD_LOGIC;
  signal \initialization_reg[16]_i_2_n_3\ : STD_LOGIC;
  signal \initialization_reg[16]_i_2_n_4\ : STD_LOGIC;
  signal \initialization_reg[16]_i_2_n_5\ : STD_LOGIC;
  signal \initialization_reg[16]_i_2_n_6\ : STD_LOGIC;
  signal \initialization_reg[16]_i_2_n_7\ : STD_LOGIC;
  signal \initialization_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \initialization_reg[20]_i_2_n_1\ : STD_LOGIC;
  signal \initialization_reg[20]_i_2_n_2\ : STD_LOGIC;
  signal \initialization_reg[20]_i_2_n_3\ : STD_LOGIC;
  signal \initialization_reg[20]_i_2_n_4\ : STD_LOGIC;
  signal \initialization_reg[20]_i_2_n_5\ : STD_LOGIC;
  signal \initialization_reg[20]_i_2_n_6\ : STD_LOGIC;
  signal \initialization_reg[20]_i_2_n_7\ : STD_LOGIC;
  signal \initialization_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \initialization_reg[24]_i_2_n_1\ : STD_LOGIC;
  signal \initialization_reg[24]_i_2_n_2\ : STD_LOGIC;
  signal \initialization_reg[24]_i_2_n_3\ : STD_LOGIC;
  signal \initialization_reg[24]_i_2_n_4\ : STD_LOGIC;
  signal \initialization_reg[24]_i_2_n_5\ : STD_LOGIC;
  signal \initialization_reg[24]_i_2_n_6\ : STD_LOGIC;
  signal \initialization_reg[24]_i_2_n_7\ : STD_LOGIC;
  signal \initialization_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \initialization_reg[28]_i_2_n_1\ : STD_LOGIC;
  signal \initialization_reg[28]_i_2_n_2\ : STD_LOGIC;
  signal \initialization_reg[28]_i_2_n_3\ : STD_LOGIC;
  signal \initialization_reg[28]_i_2_n_4\ : STD_LOGIC;
  signal \initialization_reg[28]_i_2_n_5\ : STD_LOGIC;
  signal \initialization_reg[28]_i_2_n_6\ : STD_LOGIC;
  signal \initialization_reg[28]_i_2_n_7\ : STD_LOGIC;
  signal \initialization_reg[31]_i_2_n_2\ : STD_LOGIC;
  signal \initialization_reg[31]_i_2_n_3\ : STD_LOGIC;
  signal \initialization_reg[31]_i_2_n_5\ : STD_LOGIC;
  signal \initialization_reg[31]_i_2_n_6\ : STD_LOGIC;
  signal \initialization_reg[31]_i_2_n_7\ : STD_LOGIC;
  signal \initialization_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \initialization_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \initialization_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \initialization_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \initialization_reg[4]_i_2_n_4\ : STD_LOGIC;
  signal \initialization_reg[4]_i_2_n_5\ : STD_LOGIC;
  signal \initialization_reg[4]_i_2_n_6\ : STD_LOGIC;
  signal \initialization_reg[4]_i_2_n_7\ : STD_LOGIC;
  signal \initialization_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \initialization_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \initialization_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \initialization_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \initialization_reg[8]_i_2_n_4\ : STD_LOGIC;
  signal \initialization_reg[8]_i_2_n_5\ : STD_LOGIC;
  signal \initialization_reg[8]_i_2_n_6\ : STD_LOGIC;
  signal \initialization_reg[8]_i_2_n_7\ : STD_LOGIC;
  signal locked : STD_LOGIC;
  signal sent_reg_n_0 : STD_LOGIC;
  signal \NLW_initialization_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_initialization_reg[31]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__4\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \count[1]_i_1__7\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \count[2]_i_1__4\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \count[4]_i_4\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \cs[0]_i_10\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \cs[0]_i_3\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \initialization[0]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \initialization[10]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \initialization[11]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \initialization[12]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \initialization[13]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \initialization[14]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \initialization[15]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \initialization[16]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \initialization[17]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \initialization[18]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \initialization[19]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \initialization[1]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \initialization[20]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \initialization[21]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \initialization[22]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \initialization[23]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \initialization[24]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \initialization[25]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \initialization[26]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \initialization[27]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \initialization[28]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \initialization[29]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \initialization[2]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \initialization[30]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \initialization[31]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \initialization[3]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \initialization[4]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \initialization[5]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \initialization[6]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \initialization[7]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \initialization[8]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \initialization[9]_i_1\ : label is "soft_lutpair36";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of serialClocks : label is "clk_wiz_0,clk_wiz_v5_1,{component_name=clk_wiz_0,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=1,clkin1_period=10.0,clkin2_period=10.0,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}";
begin
  BCLK <= \^bclk\;
  MCLK <= \^mclk\;
control: entity work.audioSys_0_I2C
     port map (
      E(0) => control_n_2,
      Q(4) => \count_reg_n_0_[4]\,
      Q(3) => \count_reg_n_0_[3]\,
      Q(2) => \count_reg_n_0_[2]\,
      Q(1) => \count_reg_n_0_[1]\,
      Q(0) => \count_reg_n_0_[0]\,
      SCL => SCL,
      SDA => SDA,
      clk => clk,
      \cs_reg[1]_0\(1 downto 0) => cs(1 downto 0),
      reset => reset,
      sent_reg => control_n_0,
      sent_reg_0 => sent_reg_n_0
    );
\count[0]_i_1__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => cs(0),
      I2 => cs(1),
      O => \count[0]_i_1__4_n_0\
    );
\count[1]_i_1__7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0060"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => cs(0),
      I3 => cs(1),
      O => \count[1]_i_1__7_n_0\
    );
\count[2]_i_1__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00007800"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => cs(0),
      I4 => cs(1),
      O => \count[2]_i_1__4_n_0\
    );
\count[3]_i_1__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000007F800000"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[3]\,
      I4 => cs(0),
      I5 => cs(1),
      O => \count[3]_i_1__4_n_0\
    );
\count[4]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00007800"
    )
        port map (
      I0 => \count[4]_i_4_n_0\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[4]\,
      I3 => cs(0),
      I4 => cs(1),
      O => \count[4]_i_2__0_n_0\
    );
\count[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[1]\,
      O => \count[4]_i_4_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => control_n_2,
      CLR => reset,
      D => \count[0]_i_1__4_n_0\,
      Q => \count_reg_n_0_[0]\
    );
\count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => control_n_2,
      CLR => reset,
      D => \count[1]_i_1__7_n_0\,
      Q => \count_reg_n_0_[1]\
    );
\count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => control_n_2,
      CLR => reset,
      D => \count[2]_i_1__4_n_0\,
      Q => \count_reg_n_0_[2]\
    );
\count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => control_n_2,
      CLR => reset,
      D => \count[3]_i_1__4_n_0\,
      Q => \count_reg_n_0_[3]\
    );
\count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => control_n_2,
      CLR => reset,
      D => \count[4]_i_2__0_n_0\,
      Q => \count_reg_n_0_[4]\
    );
\cs[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7444744474444444"
    )
        port map (
      I0 => \cs[0]_i_2_n_0\,
      I1 => cs(0),
      I2 => \cs[0]_i_3_n_0\,
      I3 => \cs[0]_i_4_n_0\,
      I4 => initialization(15),
      I5 => \cs[0]_i_5_n_0\,
      O => \cs[0]_i_1_n_0\
    );
\cs[0]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => initialization(9),
      I1 => initialization(8),
      O => \cs[0]_i_10_n_0\
    );
\cs[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => initialization(29),
      I1 => initialization(31),
      I2 => initialization(27),
      I3 => initialization(28),
      I4 => initialization(30),
      I5 => \cs[0]_i_12_n_0\,
      O => \cs[0]_i_11_n_0\
    );
\cs[0]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => initialization(25),
      I1 => initialization(26),
      I2 => initialization(22),
      I3 => initialization(21),
      I4 => initialization(24),
      I5 => initialization(23),
      O => \cs[0]_i_12_n_0\
    );
\cs[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008880"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[2]\,
      I4 => cs(1),
      O => \cs[0]_i_2_n_0\
    );
\cs[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => initialization(6),
      I1 => initialization(8),
      I2 => initialization(9),
      I3 => \cs[0]_i_6_n_0\,
      I4 => \cs[0]_i_7_n_0\,
      O => \cs[0]_i_3_n_0\
    );
\cs[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0C08080C0C08000"
    )
        port map (
      I0 => initialization(10),
      I1 => \cs[0]_i_8_n_0\,
      I2 => \cs[0]_i_9_n_0\,
      I3 => initialization(7),
      I4 => \cs[0]_i_6_n_0\,
      I5 => \cs[0]_i_10_n_0\,
      O => \cs[0]_i_4_n_0\
    );
\cs[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => initialization(16),
      I1 => \cs[0]_i_11_n_0\,
      O => \cs[0]_i_5_n_0\
    );
\cs[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => initialization(12),
      I1 => initialization(11),
      I2 => initialization(14),
      I3 => initialization(13),
      I4 => \cs[0]_i_11_n_0\,
      I5 => initialization(16),
      O => \cs[0]_i_6_n_0\
    );
\cs[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => initialization(4),
      I1 => initialization(5),
      I2 => initialization(0),
      I3 => initialization(3),
      I4 => initialization(2),
      I5 => initialization(1),
      O => \cs[0]_i_7_n_0\
    );
\cs[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => initialization(18),
      I1 => initialization(17),
      I2 => initialization(19),
      I3 => initialization(20),
      I4 => \cs[0]_i_11_n_0\,
      O => \cs[0]_i_8_n_0\
    );
\cs[0]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => locked,
      I1 => cs(1),
      O => \cs[0]_i_9_n_0\
    );
\cs[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF88800000"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[2]\,
      I4 => cs(0),
      I5 => cs(1),
      O => \cs[1]_i_1__0_n_0\
    );
\cs_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \cs[0]_i_1_n_0\,
      Q => cs(0)
    );
\cs_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \cs[1]_i_1__0_n_0\,
      Q => cs(1)
    );
dacVal: entity work.audioSys_0_serialInterface
     port map (
      CLK => \^bclk\,
      D(0) => D(0),
      LRCLK => LRCLK,
      Q(0) => Q(0),
      SDATA => SDATA,
      atten_valid => atten_valid,
      atten_valid_freq(2 downto 0) => atten_valid_freq(2 downto 0),
      \cs_reg[1]\(1 downto 0) => cs(1 downto 0),
      reset => reset,
      step => step,
      \waveform_atten_freq_reg[0]\ => \waveform_atten_freq_reg[0]\,
      \waveform_atten_freq_reg[0]_0\ => \waveform_atten_freq_reg[0]_0\,
      \waveform_atten_freq_reg[0]_1\ => \waveform_atten_freq_reg[0]_1\
    );
\initialization[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => initialization(0),
      I1 => cs(0),
      I2 => cs(1),
      O => \initialization[0]_i_1_n_0\
    );
\initialization[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[12]_i_2_n_6\,
      I2 => cs(1),
      O => \initialization[10]_i_1_n_0\
    );
\initialization[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[12]_i_2_n_5\,
      I2 => cs(1),
      O => \initialization[11]_i_1_n_0\
    );
\initialization[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[12]_i_2_n_4\,
      I2 => cs(1),
      O => \initialization[12]_i_1_n_0\
    );
\initialization[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(12),
      O => \initialization[12]_i_3_n_0\
    );
\initialization[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(11),
      O => \initialization[12]_i_4_n_0\
    );
\initialization[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(10),
      O => \initialization[12]_i_5_n_0\
    );
\initialization[12]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(9),
      O => \initialization[12]_i_6_n_0\
    );
\initialization[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[16]_i_2_n_7\,
      I2 => cs(1),
      O => \initialization[13]_i_1_n_0\
    );
\initialization[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[16]_i_2_n_6\,
      I2 => cs(1),
      O => \initialization[14]_i_1_n_0\
    );
\initialization[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[16]_i_2_n_5\,
      I2 => cs(1),
      O => \initialization[15]_i_1_n_0\
    );
\initialization[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[16]_i_2_n_4\,
      I2 => cs(1),
      O => \initialization[16]_i_1_n_0\
    );
\initialization[16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(16),
      O => \initialization[16]_i_3_n_0\
    );
\initialization[16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(15),
      O => \initialization[16]_i_4_n_0\
    );
\initialization[16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(14),
      O => \initialization[16]_i_5_n_0\
    );
\initialization[16]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(13),
      O => \initialization[16]_i_6_n_0\
    );
\initialization[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[20]_i_2_n_7\,
      I2 => cs(1),
      O => \initialization[17]_i_1_n_0\
    );
\initialization[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[20]_i_2_n_6\,
      I2 => cs(1),
      O => \initialization[18]_i_1_n_0\
    );
\initialization[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[20]_i_2_n_5\,
      I2 => cs(1),
      O => \initialization[19]_i_1_n_0\
    );
\initialization[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[4]_i_2_n_7\,
      I2 => cs(1),
      O => \initialization[1]_i_1_n_0\
    );
\initialization[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[20]_i_2_n_4\,
      I2 => cs(1),
      O => \initialization[20]_i_1_n_0\
    );
\initialization[20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(20),
      O => \initialization[20]_i_3_n_0\
    );
\initialization[20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(19),
      O => \initialization[20]_i_4_n_0\
    );
\initialization[20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(18),
      O => \initialization[20]_i_5_n_0\
    );
\initialization[20]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(17),
      O => \initialization[20]_i_6_n_0\
    );
\initialization[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[24]_i_2_n_7\,
      I2 => cs(1),
      O => \initialization[21]_i_1_n_0\
    );
\initialization[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[24]_i_2_n_6\,
      I2 => cs(1),
      O => \initialization[22]_i_1_n_0\
    );
\initialization[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[24]_i_2_n_5\,
      I2 => cs(1),
      O => \initialization[23]_i_1_n_0\
    );
\initialization[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[24]_i_2_n_4\,
      I2 => cs(1),
      O => \initialization[24]_i_1_n_0\
    );
\initialization[24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(24),
      O => \initialization[24]_i_3_n_0\
    );
\initialization[24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(23),
      O => \initialization[24]_i_4_n_0\
    );
\initialization[24]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(22),
      O => \initialization[24]_i_5_n_0\
    );
\initialization[24]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(21),
      O => \initialization[24]_i_6_n_0\
    );
\initialization[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[28]_i_2_n_7\,
      I2 => cs(1),
      O => \initialization[25]_i_1_n_0\
    );
\initialization[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[28]_i_2_n_6\,
      I2 => cs(1),
      O => \initialization[26]_i_1_n_0\
    );
\initialization[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[28]_i_2_n_5\,
      I2 => cs(1),
      O => \initialization[27]_i_1_n_0\
    );
\initialization[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[28]_i_2_n_4\,
      I2 => cs(1),
      O => \initialization[28]_i_1_n_0\
    );
\initialization[28]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(28),
      O => \initialization[28]_i_3_n_0\
    );
\initialization[28]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(27),
      O => \initialization[28]_i_4_n_0\
    );
\initialization[28]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(26),
      O => \initialization[28]_i_5_n_0\
    );
\initialization[28]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(25),
      O => \initialization[28]_i_6_n_0\
    );
\initialization[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[31]_i_2_n_7\,
      I2 => cs(1),
      O => \initialization[29]_i_1_n_0\
    );
\initialization[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[4]_i_2_n_6\,
      I2 => cs(1),
      O => \initialization[2]_i_1_n_0\
    );
\initialization[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[31]_i_2_n_6\,
      I2 => cs(1),
      O => \initialization[30]_i_1_n_0\
    );
\initialization[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[31]_i_2_n_5\,
      I2 => cs(1),
      O => \initialization[31]_i_1_n_0\
    );
\initialization[31]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(31),
      O => \initialization[31]_i_3_n_0\
    );
\initialization[31]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(30),
      O => \initialization[31]_i_4_n_0\
    );
\initialization[31]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(29),
      O => \initialization[31]_i_5_n_0\
    );
\initialization[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[4]_i_2_n_5\,
      I2 => cs(1),
      O => \initialization[3]_i_1_n_0\
    );
\initialization[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[4]_i_2_n_4\,
      I2 => cs(1),
      O => \initialization[4]_i_1_n_0\
    );
\initialization[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(4),
      O => \initialization[4]_i_3_n_0\
    );
\initialization[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(3),
      O => \initialization[4]_i_4_n_0\
    );
\initialization[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(2),
      O => \initialization[4]_i_5_n_0\
    );
\initialization[4]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(1),
      O => \initialization[4]_i_6_n_0\
    );
\initialization[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[8]_i_2_n_7\,
      I2 => cs(1),
      O => \initialization[5]_i_1_n_0\
    );
\initialization[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[8]_i_2_n_6\,
      I2 => cs(1),
      O => \initialization[6]_i_1_n_0\
    );
\initialization[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[8]_i_2_n_5\,
      I2 => cs(1),
      O => \initialization[7]_i_1_n_0\
    );
\initialization[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[8]_i_2_n_4\,
      I2 => cs(1),
      O => \initialization[8]_i_1_n_0\
    );
\initialization[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(8),
      O => \initialization[8]_i_3_n_0\
    );
\initialization[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(7),
      O => \initialization[8]_i_4_n_0\
    );
\initialization[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(6),
      O => \initialization[8]_i_5_n_0\
    );
\initialization[8]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialization(5),
      O => \initialization[8]_i_6_n_0\
    );
\initialization[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cs(0),
      I1 => \initialization_reg[12]_i_2_n_7\,
      I2 => cs(1),
      O => \initialization[9]_i_1_n_0\
    );
\initialization_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[0]_i_1_n_0\,
      Q => initialization(0)
    );
\initialization_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[10]_i_1_n_0\,
      Q => initialization(10)
    );
\initialization_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[11]_i_1_n_0\,
      Q => initialization(11)
    );
\initialization_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[12]_i_1_n_0\,
      Q => initialization(12)
    );
\initialization_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \initialization_reg[8]_i_2_n_0\,
      CO(3) => \initialization_reg[12]_i_2_n_0\,
      CO(2) => \initialization_reg[12]_i_2_n_1\,
      CO(1) => \initialization_reg[12]_i_2_n_2\,
      CO(0) => \initialization_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \initialization_reg[12]_i_2_n_4\,
      O(2) => \initialization_reg[12]_i_2_n_5\,
      O(1) => \initialization_reg[12]_i_2_n_6\,
      O(0) => \initialization_reg[12]_i_2_n_7\,
      S(3) => \initialization[12]_i_3_n_0\,
      S(2) => \initialization[12]_i_4_n_0\,
      S(1) => \initialization[12]_i_5_n_0\,
      S(0) => \initialization[12]_i_6_n_0\
    );
\initialization_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[13]_i_1_n_0\,
      Q => initialization(13)
    );
\initialization_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[14]_i_1_n_0\,
      Q => initialization(14)
    );
\initialization_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[15]_i_1_n_0\,
      Q => initialization(15)
    );
\initialization_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[16]_i_1_n_0\,
      Q => initialization(16)
    );
\initialization_reg[16]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \initialization_reg[12]_i_2_n_0\,
      CO(3) => \initialization_reg[16]_i_2_n_0\,
      CO(2) => \initialization_reg[16]_i_2_n_1\,
      CO(1) => \initialization_reg[16]_i_2_n_2\,
      CO(0) => \initialization_reg[16]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \initialization_reg[16]_i_2_n_4\,
      O(2) => \initialization_reg[16]_i_2_n_5\,
      O(1) => \initialization_reg[16]_i_2_n_6\,
      O(0) => \initialization_reg[16]_i_2_n_7\,
      S(3) => \initialization[16]_i_3_n_0\,
      S(2) => \initialization[16]_i_4_n_0\,
      S(1) => \initialization[16]_i_5_n_0\,
      S(0) => \initialization[16]_i_6_n_0\
    );
\initialization_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[17]_i_1_n_0\,
      Q => initialization(17)
    );
\initialization_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[18]_i_1_n_0\,
      Q => initialization(18)
    );
\initialization_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[19]_i_1_n_0\,
      Q => initialization(19)
    );
\initialization_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[1]_i_1_n_0\,
      Q => initialization(1)
    );
\initialization_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[20]_i_1_n_0\,
      Q => initialization(20)
    );
\initialization_reg[20]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \initialization_reg[16]_i_2_n_0\,
      CO(3) => \initialization_reg[20]_i_2_n_0\,
      CO(2) => \initialization_reg[20]_i_2_n_1\,
      CO(1) => \initialization_reg[20]_i_2_n_2\,
      CO(0) => \initialization_reg[20]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \initialization_reg[20]_i_2_n_4\,
      O(2) => \initialization_reg[20]_i_2_n_5\,
      O(1) => \initialization_reg[20]_i_2_n_6\,
      O(0) => \initialization_reg[20]_i_2_n_7\,
      S(3) => \initialization[20]_i_3_n_0\,
      S(2) => \initialization[20]_i_4_n_0\,
      S(1) => \initialization[20]_i_5_n_0\,
      S(0) => \initialization[20]_i_6_n_0\
    );
\initialization_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[21]_i_1_n_0\,
      Q => initialization(21)
    );
\initialization_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[22]_i_1_n_0\,
      Q => initialization(22)
    );
\initialization_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[23]_i_1_n_0\,
      Q => initialization(23)
    );
\initialization_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[24]_i_1_n_0\,
      Q => initialization(24)
    );
\initialization_reg[24]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \initialization_reg[20]_i_2_n_0\,
      CO(3) => \initialization_reg[24]_i_2_n_0\,
      CO(2) => \initialization_reg[24]_i_2_n_1\,
      CO(1) => \initialization_reg[24]_i_2_n_2\,
      CO(0) => \initialization_reg[24]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \initialization_reg[24]_i_2_n_4\,
      O(2) => \initialization_reg[24]_i_2_n_5\,
      O(1) => \initialization_reg[24]_i_2_n_6\,
      O(0) => \initialization_reg[24]_i_2_n_7\,
      S(3) => \initialization[24]_i_3_n_0\,
      S(2) => \initialization[24]_i_4_n_0\,
      S(1) => \initialization[24]_i_5_n_0\,
      S(0) => \initialization[24]_i_6_n_0\
    );
\initialization_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[25]_i_1_n_0\,
      Q => initialization(25)
    );
\initialization_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[26]_i_1_n_0\,
      Q => initialization(26)
    );
\initialization_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[27]_i_1_n_0\,
      Q => initialization(27)
    );
\initialization_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[28]_i_1_n_0\,
      Q => initialization(28)
    );
\initialization_reg[28]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \initialization_reg[24]_i_2_n_0\,
      CO(3) => \initialization_reg[28]_i_2_n_0\,
      CO(2) => \initialization_reg[28]_i_2_n_1\,
      CO(1) => \initialization_reg[28]_i_2_n_2\,
      CO(0) => \initialization_reg[28]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \initialization_reg[28]_i_2_n_4\,
      O(2) => \initialization_reg[28]_i_2_n_5\,
      O(1) => \initialization_reg[28]_i_2_n_6\,
      O(0) => \initialization_reg[28]_i_2_n_7\,
      S(3) => \initialization[28]_i_3_n_0\,
      S(2) => \initialization[28]_i_4_n_0\,
      S(1) => \initialization[28]_i_5_n_0\,
      S(0) => \initialization[28]_i_6_n_0\
    );
\initialization_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[29]_i_1_n_0\,
      Q => initialization(29)
    );
\initialization_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[2]_i_1_n_0\,
      Q => initialization(2)
    );
\initialization_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[30]_i_1_n_0\,
      Q => initialization(30)
    );
\initialization_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[31]_i_1_n_0\,
      Q => initialization(31)
    );
\initialization_reg[31]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \initialization_reg[28]_i_2_n_0\,
      CO(3 downto 2) => \NLW_initialization_reg[31]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \initialization_reg[31]_i_2_n_2\,
      CO(0) => \initialization_reg[31]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \NLW_initialization_reg[31]_i_2_O_UNCONNECTED\(3),
      O(2) => \initialization_reg[31]_i_2_n_5\,
      O(1) => \initialization_reg[31]_i_2_n_6\,
      O(0) => \initialization_reg[31]_i_2_n_7\,
      S(3) => '0',
      S(2) => \initialization[31]_i_3_n_0\,
      S(1) => \initialization[31]_i_4_n_0\,
      S(0) => \initialization[31]_i_5_n_0\
    );
\initialization_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[3]_i_1_n_0\,
      Q => initialization(3)
    );
\initialization_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[4]_i_1_n_0\,
      Q => initialization(4)
    );
\initialization_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \initialization_reg[4]_i_2_n_0\,
      CO(2) => \initialization_reg[4]_i_2_n_1\,
      CO(1) => \initialization_reg[4]_i_2_n_2\,
      CO(0) => \initialization_reg[4]_i_2_n_3\,
      CYINIT => initialization(0),
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \initialization_reg[4]_i_2_n_4\,
      O(2) => \initialization_reg[4]_i_2_n_5\,
      O(1) => \initialization_reg[4]_i_2_n_6\,
      O(0) => \initialization_reg[4]_i_2_n_7\,
      S(3) => \initialization[4]_i_3_n_0\,
      S(2) => \initialization[4]_i_4_n_0\,
      S(1) => \initialization[4]_i_5_n_0\,
      S(0) => \initialization[4]_i_6_n_0\
    );
\initialization_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[5]_i_1_n_0\,
      Q => initialization(5)
    );
\initialization_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[6]_i_1_n_0\,
      Q => initialization(6)
    );
\initialization_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[7]_i_1_n_0\,
      Q => initialization(7)
    );
\initialization_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[8]_i_1_n_0\,
      Q => initialization(8)
    );
\initialization_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \initialization_reg[4]_i_2_n_0\,
      CO(3) => \initialization_reg[8]_i_2_n_0\,
      CO(2) => \initialization_reg[8]_i_2_n_1\,
      CO(1) => \initialization_reg[8]_i_2_n_2\,
      CO(0) => \initialization_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \initialization_reg[8]_i_2_n_4\,
      O(2) => \initialization_reg[8]_i_2_n_5\,
      O(1) => \initialization_reg[8]_i_2_n_6\,
      O(0) => \initialization_reg[8]_i_2_n_7\,
      S(3) => \initialization[8]_i_3_n_0\,
      S(2) => \initialization[8]_i_4_n_0\,
      S(1) => \initialization[8]_i_5_n_0\,
      S(0) => \initialization[8]_i_6_n_0\
    );
\initialization_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \initialization[9]_i_1_n_0\,
      Q => initialization(9)
    );
sent_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => control_n_0,
      Q => sent_reg_n_0
    );
serialBCLock: entity work.audioSys_0_BCLKGen
     port map (
      BCLK => \^bclk\,
      MCLK => \^mclk\,
      locked => locked,
      reset => reset
    );
serialClocks: entity work.audioSys_0_clk_wiz_0
     port map (
      clk_main => clk,
      clk_out1 => \^mclk\,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_freqSynth is
  port (
    \remainder_reg[0]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \first_byte_reg[6]\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    \first_byte_reg[6]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 9 downto 0 );
    \cs_reg[1]\ : in STD_LOGIC;
    \cs_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_freqSynth : entity is "freqSynth";
end audioSys_0_freqSynth;

architecture STRUCTURE of audioSys_0_freqSynth is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal data : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^remainder_reg[0]\ : STD_LOGIC;
  signal step_size : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal step_size_curr : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  E(0) <= \^e\(0);
  \remainder_reg[0]\ <= \^remainder_reg[0]\;
\data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(0),
      Q => data(0)
    );
\data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(1),
      Q => data(1)
    );
\data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(2),
      Q => data(2)
    );
\data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(3),
      Q => data(3)
    );
\data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(4),
      Q => data(4)
    );
\data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(5),
      Q => data(5)
    );
\data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(6),
      Q => data(6)
    );
\data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(7),
      Q => data(7)
    );
\data_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(8),
      Q => data(8)
    );
\data_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(9),
      Q => data(9)
    );
div_en_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \first_byte_reg[6]\,
      Q => \^remainder_reg[0]\
    );
freqCalc: entity work.audioSys_0_divider_5
     port map (
      E(0) => \^e\(0),
      Q(9 downto 0) => data(9 downto 0),
      clk => clk,
      div_en_reg => \^remainder_reg[0]\,
      reset => reset,
      \step_size_curr_reg[15]\(15 downto 0) => step_size(15 downto 0)
    );
gen: entity work.audioSys_0_waveGen_6
     port map (
      Q(15 downto 0) => step_size_curr(15 downto 0),
      clk => clk,
      \cs_reg[0]\(0) => \cs_reg[0]\(0),
      \cs_reg[1]\ => \cs_reg[1]\,
      reset => reset,
      \waveform_base_reg[15]\(8 downto 0) => Q(8 downto 0)
    );
\step_size_curr_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(0),
      Q => step_size_curr(0)
    );
\step_size_curr_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(10),
      Q => step_size_curr(10)
    );
\step_size_curr_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(11),
      Q => step_size_curr(11)
    );
\step_size_curr_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(12),
      Q => step_size_curr(12)
    );
\step_size_curr_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(13),
      Q => step_size_curr(13)
    );
\step_size_curr_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(14),
      Q => step_size_curr(14)
    );
\step_size_curr_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(15),
      Q => step_size_curr(15)
    );
\step_size_curr_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(1),
      Q => step_size_curr(1)
    );
\step_size_curr_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(2),
      Q => step_size_curr(2)
    );
\step_size_curr_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(3),
      Q => step_size_curr(3)
    );
\step_size_curr_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(4),
      Q => step_size_curr(4)
    );
\step_size_curr_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(5),
      Q => step_size_curr(5)
    );
\step_size_curr_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(6),
      Q => step_size_curr(6)
    );
\step_size_curr_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(7),
      Q => step_size_curr(7)
    );
\step_size_curr_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(8),
      Q => step_size_curr(8)
    );
\step_size_curr_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(9),
      Q => step_size_curr(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_freqSynth_0 is
  port (
    \remainder_reg[0]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \first_byte_reg[6]\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    \first_byte_reg[6]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 9 downto 0 );
    \cs_reg[1]\ : in STD_LOGIC;
    \cs_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_freqSynth_0 : entity is "freqSynth";
end audioSys_0_freqSynth_0;

architecture STRUCTURE of audioSys_0_freqSynth_0 is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal data : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^remainder_reg[0]\ : STD_LOGIC;
  signal step_size : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal step_size_curr : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  E(0) <= \^e\(0);
  \remainder_reg[0]\ <= \^remainder_reg[0]\;
\data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(0),
      Q => data(0)
    );
\data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(1),
      Q => data(1)
    );
\data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(2),
      Q => data(2)
    );
\data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(3),
      Q => data(3)
    );
\data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(4),
      Q => data(4)
    );
\data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(5),
      Q => data(5)
    );
\data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(6),
      Q => data(6)
    );
\data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(7),
      Q => data(7)
    );
\data_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(8),
      Q => data(8)
    );
\data_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[6]_0\(0),
      CLR => reset,
      D => D(9),
      Q => data(9)
    );
div_en_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \first_byte_reg[6]\,
      Q => \^remainder_reg[0]\
    );
freqCalc: entity work.audioSys_0_divider_2
     port map (
      E(0) => \^e\(0),
      Q(9 downto 0) => data(9 downto 0),
      clk => clk,
      div_en_reg => \^remainder_reg[0]\,
      reset => reset,
      \step_size_curr_reg[15]\(15 downto 0) => step_size(15 downto 0)
    );
gen: entity work.audioSys_0_waveGen_3
     port map (
      Q(15 downto 0) => step_size_curr(15 downto 0),
      clk => clk,
      \cs_reg[0]\(0) => \cs_reg[0]\(0),
      \cs_reg[1]\ => \cs_reg[1]\,
      reset => reset,
      \waveform_base_reg[15]\(8 downto 0) => Q(8 downto 0)
    );
\step_size_curr_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(0),
      Q => step_size_curr(0)
    );
\step_size_curr_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(10),
      Q => step_size_curr(10)
    );
\step_size_curr_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(11),
      Q => step_size_curr(11)
    );
\step_size_curr_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(12),
      Q => step_size_curr(12)
    );
\step_size_curr_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(13),
      Q => step_size_curr(13)
    );
\step_size_curr_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(14),
      Q => step_size_curr(14)
    );
\step_size_curr_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(15),
      Q => step_size_curr(15)
    );
\step_size_curr_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(1),
      Q => step_size_curr(1)
    );
\step_size_curr_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(2),
      Q => step_size_curr(2)
    );
\step_size_curr_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(3),
      Q => step_size_curr(3)
    );
\step_size_curr_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(4),
      Q => step_size_curr(4)
    );
\step_size_curr_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(5),
      Q => step_size_curr(5)
    );
\step_size_curr_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(6),
      Q => step_size_curr(6)
    );
\step_size_curr_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(7),
      Q => step_size_curr(7)
    );
\step_size_curr_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(8),
      Q => step_size_curr(8)
    );
\step_size_curr_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(9),
      Q => step_size_curr(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_freqSynth_1 is
  port (
    \remainder_reg[0]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \first_byte_reg[7]\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    \first_byte_reg[7]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 9 downto 0 );
    \cs_reg[1]\ : in STD_LOGIC;
    \cs_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_freqSynth_1 : entity is "freqSynth";
end audioSys_0_freqSynth_1;

architecture STRUCTURE of audioSys_0_freqSynth_1 is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal data : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^remainder_reg[0]\ : STD_LOGIC;
  signal step_size : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal step_size_curr : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  E(0) <= \^e\(0);
  \remainder_reg[0]\ <= \^remainder_reg[0]\;
\data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[7]_0\(0),
      CLR => reset,
      D => D(0),
      Q => data(0)
    );
\data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[7]_0\(0),
      CLR => reset,
      D => D(1),
      Q => data(1)
    );
\data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[7]_0\(0),
      CLR => reset,
      D => D(2),
      Q => data(2)
    );
\data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[7]_0\(0),
      CLR => reset,
      D => D(3),
      Q => data(3)
    );
\data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[7]_0\(0),
      CLR => reset,
      D => D(4),
      Q => data(4)
    );
\data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[7]_0\(0),
      CLR => reset,
      D => D(5),
      Q => data(5)
    );
\data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[7]_0\(0),
      CLR => reset,
      D => D(6),
      Q => data(6)
    );
\data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[7]_0\(0),
      CLR => reset,
      D => D(7),
      Q => data(7)
    );
\data_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[7]_0\(0),
      CLR => reset,
      D => D(8),
      Q => data(8)
    );
\data_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \first_byte_reg[7]_0\(0),
      CLR => reset,
      D => D(9),
      Q => data(9)
    );
div_en_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \first_byte_reg[7]\,
      Q => \^remainder_reg[0]\
    );
freqCalc: entity work.audioSys_0_divider
     port map (
      E(0) => \^e\(0),
      Q(9 downto 0) => data(9 downto 0),
      clk => clk,
      div_en_reg => \^remainder_reg[0]\,
      reset => reset,
      \step_size_curr_reg[15]\(15 downto 0) => step_size(15 downto 0)
    );
gen: entity work.audioSys_0_waveGen
     port map (
      Q(15 downto 0) => step_size_curr(15 downto 0),
      clk => clk,
      \cs_reg[0]\(0) => \cs_reg[0]\(0),
      \cs_reg[1]\ => \cs_reg[1]\,
      reset => reset,
      \waveform_base_reg[15]\(8 downto 0) => Q(8 downto 0)
    );
\step_size_curr_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(0),
      Q => step_size_curr(0)
    );
\step_size_curr_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(10),
      Q => step_size_curr(10)
    );
\step_size_curr_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(11),
      Q => step_size_curr(11)
    );
\step_size_curr_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(12),
      Q => step_size_curr(12)
    );
\step_size_curr_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(13),
      Q => step_size_curr(13)
    );
\step_size_curr_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(14),
      Q => step_size_curr(14)
    );
\step_size_curr_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(15),
      Q => step_size_curr(15)
    );
\step_size_curr_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(1),
      Q => step_size_curr(1)
    );
\step_size_curr_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(2),
      Q => step_size_curr(2)
    );
\step_size_curr_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(3),
      Q => step_size_curr(3)
    );
\step_size_curr_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(4),
      Q => step_size_curr(4)
    );
\step_size_curr_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(5),
      Q => step_size_curr(5)
    );
\step_size_curr_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(6),
      Q => step_size_curr(6)
    );
\step_size_curr_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(7),
      Q => step_size_curr(7)
    );
\step_size_curr_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(8),
      Q => step_size_curr(8)
    );
\step_size_curr_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^e\(0),
      CLR => reset,
      D => step_size(9),
      Q => step_size_curr(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_mult_gen_v12_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 5 downto 0 );
    CE : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    ZERO_DETECT : out STD_LOGIC_VECTOR ( 1 downto 0 );
    P : out STD_LOGIC_VECTOR ( 15 downto 0 );
    PCASC : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );
  attribute C_A_TYPE : integer;
  attribute C_A_TYPE of audioSys_0_mult_gen_v12_0 : entity is 0;
  attribute C_A_WIDTH : integer;
  attribute C_A_WIDTH of audioSys_0_mult_gen_v12_0 : entity is 16;
  attribute C_B_TYPE : integer;
  attribute C_B_TYPE of audioSys_0_mult_gen_v12_0 : entity is 1;
  attribute C_B_VALUE : string;
  attribute C_B_VALUE of audioSys_0_mult_gen_v12_0 : entity is "10000001";
  attribute C_B_WIDTH : integer;
  attribute C_B_WIDTH of audioSys_0_mult_gen_v12_0 : entity is 6;
  attribute C_CCM_IMP : integer;
  attribute C_CCM_IMP of audioSys_0_mult_gen_v12_0 : entity is 0;
  attribute C_CE_OVERRIDES_SCLR : integer;
  attribute C_CE_OVERRIDES_SCLR of audioSys_0_mult_gen_v12_0 : entity is 0;
  attribute C_HAS_CE : integer;
  attribute C_HAS_CE of audioSys_0_mult_gen_v12_0 : entity is 1;
  attribute C_HAS_SCLR : integer;
  attribute C_HAS_SCLR of audioSys_0_mult_gen_v12_0 : entity is 0;
  attribute C_HAS_ZERO_DETECT : integer;
  attribute C_HAS_ZERO_DETECT of audioSys_0_mult_gen_v12_0 : entity is 0;
  attribute C_LATENCY : integer;
  attribute C_LATENCY of audioSys_0_mult_gen_v12_0 : entity is 3;
  attribute C_MODEL_TYPE : integer;
  attribute C_MODEL_TYPE of audioSys_0_mult_gen_v12_0 : entity is 0;
  attribute C_MULT_TYPE : integer;
  attribute C_MULT_TYPE of audioSys_0_mult_gen_v12_0 : entity is 1;
  attribute C_OPTIMIZE_GOAL : integer;
  attribute C_OPTIMIZE_GOAL of audioSys_0_mult_gen_v12_0 : entity is 1;
  attribute C_OUT_HIGH : integer;
  attribute C_OUT_HIGH of audioSys_0_mult_gen_v12_0 : entity is 15;
  attribute C_OUT_LOW : integer;
  attribute C_OUT_LOW of audioSys_0_mult_gen_v12_0 : entity is 0;
  attribute C_ROUND_OUTPUT : integer;
  attribute C_ROUND_OUTPUT of audioSys_0_mult_gen_v12_0 : entity is 0;
  attribute C_ROUND_PT : integer;
  attribute C_ROUND_PT of audioSys_0_mult_gen_v12_0 : entity is 0;
  attribute C_VERBOSITY : integer;
  attribute C_VERBOSITY of audioSys_0_mult_gen_v12_0 : entity is 0;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of audioSys_0_mult_gen_v12_0 : entity is "zynq";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of audioSys_0_mult_gen_v12_0 : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_mult_gen_v12_0 : entity is "mult_gen_v12_0";
end audioSys_0_mult_gen_v12_0;

architecture STRUCTURE of audioSys_0_mult_gen_v12_0 is
  attribute C_A_TYPE of i_mult : label is 0;
  attribute C_A_WIDTH of i_mult : label is 16;
  attribute C_B_TYPE of i_mult : label is 1;
  attribute C_B_VALUE of i_mult : label is "10000001";
  attribute C_B_WIDTH of i_mult : label is 6;
  attribute C_CCM_IMP of i_mult : label is 0;
  attribute C_CE_OVERRIDES_SCLR of i_mult : label is 0;
  attribute C_HAS_CE of i_mult : label is 1;
  attribute C_HAS_SCLR of i_mult : label is 0;
  attribute C_HAS_ZERO_DETECT of i_mult : label is 0;
  attribute C_LATENCY of i_mult : label is 3;
  attribute C_MODEL_TYPE of i_mult : label is 0;
  attribute C_MULT_TYPE of i_mult : label is 1;
  attribute C_OPTIMIZE_GOAL of i_mult : label is 1;
  attribute C_OUT_HIGH of i_mult : label is 15;
  attribute C_OUT_LOW of i_mult : label is 0;
  attribute C_ROUND_OUTPUT of i_mult : label is 0;
  attribute C_ROUND_PT of i_mult : label is 0;
  attribute C_VERBOSITY of i_mult : label is 0;
  attribute C_XDEVICEFAMILY of i_mult : label is "zynq";
  attribute downgradeipidentifiedwarnings of i_mult : label is "yes";
begin
i_mult: entity work.audioSys_0_mult_gen_v12_0_viv
     port map (
      A(15 downto 0) => A(15 downto 0),
      B(5 downto 0) => B(5 downto 0),
      CE => CE,
      CLK => CLK,
      P(15 downto 0) => P(15 downto 0),
      PCASC(47 downto 0) => PCASC(47 downto 0),
      SCLR => SCLR,
      ZERO_DETECT(1 downto 0) => ZERO_DETECT(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \audioSys_0_mult_gen_v12_0__3\ is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 5 downto 0 );
    CE : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    ZERO_DETECT : out STD_LOGIC_VECTOR ( 1 downto 0 );
    P : out STD_LOGIC_VECTOR ( 15 downto 0 );
    PCASC : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );
  attribute C_A_TYPE : integer;
  attribute C_A_TYPE of \audioSys_0_mult_gen_v12_0__3\ : entity is 0;
  attribute C_A_WIDTH : integer;
  attribute C_A_WIDTH of \audioSys_0_mult_gen_v12_0__3\ : entity is 16;
  attribute C_B_TYPE : integer;
  attribute C_B_TYPE of \audioSys_0_mult_gen_v12_0__3\ : entity is 1;
  attribute C_B_VALUE : string;
  attribute C_B_VALUE of \audioSys_0_mult_gen_v12_0__3\ : entity is "10000001";
  attribute C_B_WIDTH : integer;
  attribute C_B_WIDTH of \audioSys_0_mult_gen_v12_0__3\ : entity is 6;
  attribute C_CCM_IMP : integer;
  attribute C_CCM_IMP of \audioSys_0_mult_gen_v12_0__3\ : entity is 0;
  attribute C_CE_OVERRIDES_SCLR : integer;
  attribute C_CE_OVERRIDES_SCLR of \audioSys_0_mult_gen_v12_0__3\ : entity is 0;
  attribute C_HAS_CE : integer;
  attribute C_HAS_CE of \audioSys_0_mult_gen_v12_0__3\ : entity is 1;
  attribute C_HAS_SCLR : integer;
  attribute C_HAS_SCLR of \audioSys_0_mult_gen_v12_0__3\ : entity is 0;
  attribute C_HAS_ZERO_DETECT : integer;
  attribute C_HAS_ZERO_DETECT of \audioSys_0_mult_gen_v12_0__3\ : entity is 0;
  attribute C_LATENCY : integer;
  attribute C_LATENCY of \audioSys_0_mult_gen_v12_0__3\ : entity is 3;
  attribute C_MODEL_TYPE : integer;
  attribute C_MODEL_TYPE of \audioSys_0_mult_gen_v12_0__3\ : entity is 0;
  attribute C_MULT_TYPE : integer;
  attribute C_MULT_TYPE of \audioSys_0_mult_gen_v12_0__3\ : entity is 1;
  attribute C_OPTIMIZE_GOAL : integer;
  attribute C_OPTIMIZE_GOAL of \audioSys_0_mult_gen_v12_0__3\ : entity is 1;
  attribute C_OUT_HIGH : integer;
  attribute C_OUT_HIGH of \audioSys_0_mult_gen_v12_0__3\ : entity is 15;
  attribute C_OUT_LOW : integer;
  attribute C_OUT_LOW of \audioSys_0_mult_gen_v12_0__3\ : entity is 0;
  attribute C_ROUND_OUTPUT : integer;
  attribute C_ROUND_OUTPUT of \audioSys_0_mult_gen_v12_0__3\ : entity is 0;
  attribute C_ROUND_PT : integer;
  attribute C_ROUND_PT of \audioSys_0_mult_gen_v12_0__3\ : entity is 0;
  attribute C_VERBOSITY : integer;
  attribute C_VERBOSITY of \audioSys_0_mult_gen_v12_0__3\ : entity is 0;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of \audioSys_0_mult_gen_v12_0__3\ : entity is "zynq";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of \audioSys_0_mult_gen_v12_0__3\ : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \audioSys_0_mult_gen_v12_0__3\ : entity is "mult_gen_v12_0";
end \audioSys_0_mult_gen_v12_0__3\;

architecture STRUCTURE of \audioSys_0_mult_gen_v12_0__3\ is
  attribute C_A_TYPE of i_mult : label is 0;
  attribute C_A_WIDTH of i_mult : label is 16;
  attribute C_B_TYPE of i_mult : label is 1;
  attribute C_B_VALUE of i_mult : label is "10000001";
  attribute C_B_WIDTH of i_mult : label is 6;
  attribute C_CCM_IMP of i_mult : label is 0;
  attribute C_CE_OVERRIDES_SCLR of i_mult : label is 0;
  attribute C_HAS_CE of i_mult : label is 1;
  attribute C_HAS_SCLR of i_mult : label is 0;
  attribute C_HAS_ZERO_DETECT of i_mult : label is 0;
  attribute C_LATENCY of i_mult : label is 3;
  attribute C_MODEL_TYPE of i_mult : label is 0;
  attribute C_MULT_TYPE of i_mult : label is 1;
  attribute C_OPTIMIZE_GOAL of i_mult : label is 1;
  attribute C_OUT_HIGH of i_mult : label is 15;
  attribute C_OUT_LOW of i_mult : label is 0;
  attribute C_ROUND_OUTPUT of i_mult : label is 0;
  attribute C_ROUND_PT of i_mult : label is 0;
  attribute C_VERBOSITY of i_mult : label is 0;
  attribute C_XDEVICEFAMILY of i_mult : label is "zynq";
  attribute downgradeipidentifiedwarnings of i_mult : label is "yes";
begin
i_mult: entity work.\audioSys_0_mult_gen_v12_0_viv__3\
     port map (
      A(15 downto 0) => A(15 downto 0),
      B(5 downto 0) => B(5 downto 0),
      CE => CE,
      CLK => CLK,
      P(15 downto 0) => P(15 downto 0),
      PCASC(47 downto 0) => PCASC(47 downto 0),
      SCLR => SCLR,
      ZERO_DETECT(1 downto 0) => ZERO_DETECT(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \audioSys_0_mult_gen_v12_0__4\ is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 5 downto 0 );
    CE : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    ZERO_DETECT : out STD_LOGIC_VECTOR ( 1 downto 0 );
    P : out STD_LOGIC_VECTOR ( 15 downto 0 );
    PCASC : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );
  attribute C_A_TYPE : integer;
  attribute C_A_TYPE of \audioSys_0_mult_gen_v12_0__4\ : entity is 0;
  attribute C_A_WIDTH : integer;
  attribute C_A_WIDTH of \audioSys_0_mult_gen_v12_0__4\ : entity is 16;
  attribute C_B_TYPE : integer;
  attribute C_B_TYPE of \audioSys_0_mult_gen_v12_0__4\ : entity is 1;
  attribute C_B_VALUE : string;
  attribute C_B_VALUE of \audioSys_0_mult_gen_v12_0__4\ : entity is "10000001";
  attribute C_B_WIDTH : integer;
  attribute C_B_WIDTH of \audioSys_0_mult_gen_v12_0__4\ : entity is 6;
  attribute C_CCM_IMP : integer;
  attribute C_CCM_IMP of \audioSys_0_mult_gen_v12_0__4\ : entity is 0;
  attribute C_CE_OVERRIDES_SCLR : integer;
  attribute C_CE_OVERRIDES_SCLR of \audioSys_0_mult_gen_v12_0__4\ : entity is 0;
  attribute C_HAS_CE : integer;
  attribute C_HAS_CE of \audioSys_0_mult_gen_v12_0__4\ : entity is 1;
  attribute C_HAS_SCLR : integer;
  attribute C_HAS_SCLR of \audioSys_0_mult_gen_v12_0__4\ : entity is 0;
  attribute C_HAS_ZERO_DETECT : integer;
  attribute C_HAS_ZERO_DETECT of \audioSys_0_mult_gen_v12_0__4\ : entity is 0;
  attribute C_LATENCY : integer;
  attribute C_LATENCY of \audioSys_0_mult_gen_v12_0__4\ : entity is 3;
  attribute C_MODEL_TYPE : integer;
  attribute C_MODEL_TYPE of \audioSys_0_mult_gen_v12_0__4\ : entity is 0;
  attribute C_MULT_TYPE : integer;
  attribute C_MULT_TYPE of \audioSys_0_mult_gen_v12_0__4\ : entity is 1;
  attribute C_OPTIMIZE_GOAL : integer;
  attribute C_OPTIMIZE_GOAL of \audioSys_0_mult_gen_v12_0__4\ : entity is 1;
  attribute C_OUT_HIGH : integer;
  attribute C_OUT_HIGH of \audioSys_0_mult_gen_v12_0__4\ : entity is 15;
  attribute C_OUT_LOW : integer;
  attribute C_OUT_LOW of \audioSys_0_mult_gen_v12_0__4\ : entity is 0;
  attribute C_ROUND_OUTPUT : integer;
  attribute C_ROUND_OUTPUT of \audioSys_0_mult_gen_v12_0__4\ : entity is 0;
  attribute C_ROUND_PT : integer;
  attribute C_ROUND_PT of \audioSys_0_mult_gen_v12_0__4\ : entity is 0;
  attribute C_VERBOSITY : integer;
  attribute C_VERBOSITY of \audioSys_0_mult_gen_v12_0__4\ : entity is 0;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of \audioSys_0_mult_gen_v12_0__4\ : entity is "zynq";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of \audioSys_0_mult_gen_v12_0__4\ : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \audioSys_0_mult_gen_v12_0__4\ : entity is "mult_gen_v12_0";
end \audioSys_0_mult_gen_v12_0__4\;

architecture STRUCTURE of \audioSys_0_mult_gen_v12_0__4\ is
  attribute C_A_TYPE of i_mult : label is 0;
  attribute C_A_WIDTH of i_mult : label is 16;
  attribute C_B_TYPE of i_mult : label is 1;
  attribute C_B_VALUE of i_mult : label is "10000001";
  attribute C_B_WIDTH of i_mult : label is 6;
  attribute C_CCM_IMP of i_mult : label is 0;
  attribute C_CE_OVERRIDES_SCLR of i_mult : label is 0;
  attribute C_HAS_CE of i_mult : label is 1;
  attribute C_HAS_SCLR of i_mult : label is 0;
  attribute C_HAS_ZERO_DETECT of i_mult : label is 0;
  attribute C_LATENCY of i_mult : label is 3;
  attribute C_MODEL_TYPE of i_mult : label is 0;
  attribute C_MULT_TYPE of i_mult : label is 1;
  attribute C_OPTIMIZE_GOAL of i_mult : label is 1;
  attribute C_OUT_HIGH of i_mult : label is 15;
  attribute C_OUT_LOW of i_mult : label is 0;
  attribute C_ROUND_OUTPUT of i_mult : label is 0;
  attribute C_ROUND_PT of i_mult : label is 0;
  attribute C_VERBOSITY of i_mult : label is 0;
  attribute C_XDEVICEFAMILY of i_mult : label is "zynq";
  attribute downgradeipidentifiedwarnings of i_mult : label is "yes";
begin
i_mult: entity work.\audioSys_0_mult_gen_v12_0_viv__4\
     port map (
      A(15 downto 0) => A(15 downto 0),
      B(5 downto 0) => B(5 downto 0),
      CE => CE,
      CLK => CLK,
      P(15 downto 0) => P(15 downto 0),
      PCASC(47 downto 0) => PCASC(47 downto 0),
      SCLR => SCLR,
      ZERO_DETECT(1 downto 0) => ZERO_DETECT(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_mult_gen_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 5 downto 0 );
    CE : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of audioSys_0_mult_gen_0 : entity is "mult_gen_0,mult_gen_v12_0,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of audioSys_0_mult_gen_0 : entity is "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of audioSys_0_mult_gen_0 : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_mult_gen_0 : entity is "mult_gen_0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of audioSys_0_mult_gen_0 : entity is "mult_gen_v12_0,Vivado 2015.2";
end audioSys_0_mult_gen_0;

architecture STRUCTURE of audioSys_0_mult_gen_0 is
  signal NLW_U0_PCASC_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_U0_ZERO_DETECT_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_A_TYPE : integer;
  attribute C_A_TYPE of U0 : label is 0;
  attribute C_A_WIDTH : integer;
  attribute C_A_WIDTH of U0 : label is 16;
  attribute C_B_TYPE : integer;
  attribute C_B_TYPE of U0 : label is 1;
  attribute C_B_VALUE : string;
  attribute C_B_VALUE of U0 : label is "10000001";
  attribute C_B_WIDTH : integer;
  attribute C_B_WIDTH of U0 : label is 6;
  attribute C_CCM_IMP : integer;
  attribute C_CCM_IMP of U0 : label is 0;
  attribute C_CE_OVERRIDES_SCLR : integer;
  attribute C_CE_OVERRIDES_SCLR of U0 : label is 0;
  attribute C_HAS_CE : integer;
  attribute C_HAS_CE of U0 : label is 1;
  attribute C_HAS_SCLR : integer;
  attribute C_HAS_SCLR of U0 : label is 0;
  attribute C_HAS_ZERO_DETECT : integer;
  attribute C_HAS_ZERO_DETECT of U0 : label is 0;
  attribute C_LATENCY : integer;
  attribute C_LATENCY of U0 : label is 3;
  attribute C_MODEL_TYPE : integer;
  attribute C_MODEL_TYPE of U0 : label is 0;
  attribute C_MULT_TYPE : integer;
  attribute C_MULT_TYPE of U0 : label is 1;
  attribute C_OPTIMIZE_GOAL : integer;
  attribute C_OPTIMIZE_GOAL of U0 : label is 1;
  attribute C_OUT_HIGH : integer;
  attribute C_OUT_HIGH of U0 : label is 15;
  attribute C_OUT_LOW : integer;
  attribute C_OUT_LOW of U0 : label is 0;
  attribute C_ROUND_OUTPUT : integer;
  attribute C_ROUND_OUTPUT of U0 : label is 0;
  attribute C_ROUND_PT : integer;
  attribute C_ROUND_PT of U0 : label is 0;
  attribute C_VERBOSITY : integer;
  attribute C_VERBOSITY of U0 : label is 0;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of U0 : label is "zynq";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of U0 : label is std.standard.true;
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
begin
U0: entity work.audioSys_0_mult_gen_v12_0
     port map (
      A(15 downto 0) => A(15 downto 0),
      B(5 downto 0) => B(5 downto 0),
      CE => CE,
      CLK => CLK,
      P(15 downto 0) => P(15 downto 0),
      PCASC(47 downto 0) => NLW_U0_PCASC_UNCONNECTED(47 downto 0),
      SCLR => '0',
      ZERO_DETECT(1 downto 0) => NLW_U0_ZERO_DETECT_UNCONNECTED(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \audioSys_0_mult_gen_0__3\ is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 5 downto 0 );
    CE : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of \audioSys_0_mult_gen_0__3\ : entity is "mult_gen_0,mult_gen_v12_0,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of \audioSys_0_mult_gen_0__3\ : entity is "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of \audioSys_0_mult_gen_0__3\ : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \audioSys_0_mult_gen_0__3\ : entity is "mult_gen_0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of \audioSys_0_mult_gen_0__3\ : entity is "mult_gen_v12_0,Vivado 2015.2";
end \audioSys_0_mult_gen_0__3\;

architecture STRUCTURE of \audioSys_0_mult_gen_0__3\ is
  signal NLW_U0_PCASC_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_U0_ZERO_DETECT_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_A_TYPE : integer;
  attribute C_A_TYPE of U0 : label is 0;
  attribute C_A_WIDTH : integer;
  attribute C_A_WIDTH of U0 : label is 16;
  attribute C_B_TYPE : integer;
  attribute C_B_TYPE of U0 : label is 1;
  attribute C_B_VALUE : string;
  attribute C_B_VALUE of U0 : label is "10000001";
  attribute C_B_WIDTH : integer;
  attribute C_B_WIDTH of U0 : label is 6;
  attribute C_CCM_IMP : integer;
  attribute C_CCM_IMP of U0 : label is 0;
  attribute C_CE_OVERRIDES_SCLR : integer;
  attribute C_CE_OVERRIDES_SCLR of U0 : label is 0;
  attribute C_HAS_CE : integer;
  attribute C_HAS_CE of U0 : label is 1;
  attribute C_HAS_SCLR : integer;
  attribute C_HAS_SCLR of U0 : label is 0;
  attribute C_HAS_ZERO_DETECT : integer;
  attribute C_HAS_ZERO_DETECT of U0 : label is 0;
  attribute C_LATENCY : integer;
  attribute C_LATENCY of U0 : label is 3;
  attribute C_MODEL_TYPE : integer;
  attribute C_MODEL_TYPE of U0 : label is 0;
  attribute C_MULT_TYPE : integer;
  attribute C_MULT_TYPE of U0 : label is 1;
  attribute C_OPTIMIZE_GOAL : integer;
  attribute C_OPTIMIZE_GOAL of U0 : label is 1;
  attribute C_OUT_HIGH : integer;
  attribute C_OUT_HIGH of U0 : label is 15;
  attribute C_OUT_LOW : integer;
  attribute C_OUT_LOW of U0 : label is 0;
  attribute C_ROUND_OUTPUT : integer;
  attribute C_ROUND_OUTPUT of U0 : label is 0;
  attribute C_ROUND_PT : integer;
  attribute C_ROUND_PT of U0 : label is 0;
  attribute C_VERBOSITY : integer;
  attribute C_VERBOSITY of U0 : label is 0;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of U0 : label is "zynq";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of U0 : label is std.standard.true;
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
begin
U0: entity work.\audioSys_0_mult_gen_v12_0__3\
     port map (
      A(15 downto 0) => A(15 downto 0),
      B(5 downto 0) => B(5 downto 0),
      CE => CE,
      CLK => CLK,
      P(15 downto 0) => P(15 downto 0),
      PCASC(47 downto 0) => NLW_U0_PCASC_UNCONNECTED(47 downto 0),
      SCLR => '0',
      ZERO_DETECT(1 downto 0) => NLW_U0_ZERO_DETECT_UNCONNECTED(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \audioSys_0_mult_gen_0__4\ is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 5 downto 0 );
    CE : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of \audioSys_0_mult_gen_0__4\ : entity is "mult_gen_0,mult_gen_v12_0,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of \audioSys_0_mult_gen_0__4\ : entity is "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of \audioSys_0_mult_gen_0__4\ : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \audioSys_0_mult_gen_0__4\ : entity is "mult_gen_0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of \audioSys_0_mult_gen_0__4\ : entity is "mult_gen_v12_0,Vivado 2015.2";
end \audioSys_0_mult_gen_0__4\;

architecture STRUCTURE of \audioSys_0_mult_gen_0__4\ is
  signal NLW_U0_PCASC_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_U0_ZERO_DETECT_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_A_TYPE : integer;
  attribute C_A_TYPE of U0 : label is 0;
  attribute C_A_WIDTH : integer;
  attribute C_A_WIDTH of U0 : label is 16;
  attribute C_B_TYPE : integer;
  attribute C_B_TYPE of U0 : label is 1;
  attribute C_B_VALUE : string;
  attribute C_B_VALUE of U0 : label is "10000001";
  attribute C_B_WIDTH : integer;
  attribute C_B_WIDTH of U0 : label is 6;
  attribute C_CCM_IMP : integer;
  attribute C_CCM_IMP of U0 : label is 0;
  attribute C_CE_OVERRIDES_SCLR : integer;
  attribute C_CE_OVERRIDES_SCLR of U0 : label is 0;
  attribute C_HAS_CE : integer;
  attribute C_HAS_CE of U0 : label is 1;
  attribute C_HAS_SCLR : integer;
  attribute C_HAS_SCLR of U0 : label is 0;
  attribute C_HAS_ZERO_DETECT : integer;
  attribute C_HAS_ZERO_DETECT of U0 : label is 0;
  attribute C_LATENCY : integer;
  attribute C_LATENCY of U0 : label is 3;
  attribute C_MODEL_TYPE : integer;
  attribute C_MODEL_TYPE of U0 : label is 0;
  attribute C_MULT_TYPE : integer;
  attribute C_MULT_TYPE of U0 : label is 1;
  attribute C_OPTIMIZE_GOAL : integer;
  attribute C_OPTIMIZE_GOAL of U0 : label is 1;
  attribute C_OUT_HIGH : integer;
  attribute C_OUT_HIGH of U0 : label is 15;
  attribute C_OUT_LOW : integer;
  attribute C_OUT_LOW of U0 : label is 0;
  attribute C_ROUND_OUTPUT : integer;
  attribute C_ROUND_OUTPUT of U0 : label is 0;
  attribute C_ROUND_PT : integer;
  attribute C_ROUND_PT of U0 : label is 0;
  attribute C_VERBOSITY : integer;
  attribute C_VERBOSITY of U0 : label is 0;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of U0 : label is "zynq";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of U0 : label is std.standard.true;
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
begin
U0: entity work.\audioSys_0_mult_gen_v12_0__4\
     port map (
      A(15 downto 0) => A(15 downto 0),
      B(5 downto 0) => B(5 downto 0),
      CE => CE,
      CLK => CLK,
      P(15 downto 0) => P(15 downto 0),
      PCASC(47 downto 0) => NLW_U0_PCASC_UNCONNECTED(47 downto 0),
      SCLR => '0',
      ZERO_DETECT(1 downto 0) => NLW_U0_ZERO_DETECT_UNCONNECTED(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_freqAttenuatorSingle is
  port (
    sent : out STD_LOGIC;
    atten_valid_freq_reg_0 : out STD_LOGIC;
    atten_valid_freq_reg_1 : out STD_LOGIC;
    atten_valid : out STD_LOGIC;
    atten_valid_freq_reg_2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \status_reg[0]\ : out STD_LOGIC;
    \waveform_atten_freq_reg[0]_0\ : out STD_LOGIC;
    step : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    atten_valid_freq : in STD_LOGIC_VECTOR ( 1 downto 0 );
    waveform : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \received_byte_reg[6]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    atten_mag : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_freqAttenuatorSingle : entity is "freqAttenuatorSingle";
end audioSys_0_freqAttenuatorSingle;

architecture STRUCTURE of audioSys_0_freqAttenuatorSingle is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal atten_valid_freq_i_1_n_0 : STD_LOGIC;
  signal \^atten_valid_freq_reg_2\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count[0]_i_1__5_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__3_n_0\ : STD_LOGIC;
  signal cs : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \cs[0]_i_1__3_n_0\ : STD_LOGIC;
  signal \cs[1]_i_1__1_n_0\ : STD_LOGIC;
  signal multVal : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal product : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^sent\ : STD_LOGIC;
  signal waveMult_i_7_n_0 : STD_LOGIC;
  signal waveformStorage_n_0 : STD_LOGIC;
  signal \^waveform_atten_freq_reg[0]_0\ : STD_LOGIC;
  signal waveform_base : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of atten_valid_freq_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \atten_valid_freq_i_1__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \atten_valid_freq_i_1__1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \bitCount[3]_i_4__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \count[0]_i_1__5\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[1]_i_1__3\ : label is "soft_lutpair2";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of waveMult : label is "mult_gen_0,mult_gen_v12_0,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of waveMult : label is "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of waveMult : label is "yes";
  attribute x_core_info : string;
  attribute x_core_info of waveMult : label is "mult_gen_v12_0,Vivado 2015.2";
begin
  E(0) <= \^e\(0);
  atten_valid_freq_reg_2(0) <= \^atten_valid_freq_reg_2\(0);
  sent <= \^sent\;
  \waveform_atten_freq_reg[0]_0\ <= \^waveform_atten_freq_reg[0]_0\;
atten_valid_freq_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \^sent\,
      I1 => step,
      I2 => \^atten_valid_freq_reg_2\(0),
      O => atten_valid_freq_i_1_n_0
    );
\atten_valid_freq_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \^sent\,
      I1 => step,
      I2 => atten_valid_freq(1),
      O => atten_valid_freq_reg_0
    );
\atten_valid_freq_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \^sent\,
      I1 => step,
      I2 => atten_valid_freq(0),
      O => atten_valid_freq_reg_1
    );
atten_valid_freq_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => atten_valid_freq_i_1_n_0,
      Q => \^atten_valid_freq_reg_2\(0)
    );
\bitCount[3]_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^atten_valid_freq_reg_2\(0),
      I1 => atten_valid_freq(0),
      I2 => atten_valid_freq(1),
      O => atten_valid
    );
\count[0]_i_1__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => cs(0),
      I1 => cs(1),
      I2 => count(0),
      O => \count[0]_i_1__5_n_0\
    );
\count[1]_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0220"
    )
        port map (
      I0 => cs(0),
      I1 => cs(1),
      I2 => count(1),
      I3 => count(0),
      O => \count[1]_i_1__3_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \count[0]_i_1__5_n_0\,
      Q => count(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \count[1]_i_1__3_n_0\,
      Q => count(1)
    );
\cs[0]_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F00007FFF7F7F"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      I2 => cs(0),
      I3 => \^sent\,
      I4 => step,
      I5 => cs(1),
      O => \cs[0]_i_1__3_n_0\
    );
\cs[1]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"51A200A200A200A2"
    )
        port map (
      I0 => cs(1),
      I1 => step,
      I2 => \^sent\,
      I3 => cs(0),
      I4 => count(1),
      I5 => count(0),
      O => \cs[1]_i_1__1_n_0\
    );
\cs_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \cs[0]_i_1__3_n_0\,
      Q => cs(0)
    );
\cs_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \cs[1]_i_1__1_n_0\,
      Q => cs(1)
    );
sent_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => step,
      Q => \^sent\
    );
\status[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFFA2A2A2A2"
    )
        port map (
      I0 => cs(1),
      I1 => step,
      I2 => \^sent\,
      I3 => count(0),
      I4 => count(1),
      I5 => cs(0),
      O => \status_reg[0]\
    );
waveMult: entity work.\audioSys_0_mult_gen_0__3\
     port map (
      A(15) => waveform_base(15),
      A(14) => waveform_base(15),
      A(13) => waveform_base(15),
      A(12) => waveform_base(15),
      A(11) => waveform_base(15),
      A(10) => waveform_base(15),
      A(9) => waveform_base(15),
      A(8) => waveform_base(15),
      A(7 downto 0) => waveform_base(7 downto 0),
      B(5 downto 0) => multVal(5 downto 0),
      CE => waveMult_i_7_n_0,
      CLK => clk,
      P(15 downto 0) => product(15 downto 0)
    );
waveMult_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0444"
    )
        port map (
      I0 => cs(1),
      I1 => cs(0),
      I2 => count(1),
      I3 => count(0),
      O => waveMult_i_7_n_0
    );
waveformStorage: entity work.audioSys_0_baseReg
     port map (
      E(0) => \^e\(0),
      P(2 downto 0) => product(2 downto 0),
      Q(8) => waveform_base(15),
      Q(7 downto 0) => waveform_base(7 downto 0),
      atten_mag(3 downto 0) => atten_mag(3 downto 0),
      clk => clk,
      multVal(5 downto 0) => multVal(5 downto 0),
      \received_byte_reg[6]\(0) => \received_byte_reg[6]\(0),
      reset => reset,
      sent_reg => \^sent\,
      step => step,
      waveform(8 downto 0) => waveform(8 downto 0),
      \waveform_atten_freq_reg[0]\ => waveformStorage_n_0,
      \waveform_atten_freq_reg[0]_0\ => \^waveform_atten_freq_reg[0]_0\
    );
\waveform[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0055000055D55555"
    )
        port map (
      I0 => cs(0),
      I1 => count(1),
      I2 => count(0),
      I3 => \^sent\,
      I4 => step,
      I5 => cs(1),
      O => \^e\(0)
    );
\waveform_atten_freq_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => waveformStorage_n_0,
      Q => \^waveform_atten_freq_reg[0]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \audioSys_0_freqAttenuatorSingle__xdcDup__1\ is
  port (
    \waveform_atten_freq_reg[0]_0\ : out STD_LOGIC;
    atten_valid_freq : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \status_reg[0]\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    sent_reg : in STD_LOGIC;
    sent : in STD_LOGIC;
    step : in STD_LOGIC;
    waveform : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \received_byte_reg[7]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    atten_mag : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \audioSys_0_freqAttenuatorSingle__xdcDup__1\ : entity is "freqAttenuatorSingle";
end \audioSys_0_freqAttenuatorSingle__xdcDup__1\;

architecture STRUCTURE of \audioSys_0_freqAttenuatorSingle__xdcDup__1\ is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count[0]_i_1__7_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__5_n_0\ : STD_LOGIC;
  signal cs : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \cs[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \cs[1]_i_1__3_n_0\ : STD_LOGIC;
  signal multVal : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal product : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \waveMult_i_7__1_n_0\ : STD_LOGIC;
  signal waveformStorage_n_0 : STD_LOGIC;
  signal \^waveform_atten_freq_reg[0]_0\ : STD_LOGIC;
  signal waveform_base : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__7\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[1]_i_1__5\ : label is "soft_lutpair0";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of waveMult : label is "mult_gen_0,mult_gen_v12_0,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of waveMult : label is "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of waveMult : label is "yes";
  attribute x_core_info : string;
  attribute x_core_info of waveMult : label is "mult_gen_v12_0,Vivado 2015.2";
begin
  E(0) <= \^e\(0);
  \waveform_atten_freq_reg[0]_0\ <= \^waveform_atten_freq_reg[0]_0\;
atten_valid_freq_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => sent_reg,
      Q => atten_valid_freq(0)
    );
\count[0]_i_1__7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => cs(0),
      I1 => cs(1),
      I2 => count(0),
      O => \count[0]_i_1__7_n_0\
    );
\count[1]_i_1__5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0220"
    )
        port map (
      I0 => cs(0),
      I1 => cs(1),
      I2 => count(1),
      I3 => count(0),
      O => \count[1]_i_1__5_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \count[0]_i_1__7_n_0\,
      Q => count(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \count[1]_i_1__5_n_0\,
      Q => count(1)
    );
\cs[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F00007FFF7F7F"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      I2 => cs(0),
      I3 => sent,
      I4 => step,
      I5 => cs(1),
      O => \cs[0]_i_1__1_n_0\
    );
\cs[1]_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"51A200A200A200A2"
    )
        port map (
      I0 => cs(1),
      I1 => step,
      I2 => sent,
      I3 => cs(0),
      I4 => count(1),
      I5 => count(0),
      O => \cs[1]_i_1__3_n_0\
    );
\cs_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \cs[0]_i_1__1_n_0\,
      Q => cs(0)
    );
\cs_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \cs[1]_i_1__3_n_0\,
      Q => cs(1)
    );
\status[0]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFFA2A2A2A2"
    )
        port map (
      I0 => cs(1),
      I1 => step,
      I2 => sent,
      I3 => count(0),
      I4 => count(1),
      I5 => cs(0),
      O => \status_reg[0]\
    );
waveMult: entity work.audioSys_0_mult_gen_0
     port map (
      A(15) => waveform_base(15),
      A(14) => waveform_base(15),
      A(13) => waveform_base(15),
      A(12) => waveform_base(15),
      A(11) => waveform_base(15),
      A(10) => waveform_base(15),
      A(9) => waveform_base(15),
      A(8) => waveform_base(15),
      A(7 downto 0) => waveform_base(7 downto 0),
      B(5 downto 0) => multVal(5 downto 0),
      CE => \waveMult_i_7__1_n_0\,
      CLK => clk,
      P(15 downto 0) => product(15 downto 0)
    );
\waveMult_i_7__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0444"
    )
        port map (
      I0 => cs(1),
      I1 => cs(0),
      I2 => count(1),
      I3 => count(0),
      O => \waveMult_i_7__1_n_0\
    );
waveformStorage: entity work.audioSys_0_baseReg_10
     port map (
      E(0) => \^e\(0),
      P(2 downto 0) => product(2 downto 0),
      Q(8) => waveform_base(15),
      Q(7 downto 0) => waveform_base(7 downto 0),
      atten_mag(3 downto 0) => atten_mag(3 downto 0),
      clk => clk,
      multVal(5 downto 0) => multVal(5 downto 0),
      \received_byte_reg[7]\(0) => \received_byte_reg[7]\(0),
      reset => reset,
      sent => sent,
      step => step,
      waveform(8 downto 0) => waveform(8 downto 0),
      \waveform_atten_freq_reg[0]\ => waveformStorage_n_0,
      \waveform_atten_freq_reg[0]_0\ => \^waveform_atten_freq_reg[0]_0\
    );
\waveform[15]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0055000055D55555"
    )
        port map (
      I0 => cs(0),
      I1 => count(1),
      I2 => count(0),
      I3 => sent,
      I4 => step,
      I5 => cs(1),
      O => \^e\(0)
    );
\waveform_atten_freq_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => waveformStorage_n_0,
      Q => \^waveform_atten_freq_reg[0]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \audioSys_0_freqAttenuatorSingle__xdcDup__2\ is
  port (
    \waveform_atten_freq_reg[0]_0\ : out STD_LOGIC;
    atten_valid_freq : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \status_reg[0]\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    sent_reg : in STD_LOGIC;
    sent : in STD_LOGIC;
    step : in STD_LOGIC;
    atten_valid_freq_reg_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    waveform : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \received_byte_reg[7]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    atten_mag : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \audioSys_0_freqAttenuatorSingle__xdcDup__2\ : entity is "freqAttenuatorSingle";
end \audioSys_0_freqAttenuatorSingle__xdcDup__2\;

architecture STRUCTURE of \audioSys_0_freqAttenuatorSingle__xdcDup__2\ is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^atten_valid_freq\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count[0]_i_1__6_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__4_n_0\ : STD_LOGIC;
  signal cs : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \cs[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \cs[1]_i_1__2_n_0\ : STD_LOGIC;
  signal multVal : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal product : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \waveMult_i_7__0_n_0\ : STD_LOGIC;
  signal waveformStorage_n_0 : STD_LOGIC;
  signal \^waveform_atten_freq_reg[0]_0\ : STD_LOGIC;
  signal waveform_base : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__6\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[1]_i_1__4\ : label is "soft_lutpair1";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of waveMult : label is "mult_gen_0,mult_gen_v12_0,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of waveMult : label is "mult_gen_0,mult_gen_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=0,C_B_WIDTH=6,C_B_TYPE=1,C_OUT_HIGH=15,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of waveMult : label is "yes";
  attribute x_core_info : string;
  attribute x_core_info of waveMult : label is "mult_gen_v12_0,Vivado 2015.2";
begin
  E(0) <= \^e\(0);
  atten_valid_freq(0) <= \^atten_valid_freq\(0);
  \waveform_atten_freq_reg[0]_0\ <= \^waveform_atten_freq_reg[0]_0\;
atten_valid_freq_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => sent_reg,
      Q => \^atten_valid_freq\(0)
    );
\count[0]_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01FF"
    )
        port map (
      I0 => \^atten_valid_freq\(0),
      I1 => atten_valid_freq_reg_0(0),
      I2 => atten_valid_freq_reg_0(1),
      I3 => Q(0),
      O => D(0)
    );
\count[0]_i_1__6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => cs(0),
      I1 => cs(1),
      I2 => count(0),
      O => \count[0]_i_1__6_n_0\
    );
\count[1]_i_1__4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0220"
    )
        port map (
      I0 => cs(0),
      I1 => cs(1),
      I2 => count(1),
      I3 => count(0),
      O => \count[1]_i_1__4_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \count[0]_i_1__6_n_0\,
      Q => count(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \count[1]_i_1__4_n_0\,
      Q => count(1)
    );
\cs[0]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F00007FFF7F7F"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      I2 => cs(0),
      I3 => sent,
      I4 => step,
      I5 => cs(1),
      O => \cs[0]_i_1__2_n_0\
    );
\cs[1]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"51A200A200A200A2"
    )
        port map (
      I0 => cs(1),
      I1 => step,
      I2 => sent,
      I3 => cs(0),
      I4 => count(1),
      I5 => count(0),
      O => \cs[1]_i_1__2_n_0\
    );
\cs_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \cs[0]_i_1__2_n_0\,
      Q => cs(0)
    );
\cs_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \cs[1]_i_1__2_n_0\,
      Q => cs(1)
    );
\status[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFFA2A2A2A2"
    )
        port map (
      I0 => cs(1),
      I1 => step,
      I2 => sent,
      I3 => count(0),
      I4 => count(1),
      I5 => cs(0),
      O => \status_reg[0]\
    );
waveMult: entity work.\audioSys_0_mult_gen_0__4\
     port map (
      A(15) => waveform_base(15),
      A(14) => waveform_base(15),
      A(13) => waveform_base(15),
      A(12) => waveform_base(15),
      A(11) => waveform_base(15),
      A(10) => waveform_base(15),
      A(9) => waveform_base(15),
      A(8) => waveform_base(15),
      A(7 downto 0) => waveform_base(7 downto 0),
      B(5 downto 0) => multVal(5 downto 0),
      CE => \waveMult_i_7__0_n_0\,
      CLK => clk,
      P(15 downto 0) => product(15 downto 0)
    );
\waveMult_i_7__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0444"
    )
        port map (
      I0 => cs(1),
      I1 => cs(0),
      I2 => count(1),
      I3 => count(0),
      O => \waveMult_i_7__0_n_0\
    );
waveformStorage: entity work.audioSys_0_baseReg_8
     port map (
      E(0) => \^e\(0),
      P(2 downto 0) => product(2 downto 0),
      Q(8) => waveform_base(15),
      Q(7 downto 0) => waveform_base(7 downto 0),
      atten_mag(3 downto 0) => atten_mag(3 downto 0),
      clk => clk,
      multVal(5 downto 0) => multVal(5 downto 0),
      \received_byte_reg[7]\(0) => \received_byte_reg[7]\(0),
      reset => reset,
      sent => sent,
      step => step,
      waveform(8 downto 0) => waveform(8 downto 0),
      \waveform_atten_freq_reg[0]\ => waveformStorage_n_0,
      \waveform_atten_freq_reg[0]_0\ => \^waveform_atten_freq_reg[0]_0\
    );
\waveform[15]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0055000055D55555"
    )
        port map (
      I0 => cs(0),
      I1 => count(1),
      I2 => count(0),
      I3 => sent,
      I4 => step,
      I5 => cs(1),
      O => \^e\(0)
    );
\waveform_atten_freq_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => waveformStorage_n_0,
      Q => \^waveform_atten_freq_reg[0]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0_audioSys is
  port (
    SDATA : out STD_LOGIC;
    CLK : out STD_LOGIC;
    MCLK : out STD_LOGIC;
    SCL : out STD_LOGIC;
    LRCLK : out STD_LOGIC;
    SDA : inout STD_LOGIC;
    reset : in STD_LOGIC;
    MREQ_N : in STD_LOGIC;
    WR_N : in STD_LOGIC;
    addr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \^clk\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of audioSys_0_audioSys : entity is "audioSys";
end audioSys_0_audioSys;

architecture STRUCTURE of audioSys_0_audioSys is
  signal acquire : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal atten_enable : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal atten_mag : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \atten_n_0_[0]\ : STD_LOGIC;
  signal \atten_n_0_[1]\ : STD_LOGIC;
  signal \atten_n_1_[2]\ : STD_LOGIC;
  signal \atten_n_2_[1]\ : STD_LOGIC;
  signal \atten_n_2_[2]\ : STD_LOGIC;
  signal \atten_n_3_[0]\ : STD_LOGIC;
  signal \atten_n_4_[1]\ : STD_LOGIC;
  signal \atten_n_6_[2]\ : STD_LOGIC;
  signal \atten_n_7_[2]\ : STD_LOGIC;
  signal atten_valid : STD_LOGIC;
  signal atten_valid_freq : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal cpuInterface_n_0 : STD_LOGIC;
  signal cpuInterface_n_1 : STD_LOGIC;
  signal cpuInterface_n_2 : STD_LOGIC;
  signal \dacVal/count_reg\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal div_done : STD_LOGIC;
  signal div_done_2 : STD_LOGIC;
  signal div_done_3 : STD_LOGIC;
  signal div_en0 : STD_LOGIC;
  signal div_en0_0 : STD_LOGIC;
  signal div_en0_1 : STD_LOGIC;
  signal freq : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal sent : STD_LOGIC;
  signal step : STD_LOGIC;
  signal \tone_n_0_[0]\ : STD_LOGIC;
  signal \tone_n_0_[1]\ : STD_LOGIC;
  signal \tone_n_0_[2]\ : STD_LOGIC;
  signal \tone_n_1_[0]\ : STD_LOGIC;
  signal \tone_n_2_[0]\ : STD_LOGIC;
  signal \tone_n_3_[0]\ : STD_LOGIC;
  signal \tone_n_4_[0]\ : STD_LOGIC;
  signal \tone_n_5_[0]\ : STD_LOGIC;
  signal \tone_n_6_[0]\ : STD_LOGIC;
  signal \tone_n_7_[0]\ : STD_LOGIC;
  signal \tone_n_8_[0]\ : STD_LOGIC;
  signal \tone_n_9_[0]\ : STD_LOGIC;
  signal \waveform[1]_1\ : STD_LOGIC_VECTOR ( 15 downto 7 );
  signal \waveform[2]_0\ : STD_LOGIC_VECTOR ( 15 downto 7 );
begin
\atten[0]\: entity work.\audioSys_0_freqAttenuatorSingle__xdcDup__1\
     port map (
      E(0) => acquire(0),
      atten_mag(3 downto 0) => atten_mag(3 downto 0),
      atten_valid_freq(0) => atten_valid_freq(0),
      clk => \^clk\,
      \received_byte_reg[7]\(0) => atten_enable(0),
      reset => reset,
      sent => sent,
      sent_reg => \atten_n_2_[2]\,
      \status_reg[0]\ => \atten_n_3_[0]\,
      step => step,
      waveform(8) => \tone_n_1_[0]\,
      waveform(7) => \tone_n_2_[0]\,
      waveform(6) => \tone_n_3_[0]\,
      waveform(5) => \tone_n_4_[0]\,
      waveform(4) => \tone_n_5_[0]\,
      waveform(3) => \tone_n_6_[0]\,
      waveform(2) => \tone_n_7_[0]\,
      waveform(1) => \tone_n_8_[0]\,
      waveform(0) => \tone_n_9_[0]\,
      \waveform_atten_freq_reg[0]_0\ => \atten_n_0_[0]\
    );
\atten[1]\: entity work.\audioSys_0_freqAttenuatorSingle__xdcDup__2\
     port map (
      D(0) => \atten_n_2_[1]\,
      E(0) => acquire(1),
      Q(0) => \dacVal/count_reg\(0),
      atten_mag(3 downto 0) => atten_mag(3 downto 0),
      atten_valid_freq(0) => atten_valid_freq(1),
      atten_valid_freq_reg_0(1) => atten_valid_freq(2),
      atten_valid_freq_reg_0(0) => atten_valid_freq(0),
      clk => \^clk\,
      \received_byte_reg[7]\(0) => atten_enable(1),
      reset => reset,
      sent => sent,
      sent_reg => \atten_n_1_[2]\,
      \status_reg[0]\ => \atten_n_4_[1]\,
      step => step,
      waveform(8 downto 0) => \waveform[1]_1\(15 downto 7),
      \waveform_atten_freq_reg[0]_0\ => \atten_n_0_[1]\
    );
\atten[2]\: entity work.audioSys_0_freqAttenuatorSingle
     port map (
      E(0) => acquire(2),
      atten_mag(3 downto 0) => atten_mag(3 downto 0),
      atten_valid => atten_valid,
      atten_valid_freq(1 downto 0) => atten_valid_freq(1 downto 0),
      atten_valid_freq_reg_0 => \atten_n_1_[2]\,
      atten_valid_freq_reg_1 => \atten_n_2_[2]\,
      atten_valid_freq_reg_2(0) => atten_valid_freq(2),
      clk => \^clk\,
      \received_byte_reg[6]\(0) => atten_enable(2),
      reset => reset,
      sent => sent,
      \status_reg[0]\ => \atten_n_6_[2]\,
      step => step,
      waveform(8 downto 0) => \waveform[2]_0\(15 downto 7),
      \waveform_atten_freq_reg[0]_0\ => \atten_n_7_[2]\
    );
cpuInterface: entity work.audioSys_0_comInterface
     port map (
      E(0) => div_done_3,
      MREQ_N => MREQ_N,
      Q(5 downto 4) => freq(9 downto 8),
      Q(3 downto 0) => atten_mag(3 downto 0),
      WR_N => WR_N,
      addr(9 downto 0) => addr(9 downto 0),
      atten_enable(2 downto 0) => atten_enable(2 downto 0),
      clk => \^clk\,
      \count_reg[4]\(0) => div_done_2,
      \count_reg[4]_0\(0) => div_done,
      data(7 downto 0) => data(7 downto 0),
      \data_reg[3]\(3 downto 0) => freq(3 downto 0),
      \data_reg[9]\(0) => div_en0_1,
      \data_reg[9]_0\(0) => div_en0_0,
      \data_reg[9]_1\(0) => div_en0,
      div_en_reg => cpuInterface_n_0,
      div_en_reg_0 => cpuInterface_n_1,
      div_en_reg_1 => cpuInterface_n_2,
      div_en_reg_2 => \tone_n_0_[2]\,
      div_en_reg_3 => \tone_n_0_[1]\,
      div_en_reg_4 => \tone_n_0_[0]\,
      reset => reset
    );
interfaceTest: entity work.audioSys_0_dacInterface
     port map (
      BCLK => CLK,
      D(0) => \atten_n_2_[1]\,
      LRCLK => LRCLK,
      MCLK => MCLK,
      Q(0) => \dacVal/count_reg\(0),
      SCL => SCL,
      SDA => SDA,
      SDATA => SDATA,
      atten_valid => atten_valid,
      atten_valid_freq(2 downto 0) => atten_valid_freq(2 downto 0),
      clk => \^clk\,
      reset => reset,
      step => step,
      \waveform_atten_freq_reg[0]\ => \atten_n_7_[2]\,
      \waveform_atten_freq_reg[0]_0\ => \atten_n_0_[1]\,
      \waveform_atten_freq_reg[0]_1\ => \atten_n_0_[0]\
    );
\tone[0]\: entity work.audioSys_0_freqSynth
     port map (
      D(9 downto 8) => freq(9 downto 8),
      D(7 downto 4) => atten_mag(3 downto 0),
      D(3 downto 0) => freq(3 downto 0),
      E(0) => div_done,
      Q(8) => \tone_n_1_[0]\,
      Q(7) => \tone_n_2_[0]\,
      Q(6) => \tone_n_3_[0]\,
      Q(5) => \tone_n_4_[0]\,
      Q(4) => \tone_n_5_[0]\,
      Q(3) => \tone_n_6_[0]\,
      Q(2) => \tone_n_7_[0]\,
      Q(1) => \tone_n_8_[0]\,
      Q(0) => \tone_n_9_[0]\,
      clk => \^clk\,
      \cs_reg[0]\(0) => acquire(0),
      \cs_reg[1]\ => \atten_n_3_[0]\,
      \first_byte_reg[6]\ => cpuInterface_n_2,
      \first_byte_reg[6]_0\(0) => div_en0,
      \remainder_reg[0]\ => \tone_n_0_[0]\,
      reset => reset
    );
\tone[1]\: entity work.audioSys_0_freqSynth_0
     port map (
      D(9 downto 8) => freq(9 downto 8),
      D(7 downto 4) => atten_mag(3 downto 0),
      D(3 downto 0) => freq(3 downto 0),
      E(0) => div_done_2,
      Q(8 downto 0) => \waveform[1]_1\(15 downto 7),
      clk => \^clk\,
      \cs_reg[0]\(0) => acquire(1),
      \cs_reg[1]\ => \atten_n_4_[1]\,
      \first_byte_reg[6]\ => cpuInterface_n_1,
      \first_byte_reg[6]_0\(0) => div_en0_0,
      \remainder_reg[0]\ => \tone_n_0_[1]\,
      reset => reset
    );
\tone[2]\: entity work.audioSys_0_freqSynth_1
     port map (
      D(9 downto 8) => freq(9 downto 8),
      D(7 downto 4) => atten_mag(3 downto 0),
      D(3 downto 0) => freq(3 downto 0),
      E(0) => div_done_3,
      Q(8 downto 0) => \waveform[2]_0\(15 downto 7),
      clk => \^clk\,
      \cs_reg[0]\(0) => acquire(2),
      \cs_reg[1]\ => \atten_n_6_[2]\,
      \first_byte_reg[7]\ => cpuInterface_n_0,
      \first_byte_reg[7]_0\(0) => div_en0_1,
      \remainder_reg[0]\ => \tone_n_0_[2]\,
      reset => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity audioSys_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of audioSys_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of audioSys_0 : entity is "audioSys_0,audioSys,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of audioSys_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of audioSys_0 : entity is "audioSys,Vivado 2015.2";
end audioSys_0;

architecture STRUCTURE of audioSys_0 is
begin
inst: entity work.audioSys_0_audioSys
     port map (
      CLK => BCLK,
      LRCLK => LRCLK,
      MCLK => MCLK,
      MREQ_N => MREQ_N,
      SCL => SCL,
      SDA => SDA,
      SDATA => SDATA,
      WR_N => WR_N,
      addr(9 downto 0) => addr(15 downto 6),
      \^clk\ => clk,
      data(7 downto 0) => data(7 downto 0),
      reset => reset
    );
end STRUCTURE;
