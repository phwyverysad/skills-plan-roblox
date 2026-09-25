# 🛠️ Plan-Roblox Skill for Google Antigravity 2.0 & CLI

AI Custom Skill สำหรับ Google Antigravity 2.0 (Desktop App) และ Antigravity CLI (`agy`) สำหรับวิเคราะห์ซอร์สโค้ดแมพ Roblox ที่ Decompile มา และสังเคราะห์ Master Prompt พร้อมสถาปัตยกรรม Script Hub แบบจัดเต็ม (Rayfield UI Mobile)

---

## ⚡ วิธีติดตั้งอัตโนมัติ (One-Liner Installation)

เปิด **PowerShell** บนเครื่องของคุณ แล้วรันคำสั่งด้านล่างนี้ได้ทันที:

```powershell
irm https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/main/install.ps1 | iex
```

*(หรือหากตั้งชื่อ branch เริ่มต้นเป็น master)*
```powershell
irm https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/master/install.ps1 | iex
```

---

## 🚀 วิธีใช้งานใน Antigravity

เมื่อติดตั้งเสร็จแล้ว สามารถเปิด Antigravity 2.0 หรือรัน `agy` CLI แล้วพิมพ์ในช่องแชต:

```text
/plan-roblox <ตำแหน่งโฟลเดอร์แมพที่ Decompile>
```

### ตัวอย่าง:
```text
/plan-roblox C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534
```

---

## 🔍 ฟีเจอร์ของ Skill
- สแกน Place ID และสคริปต์ทั้งหมดในโฟลเดอร์อย่างรวดเร็ว (ภายใน 2-3 วินาที)
- แกะ RemoteEvents, RemoteFunctions และตัวอย่าง Arguments จริง
- ตรวจสอบ GameData Modules, Game Services, UI Frames
- สังเคราะห์ Master Prompt พร้อม Rayfield UI Mobile รองรับทุกฟีเจอร์ของแมพนั้นโดยเฉพาะ
