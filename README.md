# Plan-Roblox Skill for AI Agents (Antigravity, Codex, Claude Code, Cursor)

Universal AI Custom Skill designed to inspect and reverse engineer ANY decompiled Roblox map workspace (Simulators, Tycoons, RPG/Anime, Combat/Battlegrounds, Obbies, etc.). It maps network remotes, game data modules, and mechanics to generate comprehensive or lightweight Master Prompts and complete Script Hub architectures powered by the Rayfield UI Library (Mobile).

Compatible with all major AI coding agents:
- Google Antigravity 2.0 & Antigravity CLI (agy)
- Claude Code
- OpenAI Codex
- Cursor
- GitHub Copilot
- Cline
- Windsurf
- Warp, Zed, and 20+ other agents

---

## Installation

### Method 1: Universal Installation via npx skills (Recommended for all AI agents)

Run the following command in your terminal to install the skill globally across all supported AI agents on your machine:

```bash
npx skills add phwyverysad/skills-plan-roblox -g
```

To install only for specific agents (e.g. Claude Code, Codex, Cursor, Antigravity):

```bash
npx skills add phwyverysad/skills-plan-roblox -g -a claude-code codex cursor antigravity
```

To install locally for the current project only:

```bash
npx skills add phwyverysad/skills-plan-roblox
```

---

### Method 2: PowerShell One-Liner (Windows Native for Antigravity)

If you are on Windows and want to install directly into Google Antigravity 2.0 without requiring Node.js, run this in PowerShell:

```powershell
irm https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/main/install.ps1 | iex
```

(Or if default branch is master)
```powershell
irm https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/master/install.ps1 | iex
```

---

## Supported Commands & Usage

### 1. Architecture & Master Prompt Commands

Review the reverse-engineered analysis and Master Prompt before generating code:

- `/plan-roblox-full <path_to_folder>` (or `/plan-roblox <path_to_folder>`):
  Generates an exhaustive, feature-packed Master Prompt covering every detected system across 8+ tabs.
- `/plan-roblox-lite <path_to_folder>`:
  Generates a lightweight, essential-only Master Prompt focusing strictly on core features (3-4 tabs: Core Farm, Key Teleports, Player Movement, Anti-AFK). Designed for simplicity, minimal UI clutter, and high performance on mobile.

Examples:
```text
/plan-roblox-full C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534
```
```text
/plan-roblox-lite C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534
```

After reviewing the prompt, trigger immediate script synthesis by replying with:
- `go th` -> Generate the complete script in Thai.
- `go en` -> Generate the complete script in English.

---

### 2. Direct One-Shot Script Generation (Bypasses Prompt Output)

Generate the full, ready-to-run `.lua` Script Hub file directly without printing intermediate planning text:

- `/go-script-full <path_to_folder> [language]`:
  Directly outputs the complete Full Script Hub (8+ tabs) in the chosen language (`th` or `en`).
- `/go-script-lite <path_to_folder> [language]`:
  Directly outputs the lightweight, streamlined Script Hub (4 tabs) in the chosen language (`th` or `en`).

Examples:
```text
/go-script-full C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 th
```
```text
/go-script-lite C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 en
```

---

## Universal Map & Genre Support

The skill dynamically detects and adapts to ANY Roblox game genre:
- Simulators & Clickers (Auto Tap, Train, Rebirth, Pet Hatching, Mutations, Upgrades)
- Tycoons & Base Builders (Auto Collect Dropper Income, Auto Buy Buttons, Auto Build)
- RPG, Anime & Adventure (Auto Mob Farm, Skill Rotations, Dungeon Clears, Quests)
- Battlegrounds & Combat (Auto Attack, Weapon/Skill Equipping, Target Tracking)
- Item & Economy Games (Auto Harvest, Basket Drops, Trading, Shop Purchases)
- General Automation (Universal Movement, Server-Hop, Rejoin, Fullbright, ESP)

---

## Automated Workflow & Features

1. Universal Genre & Static Analysis: Scans the target directory, detects Place ID, identifies game genre, and indexes all Lua/Luau scripts in seconds.
2. Network Mapping: Identifies RemoteEvents and RemoteFunctions, capturing real parameter signatures and calling conventions.
3. Dual Execution Modes: Full mode (all-inclusive 8+ tabs) vs Lite mode (streamlined 4 tabs for minimal resource footprint).
4. Direct Script Synthesis (/go-script-full, /go-script-lite): Bypasses prompt output to produce ready-to-run Luau script hubs directly.
5. Server-Side Safety & Anti-Kick Integration: Enforces dynamic rate-limiting with micro-jitter, spatial distance sanity checks, strict nil/type guards, server cooldown synchronization, and character lifecycle management to prevent server-side kicks, telemetry flags, and rate-limit drops.
6. Strictly Emoji-Free: Designed with clean, professional typography and zero emojis across all generated documents and code.
7. Offline Documentation Bundled: Includes the complete offline Rayfield UI Mobile reference guide so the agent can generate accurate code without external lookups.

---

## Repository Structure

- `SKILL.md`: Main skill definition and agent execution protocol.
- `scripts/scan_roblox.ps1`: Universal PowerShell script to crawl and parse decompiled game directories across any genre.
- `references/Rayfield UI library Mobile.md`: Complete Rayfield UI Mobile reference documentation.
- `install.ps1`: Automated installer script for Windows PowerShell.
- `README.md`: Project documentation and setup guide.
