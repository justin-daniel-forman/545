range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  jr $05
  ld hl,$cafe
  ld bc,$f00d

section data
  addr0: data !DEAD !BEEF

output testS7.rom $0000 $0100
