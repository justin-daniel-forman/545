range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld bc, [$51]
  ld de, [$53]
  ld hl, [$55]
  ld st, [$57]
  ld uv, [$59]
  ld sp, [$5b]


section data
  addr0: data !0201 !0403 !0605 !0807 !0a09 !0c0b

output ld_dd_nn_x_test.rom $0000 $0100
