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

### Step 1: Analyze the Map & Generate the Architecture Prompt
Once installed, open any supported AI Agent (Antigravity, Claude Code, Codex, or Cursor) and enter the slash command in the chat:

```text
/plan-roblox <path_to_decompiled_map_folder>
```

Example:
```text
/plan-roblox C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534
```

### Step 2: Instant Script Generation via "go <language>"
Once the AI presents the Master Prompt and map architecture, you can trigger immediate full-script synthesis without extra questions by replying with:

- `go th` -> Generate the complete ready-to-run script with Thai UI labels, notifications, and code comments.
- `go en` -> Generate the complete ready-to-run script with English UI labels, notifications, and code comments.
- `go <language>` -> Generate the complete script in your preferred language.

---

## Automated Workflow & Features

1. High-Speed Static Analysis: Scans the target folder, detects Place ID, and indexes all Lua/Luau scripts in seconds.
2. Network Mapping: Identifies RemoteEvents and RemoteFunctions, capturing real parameter signatures and calling conventions.
3. Game Systems Extraction: Discovers GameData modules, GameServices, Controllers, UI frames, and core gameplay loops (Farming, Eggs/Pets, Shops, Rebirth, Combat).
4. Master Prompt Synthesis: Produces an ultra-comprehensive Master Prompt tailored specifically to that map with an 8-tab Rayfield Mobile UI matrix.
5. Server-Side Safety & Anti-Kick Integration: Enforces dynamic rate-limiting with micro-jitter, spatial distance sanity checks, strict nil/type guards, server cooldown synchronization, and character lifecycle management to prevent server-side kicks, telemetry flags, and rate-limit drops.
6. Strictly Emoji-Free: Designed with clean, professional typography and zero emojis across all generated documents and code.
7. Instant Language Dispatch: Supports rapid code generation via `go th`, `go en`, or `go <lang>`.
8. Offline Documentation Bundled: Includes the complete offline Rayfield UI Mobile reference guide so the agent can generate accurate code without external lookups.

---

## Repository Structure

- `SKILL.md`: Main skill definition and agent execution protocol.
- `scripts/scan_roblox.ps1`: High-performance PowerShell script to crawl and parse decompiled game directories.
- `references/Rayfield UI library Mobile.md`: Complete Rayfield UI Mobile reference documentation.
- `install.ps1`: Automated installer script for Windows PowerShell.
- `README.md`: Project documentation and setup guide.
