# HEOFLIX Sovereign Platform - Windows Quickstart & Extraction Guide

Welcome to the Windows distribution of HEOFLIX! This package has been configured and pre-packaged for seamless execution on **Windows 10, Windows 11, and Windows Server**.

---

## 🚀 Quick Start (1-Click Run)

1. **Prerequisite**: Ensure you have **Node.js v18, v20, or v22 LTS** installed.
   - Download free from: [https://nodejs.org/](https://nodejs.org/)
2. **Double-click `run-windows.bat`** in this folder.
   - The script will automatically verify your environment, install dependencies on first launch, start the local server on `http://localhost:3000`, and launch your default browser!

---

## ⚡ Alternative Run Methods

### PowerShell (Windows 10 / 11)
Open PowerShell in this directory and execute:
```powershell
powershell -ExecutionPolicy Bypass -File .\start-windows.ps1
```

### Standard Command Prompt (`cmd.exe`)
```cmd
run-windows.bat
```
Or manually:
```cmd
npm install
npm run dev
```

---

## 📦 App Extraction Feature

You can extract or re-bundle this entire application anytime:
- **From CLI**: Run `npm run extract` to generate an updated portable `.zip` and standalone `extracted-app/` directory.
- **From Web UI**: Click the **Extract App** button in the top navigation bar to download the complete standalone zip archive directly to your Windows Downloads folder.

---

## 🛠️ Features Included

- **Vite + React 19 Frontend with Tailwind CSS**
- **Full-Stack Node.js Express Server (`server.ts`)**
- **BlockCypher Real-Time Bitcoin Mainnet Integration**
- **Bitcore-lib Cryptographic Engine (v10.10.7)**
- **Axios HTTP Blockchain Node & REST/RPC Client**
- **Real-Time Emailing System with SMTP/IMAP Simulation**
- **Automatic Restriction Bypass & Sovereign Access Control**
- **Underground Daemon Workers running autonomously**
