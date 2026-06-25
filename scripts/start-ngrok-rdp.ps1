# start-ngrok-rdp.ps1
# Exposes this machine's Remote Desktop (TCP port 3389) to the internet via ngrok.
#
# Usage (first time, pass your ngrok authtoken):
#   .\start-ngrok-rdp.ps1 -AuthToken "<your_ngrok_authtoken>"
#
# Usage (after the token has been saved once):
#   .\start-ngrok-rdp.ps1
#
# Get a free authtoken (no credit card) at:
#   https://dashboard.ngrok.com/get-started/your-authtoken

param(
    [string]$AuthToken
)

$ngrok = "ngrok"   # assumes ngrok is on PATH (installed via: winget install Ngrok.Ngrok)

if ($AuthToken) {
    Write-Host "Saving ngrok authtoken..." -ForegroundColor Cyan
    & $ngrok config add-authtoken $AuthToken
}

Write-Host ""
Write-Host "Starting ngrok TCP tunnel -> RDP (port 3389)..." -ForegroundColor Cyan
Write-Host "Watch for a line like:" -ForegroundColor Yellow
Write-Host "    Forwarding   tcp://0.tcp.ngrok.io:NNNNN -> localhost:3389" -ForegroundColor Yellow
Write-Host "Then connect with Remote Desktop (mstsc) to  0.tcp.ngrok.io:NNNNN" -ForegroundColor Yellow
Write-Host ""

& $ngrok tcp 3389
