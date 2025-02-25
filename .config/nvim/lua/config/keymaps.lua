local map = vim.keymap.set
local dmap = vim.keymap.del
local opts = { noremap = true, silent = true, nowait = true }

local function getOpts(o)
  local merged = {}
  for key, value in pairs(opts) do
    merged[key] = value
  end
  for key, value in pairs(o) do
    merged[key] = value
  end
  return merged
end

-- Remove some default keymaps
dmap("n", "<leader>cd")
dmap("n", "<leader>bd")
dmap("n", "f")
dmap("n", "F")

-- Custom keymaps
map("n", ";", ":", opts)
map("i", "jk", "<esc>", opts)
map("n", "x", '"_x', opts)
map("v", "p", '"_dP', opts)

map("n", "-", ":Oil<cr>", opts)
map("n", "<leader>`", ":NoNeckPain<cr>", opts)

map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

map("n", "<leader>L", vim.diagnostic.open_float, getOpts({ desc = "Line Diagnostics" }))

map("n", "<M-w>", Snacks.bufdelete.delete, getOpts({ desc = "Delete Buffer" }))
map("n", "<leader>bc", ":let @+=@%<cr>", getOpts({ desc = "Copy Buffer path" }))

-- Quickfix

-- Define a function to toggle the quickfix list
local function toggle_quickfix()
  local quickfix_open = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      quickfix_open = true
      break
    end
  end

  if quickfix_open then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end

-- Create the keymap for <leader>qf to toggle the quickfix list
map("n", "<leader>qf", function()
  toggle_quickfix()
end, { noremap = true, silent = true, nowait = true, desc = "Toggle Quickfix list" })

map("n", "<leader>qn", ":cnext<cr>", opts)
map("n", "<leader>qp", ":cprev<cr>", opts)

-- Last buffer
map("n", "<tab>", "<C-6>", { noremap = true, silent = true, nowait = true, desc = "Last visited buffer" })
