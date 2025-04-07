-- ~/.config/nvim/lua/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set Font
vim.g.have_nerd_font = true

-- File operations
map("n", "<leader>w", ":w<CR>", opts)       -- Save
map("n", "<leader>q", ":q<CR>", opts)       -- Quit

-- Clear search highlights
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Window nav
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)


-- Buffer nav
map("n", "<leader>n", ":bnext<CR>", opts)       -- Next buffer
map("n", "<leader>p", ":bprevious<CR>", opts)   -- Previous buffer
map("n", "<leader>d", ":bdelete<CR>", opts)    -- Close buffer
map("n", "<leader>l", ":ls<CR>", opts)         -- List buffers


-- hot boy
vim.keymap.set("n", "<leader>a", "term<CR>A") --insert at end
vim.keymap.set("n", "<leader>s", "term<CR>I") --insert at beginning

-- Telescope (if installed)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- obscure settings
vim.cmd("syntax enable")         -- Enable syntax highlighting
vim.opt.showcmd = true           -- Show command in status bar
vim.opt.cursorline = true        -- Highlight current line
vim.opt.wildmenu = true          -- Enhanced command line completion
vim.opt.lazyredraw = true        -- Only redraw when needed (faster macros)
vim.opt.showmatch = true         -- Highlight matching brackets
vim.opt.incsearch = true         -- Show match as you type
vim.opt.hlsearch = true          -- Highlight all matches
vim.opt.showmode = false
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.cursorline = true

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Folding
-- set foldenable          " enable folding
-- set foldlevelstart=10   " open most folds by default
-- set foldnestmax=10      " 10 nested fold max
-- set foldmethod=indent   " fold based on indent levels

-- File format
-- set ts=4 sts=4 sw=4 expandtab
-- autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
-- autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
-- autocmd FileType lua setlocal ts=2 sts=2 sw=2 expandtab
-- set autowrite
--
local themes = { "tokyonight", "onedarkpro", "rose-pine" }
local index = 1

vim.keymap.set("n", "<leader>ut", function()
  index = index % #themes + 1
  vim.cmd("colorscheme " .. themes[index])
  print("Theme: " .. themes[index])
end, { desc = "Toggle UI Theme", noremap = true, silent = true })

