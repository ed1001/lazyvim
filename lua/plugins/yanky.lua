return {
  "gbprod/yanky.nvim",
  keys = {
    {
      "p",
      '<Plug>(YankyPutAfter):let @+=@0<CR>:let @"=@0<CR>',
      mode = { "n", "x", "v" },
      desc = "Put yanked text after cursor",
    },
    {
      "<leader>p",
      function()
        require("telescope").extensions.yank_history.yank_history({})
      end,
      desc = "Open Yank History",
    },
  },
}
