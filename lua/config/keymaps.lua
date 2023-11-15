-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- map esc
vim.keymap.set("i", "jk", "<ESC>", { silent = true })

-- save file
vim.keymap.set("n", "<leader><leader>", "<cmd>w<cr>", { silent = true, desc = "Save file" })

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

-- harpoon
vim.keymap.set("n", "<leader>h", function()
  require("harpoon.ui").toggle_quick_menu()
end, { silent = true, desc = "Open Harpoon" })

vim.keymap.set("n", "<leader>hh", function()
  require("harpoon.mark").add_file()
end, { silent = true, desc = "Add file to Harpoon" })

vim.keymap.set("n", "<leader>hf", function()
  require("harpoon.ui").nav_next()
end, { silent = true, desc = "Nav next Harpoon" })

-- nav buddy
vim.keymap.set("n", "<leader>n", function()
  require("nvim-navbuddy").open()
end, { silent = true, desc = "Open Nav Buddy" })

-- dap
vim.keymap.set("n", "<leader>df", function()
  require("dapui").float_element("scopes")
end, { silent = true, desc = "Open scopes" })

vim.keymap.set("n", "<leader>dx", function()
  require("dap").clear_breakpoints()
end, { silent = true, desc = "Clear Breakpoints" })

-- git
vim.keymap.set("n", "<leader>gb", function()
  vim.cmd("Git blame")
end, { silent = true, desc = "Git blame" })
