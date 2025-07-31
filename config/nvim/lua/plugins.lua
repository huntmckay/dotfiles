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
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true, timeout = 3000 },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      zen = { enabled = true },      -- zen mode (toggle with <leader>z)
      git = { enabled = true },      -- git integration (pickers, lazygit, etc.)
      styles = {
        notification = {
          -- wo = { wrap = true }
        }
      }
    },
    keys = {
      -- Main fuzzy finder/search keymaps
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>/",  function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>e",  function() Snacks.explorer() end, desc = "File Explorer" },

      -- Git
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "LazyGit (in terminal)" },

      -- Terminal
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },

      -- Zen mode (optional)
      { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },

      -- Quick buffer delete
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },

      -- Notification history
      { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    },
  },

  -- Keep any non-overlapping plugins you use, e.g.:
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "numToStr/Comment.nvim",
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
  -- Remove telescope, nvim-tree, toggleterm, etc!
}
