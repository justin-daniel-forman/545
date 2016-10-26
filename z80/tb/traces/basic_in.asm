range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, $e
  out $f

  ld a, $a
  in $f

section data
  addr0: data !1010 !12EF !0028 !1c00 !3800 !7000

output basic_in.rom $0000 $0100
