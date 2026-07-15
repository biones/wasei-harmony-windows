@echo off
chcp 65001 >nul
cd /d "%~dp0"
WaseiHarmony.exe
if errorlevel 1 pause
