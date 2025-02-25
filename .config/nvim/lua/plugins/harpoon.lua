return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      local map = vim.keymap.set

      local harpoon = require("harpoon")
      harpoon:setup({
        -- Defaults
        settings = {
          save_on_toggle = false,
          sync_on_ui_close = false,
          key = function()
            return vim.loop.cwd()
          end,
        },
      })

      local opts = { noremap = true, silent = true, nowait = true }
      map("n", "<C-m>", function()
        harpoon:list():add()
      end)
      map("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      map("n", "<M-1>", function()
        harpoon:list():select(1)
      end, opts)
      map("n", "<M-2>", function()
        harpoon:list():select(2)
      end, opts)
      map("n", "<M-3>", function()
        harpoon:list():select(3)
      end, opts)
      map("n", "<M-h>", function()
        harpoon:list():prev()
      end, opts)
      map("n", "<M-l>", function()
        harpoon:list():next()
      end, opts)
    end,
  },
}
