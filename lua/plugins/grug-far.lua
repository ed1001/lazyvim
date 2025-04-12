return {
  "MagicDuck/grug-far.nvim",
  opts = { headerMaxWidth = 80 },
  cmd = "GrugFar",
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        grug.toggle_instance({
          instanceName = "far",
          staticTitle = "Find and Replace",
          transient = true,
          prefills = { search = vim.fn.expand("<cword>") },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
    {
      "<leader>sf",
      function()
        local grug = require("grug-far")
        grug.toggle_instance({
          instanceName = "far",
          staticTitle = "Find and Replace",
          transient = true,
          prefills = {
            search = vim.fn.expand("<cword>"),
            paths = vim.fn.expand("%"),
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
  },
}
