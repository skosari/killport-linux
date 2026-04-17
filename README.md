<div align="center">

<pre>
██╗  ██╗██╗██╗     ██╗     ██████╗  ██████╗ ██████╗ ████████╗
██║ ██╔╝██║██║     ██║     ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝
█████╔╝ ██║██║     ██║     ██████╔╝██║   ██║██████╔╝   ██║   
██╔═██╗ ██║██║     ██║     ██╔═══╝ ██║   ██║██╔══██╗   ██║   
██║  ██╗██║███████╗███████╗██║     ╚██████╔╝██║  ██╗   ██║   
╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
</pre>

**Kill whatever is running on a port — Linux**

[![Version](https://img.shields.io/badge/version-1.6.6-00b4d8?style=flat-square)](#)
[![Platform](https://img.shields.io/badge/platform-Linux-00b4d8?style=flat-square&logo=linux&logoColor=white)](#)
[![Shell](https://img.shields.io/badge/shell-bash-00b4d8?style=flat-square&logo=gnubash&logoColor=white)](#)
[![License](https://img.shields.io/badge/license-MIT-00b4d8?style=flat-square)](#)

</div>

---

```
$ killport 3000

Port 3000 is in use:

  PID:     48291
  User:    ubuntu
  Name:    node
  Command: node /home/ubuntu/app/server.js

Killed.
```

---

## Install

**Option 1 — curl** *(recommended)*

```sh
curl -fsSL https://raw.githubusercontent.com/skosari/killport-linux/main/install.sh | bash
```

**Option 2 — wget**

```sh
wget -qO /usr/local/bin/killport \
  https://raw.githubusercontent.com/skosari/killport-linux/main/killport \
  && chmod +x /usr/local/bin/killport
```

**Option 3 — Manual**

```sh
sudo curl -fsSL https://raw.githubusercontent.com/skosari/killport-linux/main/killport \
  -o /usr/local/bin/killport && sudo chmod +x /usr/local/bin/killport
```

---

## Commands

| Command | Description |
|---|---|
| `killport` | Show help |
| `killport <port>` | Kill whatever is running on that port |
| `killport list` | List all listening ports |
| `killport open <port>` | Open a port to external connections |
| `killport close <port>` | Close a port from external connections |
| `killport openports` | Show all ports open to external access |
| `killport closedports` | Show all listening ports with no external access |
| `killport ports` | Inspect all ports with live firewall status |
| `killport opencheck <ip>` | Probe an IP to verify external reachability |
| `killport status <port>` | Show if a port is open or closed |
| `killport ip` | Show IP addresses, DNS, and network info |
| `killport update` | Update to the latest version |

---

## Port Inspector

```
$ killport ports

  Port Inspector  (local view — what this machine sees)
  ────────────────────────────────────────────────────

  Firewall  ENABLED   ufw active
  LAN IP    10.0.0.5

  PORT      PROCESS         ACCESS
  ────────  ──────────────  ──────────
  ●  22       sshd            open         (killport rule)
  ●  80       nginx           open         (killport rule)
  ○  5432     postgres        blocked

  To truly verify external reachability, run from another machine:
  killport opencheck 10.0.0.5
```

---

## Firewall Support

`killport open` and `killport close` work with:

| Tool | Auto-detected |
|---|---|
| `ufw` | yes |
| `firewalld` | yes |
| `iptables` | fallback |

Port listing uses `ss` (preferred), with fallback to `lsof` or `fuser`.

---

## Update

```sh
killport update
```

Self-updates by pulling the latest script from this repo. Version is checked via the GitHub API — no CDN caching issues.

---

<div align="center">

Made by [skosari](https://github.com/skosari) · [killport-mac](https://github.com/skosari/killport-mac) · [killport-win](https://github.com/skosari/killport-win) · [killport-linux](https://github.com/skosari/killport-linux)

</div>
