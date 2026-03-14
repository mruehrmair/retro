10 rem screen codes and adresses 
20 s=1024:c=55296:pl=81:wa=160:tr=90:ve=15:em=46
30 rem game variables
40 mox=40:ox=mox:tc=0
50 print chr$(147):forx=0 to 10: print:next x
60 print spc(13):print"oxygen sweep"
70 print:print spc(11):print"press fire to play"
80 gosub 3000
100 gosub 2000
110 rem --- main loop
120 j=peek(56320)
130 dx=0:dy=0
140 if(j and 1)=0 then dx=-1
150 if(j and 2)=0 then dx=1
160 if(j and 4)=0 then dy=-1
170 if(j and 8)=0 then dy=1
180 if dx=0 and dy=0 then 110
190 rem player movement
200 op=s+py+px*40:np=s+py+dy+(px+dx)*40    
210 if peek(np)=wa then goto 110 
220 if peek(np)=ve then ox=mox
230 if peek(np)=tr then tc=tc+1
240 poke op,em
250 poke c+py+px*40,14:px=px+dx:py=py+dy
260 poke np,pl
270 poke c+py+px*40,1
280 ox = ox-1
290 gosub 4000
300 if ox<=0 then goto 600
310 goto 110
600 rem game over
610 for i=1 to 12:print:next i
620 print spc(1);:print "game over - press fire to restart":
630 gosub 3000:restore:goto 20
2000 rem load level
2010 print chr$(147)
2020 for y=10 to 24:for x=1 to 5:next x:next y
2030 for x=1 to 6:read a$
2040 print spc(10); a$:next x
2050 rem -- scan screen for player
2060 for y=10 to 24
2070 for x=1 to 5
2080 a=s+y+x*40:t=peek(a)
2090 if t=pl then px=x:py=y
2100 next x
2110 next y
2120 poke c+py+px*40,1
2130 gosub 4000
2140 return
3000 rem wait for fire button
3010 j=peek(56320)
3020 f=j and 16
3030 if f=0 then return
3040 goto 3010
4000 rem print hud
4010 print chr$(19);:print "oxygen:";:print spc(1);:print right$("0"+mid$(str$(ox),2),2);
4020 print spc(1);:print "treasure:";:print spc(1);:print right$("0"+mid$(str$(tc),2),2)
4030 return
6000 data"{rvon}               "
6010 data"{rvon} {rvof}Z.{rvon} {rvof}Z.........{rvon} "
6020 data"{rvon} {rvof}.Z{rvon} {rvof}...Z......{rvon} "
6030 data"{rvon} {rvof}.....Z......o{rvon} "
6040 data"{rvon} {rvof}Z.....Q......{rvon} "
6050 data"{rvon}               "