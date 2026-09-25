param(
    [Parameter(Mandatory=$true)]
    [string]$TargetFolder
)

$ErrorActionPreference = "SilentlyContinue"

if (-not (Test-Path $TargetFolder)) {
    Write-Error "Target folder does not exist: $TargetFolder"
    exit 1
}

$report = [ordered]@{
    TargetFolder = (Resolve-Path $TargetFolder).Path
    PlaceID = "Unknown"
    TotalLuaFiles = 0
    DetectedGenre = "General Automation"
    GameDataModules = @()
    Services = @()
    RemotesFound = @()
    RemoteCallExamples = @()
    UIComponents = @()
    KeyMechanicsDetected = @()
    LiteFeaturesRecommended = @()
}

# 1. Check summary.txt
$summaryPath = Join-Path $TargetFolder "_summary.txt"
if (Test-Path $summaryPath) {
    $summaryContent = Get-Content $summaryPath
    foreach ($line in $summaryContent) {
        if ($line -match "Place ID:\s*(\d+)") {
            $report.PlaceID = $matches[1]
        }
    }
}

# 2. Count Lua Files
$luaFiles = Get-ChildItem -Path $TargetFolder -Recurse -Filter "*.lua"
$report.TotalLuaFiles = $luaFiles.Count

# 3. Game Data Modules
$gameDataPaths = @(
    (Join-Path $TargetFolder "ReplicatedStorage\GameData"),
    (Join-Path $TargetFolder "ReplicatedStorage\Data"),
    (Join-Path $TargetFolder "ReplicatedStorage\Modules"),
    (Join-Path $TargetFolder "ReplicatedStorage\Configurations"),
    (Join-Path $TargetFolder "ReplicatedStorage\Config"),
    (Join-Path $TargetFolder "ReplicatedStorage\Settings")
)
foreach ($p in $gameDataPaths) {
    if (Test-Path $p) {
        $modules = Get-ChildItem -Path $p -Filter "*.lua" | ForEach-Object { $_.BaseName -replace '\.ModuleScript$', '' }
        $report.GameDataModules += $modules
    }
}
$report.GameDataModules = $report.GameDataModules | Sort-Object -Unique

# 4. Services / Controllers
$servicePaths = @(
    (Join-Path $TargetFolder "ReplicatedStorage\GameServices"),
    (Join-Path $TargetFolder "ReplicatedStorage\Services"),
    (Join-Path $TargetFolder "ReplicatedStorage\Controllers"),
    (Join-Path $TargetFolder "StarterPlayer\StarterPlayerScripts")
)
foreach ($p in $servicePaths) {
    if (Test-Path $p) {
        $srvs = Get-ChildItem -Path $p -Filter "*.lua" | ForEach-Object { $_.BaseName -replace '\.ModuleScript$', '' -replace '\.LocalScript$', '' }
        $report.Services += $srvs
    }
}
$report.Services = $report.Services | Sort-Object -Unique

# 5. Remote Calls Extraction
$remoteCalls = @{}
$sampleCalls = @()

$matchesList = $luaFiles | Select-String -Pattern "(\w+):(FireServer|InvokeServer)\((.*?)\)"
foreach ($m in $matchesList) {
    $remoteName = $m.Matches.Groups[1].Value
    $method = $m.Matches.Groups[2].Value
    $args = $m.Matches.Groups[3].Value.Trim()

    if ($remoteName -notmatch "^(RemoteEvent|RemoteFunction|v\d+|p\d+|u\d+)$") {
        if (-not $remoteCalls.ContainsKey($remoteName)) {
            $remoteCalls[$remoteName] = 1
            $sampleCalls += "$($remoteName):$($method)($args)"
        } else {
            $remoteCalls[$remoteName]++
        }
    }
}

# Also search for WaitForChild Remotes
$matchesRemotes = $luaFiles | Select-String -Pattern "(?:Remotes|Game|Network|Events).*?:WaitForChild\([`"'](\w+)[`"']\)"
foreach ($m in $matchesRemotes) {
    $rName = $m.Matches.Groups[1].Value
    if ($rName -notmatch "^(Remotes|Game|Network|Events|Assets|SFX|Audio)$") {
        if (-not $remoteCalls.ContainsKey($rName)) {
            $remoteCalls[$rName] = 1
        }
    }
}

$report.RemotesFound = @($remoteCalls.Keys | Sort-Object)
$report.RemoteCallExamples = @($sampleCalls | Select-Object -First 40)

# 6. UI Components
$guiFolders = Get-ChildItem -Path (Join-Path $TargetFolder "Players") -Recurse | Where-Object { $_.PSIsContainer -and ($_.FullName -like "*PlayerGui\Main*" -or $_.FullName -like "*StarterGui\Main*" -or $_.FullName -like "*StarterGui*") }
if ($guiFolders) {
    $report.UIComponents = @($guiFolders | Select-Object -ExpandProperty Name | Sort-Object -Unique)
}

# 7. Universal Game Genre & Mechanic Detection
$mechanics = @()
$combinedText = ($report.GameDataModules + $report.RemotesFound + $report.UIComponents + $report.Services) -join " "

# Check genres
$genres = @()
if ($combinedText -match "Egg|Hatch|Nest|Pet|PetAging|Mutat") { 
    $genres += "Pet / Egg Hatching Simulator"
    $mechanics += "Egg Hatching & Breeding"
    $mechanics += "Pet Management & Mutations"
}
if ($combinedText -match "Tycoon|Dropper|Conveyor|Collector|Generator|Plot|Build") { 
    $genres += "Tycoon / Base Builder"
    $mechanics += "Auto Collect Income"
    $mechanics += "Auto Buy Upgrades & Buttons"
}
if ($combinedText -match "Fight|Combat|Attack|Weapon|Gun|Shoot|Punch|Sword|Skill|Ability|Hitbox") { 
    $genres += "Combat / Action / RPG"
    $mechanics += "Combat & Mob/Enemy Farming"
    $mechanics += "Auto Attack & Skill Triggering"
}
if ($combinedText -match "Click|Tap|Train|Strength|Speed|Rebirth|Prestige|Workout") { 
    $genres += "Training / Clicker Simulator"
    $mechanics += "Auto Click / Training Loop"
    $mechanics += "Rebirth & Ascension"
}
if ($combinedText -match "Shop|Buy|Purchase|Stock|Merchant|Market") { 
    $mechanics += "Shop & Purchase System"
}
if ($combinedText -match "Radar|Tracker|Scanner") { 
    $mechanics += "Radar & Object Tracking"
}
if ($combinedText -match "Weather") { 
    $mechanics += "Dynamic Weather Interaction"
}
if ($combinedText -match "Basket|Pickup|Collect|Harvest|Drop") { 
    $mechanics += "Item & Drop Auto-Collection"
}
if ($combinedText -match "Quest|Mission|Dialogue|NPC") { 
    $mechanics += "Quests & Dialogue Progression"
}
if ($combinedText -match "Index|Reward|Achievement|Milestone") { 
    $mechanics += "Index & Collection Rewards"
}

if ($genres.Count -gt 0) {
    $report.DetectedGenre = ($genres -join " / ")
} else {
    $report.DetectedGenre = "Universal Simulator / Adventure"
}

$report.KeyMechanicsDetected = $mechanics

# Lite mode recommendations
$report.LiteFeaturesRecommended = @(
    "Core Auto-Farm / Main Action Loop",
    "Essential Location Teleports",
    "Player Enhancements (WalkSpeed, JumpPower, Infinite Jump, Noclip)",
    "Anti-AFK & Mobile Draggable Toggle"
)

# Output JSON
$report | ConvertTo-Json -Depth 5
