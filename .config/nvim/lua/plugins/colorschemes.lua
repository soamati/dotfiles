return {
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
