###############################################################################
# PowerShell Profile - Security Operations & Automation Framework
###############################################################################

# --- Global Environment Variables ---
# Dynamically resolves the user path to avoid hardcoding names
$HOME_DIR = "C:\Users\$env:USERNAME"
$BACKUP_DRIVE = "D:\"

####################
# Navigation Aliases
####################
function source-profile { . $PROFILE; Write-Host "Profile Reloaded." -ForegroundColor Green }
Set-Alias -Name reload -Value source-profile

function home { Set-Location -Path $HOME_DIR }

# Logic: Uses wildcards to find labs even if folder names shift slightly
function lab { Set-Location (Get-Item "$HOME_DIR\Documents\automate*") }
function lab2 { Set-Location (Get-Item "$HOME_DIR\Documents\learn*powershell*lunches*") }

####################
# Security Gated Execution
####################
# Core function to ensure VPN is active before any web-facing traffic
function Start-SecureProcess {
    param(
        [Parameter(Mandatory)] [string]$ProcessName,
        [string]$Arguments = ""
    )

    $vpn = Get-Process -Name "ProtonVPN.Client" -ErrorAction SilentlyContinue

    if ($vpn) {
        Write-Host "[SECURE] VPN active. Launching $ProcessName..." -ForegroundColor Yellow
        if ($Arguments) {
            Start-Process $ProcessName -ArgumentList $Arguments
        }
        else {
            Start-Process $ProcessName
        }
    }
    else {
        Write-Warning "[BLOCK] Execution Aborted: ProtonVPN is NOT running. Connect VPN first."
    }
}

# Secure Browser Shortcuts
function edge { Start-SecureProcess "msedge.exe" }
function fox { Start-SecureProcess "firefox.exe" }

####################
# Connectivity
####################
# Quick public IP check to verify VPN tunnel location
function myip { (Invoke-RestMethod -Uri "https://icanhazip.com").Trim() }
function ext { myip }

####################
# Process Management (The "Kill-Switch")
####################
# One function to rule them all instead of 10 individual 'kill' functions
function stop-apps {
    param(
        [string[]]$AppNames = @('msedge', 'chrome', 'brave', 'firefox', 'opera', 'vivaldi', 'code', 'SnagitCapture', 'SnagitEditor', 'Voicemod')
    )
    foreach ($app in $AppNames) {
        if (Get-Process -Name $app -ErrorAction SilentlyContinue) {
            Write-Host "Stopping $app..." -ForegroundColor Cyan
            Stop-Process -Name $app -Force -ErrorAction SilentlyContinue
        }
    }
}

# kill swtich shortcuts
function snag1kill { stop-apps SnagitCapture }
function snag2kill { stop-apps SnagitEditor }

###############################################################################
# Local/Private Extensions
# Load sensitive functions from a non-GitHub tracked file if it exists
###############################################################################
$privateProps = "$HOME_DIR\.config\powershell\PrivateProfile.ps1"
if (Test-Path $privateProps) { . $privateProps }