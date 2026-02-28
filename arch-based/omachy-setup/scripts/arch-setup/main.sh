#!/bin/bash
# =============================================================================
# main.sh — Omachy / Arch Linux Setup Orchestrator
# Runs all setup modules in order.
#
# Usage:
#   ./main.sh              # Run all modules
#   bash 03-install-software.sh  # Run a single module standalone
# =============================================================================

set -e  # Exit immediately if any module fails

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "============================================="
echo "  Omachy Arch Linux Setup"
echo "============================================="
echo ""

# Run each module in order
bash "$SCRIPT_DIR/01-system-update.sh"
bash "$SCRIPT_DIR/02-gpu-drivers.sh"
bash "$SCRIPT_DIR/03-install-software.sh"
bash "$SCRIPT_DIR/04-configure-kitty.sh"
bash "$SCRIPT_DIR/05-configure-bash.sh"
bash "$SCRIPT_DIR/06-dev-tools.sh"

echo ""
echo "============================================="
echo "  Setup Complete!"
echo "  Restart your terminal (or run: source ~/.bashrc)"
echo "  to apply all shell changes."
echo "============================================="
