---
name: plan-roblox
description: Analyzes a decompiled Roblox map folder (e.g. from Potassium or any decompiler) and generates an ultra-comprehensive reverse engineering prompt and complete Rayfield UI Mobile script hub architecture for that specific map. Use when the user types /plan-roblox <folder_path>.
---

# Plan Roblox: Decompiled Map Reverse Engineering & Script Hub Architect

This skill provides an automated workflow to inspect, reverse engineer, and generate an ultra-comprehensive Master Prompt and architecture for creating a Roblox Script Hub using **Rayfield UI Library (Mobile)** for any decompiled map.

## Strict Formatting Directive
- DO NOT use any emojis anywhere in the output, generated prompt, instructions, or code comments. Keep all output strictly professional and emoji-free.

## Trigger Syntax
```text
/plan-roblox <folder_path>
```
Example:
```text
/plan-roblox C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534
```

---

## Step-by-Step Procedure for the Agent

When the user triggers `/plan-roblox <folder_path>`:

### Step 1: Run the Automated Scanner Script
Execute the helper PowerShell script located in this skill:
```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\.gemini\config\plugins\superpowers\skills\plan-roblox\scripts\scan_roblox.ps1" -TargetFolder "<folder_path>"
```
Capture and parse the resulting JSON data, which includes:
- `PlaceID`: Extracted from `_summary.txt`
- `TotalLuaFiles`: Count of decompiled scripts
- `GameDataModules`: Key tables (Items, Eggs, Pets, Shops, Rebirths, etc.)
- `Services`: Game services and controllers
- `RemotesFound`: Discovered `RemoteEvent` and `RemoteFunction` names
- `RemoteCallExamples`: Real syntax examples of `FireServer` / `InvokeServer`
- `UIComponents`: Detected ScreenGuis, Frames, Tabs
- `KeyMechanicsDetected`: High-level detected gameplay loops

### Step 2: Read Rayfield UI Mobile Documentation
Ensure the generated plan aligns strictly with the Rayfield UI Mobile specification:
- Check `references/Rayfield UI library Mobile.md` bundled with this skill (or local path `D:\Users\woran\Documents\My_Project\Roblox\ScriptRoblox\script\Rayfield UI library Mobile.md`).
- Verify standard Rayfield Mobile features:
  - `loadstring(game:HttpGet('https://sirius.menu/rayfield'))()`
  - `Rayfield:CreateWindow()` with `ConfigurationSaving`, `LoadingTitle`, `Theme`
  - Mobile Floating Action Button (draggable ScreenGui toggle button)
  - Elements: `CreateTab`, `CreateSection`, `CreateToggle`, `CreateSlider`, `CreateDropdown`, `CreateButton`, `CreateInput`, `CreateKeybind`
  - Status updates: `Rayfield:Notify()`

### Step 3: Generate the Map-Specific Ultra Master Prompt
Synthesize a comprehensive, production-grade Master Prompt in Markdown format tailored **specifically to the analyzed map**. 

The generated prompt **MUST** follow this exact structure:

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
   - Before firing any interaction remotes (e.g. collecting, picking up, claiming, opening), compute:
     local dist = (Character.PrimaryPart.Position - Target.Position).Magnitude
   - Validate that dist <= MaxInteractionDistance. If the target is out of range, smoothly move or tween the character into proximity first rather than firing across the map.

3. Strict Parameter Sanitization & Nil-Guards:
   - Validate existence and parenthood: if not target or not target.Parent then return end.
   - Ensure arguments strictly match expected types (e.g. number vs string) to prevent server runtime exceptions that can trigger error telemetry or disconnect the player.
   - Guard against firing remotes when the required assets or currencies are not available.

4. Server Cooldown Synchronization & Concurrency Guards:
   - Use os.clock() timestamp tracking: if os.clock() - lastAction < cooldown then return end.
   - Prevent overlapping calls to InvokeServer (blocking yield) by using mutex flags (isInvoking) to prevent thread hangs or server-side call queue exhaustion.

5. Character Lifecycle & Respawn Safety:
   - Monitor CharacterAdded and Humanoid.Died.
   - Immediately pause loops while the character is dead, respawning, or loading assets (LocalPlayer.Character:WaitForChild("HumanoidRootPart")).
   - Do not attempt to fire movement or interaction remotes when Humanoid.Health <= 0.

6. Nonce & Session Integrity Checks:
   - If the game utilizes nonces, timestamp verification, or server-provided tokens (check extracted RemoteCallExamples), preserve and accurately calculate them (e.g. workspace:GetServerTimeNow()).

7. Thread Isolation & Exception Handling:
   - Wrap every remote call and proximity prompt trigger in pcall().
   - Run features in independent task.spawn() loops so that an error in one feature never crashes the hub or other background processes.

8. Complete, Production-Ready Luau:
   - Provide the complete, unabbreviated .lua script code without placeholders, ready for immediate execution.
```

### Step 4: Instant Execution Protocol (go <language>)
Immediately after presenting the generated Master Prompt, instruct the user on how to trigger instant script generation:

Provide clear instructions that the user can immediately generate the entire production script by replying with:
- `go th` -> Generate the complete script with Thai language UI labels, notifications, and code comments.
- `go en` -> Generate the complete script with English language UI labels, notifications, and code comments.
- `go <language>` -> Generate the complete script in any specified language.

When the user enters `go th`, `go en`, or any `go <language>` command, the AI must immediately take the analyzed architecture and write the complete, full-length `.lua` script hub without needing any further questions or confirmations.
