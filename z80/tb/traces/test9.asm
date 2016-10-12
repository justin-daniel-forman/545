range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld d, $dd
  ld e, $ee
  ld h, $aa
  ld l, $bb
  ex de, hl

section data
  addr0: data !DEAD !BEEF

output test9.rom $0000 $0100
