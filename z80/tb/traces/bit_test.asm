range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100

section code
  ld uv,$0050
  ld st,$0050

  res3 [st+$05]
  bit3 [st+$05]
  jp nz, foo #dont take this jump

  res5 [uv+$02]
  bit5 [uv+$02]
  jp nz, foo #dont take this jump either

  ld hl,$0055
  set7 [hl]
  bit7 [hl]
  jp z, foo #dont take this jump either

  ld a,$ff
  res6 a
  bit6 a
  jp nz, foo #still dont take the jump

  ld b,$8d
  set1 b
  bit1 b
  jp z, foo #still dont take this one

  ld c,$08
  bit0 c
  jp nz, foo #and dont take this one either

  ld d,$10
  bit2 d
  jp nz,$004f #and dont take this one either

  ld e,$7f
  bit7 e
  jp z foo
  foo: nop

section data
  addr0: data !DEAD !BEEF
  addr1: data !08

output bit_test.rom $0000 $0100
