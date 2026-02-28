#!/bin/bash
# =============================================================================
# arch-setup-script.sh — Backward-compatible entry point
#
# This script now delegates to the modular setup system in arch-setup/.
# To run the full setup:      ./arch-setup-script.sh
# To run a single module:     bash arch-setup/03-install-software.sh
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Delegating to modular setup system..."
bash "$SCRIPT_DIR/arch-setup/main.sh"

