@echo off
chcp 65001 >nul
cd /d "%~dp0"

if not exist "WaseiHarmony.exe" (
  echo [エラー] WaseiHarmony.exe が同じフォルダにありません。
  echo GitHub の Code から Download ZIP を選び、ZIPを展開してから実行してください。
  echo.
  pause
  exit /b 1
)

"WaseiHarmony.exe"
set "EXIT_CODE=%ERRORLEVEL%"

if not "%EXIT_CODE%"=="0" (
  echo.
  echo [エラー] WaseiHarmony.exe が終了コード %EXIT_CODE% で停止しました。
  echo 「起動診断.bat」を実行し、作成された startup-diagnostic.txt をお送りください。
  echo.
  pause
)
