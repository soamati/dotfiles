return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find All Files" },
    { "<leader>fo", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
  },
  dependencies = {
    "nvim-telescope/telescope-live-grep-args.nvim",
    -- This will not install any breaking changes.
    -- For major updates, this must be adjusted manually.
    version = "^1.0.0",
  },
  opts = function(_, opts)
    local layout = require("telescope.actions.layout")
    local actions = require("telescope.actions")

    opts.defaults.mappings.i["<M-p>"] = layout.toggle_preview
    opts.defaults.mappings.n["<M-p>"] = layout.toggle_preview
    opts.defaults.mappings.i["<C-f>"] = actions.preview_scrolling_left

    vim.keymap.del("n", "<leader>sw")
    vim.keymap.del("n", "<leader>sW")
    vim.keymap.del("v", "<leader>sw")
    vim.keymap.del("v", "<leader>sW")

    vim.keymap.set(
      "n",
      "<leader>sw",
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      { desc = "Grep with args (cwd)", noremap = true, silent = true, nowait = true }
    )

    opts.defaults.preview = { hide_on_startup = false }
    opts.pickers.find_files.previewer = false

    return opts
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("live_grep_args")
  end,
  enabled = false,
}
