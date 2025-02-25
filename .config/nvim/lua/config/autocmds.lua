vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<CR>", "<CR>", { noremap = true, silent = true })
  end,
})
