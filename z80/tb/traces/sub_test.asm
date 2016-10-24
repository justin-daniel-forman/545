range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld a, [$51]         # A = 1
  sub $1

  ld bc, $0203
  ld de, $0405
  ld hl, $0052
  ld st, $0053
  ld uv, $0054

  sub b
  sub c
  sub d
  sub e
  
  sub [hl]
  sub [st]
  sub [uv]

section data
  addr0: data !7f05 !600c !0028 !1c00 !3800 !7000

output sub_test.rom $0000 $0100
