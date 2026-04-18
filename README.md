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

[![Version](https://img.shields.io/badge/version-1.6.7-00b4d8?style=flat-square)](#)
[![Platform](https://img.shields.io/badge/platform-Linux-00b4d8?style=flat-square&logo=linux&logoColor=white)](#)
[![Shell](https://img.shields.io/badge/shell-bash-00b4d8?style=flat-square&logo=gnubash&logoColor=white)](#)
[![License](https://img.shields.io/badge/license-Source%20Available-00b4d8?style=flat-square)](LICENSE)

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
sudo mkdir -p /usr/local/bin && \
curl -fsSL https://raw.githubusercontent.com/skosari/killport-linux/main/killport \
  -o /tmp/killport && sudo mv /tmp/killport /usr/local/bin/killport && sudo chmod +x /usr/local/bin/killport
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
| `killport uninstall` | Remove killport and all firewall rules |
| `killport attack <ip>` | AI pentest: scan 47 common ports + analysis |
| `killport attack allports <ip>` | AI pentest: scan all 65535 ports + analysis |
| `killport attack <ip>:<port>` | AI pentest: single port deep dive |
| `killport attack config` | Configure Ollama host and model |
| `killport attack log` | View attack history |

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

### `killport uninstall`
```
Uninstalling killport...
  Removed /usr/local/bin/killport
killport uninstalled.
```

### `killport attack config`
```
  Attack Config
  ────────────────────────────────────────────

  Config: /home/ubuntu/.config/killport/attack.conf

  Ollama Host
  Ollama is the AI engine that runs your models locally or on another machine.

    • This machine:    localhost:11434  or  127.0.0.1:11434
    • Another LAN box: 192.168.x.x:11434  (the IP of that machine)
    • Remote server:   45.76.x.x:11434   (must have port 11434 open)

  Default port is always 11434. Press Enter to keep current value.

  Current: localhost:11434
  → 

  Connecting to Ollama at localhost:11434...
  Connected.  2 model(s) available:

  ▶  1  llama3.2:latest
     2  deepseek-r1:8b

  Select model  [current: 1]
  → 

  Saved.  Host: localhost:11434  ·  Model: llama3.2:latest
```

### `killport attack 10.0.0.5`
```
  AI Pentest  →  10.0.0.5  (47 common ports)
  ────────────────────────────────────────────

  nmap not installed — needed for port/service scanning.
  Install it now? (requires sudo) [Y/n] → y

  ... (sudo apt-get install -y nmap) ...

  Connecting to Ollama at localhost:11434...
  Model: llama3.2:latest

  Scanning 47 common ports on 10.0.0.5...

  ●  22        ssh           OpenSSH 8.9p1 Ubuntu
  ●  3306      mysql         MySQL 8.0.33
  ●  27017     mongodb       MongoDB 6.0

  Agent starting  target: 10.0.0.5  ·  model: llama3.2:latest

  ▶  SCAN_PORT 3306
  ▶  WORDLIST mysql 3306
     ✓ root:  →  LOGIN SUCCEEDED
  ▶  BANNER_GRAB 27017
  ▶  WORDLIST ssh 22
     no credentials from wordlist succeeded
  ▶  REPORT

  Building report...

  ══════════════════════════════════════════════════════════════
    SECURITY REPORT  ·  10.0.0.5  ·  2025-04-17 14:32
    Model: llama3.2:latest
  ══════════════════════════════════════════════════════════════

    PORT 3306 — MYSQL  (MySQL 8.0.33)
    Risk: 🔴 Critical
    ────────────────────────────────────────────────────────────────
    ⚠  WEAK CREDENTIAL WORKS: root:(empty)

    What this means:
      Your MySQL database has no root password set.
      Anyone who can reach port 3306 has full admin access to all databases.

    How to fix it:
      1. Use a strong unique password for every database user
      2. Disable remote root login: run  DELETE FROM mysql.user WHERE User='root' AND Host!='localhost';
      3. Block port 3306 from the internet with a firewall rule

    PORT 22 — SSH  (OpenSSH 8.9p1 Ubuntu)
    Risk: 🟡 Medium
    ────────────────────────────────────────────────────────────────

    What this means:
      SSH lets you log in remotely to manage the server.
      If weak passwords are allowed, attackers can brute-force their way in.

    How to fix it:
      1. Disable password login — use SSH keys only
         Edit /etc/ssh/sshd_config → set: PasswordAuthentication no
      2. Move SSH to a non-standard port (e.g. 2222) to reduce bot noise
      3. Install fail2ban to automatically block repeated failed logins

  ══════════════════════════════════════════════════════════════
  ── What to do first ──
  ══════════════════════════════════════════════════════════════
    1. [CRITICAL] Change the password on mysql (port 3306) — 'root:' works
    2. [HIGH] Review and harden mongodb (port 27017) — see fix steps above

  ────────────────────────────────────────────
  Complete  ·  model: llama3.2:latest  ·  target: 10.0.0.5
  Logged to: /home/ubuntu/.config/killport/attack.log
```

### `killport attack allports 10.0.0.5`
```
  AI Pentest  →  10.0.0.5  (all 65535 ports)
  ────────────────────────────────────────────

  Pass 1/2  Scanning 47 common ports on 10.0.0.5...

  ●  22        ssh           OpenSSH 8.9p1
  ●  3306      mysql         MySQL 8.0.33

  Pass 2/2  scanning remaining 65535 ports on 10.0.0.5...

  [████████████████████░░░░░░░░░░░░░░░░░░░░]  51%
  ●  49152     unknown

  [████████████████████████████████████████] 100%
  Pass 2/2 complete.

  Agent starting  target: 10.0.0.5  ·  model: llama3.2:latest
  ...
```

### `killport attack log`
```
  Attack Log  /home/ubuntu/.config/killport/attack.log

  ════════════════════════════════════════════════════════════
  Time:   2025-04-17 14:32:01  |  Target: 10.0.0.5
  Model:  llama3.2:latest      |  Ports:  47 common ports
  ════════════════════════════════════════════════════════════
  ... (full report) ...
```

---

## AI Penetration Testing

> **Point it at any machine on your network. Watch an AI hunt for vulnerabilities in real time.**

`killport attack` is a fully agentic AI pentest tool powered by [Ollama](https://ollama.com) — your local AI, running entirely on your hardware, no cloud, no API keys. It doesn't just run a scan and hand you a wall of output. It **thinks**, **acts**, and **investigates** — probing services, testing credentials, hunting for exposed paths, and attempting to crack hashes — then delivers a plain-English security report with specific fix steps anyone can follow.

**Everything runs locally. Your scan data never leaves your machine.**

### Zero setup friction — missing tools install themselves

When you run `killport attack`, it checks whether `nmap`, `sshpass`, and `hashcat` are installed. If any are missing, it asks to install them for you **right there** — no new terminal, no manual steps:

```
  nmap not installed — needed for port/service scanning.
  Install it now? (requires sudo) [Y/n] → y
  ... sudo apt-get install -y nmap ...
  Continuing.
```

Auto-detects your package manager: `apt-get`, `dnf`, `yum`, `pacman`, or `zypper`. If none are found, it shows you the exact manual command for your distro.

### Setup

1. [Install Ollama](https://ollama.com/download) and pull a model:
   ```sh
   ollama pull llama3.2
   # or try a reasoning model:
   ollama pull deepseek-r1:8b
   ```
2. Configure killport to point at your Ollama instance:
   ```sh
   killport attack config
   ```
   - **This machine:** `localhost:11434` or `127.0.0.1:11434`
   - **Another LAN machine:** `192.168.x.x:11434`
   - **Remote server:** `45.76.x.x:11434` *(port 11434 must be open)*

   The config screen connects live to Ollama and shows you the models you have loaded — pick one by number.

3. Run your first attack:
   ```sh
   killport attack 10.0.0.5
   ```
   That's it. The AI takes over from there.

### Commands

```sh
killport attack 10.0.0.5            # scan 47 common ports (fast)
killport attack allports 10.0.0.5   # scan all 65535 ports with progress bar
killport attack 10.0.0.5:6379       # deep dive a single port
killport attack config               # configure Ollama host + pick model
killport attack log                  # view full history of past attacks
```

### How it works

The agent runs a **ReAct loop** — Ollama reasons about what to investigate next, calls a tool, receives the result, and iterates (up to 20 rounds). The AI drives the entire investigation. You just watch it work.

| Tool | What the AI can do |
|---|---|
| `SCAN_PORT` | Deep nmap scan with version detection on any port |
| `BANNER_GRAB` | Raw TCP banner grab — extracts version strings and hashes |
| `HTTP_PROBE` | Fetch HTTP/HTTPS responses — extracts embedded hashes |
| `HTTP_PATHS` | Probe 20+ sensitive paths: `/admin`, `/.env`, `/actuator/env`, `/.git/HEAD`, etc. |
| `WORDLIST` | Credential spray across SSH, FTP, Redis, MySQL, PostgreSQL, HTTP basic auth |
| `NMAP_SCRIPT` | Run any nmap NSE script against any port |
| `CRACK_HASH` | Crack MD5 / SHA1 / SHA256 / bcrypt / MD5crypt / SHA512crypt via hashcat or john + rockyou |

The security report is **built programmatically** — risk levels, fix steps, and priority order are all deterministic code, not AI guesswork. Ollama contributes plain-English descriptions of each finding. The result is consistent, structured, and logged to `~/.config/killport/attack.log` after every run.

### Example output

```
  AI Pentest  →  192.168.1.10  (47 common ports)
  ────────────────────────────────────────────

  Pass 1/2  Scanning 47 common ports on 192.168.1.10...

  ●  22        ssh           OpenSSH 8.9p1
  ●  6379      redis         Redis 7.0.11
  ●  27017     mongodb       MongoDB 6.0

  Agent starting  target: 192.168.1.10  ·  model: llama3.2

  ▶  SCAN_PORT 6379
  ▶  WORDLIST redis 6379
     CRITICAL: Redis has NO password — fully open to anyone
  ▶  REPORT

  ══════════════════════════════════════════════════════════════
    SECURITY REPORT  ·  192.168.1.10  ·  2025-04-17 14:32
    Model: llama3.2
  ══════════════════════════════════════════════════════════════

    PORT 6379 — REDIS
    Risk: 🔴 Critical
    ────────────────────────────────────────────────────────
    ⚠  NO PASSWORD REQUIRED — anyone on the network can connect

    What this means:
      Your Redis database has no password set.
      Anyone on your network can read, modify, or delete all stored data.

    How to fix it:
      1. Set a strong password: add  requirepass YOURPASSWORD  to /etc/redis/redis.conf
      2. Bind Redis to localhost only: add  bind 127.0.0.1  to redis.conf
      3. Block port 6379 from the network with a firewall rule

  ══════════════════════════════════════════════════════════════
  ── What to do first ──
  ══════════════════════════════════════════════════════════════
    1. [CRITICAL] Set a password on redis (port 6379) — it has none right now
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
