return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    opts = {
      keymap = {
        builtin = {
          ["<M-p>"] = "toggle-preview",
          ["<C-d>"] = "preview-down",
          ["<C-u>"] = "preview-up",
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",
    opts = {
      keymap = {
        ["<Tab>"] = { "accept", "fallback" },
      },
    },
  },
}
