# enable-rdp.ps1
# Enables Remote Desktop (RDP) on this Windows machine.
# MUST be run from an elevated PowerShell window (Run as Administrator).

#Requires -RunAsAdministrator

Write-Host "Enabling Remote Desktop..." -ForegroundColor Cyan

# 1. Allow incoming RDP connections
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' `
    -Name 'fDenyTSConnections' -Value 0

# 2. Require Network Level Authentication (more secure)
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' `
    -Name 'UserAuthentication' -Value 1

# 3. Open the Windows Firewall for Remote Desktop
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

Write-Host "Remote Desktop is now ENABLED." -ForegroundColor Green
Write-Host "IMPORTANT: make sure the Windows account you log in with has a STRONG password," -ForegroundColor Yellow
Write-Host "because the RDP port will be reachable from the internet through ngrok." -ForegroundColor Yellow
