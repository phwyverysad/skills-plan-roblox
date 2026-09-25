\# คู่มือใช้งาน Rayfield UI Library



Rayfield เป็น UI Library สำหรับ Roblox Script ที่ช่วยให้สร้าง GUI ได้อย่างรวดเร็ว สวยงาม และรองรับการบันทึกค่า Configuration อัตโนมัติ



\---



\# การโหลด Rayfield



เพิ่มโค้ดด้านล่างไว้บนสุดของสคริปต์



```lua

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

```



\---



\# การสร้างหน้าต่าง (Window)



หน้าต่างคือส่วนหลักของ GUI



```lua

local Window = Rayfield:CreateWindow({

&#x20;   Name = "My Hub",

&#x20;   LoadingTitle = "Loading...",

&#x20;   LoadingSubtitle = "by Developer",

&#x20;   Theme = "Default",



&#x20;   ConfigurationSaving = {

&#x20;       Enabled = true,

&#x20;       FileName = "MyHubConfig"

&#x20;   }

})

```



\### ตัวเลือกสำคัญ



| ตัวเลือก            | รายละเอียด        |

| ------------------- | ----------------- |

| Name                | ชื่อหน้าต่าง      |

| LoadingTitle        | ข้อความตอนโหลด    |

| LoadingSubtitle     | คำอธิบายตอนโหลด   |

| Theme               | ธีมที่ใช้         |

| ToggleUIKeybind     | ปุ่มซ่อน/แสดง GUI |

| ConfigurationSaving | ระบบบันทึกค่า     |



\---



\# การสร้างแท็บ (Tab)



```lua

local MainTab = Window:CreateTab("Main", "home")

```



หรือใช้ Roblox Asset ID



```lua

local MainTab = Window:CreateTab("Main", 4483362458)

```



\---



\# การสร้าง Section



```lua

local Section = MainTab:CreateSection("Player")

```



เปลี่ยนชื่อภายหลัง



```lua

Section:Set("New Section")

```



\---



\# การสร้าง Divider



```lua

local Divider = MainTab:CreateDivider()

```



ซ่อน/แสดง



```lua

Divider:Set(true)

```



\---



\# ปุ่ม (Button)



```lua

local Button = MainTab:CreateButton({

&#x20;   Name = "Click Me",

&#x20;   Callback = function()

&#x20;       print("Button Pressed")

&#x20;   end

})

```



เปลี่ยนข้อความ



```lua

Button:Set("New Button")

```



\---



\# Toggle



```lua

local Toggle = MainTab:CreateToggle({

&#x20;   Name = "Auto Farm",

&#x20;   CurrentValue = false,

&#x20;   Flag = "AutoFarm",



&#x20;   Callback = function(Value)

&#x20;       print(Value)

&#x20;   end

})

```



เปลี่ยนค่า



```lua

Toggle:Set(true)

```



\---



\# Slider



```lua

local Slider = MainTab:CreateSlider({

&#x20;   Name = "WalkSpeed",

&#x20;   Range = {16, 100},

&#x20;   Increment = 1,

&#x20;   CurrentValue = 16,

&#x20;   Flag = "WalkSpeed",



&#x20;   Callback = function(Value)

&#x20;       print(Value)

&#x20;   end

})

```



อัปเดตค่า



```lua

Slider:Set(50)

```



\---



\# Input Box



```lua

local Input = MainTab:CreateInput({

&#x20;   Name = "Player Name",

&#x20;   CurrentValue = "",

&#x20;   PlaceholderText = "Type here",



&#x20;   Callback = function(Text)

&#x20;       print(Text)

&#x20;   end

})

```



เปลี่ยนค่า



```lua

Input:Set("Hello")

```



\---



\# Dropdown



```lua

local Dropdown = MainTab:CreateDropdown({

&#x20;   Name = "Select Team",



&#x20;   Options = {

&#x20;       "Red",

&#x20;       "Blue",

&#x20;       "Green"

&#x20;   },



&#x20;   CurrentOption = {"Red"},



&#x20;   Callback = function(Options)

&#x20;       print(Options\[1])

&#x20;   end

})

```



เปลี่ยนตัวเลือก



```lua

Dropdown:Set({"Blue"})

```



รีเฟรชรายการ



```lua

Dropdown:Refresh({

&#x20;   "A",

&#x20;   "B",

&#x20;   "C"

})

```



\---



\# Color Picker



```lua

local ColorPicker = MainTab:CreateColorPicker({

&#x20;   Name = "Theme Color",



&#x20;   Color = Color3.fromRGB(255,255,255),



&#x20;   Callback = function(Color)

&#x20;       print(Color)

&#x20;   end

})

```



เปลี่ยนสี



```lua

ColorPicker:Set(Color3.fromRGB(255,0,0))

```



\---



\# Keybind



```lua

local Keybind = MainTab:CreateKeybind({

&#x20;   Name = "Open Menu",



&#x20;   CurrentKeybind = "RightControl",



&#x20;   Callback = function()

&#x20;       print("Pressed")

&#x20;   end

})

```



เปลี่ยนปุ่ม



```lua

Keybind:Set("F")

```



\---



\# Label



```lua

local Label = MainTab:CreateLabel(

&#x20;   "Status : Ready"

)

```



อัปเดตข้อความ



```lua

Label:Set("Status : Running")

```



\---



\# Paragraph



```lua

local Paragraph = MainTab:CreateParagraph({

&#x20;   Title = "Information",

&#x20;   Content = "Welcome to the script."

})

```



อัปเดตข้อความ



```lua

Paragraph:Set({

&#x20;   Title = "Updated",

&#x20;   Content = "New Information"

})

```



\---



\# Notification



```lua

Rayfield:Notify({

&#x20;   Title = "Success",

&#x20;   Content = "Script Loaded",

&#x20;   Duration = 5

})

```



\---



\# ระบบบันทึกค่า Configuration



เปิดใช้งาน



```lua

ConfigurationSaving = {

&#x20;   Enabled = true,

&#x20;   FileName = "MyConfig"

}

```



โหลดค่าที่บันทึกไว้



```lua

Rayfield:LoadConfiguration()

```



> ควรวางไว้ท้ายสคริปต์ หลังสร้าง Element ทั้งหมดเสร็จแล้ว



\---



\# การซ่อน/แสดง GUI



ซ่อน GUI



```lua

Rayfield:SetVisibility(false)

```



แสดง GUI



```lua

Rayfield:SetVisibility(true)

```



ตรวจสอบสถานะ



```lua

Rayfield:IsVisible()

```



\---



\# ปิด Rayfield



```lua

Rayfield:Destroy()

```



\---



\# ธีมที่มีให้ใช้งาน



```lua

Default

AmberGlow

Amethyst

Bloom

DarkBlue

Green

Light

Ocean

Serenity

```



ตัวอย่าง



```lua

Theme = "DarkBlue"

```



\---



\# ตัวอย่างสคริปต์เต็ม



```lua

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()



local Window = Rayfield:CreateWindow({

&#x20;   Name = "My Hub",

&#x20;   Theme = "DarkBlue",



&#x20;   ConfigurationSaving = {

&#x20;       Enabled = true,

&#x20;       FileName = "MyHub"

&#x20;   }

})



local Main = Window:CreateTab("Main","home")



Main:CreateButton({

&#x20;   Name = "Test Button",

&#x20;   Callback = function()

&#x20;       Rayfield:Notify({

&#x20;           Title = "Success",

&#x20;           Content = "Button Clicked",

&#x20;           Duration = 3

&#x20;       })

&#x20;   end

})



Rayfield:LoadConfiguration()

```



\---



\# สรุป Element ที่รองรับ



\* Window

\* Tab

\* Section

\* Divider

\* Button

\* Toggle

\* Slider

\* Input

\* Dropdown

\* Color Picker

\* Keybind

\* Label

\* Paragraph

\* Notification



Rayfield เป็นหนึ่งใน UI Library ที่ใช้งานง่ายที่สุดสำหรับ Roblox Script และรองรับระบบ Config Saving, Theme, Key System และ Secure Mode ในตัว



