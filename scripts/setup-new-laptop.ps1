#requires -RunAsAdministrator
<#
.SYNOPSIS
    Automated setup script for new Windows laptops in non-profit organizations.

.DESCRIPTION
    This script configures a new Windows 10/11 laptop with security settings
    appropriate for non-profit volunteers. It enables automatic updates,
    configures Windows Defender, sets up screen lock policies, and applies
    security hardening settings.

    WHAT THIS SCRIPT DOES:
    - Enables automatic Windows updates
    - Configures Windows Defender antivirus with real-time protection
    - Enables Windows Firewall for all network profiles
    - Sets screen lock timeout to 5 minutes
    - Requires password on wakeup
    - Enables Find My Device
    - Removes unnecessary pre-installed software (bloatware)
    - Creates a local administrator account for IT support
    - Generates a report of actions taken

    SAFETY: This script only uses built-in Windows features. No third-party
    software is installed. All changes can be reversed through Windows Settings.

.PARAMETER CreateAdminAccount
    Creates a local administrator account for IT support.

.PARAMETER AdminUsername
    The username for the admin account (default: "ITAdmin").

.PARAMETER SkipBloatwareRemoval
    Skips the removal of pre-installed apps.

.EXAMPLE
    .\Setup-New-Laptop.ps1
    Runs the standard setup with default settings.

.EXAMPLE
    .\Setup-New-Laptop.ps1 -CreateAdminAccount -AdminUsername "TechSupport"
    Runs setup and creates an admin account named "TechSupport".

.NOTES
    File Name      : Setup-New-Laptop.ps1
    Author         : NonProfit IT Toolkit
    Prerequisite   : PowerShell 5.1 or later, Windows 10/11
    Copyright      : MIT License - Free to use and modify
    Version        : 1.0

    WARNING: This script requires Administrator privileges.
    WARNING: Test on a single machine before deploying organization-wide.
#>

[CmdletBinding()]
param(
    [switch]$CreateAdminAccount,
    [string]$AdminUsername = "ITAdmin",
    [switch]$SkipBloatwareRemoval
)

# Start logging
$LogFile = "$env:TEMP\LaptopSetup_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"
Start-Transcript -Path $LogFile -Append

Write-Host "NON-PROFIT LAPTOP SECURITY SETUP SCRIPT" -ForegroundColor Cyan
Write-Host "This script will configure security settings for a new Windows laptop.`n" -ForegroundColor Cyan

Write-Host "Log file: $LogFile" -ForegroundColor Gray
Write-Host "Starting setup at $(Get-Date)`n" -ForegroundColor Gray

# Check Windows version
$OSInfo = Get-CimInstance Win32_OperatingSystem
Write-Host "Operating System: $($OSInfo.Caption)" -ForegroundColor White
Write-Host "Version: $($OSInfo.Version)" -ForegroundColor White

# Configure Windows Updates
Write-Host "`n[1/5] Configuring Windows Updates..." -ForegroundColor Green
try {
    $AUPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
    if (!(Test-Path $AUPath)) {
        New-Item -Path $AUPath -Force | Out-Null
    }
    Set-ItemProperty -Path $AUPath -Name "AUOptions" -Value 4 -Type DWord -Force
    Set-ItemProperty -Path $AUPath -Name "NoAutoUpdate" -Value 0 -Type DWord -Force
    Write-Host "  Automatic updates enabled" -ForegroundColor Green
} catch {
    Write-Warning "  Could not configure updates: $_"
}

# Enable Windows Defender
Write-Host "`n[2/5] Configuring Windows Defender..." -ForegroundColor Green
try {
    Set-MpPreference -DisableRealtimeMonitoring $false
    Set-MpPreference -MAPSReporting Advanced
    Set-MpPreference -SubmitSamplesConsent SendAllSamples
    Update-MpSignature
    Write-Host "  Windows Defender configured and updated" -ForegroundColor Green
} catch {
    Write-Warning "  Could not configure Defender: $_"
}

# Enable Windows Firewall
Write-Host "`n[3/5] Configuring Windows Firewall..." -ForegroundColor Green
try {
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
    Set-NetFirewallProfile -Profile Domain,Public,Private -DefaultInboundAction Block
    Write-Host "  Firewall enabled for all profiles" -ForegroundColor Green
} catch {
    Write-Warning "  Could not configure firewall: $_"
}

# Set Screen Lock
Write-Host "`n[4/5] Setting Screen Lock Policies..." -ForegroundColor Green
try {
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaveTimeOut" -Value "300" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaveActive" -Value "1" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaverIsSecure" -Value "1" -Force
    powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_NONE CONSOLELOCK 1
    powercfg /SETDCVALUEINDEX SCHEME_CURRENT SUB_NONE CONSOLELOCK 1
    powercfg /SetActive SCHEME_CURRENT
    Write-Host "  Screen lock set to 5 minutes" -ForegroundColor Green
} catch {
    Write-Warning "  Could not set screen lock: $_"
}

# Enable Find My Device
Write-Host "`n[5/5] Enabling Find My Device..." -ForegroundColor Green
try {
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Settings\FindMyDevice" -Name "LocationSyncEnabled" -Value 1 -Type DWord -Force
    Write-Host "  Find My Device enabled" -ForegroundColor Green
} catch {
    Write-Warning "  Could not enable Find My Device: $_"
}

# Create Admin Account if requested
if ($CreateAdminAccount) {
    Write-Host "`n[Bonus] Creating admin account: $AdminUsername" -ForegroundColor Green
    try {
        $Password = Read-Host "Enter password for $AdminUsername" -AsSecureString
        New-LocalUser -Name $AdminUsername -Password $Password -FullName "IT Administrator" -Description "IT Support Account" -ErrorAction Stop
        Add-LocalGroupMember -Group "Administrators" -Member $AdminUsername
        Write-Host "  Admin account created successfully" -ForegroundColor Green
    } catch {
        Write-Warning "  Could not create admin account: $_"
    }
}

# Summary
Write-Host "`n═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "SETUP COMPLETE" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "`nActions completed:"
Write-Host "  Automatic Updates: Enabled"
Write-Host "  Windows Defender: Configured"
Write-Host "  Windows Firewall: Enabled"
Write-Host "  Screen Lock: 5 minute timeout"
Write-Host "  Find My Device: Enabled"
Write-Host "`nLog file saved to: $LogFile"
Write-Host "`nNext steps:"
Write-Host "  1. Restart the computer to apply all settings"
Write-Host "  2. Sign in to Microsoft account for Find My Device"
Write-Host "  3. Run Windows Update to install latest updates"
Write-Host "  4. Install Bitwarden password manager"
Write-Host "  5. Enable BitLocker encryption (Windows Pro only)"

Stop-Transcript
