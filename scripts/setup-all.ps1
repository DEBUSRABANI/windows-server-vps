# setup-all.ps1
# One-shot setup: enables Remote Desktop, then starts the ngrok tunnel.
# MUST be run from an elevated PowerShell window (Run as Administrator).
#
#   .\setup-all.ps1 -AuthToken "<your_ngrok_authtoken>"

#Requires -RunAsAdministrator

param(
    [Parameter(Mandatory = $true)]
    [string]$AuthToken
)

$here = Split-Path -Parent $MyInvocation.MyCommand.Path

# Step 1: enable RDP + firewall
& "$here\enable-rdp.ps1"

# Step 2: open the public ngrok tunnel to RDP
& "$here\start-ngrok-rdp.ps1" -AuthToken $AuthToken
