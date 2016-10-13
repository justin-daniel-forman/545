range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld st,$10
	ld st,$23
  
  ld hl,[$51]

  ld bc,[$51]

  ld sp,st

section data
  addr0: data !DEAD !BEEF

output testS0.rom $0000 $0100
