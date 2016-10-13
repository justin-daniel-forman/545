range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld sp, $0051
  ld bc, $ffff
  ld de, $eeee
  ld hl  $bbcc

  ex [sp], hl
  ld bc, [$51]

section data
  addr0: data !DEAD !BEEF

output test7.rom $0000 $0100
