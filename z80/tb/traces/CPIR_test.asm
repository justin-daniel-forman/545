range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, [$5d]
  ld hl, $51
  ld bc, $f

  cpir

section data
  addr0: data !DEAD !BEEF !AAAA !BBBB !CCCC !BBBB !8d00 !bbbb !0000 !0000

output CPIR_test.rom $0000 $0100
