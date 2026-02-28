# Waybar Setup — Omarchy / Arch Linux

> **Environment**: Omarchy · Hyprland · Alacritty / Kitty · Neovim  
> **Config Path**: `~/.config/waybar/config.jsonc`  
> **Style Path**: `~/.config/waybar/style.css`

---

## 📋 Overview

Waybar is the Wayland-compatible status bar used in the Omarchy (Arch Linux + Hyprland) setup.  
This document covers the full configuration including module layout, per-module settings, CSS theming, and maintenance commands.

### Module Layout

| Position | Modules |
|----------|---------|
| **Left** | `custom/omarchy` → `hyprland/workspaces` |
| **Center** | `clock` → `custom/update` → indicators |
| **Right** | `cpu` → `memory` → `network` → `bluetooth` → `pulseaudio` → `tray` → `battery` |

---

## ⚙️ Configuration File (`config.jsonc`)

Path: `~/.config/waybar/config.jsonc`

```jsonc
{
  "reload_style_on_change": true,
  "layer": "top",
  "position": "top",
  "spacing": 0,
  "height": 26,

  // ── Module Placement ────────────────────────────────────────────────────────
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

  // ── 1. Workspaces (Left) ────────────────────────────────────────────────────
  "hyprland/workspaces": {
    "on-click": "activate",
    "format": "{icon}",
    "format-icons": {
      "1": "1", "2": "2", "3": "3", "4": "4", "5": "5",
      "6": "6", "7": "7", "8": "8", "9": "9", "10": "0",
      "active": "", "default": ""
    },
    "persistent-workspaces": { "1": [], "2": [], "3": [], "4": [], "5": [] }
  },

  // ── 2. CPU Monitoring (Right - Pos 1) ───────────────────────────────────────
  "cpu": {
    "interval": 2,
    "format": " {usage}%",
    "on-click": "omarchy-launch-or-focus-tui btop"
  },

  // ── 3. Memory Monitoring (Right - Pos 2) ────────────────────────────────────
  "memory": {
    "interval": 5,
    "format": " {used:0.1f}G/{total:0.1f}G ({percentage}%)"
  },

  // ── 4. Network Speeds (Right - Pos 3) ───────────────────────────────────────
  "network": {
    "interval": 2,
    "format-wifi": " ⬇{bandwidthDownBytes} ⬆{bandwidthUpBytes}",
    "format-ethernet": " ⬇{bandwidthDownBytes} ⬆{bandwidthUpBytes}",
    "format-disconnected": "⚠",
    "tooltip-format": "{essid}\n{ipaddr}",
    "on-click": "omarchy-launch-wifi"
  },

  // ── 5. Bluetooth (Right - Pos 4) ────────────────────────────────────────────
  "bluetooth": {
    "format": "",
    "format-connected": "",
    "on-click": "omarchy-launch-bluetooth"
  },

  // ── 6. Audio Control (Right - Pos 5) ────────────────────────────────────────
  "pulseaudio": {
    "format": "{icon}",
    "on-click": "omarchy-launch-audio",
    "on-click-right": "pamixer -t",
    "format-icons": { "default": ["", "", ""] }
  },

  // ── 7. Battery Status (Far Right) ───────────────────────────────────────────
  "battery": {
    "format": "{capacity}% {icon}",
    "format-icons": ["", "", "", "", "", "", "", "", "", ""],
    "format-charging": " {capacity}%",
    "interval": 5,
    "on-click": "omarchy-menu power"
  },

  // ── 8. Tray Management ──────────────────────────────────────────────────────
  "group/tray-expander": {
    "orientation": "inherit",
    "drawer": { "transition-duration": 600, "children-class": "tray-group-item" },
    "modules": ["custom/expand-icon", "tray"]
  },
  "custom/expand-icon": { "format": "", "tooltip": false },
  "tray": { "icon-size": 12, "spacing": 17 },

  // ── 9. Omarchy-Specific Modules ─────────────────────────────────────────────
  "custom/omarchy": { "format": "<span font='omarchy'>\ue900</span>", "on-click": "omarchy-menu" },
  "custom/update": { "format": "", "exec": "omarchy-update-available", "interval": 21600 },
  "clock": { "format": "{:L%A %H:%M}", "format-alt": "{:L%d %B W%V %Y}" }
}
```

---

## 🎨 Stylesheet (`style.css`)

Path: `~/.config/waybar/style.css`

```css
/* ── Standard Module Styling (Pill Effect) ──────────────────────────────────── */
#cpu,
#memory,
#network,
#bluetooth,
#pulseaudio,
#battery {
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

## 📦 Module Reference

### CPU (`cpu`)
- **Interval**: every 2 seconds
- **Format**: ` {usage}%`
- **Click action**: Opens `btop` via `omarchy-launch-or-focus-tui`

### Memory (`memory`)
- **Interval**: every 5 seconds
- **Format**: Shows used / total GB and percentage
- **Example**: ` 6.2G/15.5G (40%)`

### Network (`network`)
- **Interval**: every 2 seconds
- **Formats**: Wi-Fi and Ethernet show live bandwidth (down ⬇ / up ⬆)
- **Disconnected**: Shows `⚠` with red color via CSS
- **Tooltip**: Shows SSID and IP address
- **Click**: Opens Wi-Fi manager via `omarchy-launch-wifi`

### Bluetooth (`bluetooth`)
- **Idle**: `` icon
- **Connected**: `` icon
- **Click**: Opens Bluetooth UI via `omarchy-launch-bluetooth`

### Pulseaudio (`pulseaudio`)
- **Icons**: `["", "", ""]` (muted → low → high)
- **Left click**: Opens audio panel via `omarchy-launch-audio`
- **Right click**: Toggles mute via `pamixer -t`

### Battery (`battery`)
- **Interval**: every 5 seconds
- **Icons**: 10-step capacity icons
- **Charging format**: ` {capacity}%`
- **Click**: Opens power menu via `omarchy-menu power`

### Tray (`tray`)
- **Icon size**: 12px
- **Spacing**: 17px
- **Wrapped in** `group/tray-expander` with a drawer animation (600ms)

### Clock (`clock`)
- **Format**: `{:L%A %H:%M}` → e.g., `Saturday 21:09`
- **Alt format** (on click): `{:L%d %B W%V %Y}` → e.g., `28 February W09 2026`

---

## 🛠️ Troubleshooting & Maintenance

### Restart Waybar (Safe)
```bash
pkill waybar && waybar > /dev/null 2>&1 &
```

### Check for JSON Syntax Errors
Run Waybar in the foreground — it will print line numbers on crash:
```bash
waybar
# Press Ctrl+C after reviewing errors
```

### Discover Syntax Issues with jq
```bash
jq . ~/.config/waybar/config.jsonc
```
> Note: `config.jsonc` supports comments (`//`), which standard `jq` may reject.  
> Use `waybar` itself or a JSONC-aware linter for validation.

### Clear Terminal Spam
If the terminal is flooded with "Full" messages:
```bash
reset
```

### Open Config in Neovim
```bash
nvim ~/.config/waybar/config.jsonc
nvim ~/.config/waybar/style.css
```

### Live Style Reload
The config includes `"reload_style_on_change": true`, so CSS edits to `style.css` apply **automatically** without restarting Waybar.

---

## � Keeping Waybar Running Permanently

### Why Waybar Disappears When You Close the Terminal

Using `waybar &` puts the process in the background, but it remains a **child of that terminal session**. When the terminal closes, the shell sends a `SIGHUP` (Signal Hang Up) to all its children — killing Waybar along with it.

### Option 1 — Launch with `nohup` (Recommended for Manual Starts)

`nohup` (no hang up) detaches the process from the terminal so it survives when the shell exits.
All output (including "Full" spam) is redirected to `/dev/null`:

```bash
nohup waybar > /dev/null 2>&1 &
```

### Option 2 — `disown` an Already-Running Instance

If you started Waybar with `waybar &` and haven't closed the terminal yet, run:

```bash
disown
```

This "orphans" the process — it's removed from the shell's job table and will keep running after the terminal closes.

### Option 3 — Autostart via Hyprland `exec-once` ✅ Recommended

The cleanest solution is to let Hyprland start Waybar automatically on every login.

1. Open your Hyprland config:
   ```bash
   nvim ~/.config/hypr/hyprland.conf
   ```

2. Add this line to the `exec-once` section:
   ```ini
   exec-once = waybar
   ```

3. Save and exit (`:wq`).

> **Result**: Waybar launches automatically on every login — no terminal needed.

### Quick Comparison

| Method | Survives Terminal Close | Survives Reboot | Notes |
|--------|------------------------|-----------------|-------|
| `waybar &` | ❌ | ❌ | Dies with terminal |
| `nohup waybar > /dev/null 2>&1 &` | ✅ | ❌ | Good for one-off starts |
| `waybar & disown` | ✅ | ❌ | Works if already started |
| `exec-once = waybar` in Hyprland | ✅ | ✅ | **Best — fully automatic** |

---

## �📁 File Locations

| File | Path |
|------|------|
| Main Config | `~/.config/waybar/config.jsonc` |
| Stylesheet | `~/.config/waybar/style.css` |
| Hyprland Config | `~/.config/hypr/hyprland.conf` |

---

*Last Updated: February 2026 — Added permanent autostart documentation*  
*Created By: Asitha Kanchana Palliyaguru*
