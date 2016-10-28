range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld hl,$0051
  ld a,$ff
  rld
  ld bc,[$0051]

section data
  addr0: data !8880 !8080

output rld_test.rom $0000 $0100
