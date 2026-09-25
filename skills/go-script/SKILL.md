---
name: go-script
description: Directly synthesizes and writes a complete ready-to-run Rayfield UI Mobile script hub for ANY decompiled Roblox map without outputting planning prompts. Trigger with /go-script <folder_path> [language].
---

# Go-Script: Direct Roblox Script Hub Generator (One-Shot Mode)

This skill provides an automated, one-shot pipeline to inspect any decompiled Roblox map folder and immediately output the complete, production-grade Luau Script Hub (.lua) powered by Rayfield UI Library (Mobile) directly in code blocks, completely bypassing intermediate prompts or planning steps.

## Strict Formatting Directive
- DO NOT use any emojis anywhere in the output, GUI titles, or code comments. Keep all output strictly professional and emoji-free.

## Trigger Syntax
```text
/go-script <folder_path> [language]
```
- `language`: `th` for Thai (default) or `en` for English.

Examples:
- `/go-script C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 th`
- `/go-script C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 en`

---

## Execution Protocol for the Agent

When `/go-script <folder_path> [language]` is triggered:

### Step 1: Run the Automated Scanner (Silent)
Run the scanner script:
```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\.gemini\config\plugins\superpowers\skills\plan-roblox\scripts\scan_roblox.ps1" -TargetFolder "<folder_path>"
```
Parse the JSON output (PlaceID, DetectedGenre, GameDataModules, RemotesFound, RemoteCallExamples, UIComponents, KeyMechanicsDetected).

### Step 2: Read Rayfield UI Mobile Reference
Read `references/Rayfield UI library Mobile.md` (or local path `D:\Users\woran\Documents\My_Project\Roblox\ScriptRoblox\script\Rayfield UI library Mobile.md`).

### Step 3: Immediate Full Script Output (DO NOT OUTPUT PROMPTS)
DO NOT output any intermediate planning prompt or markdown analysis.
Directly synthesize and output the complete, unabbreviated Luau Script Hub (.lua) file inside a single code block adhering to these rules:

1. Language Localization:
   - If language is `th`: Use Thai for Window title, Tab names, Section headers, Toggle/Button labels, Notify descriptions, and code comments.
   - If language is `en`: Use English for all UI labels, notifications, and code comments.
   - Default language is Thai if omitted or unrecognized.

2. Comprehensive Feature Coverage:
   - Build an 8-tab matrix mapped directly to the discovered game systems:
     - Tab 1: Auto Farm & Main Action Loop
     - Tab 2: Primary Game Mechanic (Eggs/Pets, Tycoon Drops, Weapons, or Crafting)
     - Tab 3: Management & Upgrades (Equip best, Inventory, Upgrades)
     - Tab 4: Economy & Shop Automation (Auto buy, Auto claim, Rebirth)
     - Tab 5: Teleports & World Exploration (Spawns, Zones, Shops, Players)
     - Tab 6: Visuals & ESP (BillboardGui & Highlight for items, resources, players, Fullbright)
     - Tab 7: Movement & Character (WalkSpeed, JumpPower, Infinite Jump, Noclip, Mobile Fly)
     - Tab 8: Utility & Safety (Anti-AFK, Auto Reconnect, Server Hop, Mobile Floating Button)
   - Implement the draggable mobile floating open/close button ScreenGui.

3. Server-Side Safety Architecture:
   - Dynamic rate limiting (0.1s - 0.35s) with randomized micro-jitter (`task.wait(baseDelay + math.random() * 0.05)`).
   - Distance checks before firing remotes: `(Character.PrimaryPart.Position - Target.Position).Magnitude <= MaxDistance`.
   - Strict parameter sanitization and nil-guards on every remote call.
   - Cooldown synchronization using `os.clock()`.
   - Character lifecycle hooks (pause loops on `Humanoid.Died`, resume on `CharacterAdded`).
   - Wrap all remote calls in `pcall()`.
   - Thread every feature in an isolated `task.spawn()` loop.

4. Zero Emojis & Complete Code:
   - Strictly zero emojis in the entire script.
   - 100% full, runnable Luau code with zero placeholders or omissions.
