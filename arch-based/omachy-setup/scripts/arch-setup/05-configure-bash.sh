#!/bin/bash
# =============================================================================
# Module 05 — Bash Shell Configuration
# Adds:
#   - fastfetch on shell startup (with Arch branding)
#   - y() yazi wrapper: syncs terminal CWD when you exit yazi
# All additions are idempotent (safe to run multiple times).
# =============================================================================

echo ""
echo "==> [5/6] Bash Shell Configuration"
echo "------------------------------------"

# --- Fastfetch on startup ---
# Remove any existing fastfetch lines first (idempotent)
sed -i '/fastfetch/d' ~/.bashrc
echo 'fastfetch --logo arch --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Terminal:CPU:GPU:Memory' >> ~/.bashrc
echo "  fastfetch startup line added to ~/.bashrc"

# --- Yazi y() wrapper function ---
# The y() function syncs the terminal CWD when you quit yazi.
# Usage: type `y` instead of `yazi` to get CWD sync on exit.
if ! grep -q "yazi-cwd" ~/.bashrc; then
    cat >> ~/.bashrc << 'BASHRC_EOF'

# Yazi wrapper to sync CWD on exit
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
BASHRC_EOF
    echo "  Yazi y() shell integration added to ~/.bashrc"
else
    echo "  Yazi shell integration already present in ~/.bashrc, skipping."
fi

echo ""
echo "  NOTE: Run 'source ~/.bashrc' or open a new terminal to apply shell changes."
