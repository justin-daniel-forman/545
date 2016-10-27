range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld hl, $ff7f

  dec a
  dec b
  dec c
  dec d
  dec e
  dec h
  dec l


section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000

output dec_test.rom $0000 $0100
