range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld a, [$51]         # A = 1
  ld bc, $0203
  ld de, $0405
  ld hl, $0607
  ld st, $53
  ld uv, $55

  cmc
  adc $1  #A <- 3
  adc a   #A <- 6
  adc b   #A <- 8
  adc c   #A <- 11
  adc d   #A <- 15
  adc e   #A <- 20
  adc h   #A <- 26
  adc l   #A <- 33 $21

  adc [st-2] #A <- 34 $22
  adc [uv-4] #A <- 35 $23
  ld hl, $51 
  adc [hl] #A <- 36 $24

  adc $80   #A <- A4
  adc $60   #A <- 04, C = 1
  adc $1    #A <- 06

  ld bc, $0
  ld de, $0
  ld hl, $0
  ld st, $0
  ld uv, $0

section data
  addr0: data !0102 !0304 !0506 !0708

output adc_test.rom $0000 $0100
