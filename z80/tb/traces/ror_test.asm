range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld hl,$0051
  ror [hl]
  jp nc,$4f
  ror [hl]
  bit6 [hl]
  jp z,$4f
  ld st,$004f
  ror [st+$03]
  ror [st+$03]
  bit6 [st+$03]
  jp z,$4f
  ld uv,$0050
  ror [uv+$03]
  ror [uv+$03]
  bit6 [uv+$03]
  jp z,$4f
  ld a,$01
  ror
  ror
  ld b,$01
  ror b
  ror b
  ld c,$01
  ror c
  ror c
  ld d,$01
  ror d
  ror d
  ld e,$01
  ror e
  ror e
  

section data
  addr0: data !0101 !0101

output ror_test.rom $0000 $0100
