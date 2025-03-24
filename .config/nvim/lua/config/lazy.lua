-- # keybinds
-- leader s h for help menu
-- Leader map
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set Font
vim.g.have_nerd_font = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- obscure settings
vim.opt.showmode = false
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.cursorline = true

-- keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- buffer
vim.keymap.set("n", "<leader>l", ":bn<CR>")
vim.keymap.set("n", "<leader>h", ":bp<CR>")
vim.keymap.set("n", "<leader>k", ":ls<CR>")
vim.keymap.set("n", "<leader>j", ":w<CR>:bw<CR>")
vim.keymap.set("n", "<leader>d", ":bd<CR>")
-- hot boy shit
vim.keymap.set("n", "<leader>a", "term<CR>A") --insert at end
vim.keymap.set("n", "<leader>s", "term<CR>I") --insert at beginning

-- -- Config
-- syntax enable           " enable syntax processing
-- set showcmd             " show command in bottom bar
-- set cursorline          " highlight current line
-- set wildmenu            " visual autocomplete for command menu
-- set lazyredraw          " redraw only when we need to
-- set showmatch           " highlight matching [{()}]
-- set incsearch           " search as characters are entered
-- set hlsearch            " highlight matches

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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		{ "LazyVim/LazyVim", import = "lazyvim.plugins.snacks.Config" },
		-- import/override with your plugins
		-- { import = "plugins" },
	},
	-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
	defaults = {
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = true,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	-- install = { colorscheme = { "catppuccin/nvim" } },
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	}, -- automatically check for plugin updates
})
