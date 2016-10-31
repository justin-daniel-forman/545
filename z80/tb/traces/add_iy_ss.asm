range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld uv, $1f
  ld bc, $04
  add uv, bc
  ld [$51], uv #should be $23

  ld uv, $bcde
  ld de, $01ff
  add uv, de
  ld [$53], uv #should be $bedd

  ld sp, $7fff
  ld uv, $0001
  add uv, sp
  ld [$55], uv #should be $8000

  ld uv, $ffff
  add uv, uv
  ld [$57], uv #should be #fffe with a carry out
  
  ld bc, [$51]
  ld de, [$53]
  ld hl, [$55]
  ld sp, [$57]


section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000

output add_iy_ss.rom $0000 $0100
