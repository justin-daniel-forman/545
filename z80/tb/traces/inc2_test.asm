range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld hl, $0051  #hl = 0051
  inc [hl]      #[hl] = 007f
  ld hl, [$51]  #hl = 007f

  ld st, $0051  #st = 0051
  inc [st+1]    #[st+1] = be80
  ld st, [$0052]  #st = be80

  ld uv, $0053  #uv = 53
  inc [uv-1]    #[uv-1] = be81
  ld uv, [$0052]  #uv = be81

section data
  addr0: data !ff7f !BEEF !0028 !1c00 !3800 !7000

output inc2_test.rom $0000 $0100
