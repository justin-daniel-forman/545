range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  jp foo
  ld hl,$cafe
  foo: ld bc,$f00d

section data
  addr0: data !DEAD !BEEF

output testS6.rom $0000 $0100
