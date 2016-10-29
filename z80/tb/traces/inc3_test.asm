range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  inc bc
  inc de
  inc hl
  ld  sp, $ffff
  ld  st, $ffff
  ld  uv, $ffff
  inc sp
  inc st 
  inc uv

section data
  addr0: data !ff7f !BEEF !0028 !1c00 !3800 !7000

output inc3_test.rom $0000 $0100
