#!/bin/bash

# 💕 Love Meter - Installation Script for Mac/Linux
# =================================================

set -e

echo ""
echo "💕 ================================== 💕"
echo "   Love Meter - Installation Script"
echo "💕 ================================== 💕"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PINK='\033[0;35m'
NC='\033[0m' # No Color

# Check if running on Mac or Linux
OS="$(uname -s)"
echo -e "${PINK}💖 Detected OS: $OS${NC}"
echo ""

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check for Node.js
echo -e "${YELLOW}🔍 Checking for Node.js...${NC}"
if command_exists node; then
    NODE_VERSION=$(node -v)
    echo -e "${GREEN}✅ Node.js is installed: $NODE_VERSION${NC}"
else
    echo -e "${RED}❌ Node.js is not installed${NC}"
    echo -e "${YELLOW}📦 Please install Node.js from https://nodejs.org/${NC}"
    exit 1
fi

# Check for Bun (preferred) or npm
echo ""
echo -e "${YELLOW}🔍 Checking for package manager...${NC}"

if command_exists bun; then
    PKG_MANAGER="bun"
    PKG_VERSION=$(bun -v)
    echo -e "${GREEN}✅ Bun is installed: $PKG_VERSION${NC}"
elif command_exists npm; then
    PKG_MANAGER="npm"
    PKG_VERSION=$(npm -v)
    echo -e "${GREEN}✅ npm is installed: $PKG_VERSION${NC}"
    echo -e "${YELLOW}💡 Tip: Install Bun for faster performance: curl -fsSL https://bun.sh/install | bash${NC}"
else
    echo -e "${RED}❌ No package manager found${NC}"
    echo -e "${YELLOW}📦 Installing Bun...${NC}"
    curl -fsSL https://bun.sh/install | bash
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
    PKG_MANAGER="bun"
fi

# Install dependencies
echo ""
echo -e "${PINK}💝 Installing dependencies...${NC}"
echo ""

if [ "$PKG_MANAGER" = "bun" ]; then
    bun install
else
    npm install
fi

echo ""
echo -e "${GREEN}✅ Dependencies installed successfully!${NC}"

# Make the run script executable
chmod +x run.sh 2>/dev/null || true

echo ""
echo -e "${PINK}💕 ================================== 💕${NC}"
echo -e "${GREEN}   Installation Complete! 🎉${NC}"
echo -e "${PINK}💕 ================================== 💕${NC}"
echo ""
echo -e "${YELLOW}To run the Love Meter:${NC}"
echo ""
if [ "$PKG_MANAGER" = "bun" ]; then
    echo -e "  ${GREEN}bun dev${NC}"
else
    echo -e "  ${GREEN}npm run dev${NC}"
fi
echo ""
echo -e "${PINK}💕 Happy Valentine's Day! 💕${NC}"
echo ""
