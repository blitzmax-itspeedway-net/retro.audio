'   SFXR.bmx
'   (c) Copyright Si Dunford, September 2022, All Rights Reserved. 
'   VERSION: 1.1

'   CHANGES:
'   19 Sep 2022  1.0  Converted to a Module
'	03 Feb 2023  1.1  Modified SXFR factory into TSFXRSound to allow type creation

Type TSFXRSound Extends TSoloudSound	' Which extends TSound

	Method LoadPreset:TSFXRSound( preset:Int, seed:Int )
		_sound = New TSLSfxrPlus
		If _sound; TSLSfxrPlus(_sound).loadPreset( preset, seed )
		Return Self
	End Method
	
	Method Load:TSFXRSound( bank:TBank, copy:Int = False, takeOwnership:Int = True )
		_sound = New TSLSfxrPlus
		If _sound; TSLSfxrPlus(_sound).loadMem( BankBuf(bank), Int(BankSize(bank)), copy, takeOwnership )
		Return Self
	End Method

	' This is a modified version of TSoloudSound.Load()
	Method Load:TSFXRSound( url:Object, loopFlag:Int = 0 )
		Local sound:TSLLoadableAudioSource = New TSLSfxr
		If sound; _sound = sound

		If loopFlag & SOUND_LOOP; isLooped = True	
		If loopFlag & SOLOUD_SOUND_PAUSE_INAUDIBLE; pauseInaudible = True

		Local stream:TStream
		If String(url)
			stream = ReadStream(url)
			If Not stream; Return Null
		Else If TStream(url)
			stream = TStream(url)
		End If
			
		If stream
			If Not sound
				_sound = TryLoadSound(stream, loopFlag)				
				If Not _sound; Return Null
				Return Self
			End If
			
			If sound And sound.loadStream(stream); Return Null		
		End If
		
		Return Self
	End Method
	
End Type

' We extend type TSLSfxr because it does not include the SFXR functionality
' that we need to provide LoadPreset()

Type TSLSfxrPlus Extends TSLSfxr

	Method LoadPreset:Int( preset:Int, seed:Int )
		Local res:Int = sfxr_loadPreset( asPtr, preset, seed )
		Return res
	End Method
	
End Type


