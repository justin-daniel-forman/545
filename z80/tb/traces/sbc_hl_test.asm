range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  #compute a 16-bit subtraction
  #98ba - 98bb -1  = fffe (-2)

  stc #set the carry bit
  #part 1 98ba - 98bb - C_in = fffe
  ld hl $98ba
  ld bc $98bb
  sbc hl bc

section data
  addr0: data !ba98 !bb98 !0c00 !0c00 !3800 !7000

output sbc_hl_test.rom $0000 $0100
