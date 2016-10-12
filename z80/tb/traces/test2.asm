range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld [st, $51], $ff
  ld [uv, $52], $ee

  ld b, [st+$51]
  ld c, [uv+$52]

section data
  addr0: data !DEAD !BEEF

output test2.rom $0000 $0100
