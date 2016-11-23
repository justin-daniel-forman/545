range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  or a #clear flags
  ld hl, $0028
  ld de, $0001
  sbc hl, de

  #or a 
  #ld hl, $0028
  #ld de, $0028
  #sbc hl, de

section data
  addr0: data !ba98 !bb98 !0c00 !0c00 !3800 !7000

output sbc_hl_test.rom $0000 $0100
