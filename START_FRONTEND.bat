@echo off
echo ========================================
echo   Starting Medisync Frontend Server
echo ========================================
echo.
echo Opening frontend on http://localhost:8000
echo.
echo Press Ctrl+C to stop the server
echo ========================================
echo.

cd /d "%~dp0"
python -m http.server 8000

pause
