range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, [$0051]
  ld h, a
  ld a, [$0052]
  ld l, a

  ld b $ff
  ld c $ff

section data
  addr0: data !DEAD !BEEF

output test4.rom $0000 $0100
