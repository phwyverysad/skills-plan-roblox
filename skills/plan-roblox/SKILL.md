---
name: plan-roblox
description: Universal reverse engineering and script architect for ANY decompiled Roblox map. Generates comprehensive or lightweight prompts (/plan-roblox-full, /plan-roblox-lite) or writes complete Rayfield UI Mobile script hubs directly (/go-script-full, /go-script-lite). Trigger with /plan-roblox <folder_path>.
---

# Plan Roblox: Universal Reverse Engineering & Script Architect

This skill inspects any decompiled Roblox map folder, identifies game mechanics, and generates an architecture prompt or directly generates script hubs.

## Strict Formatting Directive
- DO NOT use any emojis anywhere in the output, GUI titles, or code comments. Keep all output strictly professional and emoji-free.

## Trigger Syntax
```text
/plan-roblox <folder_path>
```
Example:
```text
/plan-roblox C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534
```

---

## Execution Protocol
1. Run `scan_roblox.ps1` on `<folder_path>`.
2. Read `references/Rayfield UI library Mobile.md`.
3. If the user asked to plan or analyze: Output the comprehensive Master Prompt and explain that they can reply with `go th` / `go en` (for full) or `go-lite th` / `go-lite en` (for lite) to generate the script.
4. If the user included `go` or `go-script` in their message: Immediately output the complete Luau Script Hub (.lua) code directly without showing intermediate prompts.
5. Strictly zero emojis in all output.
