return {
  "telescope.nvim",
  keys = {
    { "<leader><leader>", false },
    { "<leader>ff", false },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })
      end,
      desc = "Findy Files (root dir)",
    },
  },
}
