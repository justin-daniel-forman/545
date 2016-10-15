range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld sp, $0051
  ld bc, $ffff
  ld de, $eeee
  ld hl  $bbcc
  ld st, $cccc
  ld uv, $dddd

  ex [sp], hl
  ld sp, $0053  
  ex [sp], st
  ld sp, $0055
  ex [sp], uv

  ld bc, [$51]
  ld de, [$53]
  ld hl, [$55]


section data
  addr0: data !DEAD !BEEF !FAAB

output test7.rom $0000 $0100
