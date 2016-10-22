range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, $ff
  ld b, $fe
  ld c, $fd
  ld d, $fc
  ld e, $fb
  ld h, $fa
  ld l, $f0

  and b
  and c
  and d
  and e
  and h
  and l
  and a

section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000

output and_test.rom $0000 $0100
