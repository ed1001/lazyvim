return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  keys = {
    { "<leader><leader>", false },
    { "<leader>ff", false },
    { "gr", false },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })
      end,
      desc = "Find Files (root dir)",
    },
    {
      "gr",
      function()
        print(vim.fn.getcwd())
        print("root")
        require("telescope.builtin").lsp_references({ root = false })
      end,
      desc = "References (telescope)",
      nowait = true,
    },
  },
}
