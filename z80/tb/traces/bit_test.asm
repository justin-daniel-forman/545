range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld uv,$0050
  ld st,$0050
  bit3 [st+$05]
  jp z,$0049
  bit5 [uv+$02]
  jp z,$0049
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
  ld e,$7f
  bit7 e
  jp z,$0049
  ld uv,$2345

section data
  addr0: data !DEAD !BEEF
  addr1: data !08

output bit_test.rom $0000 $0100
