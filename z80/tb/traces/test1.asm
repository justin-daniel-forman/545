range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld h, $00
  ld l, $51
  ld [hl], $ff
  ld b, [st+$51]

section data
  addr0: data !DEAD !BEEF

output test1.rom $0000 $0100
