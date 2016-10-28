range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld hl,$0051
  rol [hl]
  jp nc,$4f
  rol [hl]
  bit1 [hl]
  jp z,$4f
  ld st,$004f
  rol [st+$03]
  rol [st+$03]
  bit1 [st+$03]
  jp z,$4f
  ld uv,$0050
  rol [uv+$03]
  rol [uv+$03]
  bit1 [uv+$03]
  jp z,$4f
  ld a,$80
  rol
  rol
  ld b,$80
  rol b
  rol b
  ld c,$80
  rol c
  rol c
  ld d,$80
  rol d
  rol d
  ld e,$80
  rol e
  rol e
  

section data
  addr0: data !8080 !8080

output rol_test.rom $0000 $0100
