range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, $15
  add $27
  daa

section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000

output daa_test.rom $0000 $0100
