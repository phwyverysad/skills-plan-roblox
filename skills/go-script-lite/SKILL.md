---
name: go-script-lite
description: Directly synthesizes and writes a lightweight, streamlined (4 tabs) Rayfield UI Mobile script hub for ANY decompiled Roblox map without outputting planning prompts. Trigger with /go-script-lite <folder_path> [language].
---

# Go-Script Lite: Lightweight Roblox Script Hub Generator (One-Shot Mode)

This skill directly outputs a lightweight, streamlined Luau Script Hub (.lua) focusing strictly on 4 core tabs (Main Farm, Key Teleports, Player Movement, Anti-AFK) with Rayfield UI Library (Mobile), completely bypassing intermediate prompts.

## Strict Formatting Directive
- DO NOT use any emojis anywhere in the output, GUI titles, or code comments. Keep all output strictly professional and emoji-free.

## Trigger Syntax
```text
/go-script-lite <folder_path> [language]
```
- `language`: `th` for Thai (default) or `en` for English.

Examples:
- `/go-script-lite C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 th`
- `/go-script-lite C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 en`

---

## Execution Protocol
1. Run `scan_roblox.ps1` silently on `<folder_path>`.
2. Read `references/Rayfield UI library Mobile.md`.
3. Directly output the complete, unabbreviated 4-tab Luau script in a single code block:
   - Tab 1: Main Auto Farm (Core primary loop with safety delay)
   - Tab 2: Teleports (Essential spawns, zones, and home/plot)
   - Tab 3: Movement & Player (WalkSpeed slider, JumpPower slider, Infinite Jump, Noclip)
   - Tab 4: Utility & Safety (Anti-AFK toggle, Mobile Draggable Button)
4. Enforce the Server-Side Safety Architecture (rate limiting, distance verification, pcall wrapping, task.spawn isolation).
5. Strictly zero emojis in the code or output.
