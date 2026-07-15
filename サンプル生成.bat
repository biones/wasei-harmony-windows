@echo off
chcp 65001 >nul
cd /d "%~dp0"
WaseiHarmony.exe --samples --max-results 3
if errorlevel 1 pause
