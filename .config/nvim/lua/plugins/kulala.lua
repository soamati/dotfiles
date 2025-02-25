return {
  "mistweaverco/kulala.nvim",
  lazy = false,
  opts = function(_, opts)
    vim.filetype.add({
      ["http"] = "http",
    })
    local map_opts = { noremap = true, silent = true, nowait = true }
    local map = vim.keymap.set
    map("n", "<leader>kk", ":lua require('kulala').jump_prev()<cr>", map_opts)
    map("n", "<leader>kj", ":lua require('kulala').jump_next()<cr>", map_opts)
    map("n", "<leader>ks", ":lua require('kulala').run()<cr>", map_opts)
    opts.formatters = { json = { "yq", "." } }
    return opts
  end,
  enabled = false,
}
