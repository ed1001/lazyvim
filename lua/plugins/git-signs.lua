return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    -- opts.current_line_blame = true
    opts.current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 300,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    }
    opts.word_diff = true
    local existing_on_attach = opts.on_attach
    opts.on_attach = function(bufnr)
      if existing_on_attach then
        existing_on_attach(bufnr)
      end

      vim.keymap.set(
        "n",
        "<leader>gt",
        "<cmd>Gitsigns toggle_current_line_blame<CR>",
        { buffer = bufnr, desc = "Toggle current line blame" }
      )
    end
  end,
}
