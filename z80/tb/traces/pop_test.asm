range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld sp, $5d
  ld a, $01
  ld bc, $0302
  ld de, $0504
  ld hl, $0706
  ld st, $0908
  ld uv, $0b0a

  push uv #5b
  push st #59
  push hl #57
  push de #55
  push bc #53
  push af #51

  pop af #53
  pop bc #55
  pop de #57
  pop hl #59
  pop st #5b
  pop uv #5d

section data
  addr0: data !0000 !0000 !0000 !0000

output pop_test.rom $0000 $0100
