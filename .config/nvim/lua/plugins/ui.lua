return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "snacks.nvim",
    opts = {
      indent = {
        scope = { enabled = false },
      },
      scroll = { enabled = false },
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.cmdline = opts.cmdline or {}
      opts.cmdline.format = opts.cmdline.format or {}
      opts.cmdline.format.cmdline = opts.cmdline.format.cmdline or {}
      opts.cmdline.format.cmdline.lang = false
    end,
  },
}
