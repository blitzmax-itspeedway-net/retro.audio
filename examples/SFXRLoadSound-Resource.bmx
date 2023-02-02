' 	SFXR LoadSound( File ) Example
'   (c) Copyright Si Dunford, September 2022, All Rights Reserved. 
'   VERSION: 1.0

' This example shows how an sxfr resource file (Generated in SFXR)
' can be played using Soload SFXR

SuperStrict

Import retro.audio

AppTitle="SFXR LoadSound( Resource ) Example"
Graphics 320, 200

Local sound:TSound = SFXR.LoadSound( "powerup.sfxr" )

Repeat
    Cls
	DrawText( "Press SPACE to play sound", 5, 5 )
    If KeyHit( KEY_SPACE )
        Local channel:TChannel = AllocChannel()
		PlaySound( sound, channel )
    EndIf
    Flip
	Delay( 1 )
Until KeyHit( KEY_ESCAPE ) Or AppTerminate()

