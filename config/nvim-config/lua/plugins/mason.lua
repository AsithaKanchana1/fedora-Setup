-- File: lua/plugins/mason.lua

return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- This list contains the names of external command-line tools
      -- that Mason should install. It correctly specifies 'lua_ls'
      -- and 'pyright' as tools, not Neovim plugins.
      ensure_installed = {
        "lua_ls",
        "pyright",
      },
    },
  },
}
