range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld bc, $05cc
  ld hl, $0058
  outdr 

  ld bc, $05cc
  ld hl, $0058
  indr

  ld st, $0051
  ld a, [st]
  ld b, [st+1]
  ld c, [st+2]
  ld d, [st+3]
  ld e, [st+4]
  ld h, [st+5]
  ld l, [st+6]

section data
  addr0: data !0102 !0304 !0506 !0708 !0910 !1112 !1314 !1516

output otdr_test.rom $0000 $0100
