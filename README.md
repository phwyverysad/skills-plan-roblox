# Universal Roblox Reverse Engineering & Script Hub Skills for AI Agents

A collection of 6 AI Custom Skills designed to inspect, reverse engineer, and synthesize Roblox Script Hubs powered by the Rayfield UI Library (Mobile) for ANY decompiled Roblox map (Simulators, Tycoons, RPG/Anime, Combat, Obbies, etc.).

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

## Included Skills & Slash Commands

| Command | Mode | Description |
| :--- | :--- | :--- |
| `/go-script <folder> [lang]` | Direct Script (One-Shot) | Immediately writes the complete ready-to-run script hub without intermediate prompts |
| `/go-script-full <folder> [lang]` | Direct Full Script (One-Shot) | Immediately writes the exhaustive 8+ tab script hub |
| `/go-script-lite <folder> [lang]` | Direct Lite Script (One-Shot) | Immediately writes the lightweight 4-tab script hub (optimized for mobile) |
| `/plan-roblox-full <folder>` | Full Prompt Mode | Generates an exhaustive Master Prompt & architecture across 8+ tabs |
| `/plan-roblox-lite <folder>` | Lite Prompt Mode | Generates a streamlined Master Prompt & architecture across 4 core tabs |
| `/plan-roblox <folder>` | Master Planner | Analyzes the map and prompts for full or lite execution |

- Language parameter: `th` for Thai, `en` for English (e.g. `/go-script <folder> th`).

---

## Installation

### Method 1: Universal Installation via npx skills (Recommended for all AI agents)

Run this command in your terminal to install all 6 skills globally across all supported AI agents on your machine:

```bash
npx skills add phwyverysad/skills-plan-roblox -g
```

To install only for specific agents (e.g. Claude Code, Codex, Cursor, Antigravity):

```bash
npx skills add phwyverysad/skills-plan-roblox -g -a claude-code codex cursor antigravity
```

---

### Method 2: PowerShell One-Liner (Windows Native for Antigravity)

Run this in PowerShell to automatically install and link all 6 skills into Google Antigravity 2.0 and Antigravity CLI:

```powershell
irm https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/main/install.ps1 | iex
```

(Or if default branch is master)
```powershell
irm https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/master/install.ps1 | iex
```

---

## Usage Examples

### 1. Direct Script Generation (No Prompt Output)
```text
/go-script C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 th
```
```text
/go-script-lite C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 en
```

### 2. Architecture & Prompt Review Mode
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

## Automated Workflow & Features

1. Universal Genre & Static Analysis: Automatically classifies game genre (Simulators, Tycoons, RPG, Combat, etc.) and indexes all Lua scripts in seconds.
2. Network Mapping: Identifies RemoteEvents and RemoteFunctions with real parameter signatures.
3. Dual Execution Modes: Full mode (all-inclusive 8+ tabs) vs Lite mode (streamlined 4 tabs for minimal resource footprint).
4. Direct Script Synthesis (/go-script): Bypasses prompt output to produce ready-to-run Luau script hubs directly.
5. Server-Side Safety & Anti-Kick Integration: Enforces dynamic rate-limiting with micro-jitter, spatial distance sanity checks, strict nil/type guards, server cooldown synchronization, and character lifecycle management to prevent server-side kicks, telemetry flags, and rate-limit drops.
6. Strictly Emoji-Free: Designed with clean, professional typography and zero emojis across all generated documents and code.
7. Offline Documentation Bundled: Includes the complete offline Rayfield UI Mobile reference guide so the agent can generate accurate code without external lookups.

---

## Repository Structure

- `skills/`: Contains the 6 individual AI skill definitions (`go-script`, `go-script-full`, `go-script-lite`, `plan-roblox`, `plan-roblox-full`, `plan-roblox-lite`).
- `scripts/scan_roblox.ps1`: Universal PowerShell script to crawl and parse decompiled game directories across any genre.
- `references/Rayfield UI library Mobile.md`: Complete Rayfield UI Mobile reference documentation.
- `install.ps1`: Automated installer script for Windows PowerShell.
- `README.md`: Project documentation and setup guide.
