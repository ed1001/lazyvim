return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.sources, {
      require("null-ls").builtins.code_actions.ts_node_action,
    })
  end,
}
