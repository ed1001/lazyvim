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
