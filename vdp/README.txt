Written by: Christopher Chao 

This document aims to help users understand how the Sega Master System 
VDP operates; it is unfortunate that so many different documents exist 
online, yet none of them truly aggregate all of the information in full, 
making it difficult to get full functionality from a single one. 
As such, I've tried to do so here. 

Before we start, below is a list of documents that I pulled from the 
internet to aggregate said information:
 
 1. Charles MacDonald's VDP Documentation, found on SMSPower.org, at:
    www.smspower.org/uploads/Development/msvdp-20021112.txt
 
 2. The Sega Mk3 manual, containing the official Sega documentation 
    of the console, found at:
    http://www.smspower.org/Development/OfficialDocumentation
 
 3. The TMS9918 documentation, containing information on the TI chip 
    that the VDP is built upon, found at:
    http://www.cs.columbia.edu/~sedwards/papers/TMS9918.pdf

-------------------------------------------------------------------------------
Overview:
-------------------------------------------------------------------------------

The Video Display Processor, or VDP, handles two main processes: 
  - Reading/Writing data requested/given by the z80 into Video RAM, or VRAM
  - Translating VRAM contents into a frame to be displayed by a VGA monitor
  
The VDP contains two different memories, video RAM, or VRAM, and color RAM,
or CRAM. Both of these memories act as the boundary between the two processes
decribed above, each of which has its own architecture and is clocked 
independently of each other. VRAM contains 2^14 = 16,384 entries of 8 bits 
each, while CRAM contains 2^5 = 32 entries of 8 bits each (though only the
lower 6 bits are ever used).

The VDP also contains 11 write-only 8-bit registers that control different 
aspects of the VGA interface. The details of each will be referenced 
throughout this document and summarized at the end.

-------------------------------------------------------------------------------
I/O Inteface:
-------------------------------------------------------------------------------

The z80 can interact with the VDP by issuing either an IN (i.e. read) or an 
OUT (i.e. write) command to address $XXBE or $XXBF. Writes to $BF go to the 
command port, which is responsible for aggregating the 14-bit address when 
writing/reading to VRAM or CRAM and selecting and aggregating the data when 
writing to a VDP register (of which there are 11). Writes/reads to $BE go to 
the data port, where data then shows up or gets written into VRAM or CRAM 
after setting the address register through the command port. 

In order to write to the address register, the z80 needs to issue two 
sequential OUT commands to the command port, each writing a single byte. 
These two bytes can be interpreted by looking at the most-significant 2 bits,
detailed below: 

00: VRAM Read - Write the 14 remaining bits to the address register and expect 
    a read from the data port, put the data at that address into the data port.
01: VRAM Write - Write the 14 remaining bits to the address register and expect 
    a write to the data port, put that data into memory at that address.
10: VDP Register Write - Write the 2nd byte into the register indicated by the 
    4 LSB’s of the 1st byte.
11: CRAM Write - Same as VRAM write, but CRAM. Since addresses are only 5 bits,
    only use the lowest 5 bits of the address from the address register.

Since the entire expression requires two bytes, this necessitates two 8-bit 
registers that both latch the data bus; since each OUT command takes multiple 
clock cycles, an FSM is in place to enable the appropriate register and wait 
for the second byte to come through, which can take several clock cycles. 

The address register also features an autoincrementing mode, which occurs after
any subsequent read or write. This allows the z80 to simply configure the 
address register once with two OUT commands to $BF, then any number of OUT 
commands to $BE containing the data to be written or IN commands to $BE to 
read subsequent bytes. 

Finally, reads from $BF actually return the data from the status register, a 
register that holds information about interrupts that have been triggered since
the last read of $BF. Any read from here should acknowledge the interrupt 
regardless of what triggered it. (A note here, this functionality doesn't 
actually involve the interface we described above at all, so make sure it isn't
listening for this command! Source: Had a bug here, was hard to find)

-------------------------------------------------------------------------------
VGA Interface:
-------------------------------------------------------------------------------

The data that the z80 writes into VRAM is unfortunately not exactly a copy of 
the frame that ultimately gets displayed. Especially given the technological 
limitations of a processor built in the ‘80s, the amount of work needed to 
update every position in the screen through IN and OUT commands would be 
enormous and take far too much time. In order to combat this, VRAM is split up 
into a series of tables that dictate several aspects of the screen at once. 
The details can be found below:

Sprite Attribute Table (256B) - {R5[6:1], 8'bXXXX_XXXX}
Screen Map (1,792B) - {R2[3:1], 11'bXXX_XXXX_XXXX}
Character Patterns (14,336B) - $0000-$3800

** Values from the VDP registers above are indicated with Rx, where x is 0-10.

The original SMS had a screen with size 256x192. We planned on using a 640x480 
VGA monitor, and while the aspect ratio is the same the scaling factor is not 
an integer, so we decided to scale the screen up by a factor of 2 and simply 
blanked the remaining space. This results in a black border around the screen 
of width 64 pixels on the sides and 48 pixels on the top and bottom. The VGA 
controller, which directly generates VSYNC, HSYNC, and RGB components, also 
keeps track of the current pixel being displayed with the current row and 
column. 

Additionally, VGA monitors need to be driven at a clock speed minimum of 
25 MHz. The SMS was originally clocked at 4 MHz, so the design has been 
subsequently partitioned into the VGA interface, operating at 25 MHz, and 
the z80 interface, operating at 4 MHz.

The VGA interface can be further partitioned into two parts, the background 
logic and the sprite logic. Background logic is responsible for pulling 
background patterns out of VRAM in time to be displayed on the monitor, while 
sprite logic is responsible for preloading and displaying sprites when needed.
Below you will find descriptions of the two:

Background Logic:

Based on this information, the VDP can look to the Screen Map, which 
has a pair of bytes for every 8x8 pixel location on the screen, of which there 
are 32x24 = 768. The lowest 9 bits of the 2B select one of the 512 character 
patterns to be displayed, while the other 7 bits contain information on how 
to interpret the pattern. That information is reiterated below:

Screen Map Entry: {3'bXXX, b, p, v, h, PatternAddress[8:0]}
b: Background Obscurity Flag - 1=Background in front of sprites, 0=Vice Versa
p: Palette Select - Acts as a 5th bit to the CRAM address indicated by 
   pixel data.
v: Vertical Flip - Vertically flips the 8x8 character pattern on a 1.
h: Horizontal Flip - Horizontally flips the 8x8 character pattern on a 1.

The Character Patterns portion contains up to 512 8x8 character patterns, each 
of which take up 32B. In order to retrieve the actual pixel data from the 32B, 
hardware has been implemented to read out 4 bytes at a time from the pattern. 
By reading the i’th bit of each of the 4 bytes and concatenating them together 
with the Palette Select bit from the screen map flags, the resulting 5-bit 
expression can be used to index into CRAM, which contains 32 8-bit color 
expressions, to get the corresponding color at that pixel. Since the VGA on the
ZedBoard features 4-bit color but the SMS only supports 2-bit color, scaling 
happened. Below you can find a visual description of the bitslicing phenomenon
described above:

Suppose we were looking at the pattern beginning at address $0000, which held
the following information:

Character Pattern Entry at $0000, Row 0:
$0000: 11011100
$0001: 00001000
$0002: 11000011
$0003: 01110010

This set of 4 bytes makes up the first row of pixels in the character pattern 
located at address $0000. To find the color of the first pixel in the first row,
take the most significant bit of each of the bytes in memory and concatenate
them together. With the example above, the first pixel would be color 0101, or
color 5, the second would be 1101, or D, the third would be 8, etc. These 4-bit
expressions are then concatenated further with the palette select bit from the 
screen map entry as the MSB, and that entire 5-bit expression is used to index
into CRAM to find the corresponding color for to display for that pixel. 

Scrolling always constitutes moving the background in some manner, either
vertically or horizontally, while the sprites stay still. These scroll values
are indicated by the values in R8 and R9. R8 holds the horizontal scroll value,
which is just a value between 0 and 255. This value indicates how many pixels
to shift the display by, with the overflowing pixels wrapping around to the 
other side. R9 operates in a very similar manner, just shifting the pixels up
by some value between 0 and 191. One thing to note is that the screen map 
actually contains enough memory for 32x32 patterns instead of just the 32x24 
locations that are actively on the display. This extra space is for smoothly
scrolling in some extra patterns that transition well between the top and the
bottom patterns on the screen. If bit 6 or 7 of R0 is set, it prevents the
rightmost 8 character pattern columns or the topmost 2 character pattern rows
to not scroll. These non-scrolling patterns are used for status bars and other
game-specific features.

Sprite Logic:

In order for interesting things to happen on the screen, sprites are needed. 
Sprites are easily moveable objects across the screen, and their details are 
kept in the Sprite Attribute Table. A sprite is held in memory as a vertical 
position, tracked by the top row of the 8x8 pattern, a horizontal position, 
tracked by the far left column of the 8x8 pattern, and a corresponding 8x8 
pattern in the Character Patterns. Below you can find a visual representation
of the SAT:

Suppose the SAT occupied the most-significant 256B of VRAM (as it often does):

(Beginning of the SAT)

64B of VerticalPosition
64B of Unused Space
64 entries of 2B in the following format:
  - 1B of HorizontalPosition
  - 1B of CharacterPatternAddress

(End of the SAT)

On each scanline, the hardware should iterate through the vertical positions, 
checking if any of them fall between the current row or 8 before it (16 if you
consider the fact that our screen is stretched 2x in each direction). If not,
this sprite is not being displayed on this scanline and can be safely ignored
until the next scanline. If it does fall in that range, that means the current
sprite covers some part of this scanline and needs to be prefetched. In order
to do this, we can look at the current address plus $80 to find the
corresponding horizontal position and character pattern address for this sprite.
The hardware should latch each of these values, namely the VPOS, HPOS, and 
character pattern address, then load the corresponding character pattern at that
address into an 8-entry sprite buffer. During the scanline, if the latched HPOS
falls between the current column and 8 before it (again, 16 in our architecture)
then it's time to display that sprite. It is important to note that the order
that the sprites are read out of the SAT does not have any bearing on the order
that they are processed on the scanline.

It should be noted that the 8-entry sprite buffer implies a hard limit of 8
sprites per scanline. If more than 8 sprites register their VPOS for this 
scanline, then the hardware should stop parsing the SAT and raise a Sprite 
Overflow Flag, which constitutes an interrupt to the z80.

Since the process for looking up the sprite pattern is more or less the same 
as looking it up for backgrounds, and since we are prefetching these sprite 
patterns before the scanline even begins, we can reuse the logic from the 
backgrounds by having the sprite logic hijack it when necessary.

Sprites consist of 8x8 character patterns by default, just like backgrounds.
One of the main differences is that any pixel color of 5'd0 translates not to 
the 0th color entry in CRAM, but instead to a transparent pixel. Since a
background pattern should be present at every position on the screen, a 
transparent pixel translates to displaying the pixels of the underlying layers.
Similarly, non-0 pixels in sprites, called opaque pixels, are shown over the 
background and over any opaque pixels of sprites later in the SAT. If any 
opaque pixels are obscuring opaque pixels from another sprite, the Sprite 
Collision Flag is set, and a subsequent interrupt generated.

If bit 1 of R1 is set, all sprites are 8x16 instead of 8x8, in which any given
sprite is characterized by the character pattern given with the sprite for the 
top half and the character pattern directly below that one in VRAM for the
bottom half. 

-------------------------------------------------------------------------------
Interrupts
-------------------------------------------------------------------------------

The VDP has a single interrupt line back to the z80 which is directly
controlled by the status register. The status register is structured in the 
following way:

Status Register: {FINT, SOVFW, SCOLL, 5'bX_XXXX}

FINT:  Frame Interrupt - This flag is set on two different conditions, either
       that the VDP has reached the end of the screen map or that the scanline
       indicated by R10, the Raster Line, has been reached. The first is only
       triggered when bit 5 of R1 is set, and the second only triggers when 
       bit 4 of R0 is set. 
SOVFW: Sprite Overflow - As described in the Sprites section, this flag is set
       when the number of sprites on any scanline exceeds 8. 
SCOLL: Sprite Collision - As described in the Sprites section, this flag is set
       when opaque pixels of two different sprites are obscuring one another.

The interrupt line is directly controlled by the logical OR of all of the flags
in the status register. Upon receiving the interrupt, the z80 should read the 
status register by performing an IN command to $BF, at which time the VDP
should subsequently clear the status register.

-------------------------------------------------------------------------------
VDP Registers
-------------------------------------------------------------------------------

Below you will find an appendix of sorts with an exhaustive description of each
of the 11 VDP write-only registers:

Register 0:

Register 1:

Register 2:

Register 3:

Register 4:

Register 5:

Register 6:

Register 7:

Register 8:

Register 9:

Register 10: 

-------------------------------------------------------------------------------
Miscellaneous Stuff:
-------------------------------------------------------------------------------

Sega products often feature reverse compatibility, and the Master System is no
different. The VDP has 4 different modes that build upon the 3 display modes
featured in the original TMS9918. These modes require different architectures 
to read out and interpret the data located in VRAM, of which only Mode 4 was 
documented here. Modes 1-3 are well-documented by the TMS9918 document, and 
since I didn't even get a chance to implement those they will not be found
here.

An issue we encountered during synthesis on the board is that the Zedboard only
allows for BRAMs with at most 2 ports, where the SMS called for a VRAM with at 
least 8. To mimic a VRAM with 8 ports, I’ve overclocked a traditional BRAM at 
100 MHz and written a VRAM controller to functionally read out 8 bytes over 
1 clock cycle @ 25 MHz.
