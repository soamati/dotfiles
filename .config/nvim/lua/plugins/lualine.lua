return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      sections = {
        lualine_b = { "diff", "diagnostics" },
        lualine_c = {},
        lualine_z = {},
        lualine_x = {
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#e6b99d" },
          },
        },
      },
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        theme = "auto",
      },
    }
  end,
}
