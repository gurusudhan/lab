@echo off
set SLOW_WIFI_ID="USB\VID_148F&PID_5372"
"%~dp0devcon.exe" disable %SLOW_WIFI_ID%
