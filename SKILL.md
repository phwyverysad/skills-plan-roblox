---
name: plan-roblox
description: Analyzes a decompiled Roblox map folder and generates either an ultra-comprehensive reverse engineering prompt (/plan-roblox <folder_path>) or immediately writes the complete ready-to-run Rayfield UI Mobile script hub without prompt generation (/go-script <folder_path> [language]).
---

# Plan Roblox: Decompiled Map Reverse Engineering & Script Hub Architect

This skill provides automated workflows to inspect, reverse engineer, and generate either an ultra-comprehensive Master Prompt or directly write a complete production-grade Roblox Script Hub using Rayfield UI Library (Mobile) for any decompiled map.

## Strict Formatting Directive
- DO NOT use any emojis anywhere in the output, generated prompt, instructions, GUI titles, or code comments. Keep all output strictly professional and emoji-free.

## Supported Commands

### Command 1: Architecture & Master Prompt Mode
```text
/plan-roblox <folder_path>
```
Scans the decompiled map folder and outputs an ultra-comprehensive Master Prompt with full reverse-engineered intelligence and an 8-tab feature matrix.

### Command 2: Direct Script Generation Mode (One-Shot)
```text
/go-script <folder_path> [language]
```
Bypasses displaying the intermediate prompt and immediately synthesizes and writes the complete ready-to-run Luau script hub file in the specified language (e.g. `th` for Thai or `en` for English).

Examples:
- `/go-script C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 th`
- `/go-script C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 en`

---

## Step-by-Step Procedure for the Agent

### Step 1: Automated Static Scanning
When either command is triggered with `<folder_path>`, execute the helper PowerShell script:
```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\.gemini\config\plugins\superpowers\skills\plan-roblox\scripts\scan_roblox.ps1" -TargetFolder "<folder_path>"
```
Capture and parse the resulting JSON data:
- PlaceID: Extracted from _summary.txt
- TotalLuaFiles: Total count of decompiled scripts
- GameDataModules: Tables (Items, Eggs, Pets, Shops, Rebirths, etc.)
- Services: Game services and controllers
- RemotesFound: Discovered RemoteEvent and RemoteFunction names
- RemoteCallExamples: Real syntax examples of FireServer / InvokeServer calls
- UIComponents: Detected ScreenGuis, Frames, Tabs
- KeyMechanicsDetected: Detected gameplay loops

### Step 2: Read Rayfield UI Mobile Documentation
Ensure the generated script or plan aligns strictly with the Rayfield UI Mobile specification:
- Read `references/Rayfield UI library Mobile.md` bundled with this skill (or local path `D:\Users\woran\Documents\My_Project\Roblox\ScriptRoblox\script\Rayfield UI library Mobile.md`).
- Utilize standard Rayfield Mobile elements:
  - loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
  - Rayfield:CreateWindow() with ConfigurationSaving, LoadingTitle, Theme
  - Mobile Floating Action Button (draggable ScreenGui toggle button)
  - Elements: CreateTab, CreateSection, CreateToggle, CreateSlider, CreateDropdown, CreateButton, CreateInput, CreateKeybind
  - Status updates: Rayfield:Notify()

---

## Branching Logic Based on Command

### If User Triggered `/plan-roblox <folder_path>`:
Output the comprehensive Master Prompt in Markdown format tailored specifically to the analyzed map, following this structure:

```markdown
# MASTER PROMPT: [Game Name / Place ID] SCRIPT HUB (RAYFIELD MOBILE)

## Formatting Constraint
- Strictly DO NOT use emojis anywhere in the script, UI labels, or code comments.

## Context & Target Scope
- Target Folder: <folder_path>
- Place ID: <place_id>
- Detected Core Mechanics: <list mechanics, e.g. Farming, Pets, Shops, Rebirths, Combat>
- GUI Engine: Rayfield UI Library Mobile

## Reverse Engineered Intelligence
- Discovered Modules: <list top GameData modules>
- Core Network Remotes & Call Signatures:
  - <remote_1:FireServer(...)>
  - <remote_2:FireServer(...)>
  - <remote_3:InvokeServer(...)>

## Script Hub UI Architecture (8-Tab Matrix)
Detail every feature tailored to the discovered mechanics:
1. Tab 1: Auto Farm & Main Loop (All auto-collection, auto-clicks, mob/resource farming)
2. Tab 2: [Primary Game Mechanic] (e.g. Eggs/Pets, Tycoon Drops, Weapons, or Crafting)
3. Tab 3: Management & Upgrades (Equip best, Inventory, Pet feeding, Upgrades)
4. Tab 4: Economy & Shop Automation (Auto buy items, auto claim rewards, auto rebirth)
5. Tab 5: Teleports & World Exploration (Teleport to Spawns, Zones, Shops, Players)
6. Tab 6: Visuals & ESP (BillboardGui & Highlight for items, resources, players, Fullbright)
7. Tab 7: Movement & Character Enhancements (WalkSpeed, JumpPower, Infinite Jump, Noclip, Mobile Fly)
8. Tab 8: Utility & Safety (Anti-AFK, Auto Reconnect, Server Hop, Mobile Toggle Button)

## Server-Side Safety, Anti-Kick & Network Reliability Architecture
To ensure the script runs smoothly without triggering server-side sanity checks, rate-limit kicks, or detection heuristics, the implementation MUST enforce the following safeguards:

1. Dynamic Rate Limiting & Micro-Jitter:
   - Enforce configurable delays between remote calls (minimum 0.1s to 0.35s).
   - Inject randomized micro-jitter: task.wait(baseDelay + math.random() * 0.05) to prevent perfectly fixed interval patterns that server heuristics easily flag.

2. Distance & Magnitude Sanity Checks:
   - Before firing any interaction remotes, compute:
     local dist = (Character.PrimaryPart.Position - Target.Position).Magnitude
   - Validate that dist <= MaxInteractionDistance. If out of range, move or tween the character into proximity first.

3. Strict Parameter Sanitization & Nil-Guards:
   - Validate existence and parenthood: if not target or not target.Parent then return end.
   - Ensure arguments strictly match expected types to prevent server runtime exceptions.
   - Guard against firing remotes when required assets or currencies are unavailable.

4. Server Cooldown Synchronization & Concurrency Guards:
   - Use os.clock() timestamp tracking: if os.clock() - lastAction < cooldown then return end.
   - Prevent overlapping calls to InvokeServer using mutex flags (isInvoking).

5. Character Lifecycle & Respawn Safety:
   - Monitor CharacterAdded and Humanoid.Died.
   - Immediately pause loops while the character is dead, respawning, or loading assets.
   - Do not attempt to fire movement or interaction remotes when Humanoid.Health <= 0.

6. Nonce & Session Integrity Checks:
   - Accurately calculate and pass expected time/nonce tokens (e.g. workspace:GetServerTimeNow()).

7. Thread Isolation & Exception Handling:
   - Wrap every remote call and proximity prompt trigger in pcall().
   - Run features in independent task.spawn() loops.

8. Complete, Production-Ready Luau:
   - Provide the complete, unabbreviated .lua script code without placeholders, ready for immediate execution.
```

After outputting the Master Prompt, inform the user:
- Reply with `go th` to generate the complete script in Thai.
- Reply with `go en` to generate the complete script in English.
- Or use `/go-script <folder_path> [lang]` in the future for direct one-shot generation.

---

### If User Triggered `/go-script <folder_path> [language]` (OR replied with `go th` / `go en`):
DO NOT output the intermediate Master Prompt or planning text.
Directly synthesize and output the complete, unabbreviated Luau Script Hub (.lua) file inside a code block following these rules:

1. Language Localization:
   - If language is `th` (or user said `go th`): Use clear Thai for Window title, Tab names, Section headers, Toggle/Button names, Notify descriptions, and code comments.
   - If language is `en` (or user said `go en`): Use English for all UI labels, notifications, and code comments.
   - Default language is Thai if omitted or unrecognized.

2. Complete Implementation:
   - Build all 8 tabs populated with features corresponding to the discovered game remotes and modules.
   - Implement the draggable mobile floating open/close button ScreenGui.
   - Fully integrate the Server-Side Safety Architecture (rate limiting, micro-jitter, distance checks, nil checks, cooldowns, pcall error trapping, and character lifecycle management).
   - Provide 100% full, runnable Luau code with zero placeholders or omissions.
   - Maintain zero emojis throughout the script.
