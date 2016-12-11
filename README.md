#Sega Master System Emulator

#Authors:
    Justin Forman (justin.daniel.forman@gmail.com)
    Chris Chao    (ghastall@gmail.com)
    Suyash Bhatt  (suyashb@andrew.cmu.edu)

#Overview:
  This project is an FPGA emulator of a 1986 Sega Master System for a
  Xilinx Zedboard.

#Current Status
  The project is mostly complete. As of now, the 1986 BIOS run on the
  system, including the built-in snail maze game with minimal errors.
  There are a few minor glitches and sprite rendering problems, which
  are attributed to small VDP bugs. There are also a few known processor
  bugs that are documented in the processor readme file.

#System Components
  1) Zilog Z80 Processor (z80)
  2) Video Display Processor (VDP)
  3) Programmable Sound Generator (PSG)

See individual README's for additional information.
