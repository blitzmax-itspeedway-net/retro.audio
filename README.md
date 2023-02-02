# Module retro.audio
A set of tools and functions for creating retro sounds in Blitzmax

Version 1.0

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

# Playing an SFXR Preset
```
Local preset:Int = Rand(0,65535)
Local channel:TChannel = AllocChannel()
Local sound:TSound = SFXR.LoadPreset( effect, preset )
PlaySound( sound, channel )
```

You can also load all your preset TSounds in advance and simply play them

# SFXR Presets

SFXR_COIN
SFXR_LASER
SFXR_EXPLOSION
SFXR_POWERUP
SFXR_HURT
SFXR_JUMP
SFXR_BLIP
SFXR_SHOOT  (Alias for SFXR_LASER)
SFXR_HIT	(Alias for SFXR_HURT)
SFXR_SELECT	(Alias for SFXR_BLIP)


