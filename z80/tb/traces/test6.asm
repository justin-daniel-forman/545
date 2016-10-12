range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, $ff
  ld [$0051], a
 
  ld a, $ee
  ld a, [$0051] 
 
section data
  addr0: data !DEAD !BEEF

output test6.rom $0000 $0100
