@echo off
cd /d "%~dp0"

if not exist "WaseiHarmony.exe" goto missing

"WaseiHarmony.exe"
set "EXIT_CODE=%ERRORLEVEL%"
if "%EXIT_CODE%"=="0" goto end

echo.
echo ERROR: WaseiHarmony.exe stopped with exit code %EXIT_CODE%.
echo Run diagnose.bat and send startup-diagnostic.txt to support.
echo.
pause
exit /b %EXIT_CODE%

:missing
echo ERROR: WaseiHarmony.exe is not in this folder.
echo Download the complete ZIP from GitHub and extract all files first.
echo.
pause
exit /b 1

:end
