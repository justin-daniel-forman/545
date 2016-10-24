range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, $1
  ld b, $2
  ld c, $3
  ld d, $4
  ld e, $5
  ld h, $6
  ld l, $7

  xor a
  xor b
  xor c
  xor d
  xor e
  xor h
  xor l

  ld hl, $51
  ld st, $52
  ld uv, $53
  xor [hl]
  xor [st]
  xor [uv]

  xor $1
  

section data
  addr0: data !0809 !0aEF !0028 !1c00 !3800 !7000

output xor_test.rom $0000 $0100
