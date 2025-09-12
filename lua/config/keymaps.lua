-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- map esc
vim.keymap.set("i", "jk", "<ESC>", { silent = true })

-- save file
vim.keymap.set("n", "<leader><leader>", "<cmd>w<cr>", { silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>a", "<cmd>wa<cr>", { silent = true, desc = "Save all files" })

vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat<cr>", { silent = true, desc = "CodeCompanionChat" })

-- moving in insert mode
vim.keymap.set("i", "<C-h>", "<Left>", { silent = true, desc = "Move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { silent = true, desc = "Move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { silent = true, desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { silent = true, desc = "Move up" })

-- TSTools
-- vim.keymap.set("n", "<leader>oi", "<cmd>TSToolsOrganizeImports<CR>", { silent = true, desc = "Organize imports" })
-- vim.keymap.set("n", "<leader>cM", "<cmd>TSToolsAddMissingImports<CR>", { silent = true, desc = "Add missing imports" })
-- vim.keymap.set("n", "<leader>cu", "<cmd>TSToolsRemoveUnused<CR>", { silent = true, desc = "Remove unused" })
-- vim.keymap.set(
--   "n",
--   "<leader>fa",
--   "<cmd>TSToolsFixAll<CR>|<cmd>EslintFixAll<CR>",
--   { silent = true, desc = "Fix all ts and eslint" }
-- )
-- vim.keymap.set("n", "gd", "<cmd>TSToolsGoToSourceDefinition<CR>", { silent = true, desc = "Go to source definition" })

-- delete without yank
vim.keymap.set(
  "n",
  "x",
  'x:let @+=@0<CR>:let @"=@0<CR>',
  { noremap = true, silent = true, desc = "Delete char without yank" }
)

local function toggle_file_in_vsplit(file_path, keybinding, description)
  vim.keymap.set("n", keybinding, function()
    local expanded_path = vim.fn.expand(file_path)
    local buf_exists = false
    local target_win = nil
    local target_buf = nil

    -- Check if the file is already open in a window
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.api.nvim_buf_get_name(buf) == expanded_path then
        buf_exists = true
        target_win = win
        target_buf = buf
        break
      end
    end

    if buf_exists and target_win and target_buf then
      -- Close the window
      vim.api.nvim_win_close(target_win, true)
      -- Check if the buffer is still open elsewhere before deleting
      local buf_still_open = false
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == target_buf then
          buf_still_open = true
          break
        end
      end
      -- Delete buffer if it's not open elsewhere
      if not buf_still_open then
        vim.api.nvim_buf_delete(target_buf, { force = true })
      end
    else
      -- Open the file in a vertical split
      vim.cmd("vsplit " .. expanded_path)
    end
  end, { desc = description or ("Toggle " .. file_path) })
end

toggle_file_in_vsplit("~/code/ed1001/dotfiles/vimtips.txt", "<leader>tv", "Toggle Vim tips")
toggle_file_in_vsplit("~/code/ed1001/empowr/packages/db/prisma/schema.prisma", "<leader>ts", "Toggle Prisma schema")
toggle_file_in_vsplit("~/code/ed1001/empowr/.env", "<leader>ted", "Toggle .env")
toggle_file_in_vsplit("~/code/ed1001/empowr/.env.prod", "<leader>tep", "Toggle .env.prod")
toggle_file_in_vsplit("~/code/ed1001/empowr/.env.test", "<leader>tet", "Toggle .env.test")
toggle_file_in_vsplit("~/code/ed1001/notes.txt", "<leader>tn", "Toggle notes")
