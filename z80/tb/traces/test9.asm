range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld d, $dd
  ld e, $ee
  ld h, $aa
  ld l, $bb
  ex de, hl

  #switch contexts and perform more ops
  exx
  ld b, $11
  ld c, $22
  ld d, $33
  ld e, $44
  ld h, $55
  ld l, $66

  ld [st+$51], b #51 <- 11

  #switch back to the original context
  exx
  ld b, [st+$51]

section data
  addr0: data !DEAD !BEEF

output test9.rom $0000 $0100
