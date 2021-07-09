@echo off
set DISPLAY_AUDIO_ID="HDAUDIO\FUNC_01&VEN_8086&DEV_2806&SUBSYS_80860101"
"%~dp0devcon.exe" disable %DISPLAY_AUDIO_ID%
timeout /t 1
"%~dp0devcon.exe" enable %DISPLAY_AUDIO_ID%