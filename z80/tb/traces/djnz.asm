range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  #set a bunch of flags
  ld a, $ff
  sbc a

  ld b, $5
  ld c, $ff
  foo: dec c
  djnz foo

  ld d, $ee
  ld e, $bb

section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000

output djnz.rom $0000 $0100
