@echo off
setlocal enabledelayedexpansion
title HEOFLIX Sovereign Platform - Windows Launcher
color 0B

echo ======================================================================
echo           HEOFLIX SOVEREIGN DIGITAL PLATFORM - WINDOWS RUNNER
echo ======================================================================
echo.
echo [1/4] Checking Node.js environment on Windows...

where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    color 0E
    echo [NOTICE] Node.js is not yet installed on this PC.
    echo [INFO] Automatically downloading and installing official Node.js LTS...
    echo.
    
    where winget >nul 2>nul
    if !ERRORLEVEL! equ 0 (
        echo [INFO] Installing Node.js LTS via Windows Package Manager (winget)...
        winget install --id OpenJS.NodeJS.LTS -e --silent --accept-source-agreements --accept-package-agreements
    ) else (
        echo [INFO] Downloading official Node.js LTS 64-bit installer...
        powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $installer = [System.IO.Path]::Combine($env:TEMP, 'nodejs_setup.msi'); Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.18.0/node-v20.18.0-x64.msi' -OutFile $installer; Start-Process msiexec.exe -ArgumentList '/i', $installer, '/quiet', '/qn', '/norestart' -Wait"
    )
    
    REM Refresh PATH for the current terminal session
    for /f "tokens=*" %%a in ('powershell -NoProfile -Command "[Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' + [Environment]::GetEnvironmentVariable('Path', 'User')"') do set "PATH=%%a"
    
    where node >nul 2>nul
    if !ERRORLEVEL! neq 0 (
        color 0A
        echo.
        echo [SUCCESS] Node.js installation package completed!
        echo Please restart this run-windows.bat file to load the new Node.js PATH.
        echo.
        pause
        exit /b 0
    )
    echo [OK] Node.js installed and configured successfully!
    color 0B
)

for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
for /f "tokens=*" %%i in ('npm -v') do set NPM_VERSION=%%i
echo [OK] Detected Node.js !NODE_VERSION! and npm !NPM_VERSION! on Windows.
echo.

echo [2/4] Checking dependencies...
if not exist "node_modules\" (
    echo [INFO] First time setup detected. Installing npm dependencies...
    call npm install
    if %ERRORLEVEL% neq 0 (
        echo [ERROR] Failed to install dependencies. Check your internet connection.
        pause
        exit /b 1
    )
) else (
    echo [OK] Dependencies already installed.
)
echo.

echo [3/4] Launching HEOFLIX Full-Stack Server on port 3000...
echo Server running at: http://localhost:3000
echo.

REM Automatically open default browser after 3 seconds in the background
start "" cmd /c "timeout /t 3 /nobreak >nul & start http://localhost:3000"

echo [4/4] Starting Node.js / Express / Vite daemon...
echo Press Ctrl+C at any time to stop the server.
echo ======================================================================
echo.

call npm run dev

pause
