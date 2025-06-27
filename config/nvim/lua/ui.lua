-- === Theme Setup ===

-- TokyoNight
require("tokyonight").setup({
  style = "night", -- "storm" | "moon" | "night" | "day"
  light_style = "day",
  transparent = false,
})

-- OneDark
require("onedark").setup({
  style = "cool",
  light_style = "light",
  options = {
    transparency = false,
  },
})

-- Rose Pine
require("rose-pine").setup({
  style = "moon",
  light_style = "dawn",
})

-- Set a default theme at startup
vim.o.background = "dark"
vim.cmd.colorscheme("tokyonight")

-- === Lualine ===
require("lualine").setup({
  options = {
    theme = "auto", -- auto-detects from colorscheme
    section_separators = "",
    component_separators = "|",
  },
})

-- === Theme Toggler ===

-- Cycle between themes
local themes = { "tokyonight", "onedark", "rose-pine" }
local current_theme_index = 1

vim.keymap.set("n", "<leader>ut", function()
  current_theme_index = current_theme_index % #themes + 1
  vim.cmd("colorscheme " .. themes[current_theme_index])
  print("Theme: " .. themes[current_theme_index])
end, { desc = "Toggle UI Theme", noremap = true, silent = true })

-- Toggle between dark/light
local is_dark = true
vim.keymap.set("n", "<leader>ul", function()
  if is_dark then
    vim.o.background = "light"
    print("Light mode")
  else
    vim.o.background = "dark"
    print("Dark mode")
  end
  is_dark = not is_dark
end, { desc = "Toggle Light/Dark", noremap = true, silent = true })
