---
name: plan-roblox
description: Analyzes a decompiled Roblox map folder (e.g. from Potassium or any decompiler) and generates an ultra-comprehensive reverse engineering prompt and complete Rayfield UI Mobile script hub architecture for that specific map. Use when the user types /plan-roblox <folder_path>.
---

# Plan Roblox: Decompiled Map Reverse Engineering & Script Hub Architect

This skill provides an automated workflow to inspect, reverse engineer, and generate an ultra-comprehensive Master Prompt and architecture for creating a Roblox Script Hub using **Rayfield UI Library (Mobile)** for any decompiled map.

## Trigger Syntax
```text
/plan-roblox <folder_path>
```
Example:
```text
/plan-roblox C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534
```

---

## 🛠️ Step-by-Step Procedure for the Agent

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
- Check `D:\Users\woran\Documents\My_Project\Roblox\ScriptRoblox\script\Rayfield UI library Mobile.md` (or fallback to built-in Rayfield Mobile best practices).
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
# 🚀 MASTER PROMPT: [Game Name / Place ID] SCRIPT HUB (RAYFIELD MOBILE)

## 📌 Context & Target Scope
- **Target Folder:** `<folder_path>`
- **Place ID:** `<place_id>`
- **Detected Core Mechanics:** `<list mechanics, e.g. Farming, Pets, Shops, Rebirths, Combat>`
- **GUI Engine:** Rayfield UI Library Mobile (`D:\Users\woran\Documents\My_Project\Roblox\ScriptRoblox\script\Rayfield UI library Mobile.md`)

## 🔍 Reverse Engineered Intelligence
- **Discovered Modules:** `<list top GameData modules>`
- **Core Network Remotes & Call Signatures:**
  - `<remote_1:FireServer(...)>`
  - `<remote_2:FireServer(...)>`
  - `<remote_3:InvokeServer(...)>`

## 🗂️ Script Hub UI Architecture (8-Tab Matrix)
Detail every feature tailored to the discovered mechanics:
1. **Tab 1: Auto Farm & Main Loop** (All auto-collection, auto-clicks, mob/resource farming)
2. **Tab 2: [Primary Game Mechanic]** (e.g. Eggs/Pets, Tycoon Drops, Weapons, or Crafting)
3. **Tab 3: Management & Upgrades** (Equip best, Inventory, Pet feeding, Upgrades)
4. **Tab 4: Economy & Shop Automation** (Auto buy items, auto claim rewards, auto rebirth)
5. **Tab 5: Teleports & World Exploration** (Teleport to Spawns, Zones, Shops, Players)
6. **Tab 6: Visuals & ESP** (BillboardGui & Highlight for items, resources, players, Fullbright)
7. **Tab 7: Movement & Character Enhancements** (WalkSpeed, JumpPower, Infinite Jump, Noclip, Mobile Fly)
8. **Tab 8: Utility & Safety** (Anti-AFK, Auto Reconnect, Server Hop, Mobile Toggle Button)

## 🛡️ Anti-Kick & Thread Safety Directives
- Wrap all remote calls in `pcall()`
- Thread every loop with `task.spawn()`
- Rate limit loops with `task.wait()` to prevent server flood/kick
- Full Luau script output without placeholders
```

### Step 4: Proactive Offer to Execute
After presenting the tailored Master Prompt, inform the user:
- You have direct access to their machine and the scanned scripts.
- Offer to immediately write the complete, ready-to-run `.lua` file for them right away.
