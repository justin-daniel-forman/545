range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld uv,$10
	ld uv,$23

  ld hl,$aabb

  ld [$53],hl

  ld hl,[$53]

section data
  addr0: data !DEAD !BEEF

output testS2.rom $0000 $0100
