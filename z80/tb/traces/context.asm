range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld bc, $51
  ld a, [bc] #a <- de

  ld bc, $2
  ldi        #should set P/V flag

  ex af

  ex af 

section data
  addr0: data !DEAD !BEEF !AAAA !BBBB !CCCC !BBBB

output context.rom $0000 $0100
