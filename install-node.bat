@echo off
setlocal enabledelayedexpansion
title Node.js Official Installer for HEOFLIX
color 0A

echo ======================================================================
echo           AUTOMATIC NODE.JS INSTALLATION SETUP FOR HEOFLIX
echo ======================================================================
echo.

where node >nul 2>nul
if %ERRORLEVEL% equ 0 (
    echo [OK] Node.js is already installed!
    node -v
    npm -v
    echo.
    echo Your system is ready. You can run 'run-windows.bat' directly.
    pause
    exit /b 0
)

echo [1/2] Downloading Node.js LTS (v20) official 64-bit Windows installer...
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $msi = [System.IO.Path]::Combine($env:TEMP, 'nodejs_setup.msi'); Write-Host 'Downloading from https://nodejs.org...'; Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.18.0/node-v20.18.0-x64.msi' -OutFile $msi; Write-Host 'Download complete. Installing silently...'; Start-Process msiexec.exe -ArgumentList '/i', $msi, '/quiet', '/qn', '/norestart' -Wait; Write-Host 'Installation finished.'"

echo.
echo [2/2] Verifying installation...
for /f "tokens=*" %%a in ('powershell -NoProfile -Command "[Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' + [Environment]::GetEnvironmentVariable('Path', 'User')"') do set "PATH=%%a"

echo ======================================================================
echo [SUCCESS] Node.js installation finished!
echo You can now launch HEOFLIX by double-clicking 'run-windows.bat'.
echo ======================================================================
echo.
pause
