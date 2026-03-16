10 rem screen codes and adresses 
20 s=1024:c=55296:pl=81:wa=160:tr=90:ve=15:em=46
30 rem game variables
40 mox=50:ox=mox:tc=0:ld=0
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
2020 for x=0 to 4:print:next x
2030 for x=1 to 13:read a$
2040 print spc(5); a$:next x
2050 rem -- scan screen for player
2060 for y=8 to 33
2070 for x=8 to 10
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
4010 print chr$(19);:print "{rvon}score";:print" ";:print right$("0"+mid$(str$(tc),2),2);
4020 print"  ";:print "load:";:print" ";:print right$("0"+mid$(str$(ld),2),2);
4030 print"  ";:print "oxygen";:print" ";:for x=1 to ox/10: print ">";:next x
4040 for x=1 to (10-ox/10)+3:print" ";:next x:print"{rvof}"
4050 return
6000 data"{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}"
6010 data"{CBM-+}{rvon}                            {rvof}{CBM-+}"
6020 data"{CBM-+}{rvon} {rvof}Z...{rvon} {rvof}.........ZZZZ{rvon} {rvof}...{rvon} {rvof}ZZZ{rvon} {rvof}{CBM-+}"
6030 data"{CBM-+}{rvon} {rvof}ZZ..{rvon} {rvof}..........ZZZ{rvon} {rvof}...{rvon} {rvof}ZZZ{rvon} {rvof}{CBM-+}"
6040 data"{CBM-+}{rvon} {rvof}Z...{rvon} {rvof}...{rvon}           {rvof}...{rvon} {rvof}ZZZ{rvon} {rvof}{CBM-+}"
6050 data"{CBM-+}{rvon} {rvof}............ZZZ.......{rvon} {rvof}..Z{rvon} {rvof}{CBM-+}"
6060 data"{CBM-+}{rvon}      {rvof}..o{rvon} {rvof}....Z...o{rvon} {rvof}...{rvon} {rvof}...{rvon} {rvof}{CBM-+}"
6070 data"{CBM-+}{rvon} {rvof}........{rvon} {rvof}....Z....{rvon} {rvof}..{rvon}  {rvof}...{rvon} {rvof}{CBM-+}"
6080 data"{CBM-+}{rvon} {rvof}........{rvon}    {rvof}...{rvon}    {rvof}.......{rvon} {rvof}{CBM-+}"
6090 data"{CBM-+}{rvon}      {rvof}......{rvon} {rvof}...{rvon} {rvof}..........{rvon} {rvof}{CBM-+}"
6100 data"{CBM-+}{rvon} {rvof}ZZ.........{rvon} {rvof}Q..{rvon} {rvof}....ZZZ...{rvon} {rvof}{CBM-+}"
6110 data"{CBM-+}{rvon}                            {rvof}{CBM-+}"
6120 data"{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}"
