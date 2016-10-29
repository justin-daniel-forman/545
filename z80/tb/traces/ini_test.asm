range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld bc, $01cc
  ld hl, $0051
  ini 

  ld st, $0051
  ld d, [st]


section data
  addr0: data !7e7e !0f0f

output ini_test.rom $0000 $0100
