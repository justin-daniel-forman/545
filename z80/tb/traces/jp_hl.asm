range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code
  ld hl foo
  jp hl
  ld bc, $baad

foo: ld de, $f00d

  ld st bar
  jp st
  ld bc $baad

bar: ld sp, $f00d

  ld uv boo
  jp uv
  ld bc $baad

boo: ld hl $f00d

section data
  addr0: data !0102 !BEEF !0028 !1c00 !3800 !7000

output jp_hl.rom $0000 $0100
