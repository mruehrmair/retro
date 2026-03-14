10 s=1024:c=55296:gosub 9000
20 print chr$(147)
30 forx=0 to 10: print:next x
40 print spc(13):print"oxygen sweep"
50 print:print spc(11):print"press fire to play"
60 j=peek(56320)
70 f=j and 16
80 if f=0 then gosub 100
90 goto 60
100 gosub 2000
110 rem --- main loop
130 j=peek(56320)
140 dx=0:dy=0
150 if(j and 1)=0 then dx=-1
160 if(j and 2)=0 then dx=1
170 if(j and 4)=0 then dy=-1
180 if(j and 8)=0 then dy=1
190 if dx=0 and dy=0 then 110
200 rem player movement
210 op=s+py+px*40:np=s+py+dy+(px+dx)*40    
220 if peek(np)=wall then goto 110
230 if peek(np)=treasure then tl=tl-1
230 px=px+dx:py=py+dy
240 poke op,empty:poke np,player:poke s+40*24,tl+48
250 goto 110
2000 rem load level
2010 print chr$(147)
2005 for y=10 to 24:for x=1 to 5:poke c+y+x*40,6:next x:next y
2020 for x=1 to 6:read a$
2030 print spc(10); a$:next x
2040 rem -- scan screen for player + ore
2050 for y=10 to 24
2060 for x=1 to 5
2070 a=s+y+x*40:poke c+y+x*40,14:t=peek(a)
2080 if t=player then px=x:py=y
2090 if t=treasure then tl=tl+1
2100 next x
2110 next y
2120 poke s+40*24,tl+48
2130 return
6000 data"{rvon}               "
6010 data"{rvon} {rvof}Z.{rvon} {rvof}Z.........{rvon} "
6020 data"{rvon} {rvof}.Z{rvon} {rvof}...Z......{rvon} "
6030 data"{rvon} {rvof}.....Z......o{rvon} "
6040 data"{rvon} {rvof}Z.....Q......{rvon} "
6050 data"{rvon}               "
9000 rem learn screen codes by print and peek
9010 print chr$(147)"Q{rvon} {rvof}ZO."
9020 player=peek(s+0)
9030 wall=peek(s+1)
9040 treasure=peek(s+2)
9050 vent=peek(s+3)
9060 empty=peek(s+4)
9070 return