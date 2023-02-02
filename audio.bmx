'   Retro Audio Module
'   (c) Copyright Si Dunford, September 2022, All Rights Reserved. 
'   VERSION: 1.0

'   CHANGES:
'   19 Sep 2022  Converted to a Module
'

SuperStrict

Module retro.audio

ModuleInfo "Retro Audio Module"
ModuleInfo "Copyright Si Dunford, Sep 2022, All Rights Reserved"

ModuleInfo "Version 1.00, 19 Sep 2022"
ModuleInfo "Implemented SFXR presets using soloud"

Import Audio.AudioSDL

' Define some Alias' for Preloads. (These are defined in audio.soloud/common.bmx)
Const SFXR_SHOOT:Int 		= SFXR_LASER
Const SFXR_HIT:Int 			= SFXR_HURT
Const SFXR_SELECT:Int 		= SFXR_BLIP

SetAudioDriver("SoLoud")

Include "bin/SFXR.bmx"



