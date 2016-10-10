range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld b, $ff
  ld [st + $51], b
  ld c, [st + $51]

  ld d, $ee
  ld [uv + $52], d
  ld e, [uv + $52]

section data
  addr0: data !DEAD !BEEF

output test0.rom $0000 $0100
