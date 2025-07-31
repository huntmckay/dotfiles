local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- File operations
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Clear search highlights
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation
map("n", "<leader>n", ":bnext<CR>", opts)
map("n", "<leader>p", ":bprevious<CR>", opts)
map("n", "<leader>d", ":bdelete<CR>", opts)
map("n", "<leader>l", ":ls<CR>", opts)

-- hot boy
vim.keymap.set("n", "<leader>a", "term<CR>A")
vim.keymap.set("n", "<leader>s", "term<CR>I")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd("syntax enable")
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.wildmenu = true
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmode = false
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.cursorline = true

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- UFO folding config (at the end, after plugin is loaded)
vim.opt.foldcolumn = "1" -- show fold markers
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

pcall(function()
  require('ufo').setup({
    provider_selector = function(_, _, _)
      return {'treesitter', 'indent'}
    end
  })
end)
