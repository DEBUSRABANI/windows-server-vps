# windows-server-vps

Scripts to give a **local Windows machine** secure remote access over the internet
using [ngrok](https://ngrok.com) — **no cloud VPS and no credit card required**.

ngrok creates a tunnel from a public address (e.g. `0.tcp.ngrok.io:14823`) to this
machine's Remote Desktop port (`3389`), so you can RDP in from anywhere.

## Prerequisites

- Windows 10/11 **Pro** or Windows **Server** (Remote Desktop is not available on Home editions).
- [ngrok](https://ngrok.com) installed:
  ```powershell
  winget install Ngrok.Ngrok
  ```
- A **free** ngrok account (no card) and your authtoken:
  https://dashboard.ngrok.com/get-started/your-authtoken

## Quick start

Open **PowerShell as Administrator** in the `scripts` folder and run:

```powershell
.\setup-all.ps1 -AuthToken "<your_ngrok_authtoken>"
```

This will:

1. **Enable Remote Desktop** and open the firewall (`enable-rdp.ps1`).
2. **Start an ngrok TCP tunnel** to port 3389 (`start-ngrok-rdp.ps1`).

ngrok then prints a forwarding line like:

```
Forwarding   tcp://0.tcp.ngrok.io:14823 -> localhost:3389
```

Connect from any computer with Remote Desktop (`mstsc`) using that `host:port`:

- **Computer:** `0.tcp.ngrok.io:14823`
- **Username:** your Windows account name
- **Password:** your Windows account password

## Scripts

| Script | Purpose |
|---|---|
| `scripts/enable-rdp.ps1` | Turn on Remote Desktop + firewall rule (admin). |
| `scripts/start-ngrok-rdp.ps1` | Open the ngrok tunnel to RDP. |
| `scripts/setup-all.ps1` | Do both in one step (admin). |

## Security notes

- Your RDP port becomes reachable from the internet while ngrok is running.
  **Use a strong Windows password** and stop the tunnel (`Ctrl+C`) when not in use.
- The free ngrok address changes every time you restart the tunnel.
- Consider enabling Network Level Authentication (the scripts do this) and
  limiting which user accounts may log in remotely.
