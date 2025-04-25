return {
  -- Using lazy.nvim
  {
    "metalelf0/black-metal-theme-neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("black-metal").setup({
        -- optional configuration here
        theme = "dark-funeral",
      })
      require("black-metal").load()
    end,
  },
  {
    "soamati/oldworld.nvim",
    lazy = false,
    branch = "maple",
    priority = 1000,
    enabled = true,
    opts = function(_, opts)
      local p = require("oldworld.palette")
      return {
        styles = {},
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oldworld",
    },
  },
}
