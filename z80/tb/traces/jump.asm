range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  #set a bunch of flags
  ld a, $ff
  ld b, $ff
  sub b

  jr z bar
  jr foo

foo: ld d, $ee
bar: ld e, $bb

section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000

output jump.rom $0000 $0100
