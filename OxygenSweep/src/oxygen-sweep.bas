5 s=1024
6 gosub 9000
10 print chr$(147)
20 forx=0 to 10: print:next x
30 print spc(13)
40 print"oxygen sweep"
50 print:print spc(11):print"press fire to play"
60 j=peek(56320)
70 f=j and 16
80 if f=0 then gosub 100
90 goto 60
100 gosub 2000
110 rem --- main loop
130 j=peek(56320)
140 dx=0:dy=0
150 if(j and 1)=0 then dy=-1
160 if(j and 2)=0 then dy=1
170 if(j and 4)=0 then dx=-1
180 if(j and 8)=0 then dx=1
190 if dx=0 and dy=0 then 130
2000 rem load level
2010 print chr$(147)
2020 for x=1 to 6:read a$
2030 print spc(10); a$:next x
2040 rem -- scan screen for player + ore
2050 for y=0 to 24
2060 for x=0 to 39
2070 a=s+y*40+x: t=peek(a)
2080 if t=player then px=x: py=y
2090 if t=treasure then treasureleft=treasureleft+1
2100 next x
2110 next y
2120 return
6000 data"{rvon}               "
6010 data"{rvon} {rvof}Z.{rvon} {rvof}Z.........{rvon}{$a0}"
6020 data"{rvon}{$a0}{rvof}.Z{rvon} {rvof}...Z......{rvon}{$a0}"
6030 data"{rvon}{$a0}{rvof}.....Z......o{rvon} "
6040 data"{rvon} {rvof}Z.....Q......{rvon} "
6050 data"{rvon}               "
9000 rem learn screen codes by print and peek
9010 print chr$(147)
9020 rem put marker chars in known spots, then peek them back
9030 print "Q{rvon} {rvof}ZO."
9040 player=peek(s+0)
9050 wall=peek(s+1)
9060 treasure=peek(s+2)
9070 vent=peek(s+3)
9080 empty=peek(s+4)
9090 return