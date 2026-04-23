<div align="center">

<pre>
██╗  ██╗██╗██╗     ██╗     ██████╗  ██████╗ ██████╗ ████████╗
██║ ██╔╝██║██║     ██║     ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝
█████╔╝ ██║██║     ██║     ██████╔╝██║   ██║██████╔╝   ██║   
██╔═██╗ ██║██║     ██║     ██╔═══╝ ██║   ██║██╔══██╗   ██║   
██║  ██╗██║███████╗███████╗██║     ╚██████╔╝██║  ██╗   ██║   
╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
</pre>

**Kill ports · manage firewall · SSH easy connect · Wake on LAN · remote shutdown · network scanning — Linux**

Also available for [macOS](https://github.com/skosari/killport-mac) · [Windows](https://github.com/skosari/killport-win) · [Windows CMD](https://github.com/skosari/killport-cmd)

AI-powered pentesting, vulnerability scanning, and automated hardening via [Ollama](https://ollama.com) — runs entirely on your hardware

[![Version](https://img.shields.io/badge/version-1.11.28-00b4d8?style=flat-square)](#)
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
wget -qO /tmp/killport https://raw.githubusercontent.com/skosari/killport-linux/main/killport \
  && sudo mv /tmp/killport /usr/local/bin/killport \
  && sudo chmod +x /usr/local/bin/killport
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
| `killport attack <ip>` | AI pentest: scan all ports + analysis (requires Ollama) |
| `killport attack <ip>:<port>` | AI pentest: single port deep dive (requires Ollama) |
| `killport attack log` | View attack history |
| `killport audit` | Review firewall rules with plain-English findings |
| `killport cert <host:port>` | Inspect TLS certificate (expiry, SANs, cipher) |
| `killport close <port>` | Close a port from external connections |
| `killport closedports` | Show all listening ports with no external access |
| `killport code` | Launch opencode AI coding assistant with your saved Ollama config |
| `killport code <model>` | Launch opencode with a specific Ollama model |
| `killport code model` | Pick a model from your Ollama library |
| `killport code install` | Install opencode |
| `killport config` | Configure Ollama host and model |
| `killport dns <domain>` | DNS recon: A/MX/TXT/NS/AXFR zone transfer test |
| `killport fix <ip:port>` | Detect vulns and generate/apply a hardening fix (requires Ollama) |
| `killport forward <port> <host:port>` | Forward a local port to a remote host:port |
| `killport ip` | Show IP addresses, DNS, and network info |
| `killport list` | List all listening ports |
| `killport open <port>` | Open a port to external connections |
| `killport openports` | Show all ports open to external access |
| `killport openports <ip>` | Probe an IP to verify which ports are reachable |
| `killport ports` | Inspect all ports with live firewall status |
| `killport scan` | Scan local network for all active computers |
| `killport scan <ip>` | Scan ports on a remote host |
| `killport scan <ip> all` | Scan all 65535 ports on a remote host |
| `killport setup` | Interactive pro setup wizard (Ollama, SSH, required tools) |
| `killport shutdown` | Scan network and pick a machine to shut down |
| `killport shutdown <ip>` | Send a shutdown signal to a remote machine via SSH |
| `killport shutdown <name>` | Shut down a saved host by name |
| `killport shutdown list` | Show all saved shutdown hosts |
| `killport shutdown delete <name>` | Remove a saved shutdown host |
| `killport restart` | Scan network and pick a machine to restart |
| `killport restart <ip>` | Send a restart signal to a remote machine via SSH |
| `killport restart <name>` | Restart a saved host by name |
| `killport restart list` | Show all saved shutdown/restart hosts |
| `killport sniff <ip:port>` | Capture traffic to/from a specific host:port |
| `killport sniff <port>` | Capture and display traffic on a port |
| `killport ssh` | Generate a token so another machine can SSH into this one |
| `killport ssh <name>` | SSH to a saved connection using your key |
| `killport ssh <name> <new-ip>` | Update the saved IP for a connection (e.g. after DHCP change) |
| `killport ssh ks:<token>` | Accept a token — adds their key and enables SSH access |
| `killport ssh list` | Show all saved SSH connections |
| `killport ssh delete <name>` | Remove a saved SSH connection |
| `killport status <port>` | Show if a port is open or closed |
| `killport stress <ip:port>` | Authorized connection flood / stress test |
| `killport uninstall` | Remove killport and all firewall rules |
| `killport update` | Update to the latest version |
| `killport vuln <ip:port>` | Detect service version + query CVE database |
| `killport watch <port>` | Monitor live connections to a local port |
| `killport wol` | Wake a LAN computer — scan network or pick a saved host |
| `killport wol <name>` | Wake a saved host by name |
| `killport wol list` | Show all saved WoL hosts |
| `killport wol save <name> <mac> [ip]` | Save a host for quick wake |
| `killport wol delete <name>` | Remove a saved WoL host |

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
  PORT     PID(S)            ADDRESS                   PROCESS
  ───────  ────────────────  ────────────────────────  ──────────────────────
  22       1953              *                         sshd
  80       1024 (+11 more)   *                         nginx
  3000     48291             *                         node
  5432     312               *                         postgres
  6379     2048              127.0.0.1                 redis-server

  5 service(s) listening
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

  To verify external reachability from another machine:
  killport openports 10.0.0.5
```

### `killport openports 10.0.0.5`
```
  External Port Check  → 10.0.0.5
  ────────────────────────────────────────────

  ●  22        open   ssh
  ●  80        open   http
  ●  443       open   https

  ────────────────────────────────────────────
  3 open port(s) found  ·  scanned 30 common ports via nmap
```

### `killport ports`
```
  Port Inspector  (local view)
  ────────────────────────────────────────────

  Firewall  ENABLED   ufw active
  LAN IP    10.0.0.5

  PORT      PROCESS         ACCESS
  ────────  ──────────────  ──────────
  ●  22       sshd            open         (killport rule)
  ●  80       nginx           open         (killport rule)
  ○  3000     node            blocked
  ○  5432     postgres        blocked
```

### `killport scan`
```
  killport scan  local network
  ────────────────────────────────────────────

  ?                               192.168.1.1      48:22:54:4f:3b:25
  ?                               192.168.1.10     10:ff:e0:23:9b:44
  ?                               192.168.1.22     4c:20:b8:ab:36:10
  [████████████████████████████░░]   93%  3 host(s) found

  3 host(s) found on 192.168.1.0/24
```

### `killport scan 10.0.0.5`
```
  killport scan  10.0.0.5
  ────────────────────────────────────────────

  Scanning common ports...

  PORT     SERVICE             VERSION
  ────────────────────────────────────────────────────
  22       ssh                 OpenSSH 9.2p1
  80       http                nginx 1.24.0
  3306     mysql               MySQL 8.0.33
  6379     redis               Redis key-value store

  Host latency: 0.0008 s latency
```

### `killport wol`
```
  Wake on LAN
  ────────────────────────────────────────────

   1  ★ htpc                   10:ff:e0:23:9b:44  192.168.1.10

  Scanning 192.168.1 — type a number + Enter to wake immediately

   2  ?                        192.168.1.1      48:22:54:4f:3b:25
   3  ?                        192.168.1.22     4c:20:b8:ab:36:10
  [██████████████████████████████]  100%  3 host(s) found

  Enter number to wake, or 's <num> <name>' to save a host:
  → 1

  Waking htpc  10:ff:e0:23:9b:44  192.168.1.10
  Magic packet sent.
```

### `killport watch 3000`
```
  killport watch  port 3000  (Ctrl+C to stop)
  ────────────────────────────────────────────

  TIME        REMOTE                      STATE           PROCESS
  ──────────────────────────────────────────────────────────────
  14:32:01    10.0.0.55:51204             ESTABLISHED     node
  14:32:09    10.0.0.55:51204             CLOSE_WAIT      node
```

### `killport cert github.com`
```
  killport cert  github.com:443
  ────────────────────────────────────────────

  Subject :  CN=github.com
  Issuer  :  C=US, O=DigiCert Inc, CN=DigiCert TLS Hybrid ECC SHA384 2020 CA1
  Expires :  2026-03-26  (341 days)
  SANs    :
    github.com
    www.github.com

  Protocol: Tls13
  Cipher  : Aes128
```

### `killport sniff 443`
```
  killport sniff  port 443  (Ctrl+C to stop)
  ────────────────────────────────────────────

  Filter: port 443. Requires sudo.

  14:32:01.123  10.0.0.55.51204 > 10.0.0.1.443: Flags [S]
  14:32:01.124  10.0.0.1.443 > 10.0.0.55.51204: Flags [S.]
```

### `killport sniff 10.0.0.10:22`
```
  killport sniff  10.0.0.10:22  (Ctrl+C to stop)
  ────────────────────────────────────────────

  Filter: host 10.0.0.10 and port 22. Requires sudo.

  14:33:10.441  10.0.0.5.52100 > 10.0.0.10.22: Flags [S]
  14:33:10.442  10.0.0.10.22 > 10.0.0.5.52100: Flags [S.]
```

### `killport vuln 10.0.0.5:22`
```
  killport vuln  10.0.0.5:22
  ────────────────────────────────────────────

  Detecting service on port 22...

  Service:  ssh
  Version:  OpenSSH 9.2p1

  Querying NVD database...

  85 CVE(s) found — showing top 10:

  CVE-2023-38408  [CRITICAL  9.8]
  The PKCS#11 feature in ssh-agent in OpenSSH before 9.3p2 has an insufficiently...

  CVE-2023-51385  [MEDIUM  6.5]
  In ssh in OpenSSH before 9.6, OS command injection might occur if a user name or...
```

### `killport fix 10.0.0.5:22`
```
  killport fix  10.0.0.5:22
  ────────────────────────────────────────────

  Detecting service on port 22...

  Service:  ssh
  Version:  OpenSSH 9.2p1

  ✓  Target is this machine — can apply fixes directly.

  Querying NVD database...

  ────────────────────────────────────────────
  AI Remediation Advice

  UPGRADE: sudo apt-get update && apt-get install --only-upgrade openssh-server

  CONFIG:
    PermitRootLogin no
    MaxAuthTries 3
    X11Forwarding no
    PermitEmptyPasswords no

  NETWORK: sudo ufw limit 22/tcp

  ────────────────────────────────────────────
  Apply these fixes now? (requires sudo)  [yes/N]: yes

    [fix] Backed up sshd_config
    [fix] sshd_config hardened
    [fix] SSH service restarted
    [fix] OpenSSH upgrade attempted
    [fix] Fix script completed

  ✓  Fixes applied.  Verify with: killport vuln 10.0.0.5:22
```

### `killport audit`
```
  killport audit  firewall rule review
  ────────────────────────────────────────────

  ufw status: active

  Findings:

  ✓  ufw is active.
  ⚠  Port 22 (SSH) referenced — confirm it's restricted to trusted IPs.
  ⚠  No rate limiting rules found — consider: ufw limit 22/tcp

  Run 'killport ports' to cross-reference currently exposed ports.
```

### `killport dns example.com`
```
  killport dns  example.com
  ────────────────────────────────────────────

  A         93.184.216.34
  AAAA      2606:2800:220:1:248:1893:25c8:1946
  MX        (none)
  NS        a.iana-servers.net
            b.iana-servers.net
  TXT       "v=spf1 -all"

  REVERSE
    93.184.216.34  →  93.184.216.34.in-addr.arpa

  AXFR
    ✓  Zone transfers blocked.
```

### `killport forward 8080 10.0.0.10:80`
```
  killport forward  localhost:8080  →  10.0.0.10:80
  ────────────────────────────────────────────

  ✓  socat  —  forwarding port 8080 to 10.0.0.10:80
  Press Ctrl+C to stop.
```

### `killport stress 10.0.0.5:80`
```
  killport stress  authorized connection flood testing
  ────────────────────────────────────────────

  Target:   10.0.0.5:80  (service: http)

  Duration in seconds — auto-starting in 10s [default 30]:  30

  ⚠  This will flood 10.0.0.5:80 for 30s at up to 20 concurrent connections.
  Only test systems you own or have written authorization to test.

  Type yes to confirm: yes

  ⠸  [████████████████░░░░░░░░]  12,847 req  428/s  0 err  18s left

  ════════════════════════════════════════════════════════
  STRESS TEST COMPLETE
  ════════════════════════════════════════════════════════
  Service:   http  (10.0.0.5:80)
  Duration:  30s  ·  Threads: 20
  Requests:  18,432  (614/s avg  ·  891/s peak)
  Errors:    0  (0%)
  After:     ONLINE — still responding
  ════════════════════════════════════════════════════════
```

### `killport attack 10.0.0.5`
```
  AI Pentest  →  10.0.0.5  (47 common ports)
  ────────────────────────────────────────────

  Connecting to Ollama at localhost:11434...
  Model: llama3.2:latest

  Scanning 47 common ports on 10.0.0.5...

  ●  22        ssh           OpenSSH 8.9p1 Ubuntu
  ●  3306      mysql         MySQL 8.0.33
  ●  27017     mongodb       MongoDB 6.0

  Agent starting  target: 10.0.0.5  ·  model: llama3.2:latest

  💭 MySQL is running — I'll check for weak credentials first
  ▶  WORDLIST mysql 3306
     ✓ root:  →  LOGIN SUCCEEDED
  ▶  REPORT

  ══════════════════════════════════════════════════════════════
    SECURITY REPORT  ·  10.0.0.5  ·  2025-04-18 14:32
  ══════════════════════════════════════════════════════════════

    PORT 3306 — MYSQL
    Risk: 🔴 Critical
    ────────────────────────────────────────────────────────────────
    ⚠  WEAK CREDENTIAL WORKS: root:(empty)

    How to fix it:
      1. Set a root password immediately
      2. Run: killport fix 10.0.0.5:3306

  Logged to: ~/.config/killport/attack.log
```

---

## Security Toolkit

killport includes a full suite of network security tools beyond just killing ports.

### Vulnerability Detection → `killport vuln`

Detects service version via nmap and queries the [NVD](https://nvd.nist.gov) CVE database:

```sh
killport vuln 10.0.0.5:22    # SSH
killport vuln 10.0.0.5:6379  # Redis
killport vuln 10.0.0.5:3306  # MySQL
```

### One-Command Hardening → `killport fix`

Automated fix after `vuln` findings. Local targets get direct apply; remote targets get a generated script:

```sh
killport fix 127.0.0.1:6379   # harden local Redis
killport fix 10.0.0.5:22      # generate SSH fix script for remote machine
```

Supports: SSH, Redis, MySQL, PostgreSQL, MongoDB, Nginx/Apache, FTP, Telnet, Memcached.

### Port Scanner → `killport scan`

```sh
killport scan                 # discover all active hosts on local network
killport scan 10.0.0.5        # common ports on a specific host
killport scan 10.0.0.5 all    # all 65535 ports
```

### SSH Easy Connect → `killport ssh`

Connect two machines over SSH with a single copy-paste — no manual key copying, no `authorized_keys` editing.

**On the machine you want to connect *from*:**

```sh
killport ssh
```

Generates an Ed25519 keypair (stored at `~/.killport/id_ed25519`) and outputs a self-contained token:

```
  killport ssh — Key Exchange
  ────────────────────────────────────────────

  Using existing key: ~/.killport/id_ed25519.pub

  Run this on the other machine:

  killport ssh ks:eyJ1c2VyIjoic2FtIiwiaXAiOiIxOTIuMTY4LjEuNDIiLCJwdWJrZXkiOiJzc2...

  Then connect from this machine with:
  ssh -i ~/.killport/id_ed25519 <their-user>@<their-ip>

  Your IP on this machine: 192.168.1.42
```

**On the machine you want to connect *to* — paste the token:**

```sh
killport ssh ks:<token>
```

```
  ✓ Key added to ~/.ssh/authorized_keys
  From: sam@192.168.1.42

  They can now connect with:
  ssh -i ~/.killport/id_ed25519 sam@192.168.1.55
```

The token is self-contained — it encodes your public key, username, and IP as base64 JSON. No server, no pastebin, no manual file editing. Works Linux↔Linux, Linux↔Mac, and Mac↔Mac.

**After accepting, the connection is saved by name.** Look it up any time without memorising IPs:

```sh
killport ssh list                          # see all saved connections
killport ssh sams-laptop                   # connect using saved key
killport ssh sams-laptop 192.168.1.55      # update IP if it changed (no re-pairing needed)
killport ssh delete sams-laptop            # remove a saved connection
killport ssh delete 'sams laptop'          # use single quotes for names with spaces
```

```
  SSH Easy Connect — sams-laptop
  ────────────────────────────────────────────

  sam (192.168.1.42) — key accepted 2026-04-19

  They connect to this machine with:
  ssh -i ~/.killport/id_ed25519 youruser@192.168.1.55
```

### Shutdown & Restart → `killport shutdown` / `killport restart`

Send a shutdown or restart signal to any Mac, Linux, or Windows machine on your network over SSH. Hosts are shared between both commands — adding one to shutdown automatically makes it available to restart.

```sh
killport shutdown                  # scan your /24 subnet and pick a machine
killport shutdown 192.168.1.50     # shutdown by IP (prompts OS + user, offers to save)
killport shutdown mini             # shutdown a saved host by name
killport shutdown list             # show all saved hosts
killport shutdown delete mini      # remove a saved host
killport shutdown delete 'my htpc' # use single quotes for names with spaces

killport restart 192.168.1.50      # restart by IP
killport restart mini              # restart a saved host by name
killport restart list              # same list as shutdown (shared hosts file)
```

Supports macOS (`sudo shutdown -h now` / `sudo shutdown -r now`), Linux (`sudo shutdown -h now` / `sudo shutdown -r now`), and Windows (`shutdown /s /t 0 /f` / `shutdown /r /t 0 /f`). Uses the killport SSH key (`~/.killport/id_ed25519`) — set that up first with `killport ssh`.

---

### Wake on LAN → `killport wol`

Boot any machine on your LAN remotely by sending a magic packet:

```sh
killport wol                           # scan network, pick a host to wake
killport wol htpc                      # wake saved host by name
killport wol 10:ff:e0:23:9b:44         # wake by MAC directly
killport wol save htpc 10:ff:e0:23:9b:44 192.168.1.10   # save a host
killport wol list                      # show saved hosts
killport wol delete htpc               # remove a saved host
```

Saved hosts are stored in `~/.config/killport/wol_hosts` and appear at the top of the interactive scan. Magic packets are sent via Python3's built-in socket — no extra dependencies.

### TLS Certificate Inspector → `killport cert`

```sh
killport cert github.com          # port 443 by default
killport cert 10.0.0.5:8443       # custom port
```

### Live Traffic Capture → `killport sniff`

```sh
killport sniff 443                 # all traffic on port 443
killport sniff 10.0.0.10:22        # traffic to/from specific host:port
```

Wraps `tcpdump`. Requires `sudo`.

### Live Connection Monitor → `killport watch`

```sh
killport watch 3000    # watch new connections in real time
```

### DNS Recon → `killport dns`

```sh
killport dns example.com    # A/AAAA/MX/NS/TXT + reverse DNS + AXFR test
```

### Firewall Audit → `killport audit`

```sh
killport audit    # reviews ufw/iptables/nft rules with plain-English findings
```

### Port Forwarder → `killport forward`

```sh
killport forward 8080 10.0.0.10:80    # tunnel local:8080 → remote:80
```

### Stress Test → `killport stress`

```sh
killport stress 10.0.0.5:80    # authorized connection flood test
```

---

## AI Penetration Testing

> **Point it at any machine on your network. Watch an AI hunt for vulnerabilities in real time.**

`killport attack` is a fully agentic AI pentest tool powered by [Ollama](https://ollama.com) — runs entirely on your hardware, no cloud, no API keys.

### Setup

1. [Install Ollama](https://ollama.com/download) and pull a model:
   ```sh
   ollama pull llama3.2
   ollama pull deepseek-r1:8b   # reasoning model
   ```
2. Configure killport:
   ```sh
   killport config
   ```
3. Run:
   ```sh
   killport attack 10.0.0.5
   ```

### Commands

```sh
killport attack 10.0.0.5            # scan 47 common ports
killport attack allports 10.0.0.5   # scan all 65535 ports
killport attack 10.0.0.5:6379       # single port deep dive
killport config               # configure Ollama host + model
killport attack log                  # view past attack reports
```

### Agent tools

| Tool | What the AI can do |
|---|---|
| `SCAN_PORT` | Deep nmap scan with version detection |
| `BANNER_GRAB` | Raw TCP banner grab |
| `HTTP_PROBE` | Fetch HTTP/HTTPS paths, extract hashes |
| `HTTP_PATHS` | Probe 20+ sensitive paths: `/admin`, `/.env`, `/.git/HEAD`, etc. |
| `WORDLIST` | Credential spray: SSH, FTP, Redis, MySQL, PostgreSQL, HTTP |
| `NMAP_SCRIPT` | Run any nmap NSE script |
| `CRACK_HASH` | Crack MD5/SHA1/SHA256/bcrypt via hashcat or john |

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

## Uninstall

**Option 1 — built-in command**

```sh
killport uninstall
```

Removes the binary and any firewall rules created by `killport open`.

**Option 2 — curl**

```sh
curl -fsSL https://raw.githubusercontent.com/skosari/killport-linux/main/uninstall.sh | bash
```

---

<div align="center">

Made by [skosari](https://github.com/skosari) · [killport-mac](https://github.com/skosari/killport-mac) · [killport-win](https://github.com/skosari/killport-win) · [killport-linux](https://github.com/skosari/killport-linux)

</div>
