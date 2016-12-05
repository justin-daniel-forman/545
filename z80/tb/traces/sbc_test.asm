range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  #compute a 16-bit subtraction using 2 8-bit subtractions
  #98ba - 98bb = ffff (-1)
  #ba98 - bb98 = ff00 (-256)
  #c-e = fffe (-2) and generates half borrow

  #part 1 99ba - 98bb = ffff
  ld hl $0053
  ld a, [$51]
  sbc [hl] #ba - bb -> generate a carry
  ld bc, $0057
  ld [bc], a #store (ba - bb) -> [$58] 

  ld a, [$52] 
  sbc $98  #98 - 98 with carry => ff
  ld bc, $0058
  ld [bc], a #store (98 - 98 - 1) -> [$57]

  ld de, [$57]

  #part 2 ba98 - bb98 = ff00
  ld uv, $52
  ld a, [$52]

  #clear the carry bit by setting, then inverting
  stc
  cmc 

  sbc [uv] #98 - 98 = 0 -> no borrow generated
  ld bc, $0057
  ld [bc], a

  ld st, $0053
  ld a, [$51]
  sbc [st] #ba - bb = ff
  ld bc, $0058
  ld [bc], a

  ld hl, [$57]

  #part 3 0c - 0e = fffc and sets half borrow
# stc
#  cmc
#  ld bc, $000e
#  ld a, [$55]   #a = 0c
#  sbc c         #0c - 0e = fc with borrow
#  ld c, $57     #bc <= 0057
#  ld [bc], a    #[0057] <= fc

#  ld a, [$56]   #a <= 0
#  ld c, $58     #bc <= 58
#  sbc b         #00 - 00 - 1 = ff
#  ld [bc], a    #[58] <= ff
 
#  ld bc, [$57]


  or a #clear all of the flags
  ld hl, $0028
  ld bc, $0001
  sbc hl, de 


section data
  addr0: data !ba98 !bb98 !0c00 !0c00 !3800 !7000

output sbc_test.rom $0000 $0100
