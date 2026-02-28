# Repository Structure

This document describes the organization of this Linux setup repository, which now supports both Fedora and Arch-based (including Omarchy) distributions.

## Current Directory Structure

```
fedora-Setup/
├── README.md                        # Main documentation with Fedora & Arch sections
├── CATALOG.md                       # Complete index of all resources with links
├── STRUCTURE.md                     # This file - repository structure documentation
├── MIGRATION.md                     # Migration history and notes
│
├── shared/                          # Shared distro-agnostic content
│   ├── configs/                     # Shared configuration files
│   │   ├── alacrity/                # Alacritty terminal configurations
│   │   └── nvim-config/             # Neovim IDE configuration
│   │
│   ├── docs/                        # Shared documentation
│   │   ├── guides/
│   │   ├── scripts/
│   │   └── software-setup/
│   │
│   └── scripts/                     # Shared utility scripts
│
├── fedora-base/                     # Fedora-specific content
│   ├── configs/
│   │   └── openbar/                 # GNOME OpenBar top bar customization
│   └── docs/
│       ├── guides/
│       ├── scripts/
│       └── software-setup/
│
├── arch-based/                      # Arch-based distributions
│   └── omachy-setup/               # Omarchy-specific setup
│       ├── configs/                 # Arch-specific configurations
│       ├── docs/                    # Arch-specific documentation
│       └── scripts/                 # Arch-specific scripts
│
├── assets/                          # Shared media and static files
├── .themes/                         # GNOME theme files
├── .icons/                          # GNOME icon theme files
└── .git/                            # Git repository
```

## Organization Principles

1. **Separation of Concerns**: Configurations, documentation, and scripts are kept separate
2. **Distribution-Based Organization**: Fedora-specific, Arch-specific, and shared folders
3. **Logical Grouping**: Related files grouped by purpose
4. **Clear Naming**: Directory names clearly indicate purpose and distribution
5. **Relative Links**: All internal links use relative paths for portability

## Key Features

- **Centralized Index**: [CATALOG.md](CATALOG.md) provides complete index of all resources
- **No Duplication**: Shared resources stored once, linked from both sections
- **Clear Documentation**: [README.md](README.md) has separate sections for each distribution
- **Backup Scripts**: Both Fedora and Arch versions available
- **Reference Guides**: Complete setup guides for both distributions

## Related Documentation

- [Main README](README.md) - Getting started by distribution
- [CATALOG.md](CATALOG.md) - Complete index of all configurations and documentation
- [MIGRATION.md](MIGRATION.md) - History of repository reorganization

---

*Last Updated: February 28, 2026*
*Repository Structure Version: 2.0 (Multi-Distribution Support)*
