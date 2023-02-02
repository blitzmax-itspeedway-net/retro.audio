'   SFXR.bmx
'   (c) Copyright Si Dunford, September 2022, All Rights Reserved. 
'   VERSION: 1.0

'   CHANGES:
'   19 Sep 2022  Converted to a Module
'

' Extend type TSoloudSound to provide a namespace we can use in our code
Type SFXR Extends TSoloudSound

	Function LoadPreset:TSound( preset:Int, seed:Int )
		Local this:TSoloudSound = New TSoloudSound
		Local sound:TSLSfxrPlus = New TSLSfxrPlus
		If sound
			Local error:Int = sound.loadPreset( preset, seed )
			this._sound = sound
		End If
		Return this
	End Function

	Function LoadSound:TSound( bank:TBank, copy:Int = False, takeOwnership:Int = True )
		Local this:TSoloudSound = New TSoloudSound
		Local sound:TSLSfxrPlus = New TSLSfxrPlus
		If sound
			Local error:Int = sound.loadMem( BankBuf(bank), Int(BankSize(bank)), copy, takeOwnership )
			this._sound = sound
		End If
		Return this
	End Function

	' This is a modified version of TSoloudSound.LoadSound()
	Function LoadSound:TSound( url:Object, loopFlag:Int = 0 )
		Local this:TSoloudSound = New TSoloudSound
		Local sound:TSLLoadableAudioSource = New TSLSfxr
		If sound; this._sound = sound

		' Commented out because I do not know if we need these at this point
		'If loopFlag & SOUND_LOOP; this.isLooped = True	
		'If loopFlag & SOLOUD_SOUND_PAUSE_INAUDIBLE; this.pauseInaudible = True

		Local stream:TStream
		If String(url)
			stream = ReadStream(url)
			If Not stream; Return Null
		Else If TStream(url)
			stream = TStream(url)
		End If
			
		If stream
			If Not sound
				this._sound = TryLoadSound(stream, loopFlag)				
				If Not this._sound; Return Null
				Return this
			End If
			
			If sound
				Local res:Int = sound.loadStream(stream)
				If res; Return Null			
				Return this
			End If
		End If
		
		Return this
	End Function
End Type

' We Extends type TSLSfxr because it does not include the SFXR functionality
' that we need to provide LoadPreset()

Type TSLSfxrPlus Extends TSLSfxr

	Method LoadPreset:Int( preset:Int, seed:Int )
		Local res:Int = sfxr_loadPreset( asPtr, preset, seed )
		Return res
	End Method
	
End Type


