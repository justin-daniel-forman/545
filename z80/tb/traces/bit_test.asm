range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld hl,$0051
  bit7 [hl]
  jp z,$0049
  ld a,$bf
  bit6 a
  jp nz,$0049
  ld b,$8f
  bit1 b
  jp z,$0049
  ld c,$08
  bit0 c
  jp nz,$0049
  ld d,$10
  bit2 d
  jp nz,$0049
  ld hl,$0000
  ld e,$7f
  bit7 e
  jp z,$0049
  ld uv,$2345

section data
  addr0: data !DEAD !BEEF

output bit_test.rom $0000 $0100
