return {
  {
    "windwp/nvim-autopairs",
    config = function()
      -- 1. Run the default setup first
      require("nvim-autopairs").setup({})

      -- 2. Now that it's set up, remove the rule
      local npairs = require("nvim-autopairs")
      npairs.remove_rule("```")
    end,
  },
}
