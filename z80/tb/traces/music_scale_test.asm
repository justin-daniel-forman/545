range rom $0000 $bfff
range ram $c000 $ffff

range code $0000 $0050


section code

  nop
  ld a,$8e
  ld bc,$007f
  out a
  ld a,$0f
  out a
  ld a,$90
  out a
  call delay
 
  ld a,$8e
  out a
  ld a,$1f
  out a
  call delay

  ld de,$ffff
  ld a,$8e
  out a
  ld a,$2f
  out a
  call delay
  jp $0000

  delay:nop
  ld de,$ffff
  ld h,$0f
  loop:dec e
  jr nz,loop
  ld e,$ff
  dec d
  jr nz,loop
  ld de,$ffff
  dec h
  jr nz,loop
  ret

  
output music_scale_test.rom $0000 $0100
