return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = false, -- we configure it manually in ui.lua
  },
}
