range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  
  ld d, $00
  ld e, $51
  ld a, $ff
  ld [de], a

  ld b, $00
  ld c, $52
  ld a, $ee
  ld [bc], a

  ld a, [bc]
  ld h, a

  ld a, [de]
  ld l, a

section data
  addr0: data !DEAD !BEEF

output test5.rom $0000 $0100
