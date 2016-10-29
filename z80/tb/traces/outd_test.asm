range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code


  ld bc, $01cc
  ld hl, $0052
  outd
  ind

  ld st, $0050
  ld d, [st+1]


section data
  addr0: data !7e7e !0f0f

output outd_test.rom $0000 $0100
