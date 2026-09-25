# Plan-Roblox Skill for AI Agents (Antigravity, Codex, Claude Code, Cursor)

AI Custom Skill สำหรับวิเคราะห์ซอร์สโค้ดแมพ Roblox ที่ Decompile มา และสังเคราะห์ Master Prompt พร้อมสถาปัตยกรรม Script Hub แบบจัดเต็ม (Rayfield UI Mobile)

รองรับ AI Coding Agents ทุกแพลตฟอร์ม:
- Google Antigravity 2.0 & Antigravity CLI (agy)
- Claude Code
- OpenAI Codex
- Cursor
- GitHub Copilot
- Cline
- Windsurf
- Warp, Zed และอื่นๆ รวมกว่า 20+ Agents

---

## วิธีติดตั้ง

### วิธีที่ 1: ติดตั้งผ่าน npx skills (แนะนำสำหรับทุก AI Agent)

สามารถรันคำสั่งนี้ใน Terminal เพื่อติดตั้งเข้ากับทุก AI Agent บนเครื่องของคุณแบบ Global:

```bash
npx skills add phwyverysad/skills-plan-roblox -g
```

ติดตั้งแบบระบุเฉพาะ Agent (เช่น Claude Code, Codex, Cursor, Antigravity):
```bash
npx skills add phwyverysad/skills-plan-roblox -g -a claude-code codex cursor antigravity
```

ติดตั้งเฉพาะในโปรเจกต์ปัจจุบัน (Project-level):
```bash
npx skills add phwyverysad/skills-plan-roblox
```

---

### วิธีที่ 2: ติดตั้งผ่าน PowerShell One-Liner (สำหรับ Windows / Antigravity)

หากใช้ Windows และต้องการติดตั้งลง Antigravity โดยตรงโดยไม่ต้องมี Node.js สามารถรันใน PowerShell:

```powershell
irm https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/main/install.ps1 | iex
```

---

## วิธีใช้งาน

เมื่อติดตั้งแล้ว สามารถเปิด AI Agent ตัวใดก็ได้ (Antigravity, Claude Code, Codex, Cursor) แล้วพิมพ์ในช่องแชต:

```text
/plan-roblox <ตำแหน่งโฟลเดอร์แมพที่ Decompile>
```

ตัวอย่าง:
```text
/plan-roblox C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534
```

---

## สิ่งที่ Skill นี้ทำโดยอัตโนมัติ

1. ตรวจสอบและสแกน Place ID และไฟล์ Lua ทั้งหมดในโฟลเดอร์ (รวดเร็วภายใน 2-3 วินาที)
2. แกะ RemoteEvents, RemoteFunctions และตัวอย่าง Parameters จริงที่ใช้งานในเกม
3. ตรวจสอบ GameData Modules, Game Services, UI Frames และวงจรเกมหลัก
4. สังเคราะห์ Master Prompt พร้อมสถาปัตยกรรม Rayfield UI Mobile (8 Tabs) ครอบคลุมทุกระบบของแมพนั้น 100%
