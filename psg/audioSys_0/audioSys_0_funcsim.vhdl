-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Mon Oct 31 16:30:59 2016
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
TPgf+Ic7RyPhASJabdHFTAo8YKD4hXfGzt5qVtc+7TJ8OilZV2fZiIADHby8pu6NiGVaKvewk6j5
9J5KHB8FNvVt7Jxs+s55BN5u3tTamGRmhh4L3v8aLtSrImpwEB6oTv4jnMAkSGcjeDW21xIUf3Di
oN+Poucwoio/lXl0qop4/g389/aV/TTSaWaS0y8Z7uwurjBtXz0kDTAc3m3TStyVOD+xFd9Z3dDJ
8nQdaVqL3G8GpU0i5EUFrW9GzgVLeheSi8Q+GImJIu8LFzCOg/EZZ+zw4US6Zk6Qz74q78aZCAXH
NamtnBG4uNdC7O9fLWugzX4LsJtsMl2bH4XeoA==


`protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`protect key_block
gyhkrqcgFVwkc4zWVM3qM/2t9XsJqANMdUVsJCLAmlSwyQZor8yMFqxDIsls9Y0vvv12/csZxp7+
u1VG8llDgsutKighfnoNvf0D+DhNK6+uGBgPpWW34De3hwvyz2UyquAVsVLlij77ffA1YKUEgYYX
0oYOvsov9824BjkE979vf4sZWKKbXgPhr0Y+DSRMtGOBYL/ZLt6QOP41MjuLhw0z9z62j2FQ40Ev
a3O6U1UsmACyXbTEwVs1+bDBcHSRafNM3nKVimBHzzWnS6jgfDgaAws//d87T0/4EFEqXCqmJ9oC
jrEyJw/PJYRpWRdvMyrC7Prz1n0lnafy3sECqA==


`protect data_method = "AES128-CBC"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 25712)
`protect data_block
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
t6dpq/0=
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
TPgf+Ic7RyPhASJabdHFTAo8YKD4hXfGzt5qVtc+7TJ8OilZV2fZiIADHby8pu6NiGVaKvewk6j5
9J5KHB8FNvVt7Jxs+s55BN5u3tTamGRmhh4L3v8aLtSrImpwEB6oTv4jnMAkSGcjeDW21xIUf3Di
oN+Poucwoio/lXl0qop4/g389/aV/TTSaWaS0y8Z7uwurjBtXz0kDTAc3m3TStyVOD+xFd9Z3dDJ
8nQdaVqL3G8GpU0i5EUFrW9GzgVLeheSi8Q+GImJIu8LFzCOg/EZZ+zw4US6Zk6Qz74q78aZCAXH
NamtnBG4uNdC7O9fLWugzX4LsJtsMl2bH4XeoA==


`protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`protect key_block
gyhkrqcgFVwkc4zWVM3qM/2t9XsJqANMdUVsJCLAmlSwyQZor8yMFqxDIsls9Y0vvv12/csZxp7+
u1VG8llDgsutKighfnoNvf0D+DhNK6+uGBgPpWW34De3hwvyz2UyquAVsVLlij77ffA1YKUEgYYX
0oYOvsov9824BjkE979vf4sZWKKbXgPhr0Y+DSRMtGOBYL/ZLt6QOP41MjuLhw0z9z62j2FQ40Ev
a3O6U1UsmACyXbTEwVs1+bDBcHSRafNM3nKVimBHzzWnS6jgfDgaAws//d87T0/4EFEqXCqmJ9oC
jrEyJw/PJYRpWRdvMyrC7Prz1n0lnafy3sECqA==


`protect data_method = "AES128-CBC"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 15056)
`protect data_block
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
pFRt9IZjUrE=
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
