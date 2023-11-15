return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    {
      "mxsdev/nvim-dap-vscode-js",
      module = { "dap-vscode-js" },
      config = function()
        local dap = require("dap")
        require("dap-vscode-js").setup({
          -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
          debugger_path = "/System/Volumes/Data/Users/edwardphilips/.local/share/nvim/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
          -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
          adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
          -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
          -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
          -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
        })

        for _, language in ipairs({ "typescript", "javascript" }) do
          if not dap.configurations[language] then
            dap.configurations[language] = {
              {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "node_modules/@nestjs/cli/bin/nest.js",
                -- resolveSourceMapLocations = {
                --   "${workspaceFolder}/src/be/dist/**/*.js",
                --   "${workspaceFolder}/src/be/dist/*.js",
                -- },
                sourceMaps = true,
                cwd = "${workspaceFolder}/src/be",
              },
              {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                processId = require("dap.utils").pick_process,
                cwd = "${workspaceFolder}",
              },
            }
          end
        end
      end,
    },
    {
      "microsoft/vscode-js-debug",
      opts = {
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },
    },
  },
}
