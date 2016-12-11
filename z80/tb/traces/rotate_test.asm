range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld hl,$0051
  rcl [hl]
  rcl [hl]
  bit0 [hl]
  jp z,$4f
  ld st,$004f
  rcl [st+$03]
  rcl [st+$03]
  bit0 [st+$03]
  jp z,$4f
  ld uv,$0050
  rcl [uv+$03]
  rcl [uv+$03]
  bit0 [uv+$03]
  jp z,$4f
  ld a,$80
  rcl
  rcl
  ld b,$80
  rcl b
  rcl b
  ld c,$80
  rcl c
  rcl c
  ld d,$80
  rcl d
  rcl d
  ld e,$80
  rcl e
  rcl e
  

section data
  addr0: data !8080 !8080

output rotate_test.rom $0000 $0100
