# Waybar Config — Omarchy Replication Guide

> **Environment**: Omarchy · Hyprland · Arch Linux  
> **Purpose**: Definitive step-by-step reference for replicating this exact Waybar setup on any fresh Arch-based installation.  
> **Related files**: [`config.jsonc`](config.jsonc) · [`style.css`](style.css) · [`waybar.md`](waybar.md) (full reference)

---

## 🛠️ Phase 1: Environment Preparation

Ensure all required packages are installed before applying any configuration.

```bash
sudo pacman -S waybar otf-font-awesome networkmanager
```

Verify the config directory exists (create it if not):

```bash
mkdir -p ~/.config/waybar
```

---

## 📄 Phase 2: Core Configuration (`config.jsonc`)

Controls the module logic and the right-bar order: **CPU → RAM → Network → Bluetooth → Pulseaudio → Tray → Battery**.

**Deploy path**: `~/.config/waybar/config.jsonc`

> **Tip**: Copy [`config.jsonc`](config.jsonc) from this repo directly to the path above.

```jsonc
{
  "reload_style_on_change": true,
  "layer": "top",
  "position": "top",
  "spacing": 0,
  "height": 26,

  "modules-left": ["custom/omarchy", "hyprland/workspaces"],
  "modules-center": [
    "clock",
    "custom/update",
    "custom/voxtype",
    "custom/screenrecording-indicator",
    "custom/idle-indicator",
    "custom/notification-silencing-indicator"
  ],
  "modules-right": [
    "cpu",
    "memory",
    "network",
    "bluetooth",
    "pulseaudio",
    "group/tray-expander",
    "tray",
    "battery"
  ],

  "hyprland/workspaces": {
    "on-click": "activate",
    "format": "{icon}",
    "format-icons": {
      "1": "1", "2": "2", "3": "3", "4": "4", "5": "5",
      "6": "6", "7": "7", "8": "8", "9": "9", "10": "0",
      "active": "", "default": ""
    },
    "persistent-workspaces": { "1": [], "2": [], "3": [], "4": [] }
  },

  "cpu": {
    "interval": 2,
    "format": " {usage}%",
    "on-click": "omarchy-launch-or-focus-tui btop"
  },

  "memory": {
    "interval": 5,
    "format": " {used:0.1f}G/{total:0.1f}G ({percentage}%)"
  },

  "network": {
    "interval": 2,
    "format-wifi": " ⬇{bandwidthDownBytes} ⬆{bandwidthUpBytes}",
    "format-ethernet": " ⬇{bandwidthDownBytes} ⬆{bandwidthUpBytes}",
    "format-disconnected": "⚠",
    "tooltip-format": "{essid}\n{ipaddr}",
    "on-click": "omarchy-launch-wifi"
  },

  "bluetooth": {
    "format": "",
    "format-connected": "",
    "on-click": "omarchy-launch-bluetooth"
  },

  "pulseaudio": {
    "format": "{icon}",
    "on-click": "omarchy-launch-audio",
    "on-click-right": "pamixer -t",
    "format-icons": { "default": ["", "", ""] }
  },

  "battery": {
    "format": "{capacity}% {icon}",
    "format-icons": ["", "", "", "", "", "", "", "", "", ""],
    "format-charging": " {capacity}%",
    "interval": 5,
    "on-click": "omarchy-menu power"
  },

  "group/tray-expander": {
    "orientation": "inherit",
    "drawer": { "transition-duration": 600, "children-class": "tray-group-item" },
    "modules": ["custom/expand-icon", "tray"]
  },
  "custom/expand-icon": { "format": "", "tooltip": false },
  "tray": { "icon-size": 12, "spacing": 17 },

  "custom/omarchy": { "format": "<span font='omarchy'>\ue900</span>", "on-click": "omarchy-menu" },
  "custom/update": { "format": "", "exec": "omarchy-update-available", "interval": 21600 },
  "clock": { "format": "{:L%A %H:%M}", "format-alt": "{:L%d %B W%V %Y}" }
}
```

---

## 🎨 Phase 3: Visual Styling (`style.css`)

Creates the **"Pill"** module appearance with Nord-palette colours and hover effects.

**Deploy path**: `~/.config/waybar/style.css`

> **Tip**: Copy [`style.css`](style.css) from this repo directly to the path above.

```css
/* ── Standard Module Styling (Pill Effect) ──────────────────────────────────── */
#cpu,
#memory,
#network,
#bluetooth,
#pulseaudio,
#battery,
#tray {
    padding: 0 12px;
    margin: 0 4px;
    background-color: #2e3440; /* Nord-style dark grey */
    border-radius: 8px;
    color: #ffffff;
}

/* ── Hover Effects ───────────────────────────────────────────────────────────── */
#cpu:hover,
#memory:hover,
#network:hover {
    background-color: #3b4252;
}

/* ── Network Alert State ─────────────────────────────────────────────────────── */
#network.disconnected {
    color: #bf616a; /* Nord red — indicates no connection */
}
```

---

## 🚀 Phase 4: Automation & Startup

Prevent duplicate bars and ensure Waybar survives terminal closure.

### Step 1 — Create a launch script

**Path**: `~/.config/waybar/launch.sh`

```bash
#!/bin/bash
pkill waybar
while pgrep -u $USER -x waybar >/dev/null; do sleep 1; done
waybar > /dev/null 2>&1 &
```

### Step 2 — Make it executable

```bash
chmod +x ~/.config/waybar/launch.sh
```

### Step 3 — Register with Hyprland

Add to `~/.config/hypr/hyprland.conf`:

```ini
exec-once = ~/.config/waybar/launch.sh
```

> **Why a script instead of `exec-once = waybar`?**  
> The script first kills any existing Waybar instance (prevents duplicates on Hyprland reload) and waits for it to fully stop before launching a fresh instance.

---

## 📦 Quick Copy-Paste Deployment

Run this block on a fresh system after installing dependencies:

```bash
# 1. Create directory
mkdir -p ~/.config/waybar

# 2. Copy configs from this repo (adjust REPO_PATH as needed)
REPO_PATH=~/path/to/this/repo/arch-based/omachy-setup/configs/waybar-setup-arch
cp "$REPO_PATH/config.jsonc" ~/.config/waybar/config.jsonc
cp "$REPO_PATH/style.css"    ~/.config/waybar/style.css

# 3. Create launch script
cat > ~/.config/waybar/launch.sh << 'EOF'
#!/bin/bash
pkill waybar
while pgrep -u $USER -x waybar >/dev/null; do sleep 1; done
waybar > /dev/null 2>&1 &
EOF
chmod +x ~/.config/waybar/launch.sh

# 4. Add to Hyprland (if not already present)
grep -qxF 'exec-once = ~/.config/waybar/launch.sh' ~/.config/hypr/hyprland.conf \
  || echo 'exec-once = ~/.config/waybar/launch.sh' >> ~/.config/hypr/hyprland.conf
```

---

## 🛠️ Phase 5: Troubleshooting Reference

| Symptom | Fix |
|---------|-----|
| Terminal flooded with "Full" messages | Run `reset` in the terminal |
| Terminal frozen / unresponsive | Press `Super + Q` (Hyprland kill) or run `pkill kitty` from another terminal |
| Two Waybar instances visible | Check `~/.config/hypr/hyprland.conf` for duplicate `exec`/`exec-once` lines |
| Bar not appearing after reboot | Confirm `exec-once = ~/.config/waybar/launch.sh` is in `hyprland.conf` |
| JSON syntax error on launch | Run `waybar` in a terminal to see the error line number, or use `jq . ~/.config/waybar/config.jsonc` |

---

## 📁 File Locations Summary

| File | Repo Path | Deploy Path |
|------|-----------|-------------|
| Bar config | [`config.jsonc`](config.jsonc) | `~/.config/waybar/config.jsonc` |
| Stylesheet | [`style.css`](style.css) | `~/.config/waybar/style.css` |
| Launch script | *(create manually)* | `~/.config/waybar/launch.sh` |
| Hyprland config | *(system file)* | `~/.config/hypr/hyprland.conf` |

---

> 📖 **Full reference**: See [`waybar.md`](waybar.md) for in-depth module documentation, live-reload details, and additional troubleshooting.

---

*Last Updated: March 2026*  
*Created By: Asitha Kanchana Palliyaguru*
