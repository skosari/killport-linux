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

## Examples

### `killport 3000`
```
  Port 3000 is in use:

  PID:     48291
  User:    ubuntu
  Name:    node
  Command: node /home/ubuntu/app/server.js

Killed.
```

### `killport list`
```
  ●  0.0.0.0:3000        node        48291    TCP
  ●  0.0.0.0:5432        postgres    312      TCP
  ●  0.0.0.0:8080        nginx       1024     TCP
  ●  127.0.0.1:6379      redis       2048     TCP
```

### `killport open 8080`
```
Opening port 8080 to external connections...
Port 8080 is now open (TCP + UDP).
```

### `killport close 8080`
```
Closing port 8080 from external connections...
Port 8080 is now closed.
```

### `killport openports`
```
  Firewall-Open Ports  (external access via killport)
  ────────────────────────────────────────────

  ●  80        listening   nginx
  ●  443       listening   nginx
  ○  8080      not listening

  ────────────────────────────────────────────
  3 port(s) open  ·  2 listening
```

### `killport closedports`
```
  Locally-Listening Ports  (no external access)
  ────────────────────────────────────────────

  ◆  3000      local only   node
  ◆  5432      local only   postgres
  ◆  6379      local only   redis

  ────────────────────────────────────────────
  3 port(s) listening locally  ·  no external access
```

### `killport ports`
```
  Port Inspector  (local view — what this machine sees)
  ────────────────────────────────────────────

  Firewall  ENABLED   ufw active
  LAN IP    10.0.0.5

  PORT      PROCESS         ACCESS
  ────────  ──────────────  ──────────
  ●  22       sshd            open         (killport rule)
  ●  80       nginx           open         (killport rule)
  ○  3000     node            blocked
  ○  5432     postgres        blocked

  ────────────────────────────────────────────
  4 port(s) listening  ·  2 open to external access

  This is only what the local machine reports. To truly verify
  external reachability, run from another machine:
  killport opencheck 10.0.0.5
```

### `killport opencheck 10.0.0.5`
```
  External Port Check  → 10.0.0.5
  ────────────────────────────────────────────

  ●  22        open   ssh
  ●  80        open   http
  ●  443       open   https

  ────────────────────────────────────────────
  3 open port(s) found  ·  scanned 30 common ports via nmap
```

### `killport status 3000`
```
  Port 3000 status:

  Firewall:  CLOSED  (no killport rule — external access blocked)
  Listening: YES  (PID: 48291 — node)
```

### `killport ip`
```
  Network Interfaces
  ────────────────────────────────────

  Interface: eth1  (Docker network)
  IPv4:      172.17.0.1

  ┌─────────────────────────────────────────┐
  │  Interface: eth0                         │
  │  MAC:       52:54:00:1a:2b:3c           │
  │  IPv4:      10.0.0.5                    │
  └─────────────────────────────────────────┘

  Default Gateway
  ────────────────────────────────────
  10.0.0.1

  DNS Servers
  ────────────────────────────────────
  8.8.8.8
  8.8.4.4

  Firewall-managed ports (killport)
  ────────────────────────────────────
  22
  80
```

### `killport update`
```
Checking for updates...
Already up to date (v1.6.6)
```

---

## Uninstall

```sh
curl -fsSL https://raw.githubusercontent.com/skosari/killport-linux/main/uninstall.sh | bash
```

Removes the binary and any firewall rules created by `killport open`.

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

<div align="center">

Made by [skosari](https://github.com/skosari) · [killport-mac](https://github.com/skosari/killport-mac) · [killport-win](https://github.com/skosari/killport-win) · [killport-linux](https://github.com/skosari/killport-linux)

</div>
