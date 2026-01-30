#!/bin/bash

# 💕 Love Meter - One-Line Installer
# ===================================
# Usage: curl -fsSL https://raw.githubusercontent.com/hangyakuzero/UNI/main/install.sh | bash

set -e

echo ""
echo "💕 ================================== 💕"
echo "   Love Meter - Installation Script"
echo "💕 ================================== 💕"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PINK='\033[0;35m'
NC='\033[0m'

# Check for git
echo -e "${YELLOW}🔍 Checking for Git...${NC}"
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is not installed${NC}"
    echo -e "${YELLOW}📦 Please install Git first${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Git is installed${NC}"

# Check for Node.js
echo -e "${YELLOW}🔍 Checking for Node.js...${NC}"
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed${NC}"
    echo -e "${YELLOW}📦 Please install Node.js from https://nodejs.org/${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Node.js is installed: $(node -v)${NC}"

# Check for Bun or install it
echo -e "${YELLOW}🔍 Checking for Bun...${NC}"
if command -v bun &> /dev/null; then
    echo -e "${GREEN}✅ Bun is installed: $(bun -v)${NC}"
else
    echo -e "${YELLOW}📦 Installing Bun...${NC}"
    curl -fsSL https://bun.sh/install | bash
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
    echo -e "${GREEN}✅ Bun installed${NC}"
fi

# Clone the repository
echo ""
echo -e "${PINK}💝 Cloning Love Meter...${NC}"
INSTALL_DIR="$HOME/Love-Meter"

if [ -d "$INSTALL_DIR" ]; then
    echo -e "${YELLOW}📁 Directory exists, updating...${NC}"
    cd "$INSTALL_DIR"
    git pull
else
    git clone https://github.com/hangyakuzero/UNI.git "$INSTALL_DIR"
    cd "$INSTALL_DIR"
fi

# Install dependencies
echo ""
echo -e "${PINK}💝 Installing dependencies...${NC}"
bun install

echo ""
echo -e "${GREEN}✅ Installation Complete!${NC}"
echo ""
echo -e "${PINK}💕 ================================== 💕${NC}"
echo -e "${GREEN}   Love Meter is ready! 🎉${NC}"
echo -e "${PINK}💕 ================================== 💕${NC}"
echo ""
echo -e "${YELLOW}To run Love Meter:${NC}"
echo ""
echo -e "  ${GREEN}cd ~/Love-Meter && bun dev${NC}"
echo ""
echo -e "${PINK}💕 Happy Valentine's Day! 💕${NC}"
echo ""

# Ask if user wants to run now
read -p "🎮 Run Love Meter now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    bun dev
fi