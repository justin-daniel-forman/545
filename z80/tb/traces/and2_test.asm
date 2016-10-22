range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, $ff
  ld hl, $0051
  ld st, $0051
  ld uv, $0054

  and $fe
  and [hl]
  and [st+1]
  and [uv-1]

section data
  addr0: data !fdfc !fbEF !0028 !1c00 !3800 !7000

output and2_test.rom $0000 $0100
