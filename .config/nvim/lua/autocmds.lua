-- Global indentation and behavior
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autowrite = true

-- overrides for 2-space indent
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml", "yml", "json", "lua", "markdown" },
  callback = function()
    vim.cmd("colorscheme onedark")
  end,
  callback = function(event)
    local ft = event.match
    local o = vim.opt_local

    -- Use 2-space indent
    o.tabstop = 2
    o.shiftwidth = 2
    o.softtabstop = 2
    o.expandtab = true

    if ft == "markdown" then
      o.spell = true
      o.wrap = true
    elseif ft == "lua" then
      o.textwidth = 120
    end
  end,
})

-- PowerShell-specific override
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ps1" },
  callback = function()
    local o = vim.opt_local
    o.tabstop = 4
    o.shiftwidth = 4
    o.softtabstop = 4
    o.expandtab = true
    o.fileformat = "dos"
  end,
})

-- Python-specific override
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
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
