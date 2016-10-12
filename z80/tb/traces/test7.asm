range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld sp, $abcd
  ld bc, $ffff
  ld de, $eeee
  ld hl  $1111
 
section data
  addr0: data !DEAD !BEEF

output test7.rom $0000 $0100
