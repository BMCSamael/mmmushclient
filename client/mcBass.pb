EnableExplicit
XIncludeFile "e:\old\lc\lua.pbi"
XIncludeFile "e:\old\aa\bass.pbi"
DeclareCDLL audio_stop(*l)
Global *ls.l ;lua state
Global volume.f
Global pan.f

DeclareCDLL audio_play(*l)
Structure sound
file.s
id.l
EndStructure

Structure luaL_reg
name.l
*func.l
EndStructure
ProcedureCDLL audio_volume(*l)
Protected arg = luaL_checkint(*l, 1)
volume = arg/100.0
ProcedureReturn 1
EndProcedure
ProcedureCDLL audio_pan(*l)
Protected arg = luaL_checkint(*l, 1)
pan = arg/100.0
ProcedureReturn 1
EndProcedure
ProcedureCDLL audio_free(*l)
bass_free()
ProcedureReturn 1
EndProcedure
Global Dim table.luaL_reg(5)
ProcedureDLL AttachProcess(instance)
volume=1
pan=0
table(0)\name = @"play"
table(0)\func = @audio_play()
table(1)\name=@"stop"
table(1)\func=@audio_stop()
table(2)\name = @"volume"
table(2)\func = @audio_volume()
table(3)\name = @"pan"
table(3)\func = @audio_pan()
table(4)\name=@"free"
table(4)\func=@audio_free()
Global NewList soundList.sound()
EndProcedure
ProcedureCDLL audio_stop(*l)
Protected arg = luaL_checkint(*l, 1)
If arg = 0 ;stop all sounds
ForEach soundList()
If BASS_ChannelIsActive(soundList()\id) = #BASS_ACTIVE_PLAYING
BASS_ChannelStop(soundList()\id)
DeleteElement(soundList())
EndIf
Next
Else
If BASS_ChannelIsActive(arg) = #BASS_ACTIVE_PLAYING
BASS_ChannelStop(arg)
EndIf
EndIf
EndProcedure

ProcedureCDLL luaopen_audio(*l)
Protected result
result = BASS_Init(-1, 44100, 0, 0, 0)
;todo error check result here and do something

luaL_register(*l, "audio", @table(0))
*ls = *l
ProcedureReturn 1
EndProcedure
ProcedureCDLL  audio_play(*l)
Protected id = -1
Protected *filename = luaL_checkstring(*l, 1)
Protected file.s = PeekS(*filename)
Protected loop.l = LuaL_checkint(*l, 2)
ForEach soundList()
If BASS_ChannelIsActive(soundList()\id) = #BASS_ACTIVE_STOPPED
DeleteElement(soundList())
EndIf
Next ;end of loop that deletes finished sounds
If id = -1

Protected streamHandle = BASS_StreamCreateFile(0, *filename, 0, 0, #BASS_STREAM_AUTOFREE)
;if it didn't load, return 0 and exit.
If Not streamHandle
lua_pushnumber(*l, 0)
ProcedureReturn 1
EndIf ;not loadResult
id = streamHandle
AddElement(soundList())
soundList()\file = file
soundList()\id = streamHandle
EndIf ;wasn't loaded before
BASS_ChannelSetAttribute(streamHandle, #BASS_ATTRIB_PAN, pan)
BASS_ChannelSetAttribute(streamHandle, #BASS_ATTRIB_VOL, volume)
If loop
BASS_ChannelFlags(streamHandle, #BASS_SAMPLE_LOOP, #BASS_SAMPLE_LOOP)
EndIf
BASS_ChannelPlay(streamHandle, 0)
lua_pushnumber(*l, streamHandle)
ProcedureReturn 1
EndProcedure
ProcedureCDLL DetachProcess(Instance)
;this doesn't work? todo
;lua_close(*ls)
ProcedureReturn 1
EndProcedure
; IDE Options = PureBasic 4.51 (Windows - x86)
; ExecutableFormat = Shared Dll
; CursorPosition = 6
; Folding = v+
; EnableThread
; EnableXP
; Executable = C:\Mush-Z\audio.dll