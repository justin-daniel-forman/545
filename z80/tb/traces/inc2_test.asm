range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld hl, $0051
  inc [hl]
  ld hl, [$51]

section data
  addr0: data !ff7f !BEEF !0028 !1c00 !3800 !7000

output inc2_test.rom $0000 $0100
