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
    GameDataModules = @()
    Services = @()
    RemotesFound = @()
    RemoteCallExamples = @()
    UIComponents = @()
    KeyMechanicsDetected = @()
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
    (Join-Path $TargetFolder "ReplicatedStorage\Configurations")
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
    (Join-Path $TargetFolder "ReplicatedStorage\Controllers")
)
foreach ($p in $servicePaths) {
    if (Test-Path $p) {
        $srvs = Get-ChildItem -Path $p -Filter "*.lua" | ForEach-Object { $_.BaseName -replace '\.ModuleScript$', '' }
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
$matchesRemotes = $luaFiles | Select-String -Pattern "(?:Remotes|Game|Network).*?:WaitForChild\([`"'](\w+)[`"']\)"
foreach ($m in $matchesRemotes) {
    $rName = $m.Matches.Groups[1].Value
    if ($rName -notmatch "^(Remotes|Game|Network|Assets|SFX)$") {
        if (-not $remoteCalls.ContainsKey($rName)) {
            $remoteCalls[$rName] = 1
        }
    }
}

$report.RemotesFound = @($remoteCalls.Keys | Sort-Object)
$report.RemoteCallExamples = @($sampleCalls | Select-Object -First 35)

# 6. UI Components
$guiFolders = Get-ChildItem -Path (Join-Path $TargetFolder "Players") -Recurse | Where-Object { $_.PSIsContainer -and ($_.FullName -like "*PlayerGui\Main*" -or $_.FullName -like "*StarterGui\Main*") }
if ($guiFolders) {
    $report.UIComponents = @($guiFolders | Select-Object -ExpandProperty Name | Sort-Object -Unique)
}

# 7. Key Mechanics Detected
$mechanics = @()
$combinedText = ($report.GameDataModules + $report.RemotesFound + $report.UIComponents) -join " "

if ($combinedText -match "Egg|Hatch|Nest") { $mechanics += "Egg Hatching / Breeding" }
if ($combinedText -match "Pet|Mutat") { $mechanics += "Pet Management & Mutations" }
if ($combinedText -match "Shop|Buy|Purchase|Stock") { $mechanics += "Shop & Purchase System" }
if ($combinedText -match "Rebirth|Prestige") { $mechanics += "Rebirth / Ascension System" }
if ($combinedText -match "Radar|Tracker") { $mechanics += "Radar / Scanning System" }
if ($combinedText -match "Weather") { $mechanics += "Dynamic Weather System" }
if ($combinedText -match "Basket|Pickup|Collect") { $mechanics += "Item / Currency Auto-Collection" }
if ($combinedText -match "Fight|Combat|Attack|Weapon|Gun") { $mechanics += "Combat & Battles" }
if ($combinedText -match "Quest|Dialogue|NPC") { $mechanics += "Quests & Dialogue System" }
if ($combinedText -match "Index|Reward|Achievement") { $mechanics += "Index & Collection Rewards" }

$report.KeyMechanicsDetected = $mechanics

# Output JSON
$report | ConvertTo-Json -Depth 5
