range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, $8
  ld b, $9
  ld d, $10
  ld e, $11
  ld h, $12
  ld l, $13

  #port 0 <= $13
  ld c, $0
  out l

  #port 1 <= $12
  ld c, $1
  out h

  #port 2 <= $11
  ld c, $2
  out e

  #port 3 <= $10
  ld c, $3
  out d

  #port 4 <= $9
  ld c, $4
  out b

  #port 5 <= $8
  ld c, $5
  out a

  #port 6 <= $6
  ld c, $6
  out c

  # a <= 6
  in a

  # b <= 8
  ld c, $5
  in b

  # d <= 9
  ld c, $4
  in d

  # e <= 10
  ld c, $3
  in e

  # h <= 11
  ld c, $2
  in h

  # l <= 12
  ld c, $1
  in l

  # c <= 13
  ld c, $0
  in c

  #c <= 0f
  ld c, $f
  in c

section data
  addr0: data !1010 !12EF !0028 !1c00 !3800 !7000

output med_in.rom $0000 $0100
