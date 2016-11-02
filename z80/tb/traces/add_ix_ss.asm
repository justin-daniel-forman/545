range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld st, $1f
  ld bc, $04
  add st, bc
  ld [$51], st #should be $23

  ld st, $bcde
  ld de, $01ff
  add st, de
  ld [$53], st #should be $bedd

  ld sp, $7fff
  ld st, $0001
  add st, sp
  ld [$55], st #should be $8000

  ld st, $ffff
  add st, st 
  ld [$57], st #should be #fffe with a carry out
  
  ld bc, [$51]
  ld de, [$53]
  ld hl, [$55]
  ld sp, [$57]


section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000

output add_ix_ss.rom $0000 $0100
