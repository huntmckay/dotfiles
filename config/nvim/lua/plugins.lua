return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "cool",
        options = { transparency = false }
      })
      vim.cmd.colorscheme("onedark")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "markdown", "python", "json", "yaml", "bash", "vim", "toml", "html", "typescript" },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
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
  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
}
