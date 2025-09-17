local get_root_dir = require("lspconfig.util").root_pattern("nx.json", "package.json", ".git")

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- remove conflict with blink list navigation
    keys[#keys + 1] = { "c-k", false, mode = { "i" } }

    opts.inlay_hints = { enabled = false }

    opts.servers.eslint.root_dir = function(fname)
      return get_root_dir(fname)
    end

    opts.servers.vtsls.settings.typescript = {
      tsserver = {
        maxtsservermemory = 8192,
      },
    }

    opts.servers.vtsls.root_dir = function(fname)
      return get_root_dir(fname)
    end
  end,
}
