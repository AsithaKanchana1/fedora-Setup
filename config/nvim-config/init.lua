-- File: init.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data").. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- This line tells lazy.nvim to load all plugin files
-- from the 'lua/plugins' directory.
require("lazy").setup("plugins")

-- You can keep any other settings (vim.opt, vim.g, keymaps) here.
