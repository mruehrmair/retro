10 rem screen codes and adresses 
20 s=1024:c=55296:pl=81:wa=160:tr=90:ve=15:em=46:vf=87
30 gosub 1020
40 rem game variables
50 dim vx(9),vy(9),vv(9):nl=2
60 mox=100:ox=mox:tc=0:ld=0:lv=1:li$=""
70 print chr$(147):forx=0 to 10:print:next x
80 print spc(13):print"oxygen sweep"
90 print:print spc(11):print"press fire to play"
100 gosub 800
110 gosub 550
120 gosub 640
130 rem --- main loop
140 j=peek(56320)
150 dx=0:dy=0
160 if(j and 1)=0 then dy=-1
170 if(j and 2)=0 then dy=1
180 if(j and 4)=0 then dx=-1
190 if(j and 8)=0 then dx=1
200 if dx=0 and dy=0 then 130
210 rem player movement
220 op=s+px+py*40:np=s+px+dx+(py+dy)*40:p=peek(np)     
230 if p=wa then goto 130 
240 if p=ve then gosub 1160:gosub 780
250 if p=vf then gosub 1160:gosub 780
260 if p=tr then gosub 1120:ld=ld+1:tt=tt-1
270 if p=em then gosub 1080
280 vk=-1:vm=-1
290 for x=1 to vn
300 v=s+vx(x)+vy(x)*40
310 if op=v then vk=v:vm=x
320 next x
330 if vk<>op then poke op,em:goto 370
340 if vk=op and vv(vm)=1 then poke op,vf
350 if vk=op and vv(vm)=2 then poke op,em
360 if vk=op and vv(vm)=1 then vv(vm)=2
370 poke c+px+py*40,14:px=px+dx:py=py+dy
380 poke np,pl
390 poke c+px+py*40,1
400 ox = ox-1-int(ld/2)
410 gosub 950
420 if ox<=0 then goto 450
430 if tt<=0 then tc=tc+ld*10:ld=0:goto 490
440 goto 130
450 rem game over
460 for i=1 to 20:print:next
470 print spc(3);:print "game over - press fire to restart"
480 gosub 910:restore:goto 60
490 rem game win
500 gosub 780:gosub 950
510 for i=1 to 20:print:next
520 print "you win - press fire to start next level"
530 gosub 910:lv=lv+1:if lv>nl then lv=1:restore
540 goto 120
550 rem position read pointer to level lv
560 restore
570 if lv=1 then return
580 for l=1 to lv-1
590 read xx,yy,tz,vz
600 for i=1 to vz:read xx,yy:next i
610 for i=1 to 13:read a$:next i
620 next l
630 return
640 rem load level
650 print chr$(147)
660 for x=0 to 4:print:next x
670 read px,py,tt,vn
680 for x=1 to vn:read vx(x),vy(x):vv(x)=1:next x
690 for x=1 to 13:read a$
700 print spc(5); a$:next x
710 for x=1 to vn
720 poke s+vx(x)+vy(x)*40,ve
730 next x
740 poke s+px+py*40,pl
750 poke c+px+py*40,1
760 gosub 950
770 return
780 ox=mox:tc=tc+ld*10:ld=0
790 return
800 rem optional level input, fire starts
810 li$=""
820 get li$
830 if li$>="1" and li$<="9" then lv=asc(li$)-48: if lv>nl then lv=1
840 gosub 870
850 if f=0 then return
860 goto 820
870 rem poll fire button
880 j=peek(56320)
890 f=(j and 16)
900 return
910 rem wait for fire button
920 gosub 870
930 if f<>0 then 920
940 return
950 rem print hud
960 print chr$(19);:print "{rvon}lv:";:print chr$(48+lv);:print" ";
970 print "score:";:print right$("00"+mid$(str$(tc),2),3);
980 print" ";:print "ld:";:print right$("0"+mid$(str$(ld),2),2);
990 print" ";:print "oxygen:";:if ox>=1 then for x=1 to int(ox/10): print ">";:next x
1000 for x=1 to (10-ox/10)+2:print" ";:next x:print"{rvof}"
1010 return
1020 rem init sound
1030 for l=54272 to 54296: poke l,0:next l 
1040 poke 54296,15
1050 poke 54277,68:poke 54278,68
1060 poke 54273,34:poke 54272,75
1070 return
1080 poke 54276,129
1090 for t=1 to 50 : next t
1100 poke 54276,128
1110 return
1120 poke 54276,17
1130 for t=1 to 50 : next t
1140 poke 54276,16
1150 return
1160 poke 54276,65
1170 poke 54275,1:poke 54274,64
1180 for t=1 to 100 : next t
1190 poke 54276,64
1200 return
1210 rem player start position, number of treasures and number of vents and their positions
1220 data 19,16,31,2,14,12,30,13
1230 data"{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}"
1240 data"{CBM-+}{rvon}                            {rvof}{CBM-+}"
1250 data"{CBM-+}{rvon} {rvof}Z...{rvon} {rvof}.........ZZZZ{rvon} {rvof}...{rvon} {rvof}ZZZ{rvon} {rvof}{CBM-+}"
1260 data"{CBM-+}{rvon} {rvof}ZZ..{rvon} {rvof}..........ZZZ{rvon} {rvof}...{rvon} {rvof}ZZZ{rvon} {rvof}{CBM-+}"
1270 data"{CBM-+}{rvon} {rvof}Z...{rvon} {rvof}...{rvon}           {rvof}...{rvon} {rvof}ZZZ{rvon} {rvof}{CBM-+}"
1280 data"{CBM-+}{rvon} {rvof}............ZZZ.......{rvon} {rvof}..Z{rvon} {rvof}{CBM-+}"
1290 data"{CBM-+}{rvon}      {rvof}...{rvon} {rvof}....Z....{rvon} {rvof}...{rvon} {rvof}...{rvon} {rvof}{CBM-+}"
1300 data"{CBM-+}{rvon} {rvof}........{rvon} {rvof}....Z....{rvon} {rvof}..{rvon}  {rvof}...{rvon} {rvof}{CBM-+}"
1310 data"{CBM-+}{rvon} {rvof}........{rvon}    {rvof}...{rvon}    {rvof}.......{rvon} {rvof}{CBM-+}"
1320 data"{CBM-+}{rvon}      {rvof}......{rvon} {rvof}...{rvon} {rvof}..........{rvon} {rvof}{CBM-+}"
1330 data"{CBM-+}{rvon} {rvof}ZZ.........{rvon} {rvof}...{rvon} {rvof}....ZZZ...{rvon} {rvof}{CBM-+}"
1340 data"{CBM-+}{rvon}                            {rvof}{CBM-+}"
1350 data"{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}"
1360 data 7,16,18,2,11,9,32,8
1370 data"{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}"
1380 data"{CBM-+}{rvon}                            {rvof}{CBM-+}"
1390 data"{CBM-+}{rvon} {rvof}.......{rvon} {rvof}ZZZZ{rvon} {rvof}.............{rvon} {rvof}{CBM-+}"
1400 data"{CBM-+}{rvon} {rvof}.{rvon} {rvof}.....{rvon} {rvof}.ZZ.{rvon} {rvof}.............{rvon} {rvof}{CBM-+}"
1410 data"{CBM-+}{rvon} {rvof}.{rvon} {rvof}..{rvon} {rvof}..{rvon} {rvof}.ZZ.{rvon} {rvof}.............{rvon} {rvof}{CBM-+}"
1420 data"{CBM-+}{rvon} {rvof}.{rvon} {rvof}..{rvon} {rvof}.Z{rvon} {rvof}....{rvon} {rvof}.............{rvon} {rvof}{CBM-+}"
1430 data"{CBM-+}{rvon} {rvof}.{rvon} {rvof}..{rvon} {rvof}.Z{rvon} {rvof}....{rvon} {rvof}.............{rvon} {rvof}{CBM-+}"
1440 data"{CBM-+}{rvon} {rvof}.{rvon} {rvof}..{rvon} {rvof}.Z{rvon} {rvof}....{rvon} {rvof}.............{rvon} {rvof}{CBM-+}"
1450 data"{CBM-+}{rvon} {rvof}.{rvon} {rvof}ZZ{rvon} {rvof}.Z{rvon} {rvof}....{rvon} {rvof}.............{rvon} {rvof}{CBM-+}"
1460 data"{CBM-+}{rvon} {rvof}.{rvon} {rvof}ZZ{rvon} {rvof}..{rvon} {rvof}....{rvon} {rvof}.............{rvon} {rvof}{CBM-+}"
1470 data"{CBM-+}{rvon} {rvof}.{rvon} {rvof}ZZ......................{rvon} {rvof}{CBM-+}"
1480 data"{CBM-+}{rvon}                            {rvof}{CBM-+}"
1490 data"{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}"
