return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = function()
    -- Auto Cmd
    -- vim.api.nvim_create_autocmd("VimEnter", {
    --   callback = function()
    --     vim.schedule(function()
    --       require("oil").open(vim.fn.getcwd())
    --     end)
    --   end,
    -- })
    return {
      view_options = {
        show_hidden = false,
      },
    }
  end,
}
