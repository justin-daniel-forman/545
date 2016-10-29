range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld hl,$0051
  sal [hl]
  jp nc,$4f
  jp m,$4f
  jp nz,$4f
  ld st,$004f
  sal [st+$03]
  jp nc,$4f
  jp m,$4f
  jp nz,$4f
  ld uv,$0050
  sal [uv+$03]
  jp nc,$4f
  jp m,$4f
  jp nz,$4f
  ld b,$01
  sal b
  ld c,$01
  sal c
  ld d,$01
  sal d
  ld e,$01
  sal e
  

section data
  addr0: data !8080 !8080

output asl_test.rom $0000 $0100
