'# ZX Spectrum 16K/48K retro sound
'# (c) Copyright Si Dunford, February 2021, All Rights Reserved
'# Version 1.0

Rem ** CHANGELOG **
 3 FEB 2021 - First Version of BEEP()
 4 FEB 2021 - Moved BEEP() into retroaudio.zspectrum.bmx
			  Added note constants C3 to B4
End Rem

Rem ** KNOWN ISSUES **
- Notes C0 to B2 + C6 and above are missing
- Tempo needs expanding and putting in a seperate file for all modules.
	IT IS NOT USED IN HERE
- OUT254() needs to be implemented
- BEEP() should really call OUT254() 
- Need to stop producing Square wave and use TControl to emulate Buzzer
End Rem

Const MIDDLE_C_FREQ:Float = 262.0 'Hz

' TEMPO
Const Moderato:Int = 114

' ZX Spectrum 16K/48K Pitch is in semitones above middle C. The following constants have been
' defined for ease of use, but you can create notes slightly off-key by adding decimals.

' NOTES TO PITCH
Const C3:Float = 	-12
Const C3_SH:Float = -11
Const D3_FL:Float = -11
Const D3:Float =	-10
Const D3_SH:Float = -9
Const E3_FL:Float = -9
Const E3:Float =	-8
Const F3:Float =	-7
Const F3_SH:Float = -6
Const G3_FL:Float = -6
Const G3:Float =	-5
Const G3_SH:Float = -4
Const A3_FL:Float = -4
Const A3:Float =	-3
Const A3_SH:Float = -2
Const B3_FL:Float = -2
Const B3:Float =	-1

Const C4:Float = 	0
Const C4_SH:Float = 1
Const D4_FL:Float = 1
Const D4:Float =	2
Const D4_SH:Float = 3
Const E4_FL:Float = 3
Const E4:Float =	4
Const F4:Float =	5
Const F4_SH:Float = 6
Const G4_FL:Float = 6
Const G4:Float =	7
Const G4_SH:Float = 8
Const A4_FL:Float = 8
Const A4:Float =	9
Const A4_SH:Float = 10
Const B4_FL:Float = 10
Const B4:Float =	11

Const C5:Float = 	12
Const C5_SH:Float = 13
Const D5_FL:Float = 13
Const D5:Float =	14
Const D5_SH:Float = 15
Const E5_FL:Float = 15
Const E5:Float =	16
Const F5:Float =	17
Const F5_SH:Float = 18
Const G5_FL:Float = 18
Const G5:Float =	19
Const G5_SH:Float = 20
Const A5_FL:Float = 20
Const A5:Float =	21
Const A5_SH:Float = 22
Const B5_FL:Float = 22
Const B5:Float =	23

' ZX Spectrum 16K/48K Beep command uses a Square Wave
' Duration is in Seconds and Pitch is in Semitones from Middle C (C4)
' Therefore PItch 0 = C4, 1=C4#, 2=D4, 3=D4#, 4=E4, 5=F4 etc
' I have guessed the samplerate to be 3000 and fixed the volume at 1.0
Function BEEP( duration:Float, pitch:Float ) 
	' Create an Audio Sample
	Local samplerate:Int = 11250 'Hz (Estimated)
	Local amplitude:Float = 1.0		' Volume
	Local samples:Int = samplerate * duration
	Local audiosample:TAudioSample = CreateAudioSample( samples, samplerate, SF_MONO8 )
	
	' Convert Pitch to Frequency
	Local frequency:Float = MIDDLE_C_FREQ * 2.0^(pitch/12.0)
	 
	' Generate a Square Wave
	Local time:Float = 0.0
	Local delta:Float = 1.0/samplerate
	Local square:Float
	For Local sample:Int = 0 Until samples
		Local value:Float = Sin( 360 * frequency * time ) * amplitude *100
		'If value>=0 
		'	square = amplitude
		'Else
		'	square = -amplitude
		'End If
		'audiosample.samples[sample] = square
		audiosample.samples[sample] = value
		time :+ delta
	Next	
	
	' Play the sound sample
	Local audio:TSound=LoadSound( audiosample, False ) ' Load but do not loop
	Local channel:TChannel = PlaySound( audio )
	While ChannelPlaying( channel )
	Wend
End Function

'beep( 1, E5 )