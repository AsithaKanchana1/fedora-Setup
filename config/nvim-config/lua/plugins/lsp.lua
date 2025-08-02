-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local on_attach = function(client, bufnr)
        client.server_capabilities.completionProvider = true

        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: ".. desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
      end

      local servers = require("mason-lspconfig").get_installed_servers()
      local lspconfig = require("lspconfig")
      for _, server_name in ipairs(servers) do
        lspconfig[server_name].setup({
          on_attach = on_attach,
        })
      end

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" },
      })

      require("mason").setup()
    end,
  },
}
