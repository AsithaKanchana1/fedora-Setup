#!/bin/bash
# =============================================================================
# Module 03 — Software Installation
# Installs all packages via yay (supports both AUR and official repos).
# Edit the SOFTWARES array below to add or remove packages.
# =============================================================================

echo ""
echo "==> [3/6] Software Installation"
echo "---------------------------------"

SOFTWARES=(
    # --- Terminals & Navigation ---
    "kitty"
    "alacritty"
    "tmux"
    "fzf"
    "zoxide"
    "yazi"

    # --- Editors & IDEs ---
    "neovim"
    "visual-studio-code-bin"
    "antigravity"

    # --- Dev Languages & Databases ---
    "nodejs"
    "npm"
    "sqlite"
    "python"
    "python-pip"
    "rustup"
    "mysql-workbench"
    "postman-bin"

    # --- Browsers & Media ---
    "microsoft-edge-stable-bin"
    "brave-bin"
    "vlc"
    "audacity"
    "davinci-resolve"

    # --- Codecs ---
    "ffmpeg"
    "gst-libav"
    "gst-plugins-base"
    "gst-plugins-good"
    "gst-plugins-bad"
    "gst-plugins-ugly"

    # --- Utilities & Monitoring ---
    "rclone"
    "btop"
    "htop"
    "fastfetch"
)

echo "  Installing ${#SOFTWARES[@]} packages..."
yay -S --noconfirm --needed "${SOFTWARES[@]}"
echo "  All packages installed."
