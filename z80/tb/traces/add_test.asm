range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld a, [$51]         # A = 1
  ld bc, $0203
  ld de, $0405
  ld hl, $0607

  add b               # A <- 1 + 2, F = 0
  add c               # A <- 6, F = 0
  add d               # A <- 10
  add e               # A <- 15
  add h               # A <- 21
  add l               # A <- 28

  add a               # A <- 56   $38
  add a               # A <- 112  $38 + $38 = $70, H = 1
  add a               # A <- 224  $70 + $70 = $EO, H = 0
  add a               # a <- 1C0  $E0 + $E0 = $1C0, H = 0, C = 1

section data
  addr0: data !0102 !BEEF

output add_test.rom $0000 $0100
