# 💕 Love Meter

A fun, interactive Valentine's Day terminal app built with OpenTUI and React. Ask your special someone to be your Valentine with an adorable proposal screen, play a heart-catching mini-game, and celebrate with romantic love poems!

![Valentine](https://img.shields.io/badge/Made%20with-Love-ff69b4)
![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?logo=typescript&logoColor=white)
![Version](https://img.shields.io/badge/Version-1.0.0-green)

## ✨ Features

### 💝 Interactive Proposal
- Beautiful animated proposal screen with falling hearts
- **Shrinking "No" button** - Try to say no, we dare you! 😏
  - The No button shrinks and moves away when you try to select it
  - The Yes button grows bigger with more hearts
  - Messages get increasingly desperate
  - Eventually the No button runs away completely!

### 🎮 Heart Collector Game
Catch falling hearts to fill your Heart-O-Meter to 100%!

**Heart Types:**
| Heart | Points | Description |
|-------|--------|-------------|
| 💕 | +5 | Basic love heart |
| 💖 | +10 | Sparkling heart |
| 💝 | +25 | Gift heart (rare!) |
| 💔 | -10 | Broken heart (avoid!) |

**Power-ups:**
| Power-up | Effect | Duration |
|----------|--------|----------|
| 🌹 Rose | Slow Motion - everything moves at 40% speed | 5 seconds |
| 💌 Love Letter | Double Points - all hearts worth 2x | 8 seconds |
| 🧲 Magnet | Heart Magnet - attracts nearby hearts | 6 seconds |

**Combo System:** Catch 3+ hearts in a row for bonus points!

### 📝 Love Poems Celebration
Win the game and enjoy romantic love poems:
- 3 beautiful poems that cycle automatically
- Each line appears with dramatic timing
- 60-second display per poem
- Press 'n' to skip to the next poem

---

## 🚀 Quick Install

### Option 1: One-Line Install (Recommended)

**Mac / Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/Abhay-0103/Love-Meter/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/Abhay-0103/Love-Meter/main/install.ps1 | iex
```

### Option 2: Standalone Executable (No Install Required!)

**Windows:** Download from [Releases](https://github.com/Abhay-0103/Love-Meter/releases) and double-click to run!

### Option 3: Manual Installation

```bash
# Clone the repository
git clone https://github.com/Abhay-0103/Love-Meter.git
cd Love-Meter

# Install dependencies
bun install

# Run the app
bun dev
```

---

## 🎮 How to Play

```bash
bun dev
```

## 🎹 Controls

| Key | Action |
|-----|--------|
| ↑ ↓ | Navigate menu options |
| Enter | Select option |
| ← → | Move basket (in game) |
| n | Skip to next poem (celebration) |
| q | Quit |

---

## 🛠️ Build Standalone Executable

Build your own executable that runs without Node.js or Bun:

```bash
# Windows
bun run build:windows

# Creates: love-meter-windows.exe
```

---

## 🛠️ Tech Stack

- **[OpenTUI](https://github.com/psobocinski/opentui)** - Terminal UI framework
- **React** - UI components
- **TypeScript** - Type safety
- **Bun** - JavaScript runtime

## 📁 Project Structure

```
Love-Meter/
├── src/
│   └── index.tsx       # Main application
├── install.sh          # Mac/Linux installer
├── install.ps1         # Windows PowerShell installer
├── install.bat         # Windows CMD installer
├── package.json
├── tsconfig.json
└── README.md
```

## 💖 Preview

```
╔══════════════════════════════════════╗
║                                      ║
║    Will you be my Valentine? 💕      ║
║                                      ║
║         💕 💖 💝 💗 💓              ║
║                                      ║
║    [  💕💕 YES! 💕💕  ]              ║
║    [     No... 🥺     ]              ║
║                                      ║
╚══════════════════════════════════════╝
```

## 🎯 How to Win

1. Select "Yes" on the proposal (good luck saying no! 😏)
2. Catch falling hearts with your basket using ← → keys
3. Collect power-ups: 🌹 💌 🧲
4. Build combos for bonus points
5. Fill the Heart-O-Meter to 100%
6. Enjoy the celebration with love poems! 🎉

---

## 📦 Requirements

- **Node.js** 18+ (for development)
- **Bun** (auto-installed by install script)
- Terminal with Unicode/emoji support

---

## 🤝 Contributing

Feel free to open issues and pull requests! Let's spread the love! 💕

## 📄 License

MIT License - Feel free to spread the love! 💕

---

Made with 💕 for Valentine's Day

**Author:** [Abhay Singh](https://github.com/Abhay-0103)

Made with 💕 for Valentine's Day

This project was created using `bun create tui`. [create-tui](https://git.new/create-tui) is the easiest way to get started with OpenTUI.
