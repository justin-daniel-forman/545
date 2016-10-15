range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld hl, $5a
  ld de, $8a
  ld bc, $a

  lddr

  ld bc, [$81]
  ld de, [$82]
  ld hl, [$8a]
  ld st, [$8b]
  ld uv, [$8c]


section data
  addr0: data !DEAD !BEEF !AAAA !BBBB !CCCC !BBBB

output LDDR_test.rom $0000 $0100
