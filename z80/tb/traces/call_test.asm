range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld sp,$0057
  call $0008
  ld hl,$0023
  ld hl,$0056
  ld b,[hl]
  ld hl,$0055
  ld c,[hl]

section data
  addr0: data !DEAD !BEEF

output call_test.rom $0000 $0100
