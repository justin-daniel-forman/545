range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld sp,$0057
  ld a,[$0051]
  call $000e
  ld hl,$0023
  jp $0049
  add $01
  ret z
  inc c
  jr $-4

section data
  addr0: data !DEAD !BEEF

output call_ret_cc_test.rom $0000 $0100
