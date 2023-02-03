'   Retro Audio Examples
'   (c) Copyright Si Dunford, FEB 2023, All Rights Reserved. 
'   VERSION: 1.0

' This example is taken from ZX Spectrum source code found here:
' https://worldofspectrum.org/ZXBasicManual/zxmanchap19.html

' (The syntax error in line 90 has been fixed below)

Rem ZX SPECTRUM CODE
10 PRINT "Frere Gustav"
20 BEEP 1,0: BEEP 1,2: BEEP .5,3: BEEP.5,2: BEEP 1,0
30 BEEP 1,0: BEEP 1,2: BEEP .5,3: BEEP.5,2: BEEP 1,0
40 BEEP 1,3: BEEP 1,5: BEEP 2,7
50 BEEP 1,3: BEEP 1,5: BEEP 2,7
60 BEEP .75,7: BEEP .25,8: BEEP .5,7: BEEP .5,5:BEEP .5,3: 
	   BEEP.5,2: BEEP 1,0
70 BEEP .75,7: BEEP .25,8: BEEP .5,7: BEEP .5,5: BEEP .5,3: BEEP .5,2: 
	   BEEP 1,0
80 BEEP 1,0: BEEP 1,-5: BEEP 2,0
90 BEEP 1,0: BEEP 1,-5: BEEP 2,0
End Rem	

SuperStrict

Import "bin/zxspectrum.bmx"

Print "Frere Gustav"
BEEP 1,0; 	BEEP 1,2;	BEEP .5,3;	BEEP.5,2;	BEEP 1,0
BEEP 1,0; 	BEEP 1,2;	BEEP .5,3;	BEEP.5,2;	BEEP 1,0
BEEP 1,3; 	BEEP 1,5;	BEEP 2,7
BEEP 1,3; 	BEEP 1,5;	BEEP 2,7
BEEP .75,7; BEEP .25,8;	BEEP .5,7;	BEEP .5,5;	BEEP .5,3
	BEEP.5,2;	BEEP 1,0
BEEP .75,7; BEEP .25,8;	BEEP .5,7;	BEEP .5,5;	BEEP .5,3;	BEEP .5,2
	BEEP 1,0
BEEP 1,0;	BEEP 1,-5;	BEEP 2,0
BEEP 1,0;	BEEP 1,-5;	BEEP 2,0
Input

