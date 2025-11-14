# Repository Structure

This document describes the organization of this Fedora setup repository.

## Directory Structure

```
fedora-Setup/
├── README.md                    # Main documentation and entry point
├── .gitignore                   # Git ignore rules
├── config/                      # Configuration files
│   ├── alacrity/               # Alacritty terminal configurations
│   ├── nvim-config/            # Neovim configuration
│   └── openbar/                # OpenBar settings
├── docs/                        # All documentation
│   ├── guides/                 # General guides and tutorials
│   │   ├── alacrity-setup.md
│   │   ├── VM-fedora.md
│   │   └── train-llm/
│   ├── scripts/                # Documentation for scripts
│   │   ├── auto-gdrive-backup.md
│   │   ├── markdown-instructions.md
│   │   ├── nvim-config.md
│   │   ├── set-git-defaults.md
│   │   └── system-clean.md
│   └── software-setup/         # Software installation guides
│       ├── android-studio-setup.md
│       ├── davinci-resolve-install.md
│       ├── docker-gui.md
│       ├── gnome-boxes-vm.md
│       ├── mysql-work-bench.md
│       ├── NetBeans-17-install.md
│       ├── one-drive-sync.md
│       └── only-office-rpm.md
├── scripts/                     # Executable scripts
│   └── gcopy/                  # Google Copy scripts
├── assets/                      # Static assets
│   ├── images/                 # Images and screenshots
│   ├── wallpapers/             # Wallpaper collections
│   └── Software/               # Software installers (if any)
└── STRUCTURE.md                 # This file

```

## Organization Principles

1. **Separation of Concerns**: Documentation, configuration, and scripts are kept in separate directories
2. **Logical Grouping**: Related files are grouped together (e.g., all software setup guides in one place)
3. **Clear Naming**: Directory and file names clearly indicate their purpose
4. **Relative Links**: All internal links use relative paths for portability
5. **Assets Centralization**: All images, wallpapers, and media files are in the `assets/` directory

## Navigation

- Start with [README.md](README.md) for an overview and quick links
- Browse [docs/guides/](docs/guides/) for general setup guides
- Check [docs/software-setup/](docs/software-setup/) for specific software installation instructions
- Find script documentation in [docs/scripts/](docs/scripts/)
- Configuration files are in [config/](config/)

## Contributing

When adding new content:
- Place documentation in the appropriate `docs/` subdirectory
- Store configuration files in `config/`
- Put executable scripts in `scripts/`
- Add images/media to `assets/images/`
- Update README.md with links to new important documents
- Use relative paths for all internal links

## Migration Notes

This repository was reorganized on November 14, 2025 to follow best practices:
- Old structure had files scattered in root and inconsistent directories
- New structure provides clear separation and better navigation
- All links have been updated to reflect the new organization
