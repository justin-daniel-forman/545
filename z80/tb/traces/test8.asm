range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld de, $51
  ld hl, $52
  ld bc, $2
  ldi #should set the P/V flag

  ldi #should unset the P/V flag

  ldi #should set the P/V flag

section data
  addr0: data !DEAD !BEEF

output test8.rom $0000 $0100
