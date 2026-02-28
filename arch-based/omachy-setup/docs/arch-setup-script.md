# Arch Setup — Modular Script Documentation

This documentation covers the Omachy / Arch Linux setup system, optimized for a terminal-centric Software Engineering workflow.

## Core Philosophy

- **Terminal-Centric**: Keyboard-driven workflow using Kitty, Tmux, Neovim, and Yazi.
- **Intelligent Shortcuts**: Ctrl+C copies when text is selected; interrupts when nothing is.
- **Modular Design**: Each concern is an independent, re-runnable bash module.

---

## File Structure

```
scripts/
├── arch-setup-script.sh        ← Entry point (backward-compatible wrapper)
└── arch-setup/
    ├── main.sh                 ← Orchestrator: runs all modules in order
    ├── 01-system-update.sh     ← pacman system update + yay AUR helper install
    ├── 02-gpu-drivers.sh       ← GPU detection + NVIDIA / Intel driver install
    ├── 03-install-software.sh  ← All package installs (edit SOFTWARES array here)
    ├── 04-configure-kitty.sh   ← Kitty terminal config (smart Ctrl+C/V, opacity)
    ├── 05-configure-bash.sh    ← fastfetch startup + yazi y() CWD wrapper
    └── 06-dev-tools.sh         ← Rust toolchain setup (rustup default stable)
```

---

## How to Use

### Run the Full Setup (Recommended)

```bash
# 1. Clone or navigate to the repo
cd arch-based/omachy-setup/scripts

# 2. Make the entry point executable
chmod +x arch-setup-script.sh

# 3. Run it (will ask for your sudo password)
./arch-setup-script.sh
```

This runs all modules in order via `arch-setup/main.sh`.

---

### Run a Single Module

Each module is standalone and can be run independently.  
Useful when you only need to reapply one section:

```bash
# Example: only reinstall software packages
bash arch-based/omachy-setup/scripts/arch-setup/03-install-software.sh

# Example: only reapply bash config (fastfetch + yazi)
bash arch-based/omachy-setup/scripts/arch-setup/05-configure-bash.sh
```

---

## Module Reference

| File | What it does |
|------|-------------|
| `01-system-update.sh` | `pacman -Syu` full system update, installs `yay` AUR helper if missing |
| `02-gpu-drivers.sh` | Detects NVIDIA/Intel GPU via `lspci`, installs correct drivers for DaVinci Resolve |
| `03-install-software.sh` | Installs all packages via `yay`. **Edit `SOFTWARES` array here** to add/remove apps |
| `04-configure-kitty.sh` | Writes `~/.config/kitty/kitty.conf` (smart clipboard, opacity) |
| `05-configure-bash.sh` | Appends `fastfetch` startup + `y()` yazi wrapper to `~/.bashrc` (idempotent) |
| `06-dev-tools.sh` | Runs `rustup default stable` to initialize the Rust toolchain |

---

## Yazi Shell Integration

The `y()` function in `05-configure-bash.sh` syncs your terminal's working directory when you exit Yazi. Use `y` instead of `yazi` to get CWD sync:

```bash
# Opens Yazi. When you quit (q), your terminal CD's into the last directory you browsed.
y
```

---

## Adding New Packages

Open `arch-setup/03-install-software.sh` and add entries to the `SOFTWARES` array:

```bash
SOFTWARES=(
    ...
    "your-new-package"   # Add here
)
```

---

## What to Expect While Running

- **Password Prompt**: `sudo` will ask for your password at the start.
- **Compilation Time**: AUR packages like `microsoft-edge-stable-bin` and `davinci-resolve` are built from source — this can take **20–60 minutes** depending on your CPU and internet speed.
- **Don't Interrupt**: Avoid Ctrl+C during the installation phase unless absolutely necessary.

After completion, run:

```bash
source ~/.bashrc
```

or open a new terminal to apply all shell changes.
