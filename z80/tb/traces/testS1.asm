range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld uv,$10
	ld uv,$23

section data
  addr0: data !DEAD !BEEF

output testS1.rom $0000 $0100
