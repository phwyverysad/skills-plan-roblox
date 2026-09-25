---
name: go-script-full
description: Directly synthesizes and writes an exhaustive, full-featured (8+ tabs) Rayfield UI Mobile script hub for ANY decompiled Roblox map without outputting planning prompts. Trigger with /go-script-full <folder_path> [language].
---

# Go-Script Full: Exhaustive Roblox Script Hub Generator (One-Shot Mode)

This skill directly outputs an exhaustive, production-grade Luau Script Hub (.lua) covering every detected game system across 8+ tabs with Rayfield UI Library (Mobile), completely bypassing intermediate prompts.

## Strict Formatting Directive
- DO NOT use any emojis anywhere in the output, GUI titles, or code comments. Keep all output strictly professional and emoji-free.

## Trigger Syntax
```text
/go-script-full <folder_path> [language]
```
- `language`: `th` for Thai (default) or `en` for English.

Examples:
- `/go-script-full C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 th`
- `/go-script-full C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534 en`

---

## Execution Protocol
1. Run `scan_roblox.ps1` silently on `<folder_path>`.
2. Read `references/Rayfield UI library Mobile.md`.
3. Directly output the complete, unabbreviated 8+ tab Luau script in a single code block.
4. Enforce the Server-Side Safety Architecture (rate limiting with micro-jitter, distance checks, nil guards, cooldowns, pcall error wrapping, and character lifecycle hooks).
5. Strictly zero emojis in the code or output.
