vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autowrite = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml", "yml", "json", "lua", "markdown" },
  callback = function(event)
    local o = vim.opt_local
    o.tabstop = 2
    o.shiftwidth = 2
    o.softtabstop = 2
    o.expandtab = true

    if event.match == "markdown" then
      o.spell = true
      o.wrap = true
    elseif event.match == "lua" then
      o.textwidth = 120
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ps1",
  callback = function()
    local o = vim.opt_local
    o.tabstop = 4
    o.shiftwidth = 4
    o.softtabstop = 4
    o.expandtab = true
    o.fileformat = "dos"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    local o = vim.opt_local
    o.tabstop = 4
    o.shiftwidth = 4
    o.softtabstop = 4
    o.expandtab = true
    o.textwidth = 88
    o.colorcolumn = "89"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("n", "<leader>p", function()
      -- Snacks users: this opens a floating terminal with glow preview of the current file
      vim.cmd('terminal glow %')
    end, { buffer = true, desc = "Markdown Preview (glow)" })
  end,
})

