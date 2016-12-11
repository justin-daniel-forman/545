range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld bc, $05cc
  ld hl, $0058
  indr 

  ld st, $0058
  ld a, [st]
  ld b, [st-1]
  ld c, [st-2]
  ld d, [st-3]
  ld e, [st-4]
  ld h, [st-5]
  ld l, [st-6]

section data
  addr0: data !f00d !f00d !f00d !f00d !f00d !f00d !f00d !f00d

output indr_test.rom $0000 $0100
