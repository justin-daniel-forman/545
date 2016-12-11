range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld hl, $1f
  ld bc, $04
  add hl, bc
  ld [$51], hl #should be $23

  ld hl, $bcde
  ld de, $01ff
  add hl, de
  ld [$53], hl #should be $bedd

  ld sp, $7fff
  ld hl, $0001
  add hl, sp
  ld [$55], hl #should be $8000

  ld hl, $ffff
  add hl, hl
  ld [$57], hl #should be #fffe with a carry out
  
  ld bc, [$51]
  ld de, [$53]
  ld hl, [$55]
  ld sp, [$57]


section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000

output add_hl_ss.rom $0000 $0100
