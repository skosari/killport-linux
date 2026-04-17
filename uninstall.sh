#!/usr/bin/env bash
set -euo pipefail

echo "Uninstalling killport..."

# Remove binary
if [ -f /usr/local/bin/killport ]; then
    sudo rm /usr/local/bin/killport
    echo "  Removed /usr/local/bin/killport"
fi

# Remove any firewall rules added by killport open
if command -v ufw &>/dev/null; then
    sudo ufw status numbered 2>/dev/null | grep -oP '(?<=# )killport-\S+' | while read -r rule; do
        sudo ufw delete "$rule" 2>/dev/null || true
    done
elif command -v firewall-cmd &>/dev/null; then
    firewall-cmd --list-ports --permanent 2>/dev/null | tr ' ' '\n' | while read -r port; do
        sudo firewall-cmd --permanent --remove-port="$port" 2>/dev/null || true
    done
    sudo firewall-cmd --reload 2>/dev/null || true
fi

echo "killport uninstalled."
