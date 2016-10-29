range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  dec bc
  dec de
  dec hl
  dec sp
  dec st 
  dec uv

section data
  addr0: data !ff7f !BEEF !0028 !1c00 !3800 !7000

output dec3_test.rom $0000 $0100
