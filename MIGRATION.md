# Migration Guide

## Changes Made on November 14, 2025

This repository has been reorganized to follow best practices for better maintainability and navigation.

### What Changed

#### Directory Structure
- **Old**: Files were scattered across `Scripts/`, `SoftwareSetup/`, `AlacritySetup/` directories
- **New**: Consolidated into organized `docs/`, `config/`, `scripts/`, and `assets/` directories

#### Specific Changes

```
Old Location → New Location
─────────────────────────────────────────────────────────────
Scripts/*.md                    → docs/scripts/
SoftwareSetup/*.md              → docs/software-setup/
AlacritySetup/*.md              → docs/guides/
Train  LLM/                     → docs/guides/train-llm/
VM-fedora.md                    → docs/guides/
img/                            → assets/images/
Wallpapers/                     → assets/wallpapers/
gcopy/                          → scripts/gcopy/
```

### Updated Links

All internal documentation links have been updated to reflect the new structure:
- README.md now uses relative paths: `docs/guides/`, `docs/scripts/`, `docs/software-setup/`
- Internal cross-references updated (e.g., config file references, image links)
- All links tested and verified

### If You Have a Local Clone

If you previously cloned this repository, you have two options:

#### Option 1: Fresh Clone (Recommended)
```bash
# Backup any local changes
cd /path/to/fedora-Setup
git stash  # if you have uncommitted changes

# Get the latest structure
git pull origin main

# If you had local modifications, restore them
git stash pop  # if you used stash above
```

#### Option 2: Manual Update
```bash
cd /path/to/fedora-Setup
git fetch origin
git reset --hard origin/main
```

**Warning**: Option 2 will discard any local changes. Make sure to backup first!

### What You Need to Do

✅ **If you use these files as reference**: Nothing! All links in README.md are updated.

✅ **If you have bookmarks to specific files**: Update your bookmarks to the new paths shown above.

✅ **If you have scripts that reference these paths**: Update the paths in your scripts.

### New Features

- **📁 STRUCTURE.md**: Comprehensive documentation of repository organization
- **🚫 .gitignore**: Proper ignore rules for temporary files
- **🗂️ Better Organization**: Logical grouping of related files
- **🔗 Relative Links**: All internal links use relative paths for better portability

### Questions?

If you notice any broken links or have questions about the new structure:
1. Check [STRUCTURE.md](STRUCTURE.md) for the complete directory layout
2. Check [README.md](README.md) for updated quick links
3. Open an issue if you find any problems

---

*This migration was done to improve repository maintainability and follow industry best practices for documentation organization.*
