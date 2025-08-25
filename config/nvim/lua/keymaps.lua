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

-- === Notes workflow ===
local NOTES_DIR   = "~/notes"
local JOURNAL_MD  = NOTES_DIR .. "/journal.md"

-- tiny helpers
local function expand(p) return vim.fn.expand(p) end
local function ensure_dir(path) vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p") end

-- daily-log: today's header at top
local function today_header() return os.date("%Y-%m-%d — %A") end
local function ensure_today_top(bufnr)
  bufnr = bufnr or 0
  local hdr = today_header()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local idx
  for i, l in ipairs(lines) do
    if l:match("^##%s+" .. vim.pesc(hdr) .. "%s*$") then idx = i; break end
  end
  if idx then
    vim.api.nvim_win_set_cursor(0, { idx + 1, 0 })
    return
  end
  vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { "## " .. hdr, "" })
  vim.api.nvim_win_set_cursor(0, { 2, 0 })
end

-- <leader>dl → open daily log (journal) and ensure today at top
vim.keymap.set("n", "<leader>dl", function()
  local path = expand(JOURNAL_MD)
  ensure_dir(path)
  vim.cmd.edit(vim.fn.fnameescape(path))
  ensure_today_top(0)
end, { desc = "Daily Log (today at top)" })

-- <leader>fn → fuzzy-find a note in ~/notes
vim.keymap.set("n", "<leader>fn", function()
  local ok, Snacks = pcall(require, "snacks")
  local cwd = expand(NOTES_DIR)
  if ok and Snacks.picker and Snacks.picker.explorer then
    Snacks.picker.explorer({ cwd = cwd, layout = "sidebar", on_show = function() vim.cmd.stopinsert() end })
  elseif ok and Snacks.picker then
    Snacks.picker.files({ cwd = cwd, on_show = function() vim.cmd.stopinsert() end })
  end
end, { desc = "Notes: find/open" })

-- <leader>gn → grep/search inside ~/notes
vim.keymap.set("n", "<leader>gn", function()
  local ok, Snacks = pcall(require, "snacks")
  local cwd = expand(NOTES_DIR)
  Snacks.picker.grep({ cwd = cwd, on_show = function() vim.cmd.stopinsert() end })
end, { desc = "Notes: grep" })

-- <leader>nn → create a new note (prompt title → slug → open)
vim.keymap.set("n", "<leader>nn", function()
  local title = vim.fn.input("New note title: ")
  if title == nil or title == "" then return end
  local slug = title
    :gsub("[^%w%s%-]", "")  -- keep words/spaces/hyphens
    :gsub("%s+", "-")
    :lower()

  local filename = slug
  local path = expand(NOTES_DIR .. "/" .. filename)
  ensure_dir(path)

  -- create/open
  vim.cmd.edit(vim.fn.fnameescape(path))

  -- if empty, add a header
  if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {
      "# " .. title,
      "",
    })
  end
end, { desc = "Notes: new note" })

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
