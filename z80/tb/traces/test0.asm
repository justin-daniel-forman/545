range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  #ld b, $dd
  #ld c, $ee
  #ld d, $ff
  #ld e, $aa
  #ld a, [st+$51]
  #ld b, [uv+$52]

  ld h, $00
  ld l, $51
  ld d, $ff
  ld [hl], d      #[$51] <- d
  ld e, [st+$51]  # e <- [$51]

section data
  addr0: data !DEAD !BEEF

output test0.rom $0000 $0100
