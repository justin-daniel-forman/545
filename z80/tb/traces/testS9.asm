range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld a,[$0051]
  ld hl,$23
foo: add $ff
  jp z, bar
  jr foo
bar: ld [$0051],a
  ld bc,[$0051]

section data
  addr0: data !DEAD !BEEF

output testS9.rom $0000 $0100
