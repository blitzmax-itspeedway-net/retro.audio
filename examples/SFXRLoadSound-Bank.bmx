' 	SFXR LoadSound( TBank ) Example
'   (c) Copyright Si Dunford, September 2022, All Rights Reserved. 
'   VERSION: 1.0

' This example shows how an SFXR resource file can be loaded from a TBank

SuperStrict

Import retro.audio

AppTitle="SFXR LoadSound( TBank ) Example"
Graphics 320, 200

Local bank:TBank = New TBank.Load( "powerup.sfxr" )
Local sound:TSound = SFXR.LoadSound( bank )

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

