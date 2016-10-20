range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  nop
  nop
  nop
  nop
  nop

  not #complement the A reg so it is now ff
  stc #set carry flag
  cmc #reset carry flag, h becomes prev carry flag

section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000

output easy_test.rom $0000 $0100
