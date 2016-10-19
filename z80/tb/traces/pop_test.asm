range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld hl, $51
  ld sp, hl
  pop st
  pop uv

section data
  addr0: data !ADDE !EFBE !0DF0 !ADBA

output pop_test.rom $0000 $0100
