@echo off
chcp 65001 >nul
cd /d "%~dp0"
set "LOG=startup-diagnostic.txt"

echo Wasei Harmony startup diagnostic > "%LOG%"
echo DATE: %DATE% %TIME% >> "%LOG%"
ver >> "%LOG%" 2>&1
echo ARCHITECTURE: %PROCESSOR_ARCHITECTURE% >> "%LOG%"
echo WORKING_DIRECTORY: %CD% >> "%LOG%"
echo. >> "%LOG%"

if not exist "WaseiHarmony.exe" (
  echo EXE_STATUS: MISSING >> "%LOG%"
  echo WaseiHarmony.exe が同じフォルダにありません。
  echo GitHub の Code から Download ZIP を選び、ZIPを展開してから実行してください。
  echo.
  type "%LOG%"
  pause
  exit /b 1
)

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
echo startup-diagnostic.txt が作成されました。このファイルをお送りください。
pause
