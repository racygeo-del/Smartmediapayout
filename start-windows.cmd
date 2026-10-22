@echo off
REM HEOFLIX Windows Fast Production Launcher
echo Starting HEOFLIX on Windows...
where node >nul 2>nul || ( echo Install Node.js from https://nodejs.org & pause & exit /b 1 )
if not exist "node_modules\" call npm install
start "" http://localhost:3000
call npm run dev
