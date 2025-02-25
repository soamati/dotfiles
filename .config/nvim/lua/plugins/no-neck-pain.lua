return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  lazy = false,
  priority = 1000,
  opts = {
    width = 140,
    autocmds = { skipEnteringNoNeckPainBuffer = true, enableOnVimEnter = false },
  },
}
