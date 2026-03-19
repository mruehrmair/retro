10 rem screen codes and adresses 
20 s=1024:c=55296:pl=81:wa=160:tr=90:ve=87:em=46:ve2=15
25 gosub 5000
30 rem game variables
35 dim vx(9),vy(9),vs(9)
40 mox=100:ox=mox:tc=0:ld=0
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
200 op=s+py+px*40:np=s+py+dy+(px+dx)*40:vi=0:oi=0
202 for x=1 to vn
204 v=s+vy(x)+vx(x)*40
206 if np=v then vi=x
208 if op=v then oi=x
209 next x
210 if vi=0 then t=peek(np)
212 if vi>0 then t=vs(vi)
214 if t=wa then goto 110 
220 if t<>ve then goto 225
222 gosub 5300:gosub 2400:vs(vi)=ve2:goto 240
225 if t<>ve2 then goto 230
227 gosub 5300:gosub 2400:vs(vi)=em:goto 240
230 if t<>tr then goto 235
232 gosub 5200:ld=ld+1:tt=tt-1:goto 240
235 if t=em then gosub 5100
240 if oi=0 then poke op,em
242 if oi>0 then poke op,vs(oi)
250 poke c+py+px*40,14:px=px+dx:py=py+dy
260 poke np,pl
270 poke c+py+px*40,1
280 ox = ox-1-ld
290 gosub 4000
300 if ox<=0 then goto 600
310 if tt<=0 then tc=tc+ld*10:ld=0:goto 700
320 goto 110
600 rem game over
610 for i=1 to 20:print:next
620 print spc(3);:print "game over - press fire to restart"
630 gosub 3000:restore:goto 40
700 rem game win
710 for i=1 to 20:print:next
720 print spc(3);:print "you win - press fire to restart"
730 gosub 3000:restore:goto 40
2000 rem load level
2010 print chr$(147)
2020 for x=0 to 4:print:next x
2030 read px,py,tt,vn
2040 for x=1 to vn:read vx(x),vy(x):next x
2050 for x=1 to 13:read a$
2060 print spc(5); a$:next x
2070 for x=1 to vn
2080 vs(x)=ve:poke s+vy(x)+vx(x)*40,ve
2090 next x
2100 poke s+py+px*40,pl
2110 poke c+py+px*40,1
2120 gosub 4000
2130 return
2400 ox=mox:tc=tc+ld*10:ld=0
2410 return
3000 rem wait for fire button
3010 j=peek(56320)
3020 f=j and 16
3030 if f=0 then return
3040 goto 3010
4000 rem print hud
4010 print chr$(19);:print "{rvon}score";:print" ";:print right$("00"+mid$(str$(tc),2),3);
4020 print"  ";:print "load:";:print" ";:print right$("0"+mid$(str$(ld),2),2);
4030 print"  ";:print "oxygen";:print" ";:if ox>=1 then for x=1 to int(ox/10): print ">";:next x
4040 for x=1 to (10-ox/10)+2:print" ";:next x:print"{rvof}"
4050 return
5000 rem init sound
5010 for l=54272 to 54296: poke l,0:next l 
5020 poke 54296,15
5030 poke 54277,68:poke 54278,68
5040 poke 54273,34:poke 54272,75
5050 return
5100 poke 54276,129
5110 for t=1 to 50 : next t
5120 poke 54276,128
5130 return
5200 poke 54276,17
5210 for t=1 to 50 : next t
5220 poke 54276,16
5230 return
5300 poke 54276,65
5305 poke 54275,1:poke 54274,64
5310 for t=1 to 100 : next t
5320 poke 54276,64
5330 return

6000 rem player start position, number of treasures and number of vents and their positions
6010 data 15,19,31,2,11,14,11,24 
6020 data"{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}"
6030 data"{CBM-+}{rvon}                            {rvof}{CBM-+}"
6040 data"{CBM-+}{rvon} {rvof}Z...{rvon} {rvof}.........ZZZZ{rvon} {rvof}...{rvon} {rvof}ZZZ{rvon} {rvof}{CBM-+}"
6050 data"{CBM-+}{rvon} {rvof}ZZ..{rvon} {rvof}..........ZZZ{rvon} {rvof}...{rvon} {rvof}ZZZ{rvon} {rvof}{CBM-+}"
6060 data"{CBM-+}{rvon} {rvof}Z...{rvon} {rvof}...{rvon}           {rvof}...{rvon} {rvof}ZZZ{rvon} {rvof}{CBM-+}"
6070 data"{CBM-+}{rvon} {rvof}............ZZZ.......{rvon} {rvof}..Z{rvon} {rvof}{CBM-+}"
6080 data"{CBM-+}{rvon}      {rvof}...{rvon} {rvof}....Z....{rvon} {rvof}...{rvon} {rvof}...{rvon} {rvof}{CBM-+}"
6090 data"{CBM-+}{rvon} {rvof}........{rvon} {rvof}....Z....{rvon} {rvof}..{rvon}  {rvof}...{rvon} {rvof}{CBM-+}"
6100 data"{CBM-+}{rvon} {rvof}........{rvon}    {rvof}...{rvon}    {rvof}.......{rvon} {rvof}{CBM-+}"
6110 data"{CBM-+}{rvon}      {rvof}......{rvon} {rvof}...{rvon} {rvof}..........{rvon} {rvof}{CBM-+}"
6120 data"{CBM-+}{rvon} {rvof}ZZ.........{rvon} {rvof}...{rvon} {rvof}....ZZZ...{rvon} {rvof}{CBM-+}"
6130 data"{CBM-+}{rvon}                            {rvof}{CBM-+}"
6140 data"{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}"
