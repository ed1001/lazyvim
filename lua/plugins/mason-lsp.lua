return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "emmet-ls",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "emmet_ls" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").emmet_ls.setup({
        filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
      })
    end,
  },
}
