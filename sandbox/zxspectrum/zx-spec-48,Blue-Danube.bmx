SuperStrict
' ZX Spectrum 48, Blue Danube by Johann Strauss (1825-1899)

Include "bin/zxspectrum.bmx"

Const Semibreve:Float =  1.0000
Const Minim:Float =      0.5000
Const Crotchet:Float =   0.2500
Const Quaver:Float =     0.1250
Const Semiquaver:Float = 0.0625
Const Rest:Float = 		 $FFFF

Print( "Blue Danube" )
Print( "Johann Strauss (1825-1899)" )

Local duration:Float, note:Float, pitch:Float
Local tempo:Int, timesig:Int[2]

ReadData tempo, timesig[0], timesig[1]
Local beat:Float = 60.0/Float( tempo )	' beat length in ms

While True
	ReadData note, pitch
	If note=$FFFF Exit
	duration = beat * 1/(1/note/timesig[1])
	'Print( duration )
	If pitch=Rest
		'Print( "Rest,"+duration )
		Local silence:Int = MilliSecs()+1000*duration
		Repeat Until MilliSecs()>silence
	Else
		' Calculate note duration using time signature
		BEEP( duration, pitch )
	End If
Wend


#BlueDanube
'https://www.pinterest.co.uk/pin/77405687328732202/
DefData Moderato	'# Tempo
DefData 3,4			'# Time Signature
'Page1
DefData Crotchet,	C4, 	Crotchet,	E4, 		Crotchet,	G4
DefData Crotchet,	G4, 	Crotchet, 	Rest, 		Crotchet,	G4
DefData Crotchet,	G4, 	Crotchet,	Rest,		Crotchet,	E4
DefData Crotchet,	E4, 	Crotchet,	Rest,		Crotchet,	C4
DefData Crotchet,	C4, 	Crotchet,	E4, 		Crotchet,	G4

DefData Crotchet,	G4, 	Crotchet, 	Rest, 		Crotchet,	G4
DefData Crotchet,	G4, 	Crotchet,	Rest,		Crotchet,	F4
DefData Crotchet,	F4, 	Crotchet,	Rest,		Crotchet,	B3
DefData Crotchet,	B3, 	Crotchet,	D4,			Crotchet,	A4

DefData Crotchet,	A4, 	Crotchet, 	Rest, 		Crotchet,	A4
DefData Crotchet,	A4, 	Crotchet,	Rest,		Crotchet,	F4
DefData Crotchet,	F4, 	Crotchet,	Rest,		Crotchet,	B3
DefData Crotchet,	B3, 	Crotchet,	D4,			Crotchet,	A4

DefData Crotchet,	A4, 	Crotchet, 	Rest, 		Crotchet,	A4
DefData Crotchet,	A4, 	Crotchet,	Rest,		Crotchet,	G4
DefData Crotchet,	G4, 	Crotchet,	Rest,		Crotchet,	C4
DefData Crotchet,	C4, 	Crotchet,	E4,			Crotchet,	G4

DefData Crotchet,	C5, 	Crotchet, 	Rest, 		Crotchet,	C5
DefData Crotchet,	C5, 	Crotchet,	Rest,		Crotchet,	G4
DefData Crotchet,	G4, 	Crotchet,	Rest,		Crotchet,	C4
DefData Crotchet,	C4, 	Crotchet,	E4,			Crotchet,	G4
'Page2
DefData Crotchet,	C5, 	Crotchet, 	Rest, 		Crotchet,	C5
DefData Crotchet,	C5, 	Crotchet,	Rest,		Crotchet,	A4
DefData Crotchet,	A4, 	Crotchet,	Rest,		Crotchet,	D4
DefData Crotchet,	D4, 	Crotchet,	F4,			Crotchet,	A4

DefData 0.75,		A4
DefData Crotchet,	A4, 	Crotchet,	F4_SH,		Crotchet,	G4
DefData 0.75,		E5
DefData Crotchet,	E5, 	Crotchet,	C5,			Crotchet,	E4

DefData Minim,		E4, 	Crotchet, 	D4
DefData Minim,		A4, 	Crotchet,	G4
DefData 0.375,		C4, 	Quaver,		C4,			Crotchet,	C4
DefData 0.625,		C4, 	0.375,		Rest,		Quaver,		Rest

DefData $FFFF, 0
