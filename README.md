# killport-linux

Kill whatever is running on a port. Linux.

```sh
killport 8080
# Port 8080 is in use:
#
#   PID:     12345
#   User:    ubuntu
#   Name:    node
#   Command: node /home/ubuntu/app/server.js
#
# Killed.
```

---

## Install

### Option 1 — curl (recommended)

```sh
curl -fsSL https://raw.githubusercontent.com/skosari/killport-linux/main/install.sh | bash
```

### Option 2 — Manual (one-liner)

```sh
curl -fsSL https://raw.githubusercontent.com/skosari/killport-linux/main/killport \
  -o /usr/local/bin/killport && chmod +x /usr/local/bin/killport
```

> If `/usr/local/bin` requires elevated permissions, prefix with `sudo`:
> ```sh
> sudo curl -fsSL https://raw.githubusercontent.com/skosari/killport-linux/main/killport \
>   -o /usr/local/bin/killport && sudo chmod +x /usr/local/bin/killport
> ```

### Option 3 — wget

```sh
wget -qO /usr/local/bin/killport https://raw.githubusercontent.com/skosari/killport-linux/main/killport \
  && chmod +x /usr/local/bin/killport
```

---

## Usage

```sh
killport <port>
```

Works with `ss` (preferred), `lsof`, or `fuser` — whichever is available on your system.
