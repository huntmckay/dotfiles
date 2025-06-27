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
  {
    "numToStr/Comment.nvim",
    config = function()
      local comment = require("Comment")
      comment.setup({
        toggler = {
          line = "<leader>cc",
          block = "<leader>CC",
        },
        opleader = {
          line = "<leader>cc",
          block = "<leader>CC",
        },
        extra = {
          above = "<leader>cO",
          below = nil,
          eol = "<leader>cA",
        },
        mappings = {
          basic = true,
          extra = true,
        },
      })
    end,
  },

  { "lukas-reineke/indent-blankline.nvim" },
  { "echasnovski/mini.surround" },
  { "folke/which-key.nvim" },
  { "indent-blankline.nvim" },
}
