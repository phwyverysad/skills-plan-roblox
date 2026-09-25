# ==============================================================================
# Installer for plan-roblox Skill (Google Antigravity 2.0 & CLI)
# One-liner execution:
#   irm https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/main/install.ps1 | iex
# ==============================================================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host "  Installing 'plan-roblox' Skill for Google Antigravity" -ForegroundColor Yellow
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host ""

$baseDir = "$env:USERPROFILE\.gemini"
$skillTarget = "$baseDir\config\plugins\superpowers\skills\plan-roblox"
$scriptsTarget = "$skillTarget\scripts"
$antigravitySkills = "$baseDir\antigravity\skills\plan-roblox"
$configSkills = "$baseDir\config\skills\plan-roblox"

$repoRawBase = "https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/main"

# 1. Ensure target directory structure exists
Write-Host "[1/4] Creating skill directory structure..." -ForegroundColor Cyan
if (-not (Test-Path $scriptsTarget)) {
    New-Item -ItemType Directory -Path $scriptsTarget -Force | Out-Null
}

# 2. Download files
Write-Host "[2/4] Downloading skill files from GitHub..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri "$repoRawBase/SKILL.md" -OutFile "$skillTarget\SKILL.md" -UseBasicParsing
    Write-Host "  -> Downloaded SKILL.md" -ForegroundColor Green
    
    Invoke-WebRequest -Uri "$repoRawBase/scripts/scan_roblox.ps1" -OutFile "$scriptsTarget\scan_roblox.ps1" -UseBasicParsing
    Write-Host "  -> Downloaded scripts/scan_roblox.ps1" -ForegroundColor Green
} catch {
    Write-Warning "Could not download directly from main branch. Attempting master branch..."
    try {
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/master/SKILL.md" -OutFile "$skillTarget\SKILL.md" -UseBasicParsing
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/phwyverysad/skills-plan-roblox/master/scripts/scan_roblox.ps1" -OutFile "$scriptsTarget\scan_roblox.ps1" -UseBasicParsing
        Write-Host "  -> Downloaded successfully from master branch!" -ForegroundColor Green
    } catch {
        Write-Error "Failed to download files: $_"
        exit 1
    }
}

# 3. Create Junctions for Antigravity discovery
Write-Host "[3/4] Linking skill into Antigravity discovery paths..." -ForegroundColor Cyan

if (Test-Path "$baseDir\antigravity\skills") {
    if (-not (Test-Path $antigravitySkills)) {
        cmd /c mklink /J "$antigravitySkills" "$skillTarget" | Out-Null
        Write-Host "  -> Linked into ~/.gemini/antigravity/skills/" -ForegroundColor Green
    } else {
        Write-Host "  -> Link in ~/.gemini/antigravity/skills/ already exists." -ForegroundColor Gray
    }
}

if (Test-Path "$baseDir\config\skills") {
    if (-not (Test-Path $configSkills)) {
        cmd /c mklink /J "$configSkills" "$skillTarget" | Out-Null
        Write-Host "  -> Linked into ~/.gemini/config/skills/" -ForegroundColor Green
    } else {
        Write-Host "  -> Link in ~/.gemini/config/skills/ already exists." -ForegroundColor Gray
    }
}

# 4. Verification
Write-Host "[4/4] Verifying installation..." -ForegroundColor Cyan
if ((Test-Path "$skillTarget\SKILL.md") -and (Test-Path "$scriptsTarget\scan_roblox.ps1")) {
    Write-Host ""
    Write-Host "======================================================" -ForegroundColor Green
    Write-Host "  SUCCESS: 'plan-roblox' skill installed successfully!" -ForegroundColor Green
    Write-Host "======================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "How to use in Antigravity 2.0 or CLI:" -ForegroundColor Yellow
    Write-Host "  Type: /plan-roblox <path_to_decompiled_folder>" -ForegroundColor White
    Write-Host "  Example:" -ForegroundColor Gray
    Write-Host "    /plan-roblox C:\Users\Administrator\AppData\Local\Potassium\workspace\scripts_124216119978534" -ForegroundColor Gray
    Write-Host ""
} else {
    Write-Error "Installation verification failed. Missing files."
    exit 1
}
