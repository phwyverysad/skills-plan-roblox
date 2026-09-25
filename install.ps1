# ==============================================================================
# Installer for plan-roblox & go-script Skills (Google Antigravity 2.0 & CLI)
# One-liner execution:
#   irm https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/main/install.ps1 | iex
# ==============================================================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host "  Installing Roblox AI Skills for Google Antigravity" -ForegroundColor Yellow
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host ""

$baseDir = "$env:USERPROFILE\.gemini"
$pluginsDir = "$baseDir\config\plugins\superpowers\skills"
$repoRawBase = "https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/main"

$skills = @(
    "go-script",
    "go-script-full",
    "go-script-lite",
    "plan-roblox",
    "plan-roblox-full",
    "plan-roblox-lite"
)

# 1. Ensure target directory structure exists
Write-Host "[1/4] Creating skill directories..." -ForegroundColor Cyan
foreach ($s in $skills) {
    $target = "$pluginsDir\$s"
    if (-not (Test-Path $target)) {
        New-Item -ItemType Directory -Path $target -Force | Out-Null
    }
}

# Also ensure shared scripts and references directories exist under plan-roblox
$sharedScripts = "$pluginsDir\plan-roblox\scripts"
$sharedReferences = "$pluginsDir\plan-roblox\references"
if (-not (Test-Path $sharedScripts)) { New-Item -ItemType Directory -Path $sharedScripts -Force | Out-Null }
if (-not (Test-Path $sharedReferences)) { New-Item -ItemType Directory -Path $sharedReferences -Force | Out-Null }

# 2. Download files
Write-Host "[2/4] Downloading skill files and shared assets from GitHub..." -ForegroundColor Cyan
try {
    # Download shared scripts and references
    Invoke-WebRequest -Uri "$repoRawBase/scripts/scan_roblox.ps1" -OutFile "$sharedScripts\scan_roblox.ps1" -UseBasicParsing
    Write-Host "  -> Downloaded shared scripts/scan_roblox.ps1" -ForegroundColor Green

    Invoke-WebRequest -Uri "$repoRawBase/references/Rayfield%20UI%20library%20Mobile.md" -OutFile "$sharedReferences\Rayfield UI library Mobile.md" -UseBasicParsing
    Write-Host "  -> Downloaded shared references/Rayfield UI library Mobile.md" -ForegroundColor Green

    # Download each SKILL.md
    foreach ($s in $skills) {
        Invoke-WebRequest -Uri "$repoRawBase/skills/$s/SKILL.md" -OutFile "$pluginsDir\$s\SKILL.md" -UseBasicParsing
        Write-Host "  -> Downloaded skill: $s" -ForegroundColor Green
    }
} catch {
    Write-Warning "Could not download directly from main branch. Attempting master branch..."
    try {
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/master/scripts/scan_roblox.ps1" -OutFile "$sharedScripts\scan_roblox.ps1" -UseBasicParsing
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/master/references/Rayfield%20UI%20library%20Mobile.md" -OutFile "$sharedReferences\Rayfield UI library Mobile.md" -UseBasicParsing
        foreach ($s in $skills) {
            Invoke-WebRequest -Uri "https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/master/skills/$s/SKILL.md" -OutFile "$pluginsDir\$s\SKILL.md" -UseBasicParsing
        }
        Write-Host "  -> Downloaded successfully from master branch!" -ForegroundColor Green
    } catch {
        Write-Error "Failed to download files: $_"
        exit 1
    }
}

# 3. Create Junctions for Antigravity discovery
Write-Host "[3/4] Linking all skills into Antigravity discovery paths..." -ForegroundColor Cyan
foreach ($s in $skills) {
    $target = "$pluginsDir\$s"
    
    if (Test-Path "$baseDir\antigravity\skills") {
        $agLink = "$baseDir\antigravity\skills\$s"
        if (-not (Test-Path $agLink)) {
            cmd /c mklink /J "$agLink" "$target" | Out-Null
        }
    }

    if (Test-Path "$baseDir\config\skills") {
        $cfgLink = "$baseDir\config\skills\$s"
        if (-not (Test-Path $cfgLink)) {
            cmd /c mklink /J "$cfgLink" "$target" | Out-Null
        }
    }
}
Write-Host "  -> All 6 skills linked into discovery paths." -ForegroundColor Green

# 4. Verification
Write-Host "[4/4] Verifying installation..." -ForegroundColor Cyan
$verified = $true
foreach ($s in $skills) {
    if (-not (Test-Path "$pluginsDir\$s\SKILL.md")) {
        $verified = $false
    }
}

if ($verified -and (Test-Path "$sharedScripts\scan_roblox.ps1")) {
    Write-Host ""
    Write-Host "======================================================" -ForegroundColor Green
    Write-Host "  SUCCESS: All Roblox skills installed successfully!" -ForegroundColor Green
    Write-Host "======================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Available slash commands in Antigravity 2.0 or CLI:" -ForegroundColor Yellow
    Write-Host "  /go-script <folder> [th/en]       -> Generate script immediately" -ForegroundColor White
    Write-Host "  /go-script-full <folder> [th/en]  -> Generate full script (8+ tabs)" -ForegroundColor White
    Write-Host "  /go-script-lite <folder> [th/en]  -> Generate lite script (4 tabs)" -ForegroundColor White
    Write-Host "  /plan-roblox-full <folder>        -> Full architecture prompt" -ForegroundColor White
    Write-Host "  /plan-roblox-lite <folder>        -> Lite architecture prompt" -ForegroundColor White
    Write-Host ""
} else {
    Write-Error "Installation verification failed. Missing files."
    exit 1
}
