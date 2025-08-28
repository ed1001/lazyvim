-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.ai_cmp = false
vim.g.lazyvim_picker = "telescope"
vim.opt.swapfile = false
vim.g.matchparen_timeout = 2
vim.g.matchparen_insert_timeout = 2
vim.lsp.set_log_level("off")
vim.opt.syntax = "off"
vim.o.foldenable = false
vim.o.spell = false
