# Module retro.audio
A set of tools and functions for creating retro sounds in Blitzmax

Version 1.11

# Dependencies
* [BlitzMax-NG](https://blitzmax.org/downloads/)

# Manual Install using GIT
**LINUX:**
```
    # mkdir -p ~/BlitzMax/mod/retro.mod/audio.mod
    # cd ~/BlitzMax/mod/retro.mod/audio.mod
	# git clone https://github.com/blitzmax-itspeedway-net/retro.audio.git .
    # chmod +x compile.sh
    # ./compile.sh
```
**WINDOWS:**
```
    C:\> mkdir C:\BlitzMax\mod\retro.mod\audio.mod
    C:\> cd /d C:\BlitzMax\mod\retro.mod\audio.mod
    C:\> git clone https://github.com/blitzmax-itspeedway-net/retro.audio.git .
    C:\> compile.bat
```

# MANUAL INSTALL USING ZIP
* Create a folder in your BlitzMax/mod folder called "retro.mod"
* Download ZIP file from GitHub and unzip it
* You will have a folder called retro.audio-main
* Rename this folder to audio.mod
* Copy folder audio.mod to BlitzMax/mod/retro.mod/
* Run the compile.sh or compile.bat file located in the audio.mod folder to compile

# UPDATE USING GIT
**LINUX:**
```
    # cd ~/BlitzMax/mod/retro.mod/audio.mod
    # git pull
    # chmod +x compile.sh
    # ./compile.sh
```
**WINDOWS:**
```
    C:\> cd /d C:\BlitzMax\mod\retro.mod\audio.mod
    C:\> git pull
    C:\> compile.bat
```

# Importing the module
```
import retro.audio
```

# SFXR Presets
SXFR provides 7 preset sound effects and each one has 65536 combinations. These are loaded into a TSound object using loadPreset(): 
```
Local effect:Int = Rand(0,65535)
Local sound:TSound = New TSFXRSound.LoadPreset( SFXR_EXPLOSION, effect )

Local channel:TChannel = AllocChannel()
PlaySound( sound, channel )
```

You can also create a prefix using new:
```
Local sound:TSound = New TSFXRSound( SFXR_EXPLOSION, effect )
```

The 7 available preets (and three aliases) are:

* SFXR_COIN
* SFXR_LASER
* SFXR_EXPLOSION
* SFXR_POWERUP
* SFXR_HURT
* SFXR_JUMP
* SFXR_BLIP
* SFXR_SHOOT (Alias for SFXR_LASER)
* SFXR_HIT (Alias for SFXR_HURT)
* SFXR_SELECT (Alias for SFXR_BLIP)

# SXFR Resource files

SFXR can save a sound definition to a .sfxr file. These can be loaded like this:

```
Local sound:TSound = New TSFXRSound.Load( "powerup.sfxr" )
```

They can also be loaded into a bank if you want to modify them:
```
Local bank:TBank = New TBank.Load( "powerup.sfxr" )
Local sound:TSound = New TSFXRsound.Load( bank )
```
