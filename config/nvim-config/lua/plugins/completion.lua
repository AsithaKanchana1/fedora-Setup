-- File: lua/plugins/completion.lua

return {
  "Saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
    { "kdheepak/cmp-latex-symbols" },
    { "uga-rosa/cmp-dictionary" },
  },
  config = function()
    require("cmp_dictionary").setup({
      paths = { "/usr/share/dict/words" },
      exact_length = 2,
    })

    local luasnip = require("luasnip")
    local cmp = require("blink.cmp")
    local opts = {}

    -- KEY-MAPS (FIXED)
    opts.keymap = {
      preset = "none",
      ["<C-y>"] = { "select_and_accept" },
      ["<C-e>"] = { "hide" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-space>"] = { "show", "show_documentation" },
      ["<Tab>"] = {
	      function(fallback)
		      if cmp.is_visible() then
			      cmp.select_next_item()
		      elseif luasnip.jumpable(1) then
			      luasnip.jump(1)
		      else
			      fallback()
		      end
	      end,
	      "fallback",
      },
      ["<S-Tab>"] = {
        function(fallback)
          if cmp.is_visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
        "fallback",
      },
    }

    opts.snippets = { preset = "luasnip" }

    opts.sources = {
      default = { "lsp", "buffer", "path" },
      per_filetype = {
        tex = { "lsp", "buffer", "path", "latex" },
        latex = { "lsp", "buffer", "path", "latex" },
        plaintex = { "lsp", "buffer", "path", "latex" },
        markdown = { "lsp", "buffer", "path", "dictionary" },
        text = { "lsp", "buffer", "path", "dictionary" },
        gitcommit = { "lsp", "buffer", "path", "dictionary" },
      },
      providers = {
        lsp = { score_offset = 10 },
        buffer = { score_offset = 5 },
        latex = {
          name = "latex_symbols",
          module = "blink.compat.source",
        },
        dictionary = {
          name = "dictionary",
          module = "blink.compat.source",
        },
      },
    }

    require("blink.cmp").setup(opts)
  end,
}
