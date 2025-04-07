-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true               -- Show absolute line number on current line
vim.opt.relativenumber = true      -- Show relative line numbers for easier movement
vim.opt.mouse = "a"                -- Enable mouse in all modes (insert, normal, etc.)
vim.opt.termguicolors = true       -- Enable 24-bit RGB color support (required for themes)
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard for yanking and pasting

-- Setup Lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"  
-- Define where lazy.nvim should be installed (~/.local/share/nvim/lazy/lazy.nvim)

if not vim.loop.fs_stat(lazypath) then  
  -- If lazy.nvim doesn't exist, clone it from GitHub
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",          -- Skip file history for faster clone
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)      -- Add lazy.nvim to runtime path so it loads

require("lazy").setup("plugins")   -- Load your plugin list from lua/plugins.lua
require("keymaps")
require("autocmds")
require("ui")
