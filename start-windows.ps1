# HEOFLIX Sovereign Platform - PowerShell Launcher for Windows 10/11
$Host.UI.RawUI.WindowTitle = "HEOFLIX Windows Launcher"
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "          HEOFLIX SOVEREIGN DIGITAL PLATFORM - POWERSHELL RUNNER" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ""

# Check Node.js
try {
    $nodeVer = & node -v
    $npmVer = & npm -v
    Write-Host "[OK] Detected Node.js $nodeVer and npm $npmVer" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Node.js is not installed or not in PATH." -ForegroundColor Red
    Write-Host "Please download and install Node.js from https://nodejs.org/" -ForegroundColor Yellow
    Read-Host "Press Enter to exit..."
    exit 1
}

# Install dependencies if missing
if (-not (Test-Path -Path "node_modules")) {
    Write-Host "[INFO] Installing dependencies (first run)..." -ForegroundColor Yellow
    npm install
} else {
    Write-Host "[OK] Dependencies verified." -ForegroundColor Green
}

Write-Host ""
Write-Host "[INFO] Starting HEOFLIX full-stack server on http://localhost:3000..." -ForegroundColor Cyan

# Open browser
Start-Process "http://localhost:3000"

# Run server
npm run dev
