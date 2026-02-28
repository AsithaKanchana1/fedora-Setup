# Documentation and Configuration Catalog

This file serves as a comprehensive index of all documentation and configuration files organized by distribution and category.

> **Note**: This repository now supports both **Fedora-based** and **Arch-based** (including Omarchy) distributions with separate configuration folders and documentation.

---

## 📑 Quick Navigation

- [Shared Resources](#shared-resources) - Documentation and configs applicable to both distributions
- [Fedora-Based Resources](#fedora-based-resources) - Fedora-specific setup and documentation
- [Arch-Based Resources](#arch-based-resources) - Arch/Omarchy-specific setup and documentation

---

## Shared Resources

Resources in this section apply to both Fedora and Arch-based distributions.

### Shared Documentation

#### Guides
- [Alacritty Terminal Setup](shared/docs/guides/alacrity-setup.md) - Configure Alacritty terminal with theming and keybindings
- [Train - LLM Setup](shared/docs/guides/train-llm/Setup.md) - Guide for local LLM training setup

#### Scripts & Utilities
- [Neovim Configuration](shared/docs/scripts/nvim-config.md) - Complete Neovim setup with LSP, completion, and snippets
- [Git Configuration Defaults](shared/docs/scripts/set-git-defaults.md) - Set up Git credentials globally
- [Kitty Terminal Setup](shared/docs/scripts/kitty-setup.md) - Configure Kitty terminal emulator
- [System Cleanup Guide](shared/docs/scripts/system-clean.md) - Remove junk and optimize disk space
- [Markdown Instructions](shared/docs/scripts/markdown-instructions.md) - Markdown formatting and best practices

#### Software Installation
- [Android Studio Setup](shared/docs/software-setup/android-studio-setup.md) - Install and configure Android Studio
- [Affinity Suite on Linux](shared/docs/software-setup/AffinityOn%20Linux.md) - Run Affinity Designer and Publisher on Linux
- [DaVinci Resolve Installation](shared/docs/software-setup/davinci-resolve-install.md) - Professional video editing software
- [GNOME Boxes - VM Setup](shared/docs/software-setup/gnome-boxes-vm.md) - Change VM storage location
- [MySQL WorkBench](shared/docs/software-setup/mysql-work-bench.md) - Database management tool setup
- [Apache NetBeans 17](shared/docs/software-setup/NetBeans-17-install.md) - Java IDE installation
- [Postman](shared/docs/software-setup/postman-installer.md) - API testing tool installation
- [ONLYOFFICE](shared/docs/software-setup/only-office-rpm.md) - Free office suite installation

### Shared Configuration Files

#### Terminal Configurations
- [Alacritty Configs](shared/configs/alacrity/) - Terminal color schemes and layouts
  - Main config: `alacritty.toml`
  - Keybindings: `keybinds.toml`
  - Themes: `nordic.toml`, `dark-theme.auto.conf`

#### Development Environment
- [Neovim Configuration](shared/configs/nvim-config/) - Complete Neovim setup with plugins
  - Main config: `init.lua`
  - Plugin specifications: `lazy-lock.json`
  - Plugin configurations in `lua/plugins/`

#### Shared Scripts
- [Google Drive Copy Setup](shared/scripts/gcopy-setup.sh) - Automated backup script setup
- [Google Drive Copy Test](shared/scripts/gcopy-setup-test.sh) - Test backup functionality

---

## Fedora-Based Resources

Resources specific to Fedora and GNOME-based distributions.

### Fedora Documentation

#### Guides
- [Fedora VM Creation](fedora-base/docs/guides/VM-fedora.md) - Create virtual machines with Fedora

#### Scripts & Utilities
- [Automated Google Drive Backup (Fedora)](fedora-base/docs/scripts/auto-gdrive-backup.md) - Set up automated backups using dnf and rclone
  - Frequency: 3 times daily (7 AM, 1 PM, 7 PM)
  - Uses systemd timers

#### Software Installation
- [OneDrive FUSE Client](fedora-base/docs/software-setup/one-drive-sync.md) - Access OneDrive files on demand
- [Docker Desktop GUI](fedora-base/docs/software-setup/docker-gui.md) - Install Docker Desktop for Fedora

### Fedora Configuration Files

#### GNOME Extensions & Theming
- [OpenBar Settings](fedora-base/configs/openbar/) - Top bar customization for GNOME
  - [OpenBar Configuration Guide](fedora-base/configs/openbar/openbarSettings)

---

## Arch-Based Resources

Resources specific to Arch Linux and Arch-derived distributions (including Omarchy).

### Omarchy-Specific Setup

All Arch-specific resources are organized under [arch-based/omachy-setup/](arch-based/omachy-setup/)

#### Guides
*(Documentation for Arch-based systems)*

#### Scripts & Utilities
- [Automated Google Drive Backup (Arch)](arch-based/omachy-setup/docs/scripts/auto-gdrive-backup-arch.md) - Set up automated backups using pacman and rclone
  - Optimized for Omarchy
  - Real-time progress display

#### Software Installation
*(Software guides applicable to Arch systems)*

### Arch Configuration Files

#### System Configuration
- [Waybar Setup](arch-based/omachy-setup/configs/waybar-setup-arch/) - Wayland-compatible taskbar for Hyprland
  - [Waybar Full Setup Guide](arch-based/omachy-setup/configs/waybar-setup-arch/waybar.md) — Complete setup: module layout, per-module config, CSS theming & troubleshooting
  - [config.jsonc](arch-based/omachy-setup/configs/waybar-setup-arch/config.jsonc) — Full bar configuration (CPU → RAM → Network → Bluetooth → Audio → Tray → Battery)
  - [style.css](arch-based/omachy-setup/configs/waybar-setup-arch/style.css) — Pill-effect styling with Nord colour palette & hover states

#### Backup Tools
- [Rclone Backup Configuration](arch-based/omachy-setup/configs/reclon-bkp/) - Google Drive backup helper
  - [Rclone Backup Script](arch-based/omachy-setup/configs/reclon-bkp/reclone-gdrive-bkp.sh)

#### Scripts
- [Reclone Google Drive Backup](arch-based/omachy-setup/scripts/reclone-gdrive-bkp.sh) - Automated backup utility

---

## 📁 File Organization Summary

```
fedora-Setup/
├── shared/                          # Shared distro-agnostic content
│   ├── configs/                     # Shared configuration files
│   │   ├── alacrity/               # Alacritty terminal configs
│   │   └── nvim-config/            # Neovim configuration
│   ├── docs/                        # Shared documentation
│   │   ├── guides/
│   │   ├── scripts/
│   │   └── software-setup/
│   └── scripts/                     # Shared utility scripts
│
├── fedora-base/                     # Fedora-specific content
│   ├── configs/                     # Fedora-specific configs
│   │   └── openbar/                # GNOME OpenBar settings
│   ├── docs/                        # Fedora-specific docs
│   │   ├── guides/
│   │   ├── scripts/
│   │   └── software-setup/
│   └── scripts/                     # Fedora-specific scripts
│
├── arch-based/                      # Arch-based content
│   └── omachy-setup/               # Omarchy-specific setup
│       ├── configs/                 # Arch-specific configs
│       │   ├── waybar-setup-arch/  # Waybar configuration
│       │   │   ├── waybar.md       # Full setup guide
│       │   │   ├── config.jsonc    # Bar configuration
│       │   │   └── style.css       # Pill-effect CSS theme
│       │   └── reclon-bkp/         # Rclone backup config
│       ├── docs/                    # Arch-specific docs
│       │   ├── guides/
│       │   ├── scripts/
│       │   └── software-setup/
│       └── scripts/                 # Arch-specific scripts
│
├── assets/                          # Shared media assets
│   ├── images/
│   ├── wallpapers/
│   ├── Files/                       # Software-specific files
│   └── Software/
│
├── README.md                        # Main documentation (updated)
├── CATALOG.md                       # This file
├── STRUCTURE.md                     # Repository structure documentation
└── MIGRATION.md                     # Historical migration notes
```

---

## 🔄 Using Shared Resources with Distribution-Specific Setup

When a resource is located in the `shared/` folder but applies to a specific distribution:

1. **Fedora Users**: Reference the shared resource from [fedora-base/](fedora-base/) context
2. **Arch Users**: Reference the shared resource from [arch-based/](arch-based/) context
3. Both distributions use the same installation and configuration process

### Example
- **Neovim Configuration** is in `shared/docs/scripts/nvim-config.md`
- Both Fedora and Arch users follow the same guide
- Configuration files are in `shared/configs/nvim-config/`
- Distribution-specific installation commands are clearly marked in the documentation

---

## 🔗 Cross-Distribution Links

Some resources have distribution-specific implementations:

| Resource | Fedora | Arch/Omarchy |
|----------|--------|-------------|
| Automated Google Drive Backup | [Fedora Version](fedora-base/docs/scripts/auto-gdrive-backup.md) | [Arch Version](arch-based/omachy-setup/docs/scripts/auto-gdrive-backup-arch.md) |
| Neovim Setup | [Shared Setup](shared/docs/scripts/nvim-config.md) | [Shared Setup](shared/docs/scripts/nvim-config.md) |
| Alacritty Terminal | [Shared Config](shared/docs/guides/alacrity-setup.md) | [Shared Config](shared/docs/guides/alacrity-setup.md) |

---

## 📌 Contributing Guidelines

When adding new documentation or configuration:

1. **Shared Content**: Place in `shared/` if it applies to both distributions
2. **Fedora Content**: Place in `fedora-base/` with appropriate subdirectory
3. **Arch Content**: Place in `arch-based/omachy-setup/` with appropriate subdirectory
4. **Update Catalog**: Add entry to this file under the appropriate section
5. **Update Main README**: Add entry to [README.md](README.md) if it's a major resource

---

## 📝 Notes

- This repository prioritizes clarity and maintainability
- Avoid content duplication - prefer linking to shared resources
- Each resource has clear distribution compatibility notes
- Follow relative paths for all internal links

---

*Last Updated: February 2026 — Added comprehensive Waybar setup documentation*
*For usage instructions, see [README.md](README.md)*
*Created By : Asitha Kanchana Palliyaguru*
