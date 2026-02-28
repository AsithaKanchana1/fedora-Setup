<!-- toc -->

- [Linux Setup Repository](#linux-setup-repository)
  * [Overview](#overview)
  * [Quick Navigation](#quick-navigation)
- [Fedora-Based Setup](#fedora-based-setup)
  * [Getting Started (Fedora)](#getting-started-fedora)
  * [Quick Links](#quick-links-fedora)
  * [Fedora-Specific Features](#fedora-specific-features)
  * [Dependencies](#dependencies)
  * [GNOME Extensions](#gnome-extensions)
  * [Theme Setup](#theme-setup)
  * [Post-Installation Setup](#post-installation-setup)
- [Arch-Based Setup (Omarchy)](#arch-based-setup-omarchy)
  * [Getting Started (Arch)](#getting-started-arch)
  * [Quick Links](#quick-links-arch)
  * [Arch-Specific Configuration](#arch-specific-configuration)
- [Shared Resources](#shared-resources-1)
- [Contributing](#contributing)

<!-- tocstop -->

# Linux Setup Repository

This repository contains comprehensive setup guides, configuration files, and scripts for **Fedora** and **Arch-based** (including **Omarchy**) Linux distributions.

> **Personal Project**: This repository is primarily for personal use, but the community is welcome to use, adapt, and contribute!

## Overview

- **Fedora-Based**: Complete setup for Fedora with GNOME desktop environment
- **Arch-Based (Omarchy)**: Optimized setup for Arch Linux and derivatives
- **Shared Resources**: Distribution-agnostic documentation and configurations
- **Central Catalog**: See [CATALOG.md](CATALOG.md) for a complete index of all resources

## Quick Navigation

- 📁 **Repository Structure**: [STRUCTURE.md](STRUCTURE.md)
- 📚 **Complete Resource Catalog**: [CATALOG.md](CATALOG.md)
- 🔄 **Migration Notes**: [MIGRATION.md](MIGRATION.md)
- **Fedora Setup**: [Jump to Fedora Section](#fedora-based-setup)
- **Arch/Omarchy Setup**: [Jump to Arch Section](#arch-based-setup-omarchy)

---

# Fedora-Based Setup

Complete setup guide for Fedora with GNOME desktop environment.

## Getting Started (Fedora)

### Clone the Repository

```bash
# Clone the repository
git clone https://github.com/AsithaKanchana1/fedora-Setup.git

# Navigate to the project directory
cd fedora-Setup
```

Make sure you have `git` installed:
```bash
sudo dnf install -y git
```

**Note**: Some features like Neovim configuration and Alacritty terminal themes require this repository to be cloned to access configuration files.

## Quick Links (Fedora)

### Essential Setup
- [Alacritty Terminal Setup](shared/docs/guides/alacrity-setup.md) - Configure terminal with themes and keybindings
- [Git Configuration](shared/docs/scripts/set-git-defaults.md) - Set up Git credentials globally  
- [Neovim Configuration](shared/docs/scripts/nvim-config.md) - Professional development environment
- [System Cleanup](shared/docs/scripts/system-clean.md) - Remove junk and optimize disk space

### Fedora-Specific Features
- [Automated Google Drive Backup (Fedora)](fedora-base/docs/scripts/auto-gdrive-backup.md) - 3x daily automatic backup
- [OneDrive FUSE Client](fedora-base/docs/software-setup/one-drive-sync.md) - Access OneDrive on-demand
- [Docker Desktop GUI](fedora-base/docs/software-setup/docker-gui.md) - Containerization platform
- [Virtual Machine Setup](fedora-base/docs/guides/VM-fedora.md) - Create Fedora VMs with GNOME Boxes

### Software Installation Guides
- [Android Studio](shared/docs/software-setup/android-studio-setup.md)
- [MySQL WorkBench](shared/docs/software-setup/mysql-work-bench.md)
- [DaVinci Resolve](shared/docs/software-setup/davinci-resolve-install.md)
- [Apache NetBeans 17](shared/docs/software-setup/NetBeans-17-install.md)
- [Postman](shared/docs/software-setup/postman-installer.md)
- [ONLYOFFICE Suite](shared/docs/software-setup/only-office-rpm.md)
- [Affinity Suite](shared/docs/software-setup/AffinityOn%20Linux.md)

### Additional Resources
- [Kitty Terminal Setup](shared/docs/scripts/kitty-setup.md)
- [Markdown Instructions](shared/docs/scripts/markdown-instructions.md)
- [LLM Training Setup](shared/docs/guides/train-llm/Setup.md)
- [Christopher Titus Tech Linux Utility](https://github.com/ChrisTitusTech/linutil.git)

## Fedora-Specific Features

### GNOME Extensions
Located in [fedora-base/configs/openbar/](fedora-base/configs/openbar/)

- **Extension Manager** - Manage GNOME extensions
- **Tiling Shell** - Advanced window management (Windows 11-like snapping)
- **OpenBar** - Top bar customization
- **Blur My Shell** - Background blur effects
- **Dash to Dock** - macOS-like dock
- **Clipboard Indicator** - Clipboard manager
- **User Theme** - Custom theme support
- **Appindicator Support** - System tray icons
- **Vitals** - System monitoring widget

### Configuration
- [OpenBar Configuration Guide](fedora-base/configs/openbar/openbarSettings)

## Dependencies

Install codec support:
```bash
sudo dnf install libavcodec-freeworld pavucontrol
```

## GNOME Extensions

Install GNOME Tweaks for appearance customization:
```bash
sudo dnf install gnome-tweaks
```

## Theme Setup

1. Extract `.themes` and `.icons` folders to home directory:
```bash
# Copy from repository
cp -r assets/.themes ~/.themes
cp -r assets/.icons ~/.icons
```

2. Open GNOME Tweaks and configure:
   - **Appearance → Icons** - Select icon theme
   - **Appearance → Legacy Applications** - Select application theme
   - Enable minimize/maximize buttons
   - Customize animations

## Post-Installation Setup

### Enable RPM Fusion Repositories
```bash
# Free repository
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# Non-free repository
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### Optimize DNF
```bash
echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
```

### Recommended System Tools
```bash
sudo dnf install -y \
  timeshift \
  preload \
  dnfdragora \
  smplayer \
  vlc \
  brave-browser \
  firefox \
  code \
  obs-studio
```

### Browser Repositories
```bash
# Brave Browser
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# Microsoft Edge
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge

# GitHub Desktop  
sudo rpm --import https://rpm.packages.shiftkey.dev/gpg.key
sudo sh -c 'echo -e "[shiftkey-packages]\nname=GitHub Desktop\nbaseurl=https://rpm.packages.shiftkey.dev/rpm/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://rpm.packages.shiftkey.dev/gpg.key" > /etc/yum.repos.d/shiftkey-packages.repo'
```

---

# Arch-Based Setup (Omarchy)

Complete setup guide for Arch Linux and Arch-derived distributions.

## Getting Started (Arch)

### Clone the Repository

```bash
# Clone the repository
git clone https://github.com/AsithaKanchana1/fedora-Setup.git

# Navigate to the project directory
cd fedora-Setup
```

Make sure you have `git` installed:
```bash
sudo pacman -S git
```

## Quick Links (Arch)

### Essential Setup (Shared with Fedora)
- [Alacritty Terminal Setup](shared/docs/guides/alacrity-setup.md) - Configure terminal with themes
- [Git Configuration](shared/docs/scripts/set-git-defaults.md) - Set up Git credentials
- [Neovim Configuration](shared/docs/scripts/nvim-config.md) - Professional text editor setup
- [System Cleanup](shared/docs/scripts/system-clean.md) - Remove unnecessary files

### Arch-Specific Features
- [Automated Google Drive Backup (Arch)](arch-based/omachy-setup/docs/scripts/auto-gdrive-backup-arch.md) - Rclone-based backup with progress display
- [Waybar Configuration](arch-based/omachy-setup/configs/waybar-setup-arch/waybar.md) - Wayland-compatible taskbar  
- [Reclone Backup Script](arch-based/omachy-setup/scripts/reclone-gdrive-bkp.sh) - Automated backup utility

### Arch-Specific Configuration Files
- [Waybar Setup Guide](arch-based/omachy-setup/configs/waybar-setup-arch/)
- [Rclone Backup Configuration](arch-based/omachy-setup/configs/reclon-bkp/)

### Software Installation (Applies to Arch)
All shared software guides apply to Arch systems with appropriate package manager commands:
- [Android Studio](shared/docs/software-setup/android-studio-setup.md)
- [MySQL WorkBench](shared/docs/software-setup/mysql-work-bench.md)
- [DaVinci Resolve](shared/docs/software-setup/davinci-resolve-install.md)
- [Apache NetBeans 17](shared/docs/software-setup/NetBeans-17-install.md)
- [Postman](shared/docs/software-setup/postman-installer.md)
- [ONLYOFFICE Suite](shared/docs/software-setup/only-office-rpm.md)
- [Affinity Suite on Linux](shared/docs/software-setup/AffinityOn%20Linux.md)

### Additional Resources
- [Kitty Terminal Setup](shared/docs/scripts/kitty-setup.md)
- [Markdown Instructions](shared/docs/scripts/markdown-instructions.md)
- [LLM Training Setup](shared/docs/guides/train-llm/Setup.md)

## Arch-Specific Configuration

### Window Manager & Taskbar
- **Waybar** - Wayland-native taskbar configured in [arch-based/omachy-setup/configs/waybar-setup-arch/](arch-based/omachy-setup/configs/waybar-setup-arch/)
- Located at: `~/.config/waybar/config.jsonc`

### Backup & Automation  
- **Rclone** - Backup automation scripts
- Located in: [arch-based/omachy-setup/configs/reclon-bkp/](arch-based/omachy-setup/configs/reclon-bkp/)

---

# Shared Resources

Resources applicable to **both Fedora and Arch** distributions are located in the [shared/](shared/) folder.

## Shared Documentation

See [CATALOG.md](CATALOG.md) for the complete list, including:

### Terminal & Development
- [Alacritty Terminal Configuration](shared/docs/guides/alacrity-setup.md)
- [Kitty Terminal Setup](shared/docs/scripts/kitty-setup.md)
- [Neovim IDE Setup](shared/docs/scripts/nvim-config.md)

### System Administration
- [Git Configuration](shared/docs/scripts/set-git-defaults.md)
- [System Cleanup & Optimization](shared/docs/scripts/system-clean.md)
- [Markdown Guide](shared/docs/scripts/markdown-instructions.md)

### Software Installation
- [Android Studio](shared/docs/software-setup/android-studio-setup.md)
- [MySQL WorkBench](shared/docs/software-setup/mysql-work-bench.md)
- [DaVinci Resolve](shared/docs/software-setup/davinci-resolve-install.md)
- [GNOME Boxes VM Setup](shared/docs/software-setup/gnome-boxes-vm.md)
- [Apache NetBeans](shared/docs/software-setup/NetBeans-17-install.md)
- [Postman API Tool](shared/docs/software-setup/postman-installer.md)
- [ONLYOFFICE](shared/docs/software-setup/only-office-rpm.md)
- [Affinity Suite on Linux](shared/docs/software-setup/AffinityOn%20Linux.md)

### Training & Development
- [LLM Training Setup](shared/docs/guides/train-llm/Setup.md)

## Shared Configuration Files

Located in [shared/configs/](shared/configs/):

- **Alacritty Terminal**: [shared/configs/alacrity/](shared/configs/alacrity/)
- **Neovim IDE**: [shared/configs/nvim-config/](shared/configs/nvim-config/)

## Shared Scripts

Located in [shared/scripts/](shared/scripts/):

- `gcopy-setup.sh` - Google Drive backup automation
- `gcopy-setup-test.sh` - Test Google Drive backup

---

# Contributing

Contributions are welcome! When adding new content:

1. **Shared Content**: Place in `shared/` if applicable to both distributions
2. **Fedora Content**: Place in `fedora-base/`
3. **Arch Content**: Place in `arch-based/omachy-setup/`
4. **Update Documentation**: Add entries to this README and [CATALOG.md](CATALOG.md)
5. **Use Relative Paths**: All internal links should be relative paths

---

## Repository Resources

- 📖 **Documentation Index**: [CATALOG.md](CATALOG.md)
- 🏗️ **Structure Guide**: [STRUCTURE.md](STRUCTURE.md)
- 📝 **Migration History**: [MIGRATION.md](MIGRATION.md)

---

## Useful External Links

- [Cris Titus Tech Linux Utility](https://github.com/ChrisTitusTech/linutil.git)
- [GNOME Extensions](https://extensions.gnome.org/)
- [Cisco Packet Tracer for Fedora](https://github.com/thiagoojack/packettracer-fedora)
- [Arch User Repository (AUR)](https://aur.archlinux.org/)

---

**Repository Created**: Original fork/adaptation  
**Last Updated**: February 28, 2026  
