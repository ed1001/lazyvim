-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- map esc
vim.keymap.set("i", "jk", "<ESC>", { silent = true })

-- save file
vim.keymap.set("n", "<leader><leader>", "<cmd>w<cr>", { silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>a", "<cmd>wa<cr>", { silent = true, desc = "Save all files" })

-- moving in insert mode
vim.keymap.set("i", "<C-h>", "<Left>", { silent = true, desc = "Move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { silent = true, desc = "Move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { silent = true, desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { silent = true, desc = "Move up" })

-- delete without yank
vim.keymap.set(
  "n",
  "x",
  'x:let @+=@0<CR>:let @"=@0<CR>',
  { noremap = true, silent = true, desc = "Delete char without yank" }
)

vim.keymap.set("n", "<leader>t", function()
  local file_path = vim.fn.expand("~/code/ed1001/dotfiles/vimtips.txt")
  local buf_exists = false
  local target_win = nil

  -- Check if the file is already open in a window
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_name(buf) == file_path then
      buf_exists = true
      target_win = win
      break
    end
  end

  if buf_exists and target_win then
    -- If the file is already open, close the window
    vim.api.nvim_win_close(target_win, true)
  else
    -- Otherwise, open it in a vertical split
    vim.cmd("vsplit " .. file_path)
  end
end, { desc = "Toggle vim tips in a vertical split" })
