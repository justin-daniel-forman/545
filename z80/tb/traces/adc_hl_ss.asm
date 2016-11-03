range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, $f
  stc #set the carry flag before adc

  ld hl, $1f
  ld bc, $04
  adc hl, bc
  ld [$51], hl #should be $24

  stc #set the carry flag
  ld hl, $bcde
  ld de, $01ff
  adc hl, de
  ld [$53], hl #should be $bede

  stc
  cmc
  ld hl, $ffff
  add hl, hl
  ld [$57], hl #should be #fffe with a carry out

  #this case should cause overflow
  stc
  cmc #unset the carry flag
  ld sp, $7fff
  ld hl, $0001
  adc hl, sp
  ld [$55], hl #should be $8000

  ld bc, [$51] #24
  ld de, [$53] #bede
  ld hl, [$55] #8000
  ld sp, [$57] #fffe


section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000

output adc_hl_ss.rom $0000 $0100
