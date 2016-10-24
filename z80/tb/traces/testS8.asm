range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld a,[$0051]
  ld hl,$0051
  cpi
  jp nz,$000c
  ld hl,$cafe
  ld bc,$f00d
  add $80
  jp nz,$0019
  ld uv,$1222
  ld st,$2122

section data
  addr0: data !DEAD !BEEF

output testS8.rom $0000 $0100
