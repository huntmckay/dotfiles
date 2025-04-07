-- ~/.config/nvim/lua/plugins.lua
return {
  {
    "catppuccin/nvim",             -- A beautiful theme with multiple styles
    name = "catppuccin",           -- Give it a stable name to refer to
    priority = 1000,               -- Load early so it's ready before other plugins
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
}
