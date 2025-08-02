# Neovim Configuration Setup Guide

This guide provides step-by-step instructions to set up a modern Neovim configuration with LSP, completion, and snippet support from scratch.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installing Neovim](#installing-neovim)
3. [Setting up the Configuration](#setting-up-the-configuration)
4. [Plugin Overview](#plugin-overview)
5. [Key Features](#key-features)
6. [Keybindings](#keybindings)
7. [Troubleshooting](#troubleshooting)
8. [Customization](#customization)

## Prerequisites

Before starting, ensure you have the following installed on your Fedora system:

```bash
# Update system
sudo dnf update -y

# Install required packages
sudo dnf install -y git curl wget unzip nodejs npm python3 python3-pip
```

## Installing Neovim

### Option 1: Install from Fedora repositories (Stable)
```bash
sudo dnf install -y neovim
```

### Option 2: Install latest stable from GitHub (Recommended)
```bash
# Download and install latest Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
rm nvim-linux64.tar.gz
```

### Verify Installation
```bash
nvim --version
```

## Setting up the Configuration

### Step 1: Backup existing configuration (if any)
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.backup 2>/dev/null || true
mv ~/.cache/nvim ~/.cache/nvim.backup 2>/dev/null || true
```

### Step 2: Copy the configuration
```bash
# Create nvim config directory
mkdir -p ~/.config/nvim

# Copy the configuration from this repository
cp -r ./config/nvim-config/* ~/.config/nvim/
```

### Step 3: Install Language Servers and Tools

#### For Python Development
```bash
# Install Python LSP and tools
pip3 install --user python-lsp-server[all] black isort flake8 mypy
```

#### For JavaScript/TypeScript Development
```bash
# Install Node.js LSP servers
npm install -g typescript-language-server typescript
npm install -g @vscode/vscode-langservers-extracted  # HTML, CSS, JSON
npm install -g lua-language-server
```

#### For Other Languages
```bash
# Install additional language servers as needed
# Go
go install golang.org/x/tools/gopls@latest

# Rust (requires rustup)
rustup component add rust-analyzer

# C/C++
sudo dnf install clang-tools-extra  # provides clangd
```

### Step 4: First Launch
```bash
# Start Neovim
nvim
```

On first launch:
1. Neovim will automatically install the Lazy.nvim plugin manager
2. All plugins will be downloaded and installed automatically
3. LSP servers will be installed via Mason
4. Wait for all installations to complete

## Plugin Overview

### Core Plugins

| Plugin | Purpose | Configuration File |
|--------|---------|-------------------|
| **lazy.nvim** | Plugin manager | Auto-installed |
| **blink.cmp** | Completion engine | `lua/plugins/completion.lua` |
| **LuaSnip** | Snippet engine | Included in completion config |
| **mason.nvim** | LSP server manager | `lua/plugins/mason.lua` |
| **nvim-lspconfig** | LSP configuration | `lua/plugins/lsp.lua` |

### Completion Sources

- **LSP**: Language server completions
- **Buffer**: Words from current buffer
- **Path**: File path completions
- **Snippets**: Code snippets via LuaSnip
- **Dictionary**: English words (for text files)
- **LaTeX Symbols**: Mathematical symbols (for LaTeX files)

## Key Features

### 🚀 Modern Completion System
- **Smart Tab Navigation**: Tab/Shift-Tab for completion and snippet jumping
- **Context-Aware Sources**: Different completion sources based on file type
- **Fuzzy Matching**: Intelligent completion matching
- **Documentation Preview**: Hover documentation for completions

### 🔧 Language Server Protocol (LSP)
- **Auto-installation**: LSP servers installed automatically via Mason
- **Multi-language Support**: Python, JavaScript, TypeScript, Lua, and more
- **Diagnostics**: Real-time error checking and linting
- **Code Actions**: Automated code fixes and refactoring

### 📝 Snippet Support
- **VS Code Snippets**: Compatible with VS Code snippet format
- **Custom Snippets**: Easy to add your own snippets
- **Smart Expansion**: Context-aware snippet expansion

### 📖 File-Type Specific Features
- **LaTeX**: Mathematical symbol completion
- **Markdown/Text**: Dictionary word completion
- **Programming Languages**: Full LSP support with completion, diagnostics, and formatting

## Keybindings

### Completion
| Key | Action |
|-----|--------|
| `Ctrl + Space` | Show completion menu / documentation |
| `Ctrl + Y` | Accept completion |
| `Ctrl + E` | Hide completion menu |
| `Ctrl + N` | Next completion item |
| `Ctrl + P` | Previous completion item |
| `Tab` | Next completion item or jump to next snippet placeholder |
| `Shift + Tab` | Previous completion item or jump to previous snippet placeholder |

### General Navigation
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Show hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |

*Note: `<leader>` is typically the space key or backslash, depending on your configuration.*

## Troubleshooting

### Common Issues

#### 1. LSP Server Not Working
```bash
# Check if Mason installed the LSP server
:Mason

# Manually install a language server
:MasonInstall python-lsp-server
```

#### 2. Completion Not Working
- Ensure the LSP server is running: `:LspInfo`
- Check if blink.cmp is loaded: `:checkhealth blink`
- Verify completion sources: `:lua print(vim.inspect(require('blink.cmp').get_config().sources))`

#### 3. Snippets Not Expanding
- Check if LuaSnip is loaded: `:checkhealth luasnip`
- Verify snippet files are loaded: `:LuaSnipListAvailable`

#### 4. Dictionary Completion Not Working
```bash
# Install words file (if not present)
sudo dnf install words
# Or create a symlink if the path is different
sudo ln -s /usr/share/dict/linux.words /usr/share/dict/words
```

### Health Check
Run Neovim's built-in health check:
```vim
:checkhealth
```

## Customization

### Adding New Language Servers

1. Install via Mason:
```vim
:MasonInstall <language-server-name>
```

2. Configure in `lua/plugins/lsp.lua`:
```lua
require('lspconfig').<server-name>.setup({
  -- Server-specific configuration
})
```

### Adding Custom Snippets

Create a snippets file in `~/.config/nvim/snippets/`:
```lua
-- Example: ~/.config/nvim/snippets/python.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("def", {
    t("def "), i(1, "function_name"), t("("), i(2, "args"), t("):"),
    t({"", "    "}), i(3, "pass")
  })
}
```

### Modifying Keybindings

Edit the keymap configuration in `lua/plugins/completion.lua`:
```lua
opts.keymap = {
  preset = "none",
  ["<YourKey>"] = { "your_action" },
  -- Add more custom keybindings
}
```

### Adding New Completion Sources

1. Install the source plugin as a dependency
2. Configure it in the sources section:
```lua
opts.sources = {
  default = { "lsp", "buffer", "path", "luasnip", "your_new_source" },
  providers = {
    your_new_source = {
      name = "source_name",
      module = "source_module",
    },
  },
}
```

## File Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration entry point
├── lazy-lock.json             # Plugin version lock file
└── lua/
    └── plugins/
        ├── completion.lua      # Completion configuration (blink.cmp + LuaSnip)
        ├── lsp.lua            # LSP server configurations
        └── mason.lua          # LSP server management
```

## Backup and Restore

### Creating a Backup
```bash
# Create a backup of your current configuration
cp -r ~/.config/nvim ~/nvim-config-backup-$(date +%Y%m%d)
```

### Restoring from Backup
```bash
# Restore from backup
rm -rf ~/.config/nvim
cp -r ~/nvim-config-backup-YYYYMMDD ~/.config/nvim
```

## Contributing

If you find improvements or fixes:

1. Update the configuration files in `config/nvim-config/`
2. Update this documentation
3. Test the changes on a fresh system
4. Commit and push to the repository

## Additional Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)
- [blink.cmp Completion Engine](https://github.com/Saghen/blink.cmp)
- [Mason LSP Manager](https://github.com/williamboman/mason.nvim)
- [LuaSnip Snippet Engine](https://github.com/L3MON4D3/LuaSnip)

---

**Last Updated**: August 2025
**Tested On**: Fedora 40+
**Neovim Version**: 0.10+
