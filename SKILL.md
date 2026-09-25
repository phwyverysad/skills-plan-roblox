---
name: plan-roblox
description: Universal reverse engineering and script architect for ANY decompiled Roblox map. Generates comprehensive or lightweight prompts (/plan-roblox-full, /plan-roblox-lite) or writes complete Rayfield UI Mobile script hubs directly (/go-script-full, /go-script-lite).
---

# Universal Plan Roblox: Reverse Engineering & Script Hub Architect

This skill provides an automated, universal workflow to inspect, reverse engineer, and synthesize Roblox Script Hubs powered by the Rayfield UI Library (Mobile) for ANY decompiled Roblox map (Simulators, Tycoons, RPG/Anime, Combat, Obbies, etc.).

## Strict Formatting Directive
- DO NOT use any emojis anywhere in the output, generated prompt, instructions, GUI titles, or code comments. Keep all output strictly professional and emoji-free.

---

## Supported Commands

### 1. Architecture & Master Prompt Commands
- `/plan-roblox-full <folder_path>` (or `/plan-roblox <folder_path>`):
  Generates an exhaustive, feature-packed Master Prompt covering every detected game system across 8+ tabs.
- `/plan-roblox-lite <folder_path>`:
  Generates a lightweight, streamlined Master Prompt focusing strictly on core essentials (3-4 tabs: Core Farm, Key Teleports, Player Movement, Anti-AFK/Safety). Optimized for simple usage, minimal GUI footprint, and low-end mobile performance.

### 2. Direct One-Shot Script Generation Commands (Bypasses Prompt Output)
- `/go-script-full <folder_path> [language]` (or `/go-script <folder_path> [language]`):
  Directly outputs the complete Full Script Hub (.lua) code in the specified language (`th` for Thai, `en` for English) without printing any intermediate prompt.
- `/go-script-lite <folder_path> [language]`:
  Directly outputs the lightweight, streamlined Script Hub (.lua) code in the specified language (`th` for Thai, `en` for English) without printing any intermediate prompt.

Examples:
- `/plan-roblox-full C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534`
- `/plan-roblox-lite C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534`
- `/go-script-full C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 th`
- `/go-script-lite C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 en`

---

## Universal Map Analysis Procedure

### Step 1: Automated Static Scanning
When any command is executed, run the automated scanner:
```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\.gemini\config\plugins\superpowers\skills\plan-roblox\scripts\scan_roblox.ps1" -TargetFolder "<folder_path>"
```
Parse the JSON output:
- PlaceID: Extracted Place ID
- TotalLuaFiles: Total scripts scanned
- DetectedGenre: Identified genre (Simulator, Tycoon, RPG, Combat, etc.)
- GameDataModules: Game tables and config modules
- Services: Controllers and client/replicated services
- RemotesFound: Discovered RemoteEvent and RemoteFunction instances
- RemoteCallExamples: Actual FireServer / InvokeServer calling syntax
- UIComponents: Discovered UI frames and screens
- KeyMechanicsDetected: Specific gameplay mechanics detected
- LiteFeaturesRecommended: Recommended features for Lite mode

### Step 2: Read Rayfield UI Mobile Documentation
Ensure the code and prompts strictly adhere to:
- `references/Rayfield UI library Mobile.md` bundled with this skill (or local path `D:\Users\woran\Documents\My_Project\Roblox\ScriptRoblox\script\Rayfield UI library Mobile.md`).
- Standard Rayfield Mobile components:
  - loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
  - Rayfield:CreateWindow() with ConfigurationSaving, LoadingTitle, Theme
  - Mobile Floating Action Button (draggable ScreenGui toggle button)
  - Elements: CreateTab, CreateSection, CreateToggle, CreateSlider, CreateDropdown, CreateButton, CreateInput, CreateKeybind
  - Status updates: Rayfield:Notify()

---

## Execution Modes & Output Formats

### Mode A: Full Architecture Mode (`/plan-roblox-full` or `/plan-roblox`)
Synthesize and display the comprehensive Master Prompt:

```markdown
# MASTER PROMPT: [Game Name / Place ID] SCRIPT HUB FULL (RAYFIELD MOBILE)

## Formatting Constraint
- Strictly DO NOT use emojis anywhere in the script, UI labels, or code comments.

## Context & Target Scope
- Target Folder: <folder_path>
- Place ID: <place_id>
- Detected Genre: <detected_genre>
- Core Mechanics: <list all detected mechanics>
- GUI Engine: Rayfield UI Library Mobile

## Reverse Engineered Intelligence
- Discovered Modules: <list top GameData modules>
- Core Network Remotes & Call Signatures:
  - <remote_1:FireServer(...)>
  - <remote_2:FireServer(...)>
  - <remote_3:InvokeServer(...)>

## Script Hub UI Architecture (8-Tab Matrix)
1. Tab 1: Auto Farm & Main Loop (All auto-collection, auto-clicks, mob/resource farming)
2. Tab 2: [Primary Game Mechanic] (e.g. Eggs/Pets, Tycoon Drops, Weapons, or Crafting)
3. Tab 3: Management & Upgrades (Equip best, Inventory, Pet feeding, Upgrades)
4. Tab 4: Economy & Shop Automation (Auto buy items, auto claim rewards, auto rebirth)
5. Tab 5: Teleports & World Exploration (Teleport to Spawns, Zones, Shops, Players)
6. Tab 6: Visuals & ESP (BillboardGui & Highlight for items, resources, players, Fullbright)
7. Tab 7: Movement & Character Enhancements (WalkSpeed, JumpPower, Infinite Jump, Noclip, Mobile Fly)
8. Tab 8: Utility & Safety (Anti-AFK, Auto Reconnect, Server Hop, Mobile Toggle Button)

## Server-Side Safety, Anti-Kick & Network Reliability Architecture
- Enforce dynamic rate-limiting (0.1s - 0.35s) with randomized micro-jitter.
- Magnitude and distance sanity checks before firing remotes.
- Strict parameter sanitization and nil guards.
- Timestamp cooldown synchronization (os.clock()) and InvokeServer mutex concurrency locks.
- Character lifecycle hooks (pause on Humanoid.Died, resume on CharacterAdded).
- Nonce and timestamp calculation preservation.
- Error wrapping with pcall() and independent task.spawn() execution threads.
- Complete, unabbreviated .lua script output with zero placeholders.
```

Follow up with quick-start instructions:
- Reply with `go th` to generate the full script in Thai.
- Reply with `go en` to generate the full script in English.
- Reply with `go-lite th` or `go-lite en` to switch to Lite script generation.

---

### Mode B: Lite Architecture Mode (`/plan-roblox-lite`)
Synthesize and display the clean, essential-only Master Prompt:

```markdown
# MASTER PROMPT: [Game Name / Place ID] SCRIPT HUB LITE (RAYFIELD MOBILE)

## Formatting Constraint
- Strictly DO NOT use emojis anywhere in the script, UI labels, or code comments.

## Context & Target Scope
- Target Folder: <folder_path>
- Place ID: <place_id>
- Detected Genre: <detected_genre>
- Design Goal: Lightweight, simple to use, minimal resource consumption, high stability on mobile.
- GUI Engine: Rayfield UI Library Mobile

## Core Network Remotes (Essentials Only)
- <list only the 3-5 most critical remotes for core gameplay>

## Streamlined UI Architecture (4-Tab Layout)
1. Tab 1: Main Auto Farm (Core primary loop with built-in safety delay)
2. Tab 2: Teleports (Essential spawns, zones, and home/plot)
3. Tab 3: Movement & Player (WalkSpeed slider, JumpPower slider, Infinite Jump, Noclip)
4. Tab 4: Utility & Safety (Anti-AFK toggle, Mobile Draggable Button)

## Server-Side Safety Architecture
- Built-in rate limiting with micro-jitter (0.15s - 0.3s).
- Distance verification before action triggers.
- Safe pcall() wrapping and task.spawn() thread isolation.
- Complete .lua script output with zero placeholders.
```

Follow up with quick-start instructions:
- Reply with `go th` (or `go-lite th`) to generate the Lite script in Thai.
- Reply with `go en` (or `go-lite en`) to generate the Lite script in English.
- Reply with `go-full th` or `go-full en` to switch to Full script generation.

---

### Mode C: Direct One-Shot Script Generation (`/go-script-full` / `/go-script-lite` / `go th` / `go en`)
DO NOT output any intermediate Master Prompt or planning text.
Directly synthesize and output the complete, unabbreviated Luau Script Hub (.lua) file inside a code block:

1. Language Localization:
   - `th` (or `go th`): All UI tabs, element titles, descriptions, notifications, and code comments in Thai.
   - `en` (or `go en`): All UI tabs, element titles, descriptions, notifications, and code comments in English.
   - Defaults to Thai if unspecified.

2. Scope Enforcement:
   - If Full mode: Build all 8+ tabs with complete feature coverage.
   - If Lite mode: Build the 4 streamlined tabs focusing on maximum performance, simple toggles, and zero clutter.

3. Standards & Zero Emojis:
   - Include the draggable mobile toggle button.
   - Fully integrate all server-side safety safeguards.
   - 100% full, runnable Luau code with zero placeholders or omissions.
   - Strictly zero emojis across all code, strings, and output text.
