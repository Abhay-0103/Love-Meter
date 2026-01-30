# 💕 Love Meter - One-Line Installer for Windows
# ===============================================
# Usage: irm https://raw.githubusercontent.com/hangyakuzero/UNI/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "💕 ================================== 💕" -ForegroundColor Magenta
Write-Host "   Love Meter - Installation Script" -ForegroundColor White
Write-Host "💕 ================================== 💕" -ForegroundColor Magenta
Write-Host ""

# Check for Git
Write-Host "🔍 Checking for Git..." -ForegroundColor Yellow
try {
    $gitVersion = git --version 2>$null
    Write-Host "✅ Git is installed" -ForegroundColor Green
} catch {
    Write-Host "❌ Git is not installed" -ForegroundColor Red
    Write-Host "📦 Please install Git from https://git-scm.com/" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Check for Node.js
Write-Host "🔍 Checking for Node.js..." -ForegroundColor Yellow
try {
    $nodeVersion = node -v 2>$null
    if ($nodeVersion) {
        Write-Host "✅ Node.js is installed: $nodeVersion" -ForegroundColor Green
    } else {
        throw "not found"
    }
} catch {
    Write-Host "❌ Node.js is not installed" -ForegroundColor Red
    Write-Host "📦 Please install Node.js from https://nodejs.org/" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Check for Bun or install it
Write-Host "🔍 Checking for Bun..." -ForegroundColor Yellow
$hasBun = $false
try {
    $bunVersion = bun -v 2>$null
    if ($bunVersion) {
        Write-Host "✅ Bun is installed: $bunVersion" -ForegroundColor Green
        $hasBun = $true
    }
} catch {}

if (-not $hasBun) {
    Write-Host "📦 Installing Bun..." -ForegroundColor Yellow
    try {
        powershell -c "irm bun.sh/install.ps1 | iex"
        $env:Path = "$env:USERPROFILE\.bun\bin;$env:Path"
        Write-Host "✅ Bun installed" -ForegroundColor Green
    } catch {
        Write-Host "⚠️ Could not install Bun, will use npm instead" -ForegroundColor Yellow
    }
}

# Clone the repository
Write-Host ""
Write-Host "💝 Cloning Love Meter..." -ForegroundColor Magenta

$installDir = "$env:USERPROFILE\Love-Meter"

if (Test-Path $installDir) {
    Write-Host "📁 Directory exists, updating..." -ForegroundColor Yellow
    Set-Location $installDir
    git pull
} else {
    git clone https://github.com/hangyakuzero/UNI.git $installDir
    Set-Location $installDir
}

# Install dependencies
Write-Host ""
Write-Host "💝 Installing dependencies..." -ForegroundColor Magenta

try {
    bun install
} catch {
    npm install
}

Write-Host ""
Write-Host "✅ Installation Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "💕 ================================== 💕" -ForegroundColor Magenta
Write-Host "   Love Meter is ready! 🎉" -ForegroundColor Green
Write-Host "💕 ================================== 💕" -ForegroundColor Magenta
Write-Host ""
Write-Host "To run Love Meter:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  cd ~/Love-Meter; bun dev" -ForegroundColor Green
Write-Host ""
Write-Host "💕 Happy Valentine's Day! 💕" -ForegroundColor Magenta
Write-Host ""

# Ask if user wants to run now
$run = Read-Host "🎮 Run Love Meter now? (y/n)"
if ($run -eq "y" -or $run -eq "Y") {
    try {
        bun dev
    } catch {
        npm run dev
    }
}
