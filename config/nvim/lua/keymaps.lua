local map = vim.keymap.set
local opts = { noremap = true, silent = true }

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

-- Notes taking
vim.keymap.set("n", "<leader>nn", ":e ~/notes/inbox.md<CR>", { desc = "Open notes inbox"})
vim.keymap.set("n","<leader>fn", function()
  Snacks.picker.files({ cmd = "~/notes" })
end, { desc = "Find in notes" })

vim.keymap.set("n", "<leader>gn", function()
  Snacks.picker.grep({ cwd = "~/notes" })
end, { desc = "Grep Notes" })

-- Neogit
vim.keymap.set("n", "<leader>gg", function() require("neogit").open() end,
  { desc = "Open Neogit" })

-- === Neogit (primary UI) ===
vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "Git Commit" })
vim.keymap.set("n", "<leader>gp", "<cmd>Neogit push<CR>",   { desc = "Git Push" })
vim.keymap.set("n", "<leader>gP", "<cmd>Neogit pull<CR>",   { desc = "Git Pull" })
vim.keymap.set("n", "<leader>gb", "<cmd>Neogit branch<CR>", { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gr", "<cmd>Neogit rebase<CR>", { desc = "Git Rebase" })
vim.keymap.set("n", "<leader>gR", "<cmd>Neogit reset<CR>",  { desc = "Git Reset…" })
vim.keymap.set("n", "<leader>gS", "<cmd>Neogit stash<CR>",  { desc = "Git Stash…" })

-- Open Neogit log view (nice filtered history UI)
vim.keymap.set("n", "<leader>gl", function() require("neogit").open({ "log" }) end,
  { desc = "Git Log (Neogit)" })

-- === Gitsigns (work the current file by hunk) ===
local gs = require("gitsigns")
vim.keymap.set("n", "]h", gs.next_hunk,                 { desc = "Next hunk" })
vim.keymap.set("n", "[h", gs.prev_hunk,                 { desc = "Prev hunk" })
vim.keymap.set("n", "<leader>hs", gs.stage_hunk,        { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hr", gs.reset_hunk,        { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk,   { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>hp", gs.preview_hunk,      { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hS", gs.stage_buffer,      { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>hR", gs.reset_buffer,      { desc = "Reset buffer" })
vim.keymap.set("n", "<leader>hb", gs.blame_line,        { desc = "Blame line" })

-- === Snacks pickers for quick Git navigation (no Telescope needed) ===
local Snacks = require("snacks")
vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_files() end,   { desc = "Git Files" })
vim.keymap.set("n", "<leader>gB", function() Snacks.picker.git_branches() end,{ desc = "Git Branches (picker)" })
vim.keymap.set("n", "<leader>gC", function() Snacks.picker.git_commits() end, { desc = "Git Commits (picker)" })
vim.keymap.set("n", "<leader>gL", function() Snacks.picker.git_log_file() end,{ desc = "Current File Log" })

-- Open repo/line in browser (GitHub/GitLab/etc.) via Snacks
vim.keymap.set("n", "<leader>gO", function() Snacks.gitbrowse() end, { desc = "Open in remote (browser)" })


-- Quick shortcuts
vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<cr>", { desc = "Commit" })
vim.keymap.set("n", "<leader>gp", "<cmd>Neogit push<cr>", { desc = "Push" })
vim.keymap.set("n", "<leader>gl", "<cmd>Neogit log<cr>", { desc = "Log" })

-- Notes
vim.keymap.set("n", "<leader>nn", ":e ~/notes/daily_log.md")
vim.keymap.set("n", "<leader>fn", function()
  Snacks.picker.find({ cmd = "~/notes" })
end, { desc = "Find in notes" })
vim.keymap.set("n", "<leader>gn", function()
  Snacks.picker.grep({ cmd = "~/notes" })
end, { desc = "search notes" })

-- Other options/settings (if you want)
vim.cmd("syntax enable")
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.wildmenu = true
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmode = false
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
