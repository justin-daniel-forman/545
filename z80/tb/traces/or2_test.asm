range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, $00
  ld hl, $0051
  ld st, $0051
  ld uv, $0051

  or [hl]
  or [st+1]
  or [uv+2]
  or $8

section data
  addr0: data !0102 !04EF !0028 !1c00 !3800 !7000

output or2_test.rom $0000 $0100
