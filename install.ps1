# 💕 Love Meter - Installation Script for Windows (PowerShell)
# ============================================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "💕 ================================== 💕" -ForegroundColor Magenta
Write-Host "   Love Meter - Installation Script" -ForegroundColor White
Write-Host "💕 ================================== 💕" -ForegroundColor Magenta
Write-Host ""

# Check for Node.js
Write-Host "🔍 Checking for Node.js..." -ForegroundColor Yellow
try {
    $nodeVersion = node -v 2>$null
    if ($nodeVersion) {
        Write-Host "✅ Node.js is installed: $nodeVersion" -ForegroundColor Green
    } else {
        throw "Node.js not found"
    }
} catch {
    Write-Host "❌ Node.js is not installed" -ForegroundColor Red
    Write-Host "📦 Please install Node.js from https://nodejs.org/" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""

# Check for Bun or npm
Write-Host "🔍 Checking for package manager..." -ForegroundColor Yellow

$pkgManager = $null

try {
    $bunVersion = bun -v 2>$null
    if ($bunVersion) {
        Write-Host "✅ Bun is installed: $bunVersion" -ForegroundColor Green
        $pkgManager = "bun"
    }
} catch {}

if (-not $pkgManager) {
    try {
        $npmVersion = npm -v 2>$null
        if ($npmVersion) {
            Write-Host "✅ npm is installed: $npmVersion" -ForegroundColor Green
            Write-Host "💡 Tip: Install Bun for faster performance:" -ForegroundColor Yellow
            Write-Host "   powershell -c `"irm bun.sh/install.ps1 | iex`"" -ForegroundColor Cyan
            $pkgManager = "npm"
        }
    } catch {}
}

if (-not $pkgManager) {
    Write-Host "❌ No package manager found" -ForegroundColor Red
    Write-Host "📦 Installing Bun..." -ForegroundColor Yellow
    try {
        irm bun.sh/install.ps1 | iex
        $pkgManager = "bun"
    } catch {
        Write-Host "❌ Failed to install Bun. Please install Node.js from https://nodejs.org/" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}

Write-Host ""
Write-Host "💝 Installing dependencies..." -ForegroundColor Magenta
Write-Host ""

try {
    if ($pkgManager -eq "bun") {
        bun install
    } else {
        npm install
    }
} catch {
    Write-Host ""
    Write-Host "❌ Installation failed: $_" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "✅ Dependencies installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "💕 ================================== 💕" -ForegroundColor Magenta
Write-Host "   Installation Complete! 🎉" -ForegroundColor Green
Write-Host "💕 ================================== 💕" -ForegroundColor Magenta
Write-Host ""
Write-Host "To run the Love Meter:" -ForegroundColor Yellow
Write-Host ""
if ($pkgManager -eq "bun") {
    Write-Host "  bun dev" -ForegroundColor Green
} else {
    Write-Host "  npm run dev" -ForegroundColor Green
}
Write-Host ""
Write-Host "💕 Happy Valentine's Day! 💕" -ForegroundColor Magenta
Write-Host ""
Read-Host "Press Enter to exit"
