' 	SFXR LoadPreset() Example
'   (c) Copyright Si Dunford, September 2022, All Rights Reserved. 
'   VERSION: 1.1

SuperStrict

Import retro.audio

AppTitle="SFXR LoadPreset() Example"
Graphics 320, 200
Global preset:Int = 0

Function play( effect:Int )
	preset = Rand(0,65535)
	Local channel:TChannel = AllocChannel()
	Local sound:TSound = New TSFXRsound( effect, preset )
	PlaySound( sound, channel )
End Function

Repeat
    Cls
	
	DrawText( "1.  SFXR_COIN", 5, 5 )
	DrawText( "2.  SFXR_LASER", 5, 20 )
	DrawText( "3.  SFXR_EXPLOSION", 5, 35 )
	DrawText( "4.  SFXR_POWERUP", 5, 50 )
	DrawText( "5.  SFXR_HURT", 5, 65 )
	DrawText( "6.  SFXR_JUMP", 5, 80 )
	DrawText( "7.  SFXR_BLIP", 5, 95 )
	DrawText( "ESC Exit", 5, 110 )
	DrawText( "LAST PLAYED: "+preset, 5, 180 )
	
    If KeyHit( KEY_1 ); play( SFXR_COIN )
    If KeyHit( KEY_2 ); play( SFXR_LASER )
    If KeyHit( KEY_3 ); play( SFXR_EXPLOSION )
    If KeyHit( KEY_4 ); play( SFXR_POWERUP )
    If KeyHit( KEY_5 ); play( SFXR_HURT )
    If KeyHit( KEY_6 ); play( SFXR_JUMP )
    If KeyHit( KEY_7 ); play( SFXR_BLIP )

    Flip
	Delay( 1 )
Until KeyHit( KEY_ESCAPE ) Or AppTerminate()

