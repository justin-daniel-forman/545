range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld bc, $0
  ld hl, $53
  ld a, [$51]
  cpdr

section data
  addr0: data !7e7e !0f0f

output CPDR_test.rom $0000 $0100
