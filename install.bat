@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

echo.
echo 💕 ================================== 💕
echo    Love Meter - Installation Script
echo 💕 ================================== 💕
echo.

:: Check for Node.js
echo 🔍 Checking for Node.js...
where node >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
    echo ✅ Node.js is installed: !NODE_VERSION!
) else (
    echo ❌ Node.js is not installed
    echo 📦 Please install Node.js from https://nodejs.org/
    echo.
    pause
    exit /b 1
)

echo.

:: Check for Bun or npm
echo 🔍 Checking for package manager...

where bun >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    for /f "tokens=*" %%i in ('bun -v') do set BUN_VERSION=%%i
    echo ✅ Bun is installed: !BUN_VERSION!
    set PKG_MANAGER=bun
    goto :install
)

where npm >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    for /f "tokens=*" %%i in ('npm -v') do set NPM_VERSION=%%i
    echo ✅ npm is installed: !NPM_VERSION!
    echo 💡 Tip: Install Bun for faster performance: powershell -c "irm bun.sh/install.ps1 | iex"
    set PKG_MANAGER=npm
    goto :install
)

echo ❌ No package manager found
echo 📦 Please install Node.js from https://nodejs.org/
pause
exit /b 1

:install
echo.
echo 💝 Installing dependencies...
echo.

if "%PKG_MANAGER%"=="bun" (
    call bun install
) else (
    call npm install
)

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Installation failed!
    pause
    exit /b 1
)

echo.
echo ✅ Dependencies installed successfully!
echo.
echo 💕 ================================== 💕
echo    Installation Complete! 🎉
echo 💕 ================================== 💕
echo.
echo To run the Love Meter:
echo.
if "%PKG_MANAGER%"=="bun" (
    echo   bun dev
) else (
    echo   npm run dev
)
echo.
echo 💕 Happy Valentine's Day! 💕
echo.
pause
