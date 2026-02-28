# Migration Guide

## Repository Reorganization - February 28, 2026

This repository has been significantly reorganized to support multiple Linux distributions while maintaining clean organization and avoiding content duplication.

### What Changed

This repository has evolved from a **Fedora-only** setup to a **multi-distribution** repository supporting:
- **Fedora** (primary, with GNOME)
- **Arch-based** distributions (including **Omarchy**)

#### Old Structure (Single Distribution)
```
fedora-Setup/
├── config/
├── docs/
├── scripts/
└── assets/
```

#### New Structure (Multi-Distribution)
```
fedora-Setup/
├── shared/          # Distribution-agnostic content
├── fedora-base/     # Fedora-specific content
├── arch-based/      # Arch-specific content
│   └── omachy-setup/# Omarchy-specific setup
└── assets/          # Shared media
```

### File Organization Changes

#### Shared Documentation (Applicable to Both)
```
Old Location                        → New Location
────────────────────────────────────────────────────────────
docs/guides/alacrity-setup.md      → shared/docs/guides/
docs/scripts/nvim-config.md        → shared/docs/scripts/
docs/scripts/set-git-defaults.md   → shared/docs/scripts/
docs/scripts/system-clean.md       → shared/docs/scripts/
docs/software-setup/android-studio-setup.md   → shared/docs/software-setup/
...and 8 other shared software guides...
config/nvim-config/                → shared/configs/
config/alacrity/                   → shared/configs/
scripts/gcopy-setup.sh             → shared/scripts/
```

#### Fedora-Specific Content
```
Old Location                        → New Location
────────────────────────────────────────────────────────────
docs/guides/VM-fedora.md           → fedora-base/docs/guides/
docs/scripts/auto-gdrive-backup.md → fedora-base/docs/scripts/
docs/software-setup/one-drive-sync.md    → fedora-base/docs/software-setup/
docs/software-setup/docker-gui.md        → fedora-base/docs/software-setup/
config/openbar/                    → fedora-base/configs/
```

#### Arch-Specific Content (New)
```
docs/scripts/auto-gdrive-backup-arch.md  → arch-based/omachy-setup/docs/scripts/
config/waybar-setup-arch/                → arch-based/omachy-setup/configs/
config/reclon-bkp/                       → arch-based/omachy-setup/configs/
```

### Updated Links

All internal documentation links have been updated:

| Old Link | New Link |
|----------|----------|
| `docs/guides/alacrity-setup.md` | `shared/docs/guides/alacrity-setup.md` |
| `docs/scripts/nvim-config.md` | `shared/docs/scripts/nvim-config.md` |
| `docs/scripts/auto-gdrive-backup.md` | `fedora-base/docs/scripts/auto-gdrive-backup.md` |
| `docs/scripts/auto-gdrive-backup-arch.md` | `arch-based/omachy-setup/docs/scripts/auto-gdrive-backup-arch.md` |
| `config/alacrity/` | `shared/configs/alacrity/` |
| `config/nvim-config/` | `shared/configs/nvim-config/` |
| `config/openbar/` | `fedora-base/configs/openbar/` |
| `config/waybar-setup-arch/` | `arch-based/omachy-setup/configs/waybar-setup-arch/` |

### New Documentation

Three new comprehensive documentation files have been created:

1. **CATALOG.md** - Complete index of all resources organized by distribution and category
2. **Updated README.md** - Now with separate sections for:
   - Fedora-Based Setup
   - Arch-Based Setup (Omarchy)
   - Shared Resources
3. **Updated STRUCTURE.md** - Reflects the new multi-distribution organization

### What You Need to Do

#### If You Have a Local Clone

**Option 1: Fresh Clone (Recommended)**
```bash
# Backup any local changes
cd /path/to/fedora-Setup
git stash  # if you have uncommitted changes

# Get the latest structure
git pull origin main

# If you had local modifications, restore them
git stash pop  # if you used stash above
```

**Option 2: Manual Directory Reorganization**
```bash
cd /path/to/fedora-Setup
git fetch origin
git reset --hard origin/main
```

#### Fedora Users

✅ **Your setup**: All your resources are in `fedora-base/` and `shared/`
✅ **Quick Links**: [Fedora Setup Section](README.md#fedora-based-setup)
✅ **All Documentation**: [README.md](README.md) - Fedora Section

#### Arch/Omarchy Users

✅ **Your setup**: All your resources are in `arch-based/omachy-setup/` and `shared/`
✅ **Quick Links**: [Arch Setup Section](README.md#arch-based-setup-omarchy)
✅ **All Documentation**: [README.md](README.md) - Arch Section

### New Features

- **📁 CATALOG.md**: Comprehensive index of all resources
- **🔗 Central Navigation**: README with separate sections for each distribution
- **📋 STRUCTURE.md**: Updated with multi-distribution organization
- **✅ No Duplication**: Shared resources stored once, linked from both sections
- **🎯 Clear Paths**: Each distribution knows exactly where its resources are
- **📚  Better Organization**: Everything logically grouped by purpose and distribution

### Removed Old Files

- Old `/docs/` directory *(content reorganized)*
- Old `/config/` directory *(content reorganized)*
- Old `/scripts/` directory *(content reorganized)*
- All links have been updated across documentation

### Accessing Your Content

**For Fedora Users:**
- Fedora-specific docs: `fedora-base/docs/`
- Shared resources: `shared/docs/` and `shared/configs/`
- See [README.md](README.md#fedora-based-setup)

**For Arch/Omarchy Users:**
- Arch-specific docs: `arch-based/omachy-setup/docs/`
- Shared resources: `shared/docs/` and `shared/configs/`
- See [README.md](README.md#arch-based-setup-omarchy)

### Questions or Issues?

If you notice any broken links or have questions about the new structure:
1. Check [STRUCTURE.md](STRUCTURE.md) for the complete directory layout
2. Check [CATALOG.md](CATALOG.md) for a complete resource index
3. Check [README.md](README.md) for your distribution section
4. Open an issue if you find problems

---

## Repository Features

### Version 1.0 (Original)
- Fedora-only setup
- Single documentation structure
- Basic scripts and configs

### Version 2.0 (Current - February 28, 2026)
- Multi-distribution support (Fedora + Arch)
- Organized by distribution + shared
- Central catalog of all resources
- Clear separation of concerns
- No content duplication
- Comprehensive cross-links

---

## Technical Notes

### Why This Organization?

1. **Scalability**: Easy to add more distributions in the future
2. **Maintainability**: Shared content updated once, used by both
3. **Clarity**: Users immediately know where their distribution's resources are
4. **Efficiency**: No duplicate documentation
5. **Professionalism**: Follows industry best practices

### Links Used

- Relative paths: `shared/docs/nvim-config.md`
- Cross-distribution: Fedora users reference `shared/` for shared content
- Distribution-specific: Arch users reference `arch-based/omachy-setup/`

### Excluded from Migration

- `.git/` - Git repository and history
- `.gitignore` - Git configuration
- `.themes/` and `.icons/` - GNOME themes and icons (remain at root)
- `assets/` - Media and wallpapers (remain at root)

---

*Last Updated: February 28, 2026*
*Migration Completed Successfully*
