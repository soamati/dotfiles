return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    -- LSP Server Settings
    ---@type lspconfig.options
    servers = {
      vtsls = {
        single_file_support = false,
        cmd = { "vtsls", "--stdio" },
      },
    },
  },
}
