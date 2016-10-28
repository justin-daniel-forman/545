range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld hl,$0051
  rcr [hl]
  rcr [hl]
  bit7 [hl]
  jp z,$4f
  ld st,$004f
  rcr [st+$03]
  rcr [st+$03]
  bit7 [st+$03]
  jp z,$4f
  ld uv,$0050
  rcr [uv+$03]
  rcr [uv+$03]
  bit7 [uv+$03]
  jp z,$4f
  ld a,$01
  rcr
  rcr
  ld b,$01
  rcr b
  rcr b
  ld c,$01
  rcr c
  rcr c
  ld d,$01
  rcr d
  rcr d
  ld e,$01
  rcr e
  rcr e
  

section data
  addr0: data !0101 !0101

output rotate_right_test.rom $0000 $0100
