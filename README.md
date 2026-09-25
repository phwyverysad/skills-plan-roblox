# Plan-Roblox Skill for AI Agents (Antigravity, Codex, Claude Code, Cursor)

AI Custom Skill designed to inspect and reverse engineer decompiled Roblox map workspaces, mapping out network remotes, game data modules, and mechanics to generate comprehensive Master Prompts and complete Script Hub architectures powered by the Rayfield UI Library (Mobile).

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

## Usage

The skill provides two execution modes depending on your workflow:

### Mode 1: Direct Script Generation (One-Shot without Prompt Output)

Use this command when you want the AI to immediately scan the map and generate the full, ready-to-run `.lua` Script Hub file directly, without outputting any intermediate planning prompt:

```text
/go-script <path_to_decompiled_map_folder> [language]
```

- Append `th` for Thai UI labels, notifications, and code comments.
- Append `en` for English UI labels, notifications, and code comments.

Examples:
```text
/go-script C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 th
```
```text
/go-script C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 en
```

---

### Mode 2: Two-Step Architecture & Master Prompt Mode

Use this command when you want to review the full reverse-engineered analysis and Master Prompt first:

```text
/plan-roblox <path_to_decompiled_map_folder>
```

Example:
```text
/plan-roblox C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534
```

After reviewing the prompt, trigger immediate script synthesis by replying with:
- `go th` -> Generate the complete script in Thai.
- `go en` -> Generate the complete script in English.

---

## Automated Workflow & Features

1. High-Speed Static Analysis: Scans the target folder, detects Place ID, and indexes all Lua/Luau scripts in seconds.
2. Network Mapping: Identifies RemoteEvents and RemoteFunctions, capturing real parameter signatures and calling conventions.
3. Game Systems Extraction: Discovers GameData modules, GameServices, Controllers, UI frames, and core gameplay loops (Farming, Eggs/Pets, Shops, Rebirth, Combat).
4. Direct Script Synthesis (/go-script): Bypasses prompt output to produce the full-length ready-to-run Luau script hub directly.
5. Server-Side Safety & Anti-Kick Integration: Enforces dynamic rate-limiting with micro-jitter, spatial distance sanity checks, strict nil/type guards, server cooldown synchronization, and character lifecycle management to prevent server-side kicks, telemetry flags, and rate-limit drops.
6. Strictly Emoji-Free: Designed with clean, professional typography and zero emojis across all generated documents and code.
7. Offline Documentation Bundled: Includes the complete offline Rayfield UI Mobile reference guide so the agent can generate accurate code without external lookups.

---

## Repository Structure

- `SKILL.md`: Main skill definition and agent execution protocol.
- `scripts/scan_roblox.ps1`: High-performance PowerShell script to crawl and parse decompiled game directories.
- `references/Rayfield UI library Mobile.md`: Complete Rayfield UI Mobile reference documentation.
- `install.ps1`: Automated installer script for Windows PowerShell.
- `README.md`: Project documentation and setup guide.
