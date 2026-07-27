@echo off
cd /d "%~dp0"
set "LOG=startup-diagnostic.txt"

echo Wasei Harmony startup diagnostic > "%LOG%"
echo DATE: %DATE% %TIME% >> "%LOG%"
ver >> "%LOG%" 2>&1
echo ARCHITECTURE: %PROCESSOR_ARCHITECTURE% >> "%LOG%"
echo WORKING_DIRECTORY: %CD% >> "%LOG%"
echo. >> "%LOG%"

if not exist "WaseiHarmony.exe" goto missing

echo EXE_STATUS: FOUND >> "%LOG%"
dir "WaseiHarmony.exe" >> "%LOG%" 2>&1
echo. >> "%LOG%"
certutil -hashfile "WaseiHarmony.exe" SHA256 >> "%LOG%" 2>&1
echo. >> "%LOG%"
"WaseiHarmony.exe" --version >> "%LOG%" 2>&1
set "EXIT_CODE=%ERRORLEVEL%"
echo EXIT_CODE: %EXIT_CODE% >> "%LOG%"
type "%LOG%"
echo.
echo Send startup-diagnostic.txt to support.
pause
exit /b %EXIT_CODE%

:missing
echo EXE_STATUS: MISSING >> "%LOG%"
type "%LOG%"
echo.
echo ERROR: WaseiHarmony.exe is not in this folder.
echo Download the complete ZIP from GitHub and extract all files first.
pause
exit /b 1
