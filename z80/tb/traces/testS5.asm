range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld sp,$5b
  ld bc,$cafe
  ld st,$f00d
  ld uv,$1eaf

  push bc
  push st
  push uv

  ld de,[$55]
  ld bc,[$57]
  ld hl,[$59]

section data
  addr0: data !DEAD !BEEF

output testS5.rom $0000 $0100
