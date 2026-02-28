#!/bin/bash
# =============================================================================
# Module 01 — System Update & AUR Helper (yay)
# =============================================================================

echo ""
echo "==> [1/6] System Update & AUR Setup"
echo "------------------------------------"

echo "  Updating system packages..."
sudo pacman -Syu --noconfirm --needed base-devel git

if ! command -v yay &> /dev/null; then
    echo "  yay not found — cloning and building from AUR..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay-build
    cd /tmp/yay-build && makepkg -si --noconfirm
    cd - &> /dev/null
    rm -rf /tmp/yay-build
    echo "  yay installed successfully."
else
    echo "  yay is already installed, skipping."
fi
