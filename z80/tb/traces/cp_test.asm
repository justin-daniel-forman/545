range rom $0000 $0100

range code $0000 $0050
range data $0051 $0100


section code

  ld a, $10
  cp a
  jr z, $+5
  ld bc, $baad
 
  cp $10
  jr z $+5
  ld bc, $baad
 
  ld b, $12
  cp b
  jr nz, $+5
  ld bc, $baad
 
  ld hl, $0051 
  cp [hl]
  jr z $+5
  ld bc, $baad

  ld st, $0051
  cp [st+1]
  jr z $+5
  ld bc, $baad

  ld uv, $0051
  cp [uv+2]
  jr nz $+5
  ld bc, $baad

section data
  addr0: data !1010 !12EF !0028 !1c00 !3800 !7000

output cp_test.rom $0000 $0100
