---
name: plan-roblox-full
description: Generates an exhaustive Master Prompt for ANY decompiled Roblox map covering all systems across 8+ tabs. Trigger with /plan-roblox-full <folder_path>.
---

# Plan Roblox Full: Exhaustive Reverse Engineering & Master Prompt

This skill scans any decompiled Roblox map and produces an exhaustive, feature-packed Master Prompt covering every detected system across 8+ tabs with full Server-Side Safety Architecture.

## Strict Formatting Directive
- DO NOT use any emojis anywhere in the output, GUI titles, or code comments. Keep all output strictly professional and emoji-free.

## Trigger Syntax
```text
/plan-roblox-full <folder_path>
```
Example:
```text
/plan-roblox-full C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534
```

---

## Execution Protocol
1. Run `scan_roblox.ps1` on `<folder_path>`.
2. Output the full Master Prompt (8-tab matrix, remotes, server safety directives).
3. Offer quick script generation: User can reply with `go th` (Thai) or `go en` (English).
4. Strictly zero emojis in all output.
