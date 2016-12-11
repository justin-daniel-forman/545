range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld hl, $abcd
  ld [$51], hl

  ld bc, $bbcc
  ld [$53], bc

  ld de, $ddee
  ld [$55], de

  ld sp, $aaff
  ld [$57], sp

  ld st, $7766
  ld [$59], st

  ld uv, $9911
  ld [$5b], uv

  ld bc, [$57]
  ld de, [$55]
  ld hl, [$53]
  ld sp, [$51]
  ld st, [$5b]
  ld uv, [$59]

section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000 !0000 !0000 !0000

output ld_nn_x_dd_test.rom $0000 $0100
