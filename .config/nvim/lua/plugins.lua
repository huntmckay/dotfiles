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
      require("Comment").setup({
        toggler = {
          line = "<leader>c",   -- Line comment toggle
          block = "<leader>C",  -- Block comment toggle
        },
        opleader = {
          line = "<leader>c",   -- Visual mode line toggle
          block = "<leader>C",  -- Visual mode block toggle
        },
        mappings = {
          basic = true,
          extra = false,
        },
      })
      -- Custom remaps for "extra" comment features not sure if work
      vim.keymap.set("n", "<leader>co", api.comment_linewise_above, { desc = "Comment above", noremap = true })
      vim.keymap.set("n", "<leader>ca", api.comment_linewise_current, { desc = "Comment end of line", noremap = true })
    end,
  },
  { "lukas-reineke/indent-blankline.nvim" },
  { "echasnovski/mini.surround" },
}
