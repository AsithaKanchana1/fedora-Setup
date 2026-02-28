#!/bin/bash
# =============================================================================
# Module 04 — Kitty Terminal Configuration
# Sets up Kitty with smart Ctrl+C/V shortcuts and visual tweaks.
# =============================================================================

echo ""
echo "==> [4/6] Kitty Terminal Configuration"
echo "----------------------------------------"

mkdir -p ~/.config/kitty

cat > ~/.config/kitty/kitty.conf << 'EOF'
# Smart clipboard: copy when text is selected, interrupt when nothing is selected
map ctrl+c copy_and_clear_or_interrupt
map ctrl+v paste_from_clipboard

# General behaviour
copy_on_select        yes
confirm_os_window_close 0
background_opacity    0.95
EOF

echo "  Kitty config written to ~/.config/kitty/kitty.conf"
