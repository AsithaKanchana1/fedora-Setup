#!/bin/bash
# =============================================================================
# Module 06 — Developer Tools Initialization
# Configures language toolchains after they have been installed.
# =============================================================================

echo ""
echo "==> [6/6] Developer Tools Setup"
echo "---------------------------------"

# --- Rust: set stable as default toolchain ---
if command -v rustup &> /dev/null; then
    echo "  Setting Rust stable as default toolchain..."
    rustup default stable
    echo "  Rust toolchain ready."
else
    echo "  rustup not found — skipping (was it installed in module 03?)."
fi
