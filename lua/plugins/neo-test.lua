return {
  "nvim-neotest/neotest",
  dependencies = { "nvim-neotest/nvim-nio", "nvim-neotest/neotest-jest" },
  opts = function(_, opts)
    opts.adapters["neotest-jest"] = {
      require("neotest-jest")({
        jestcommand = "jest",
      }),
    }
  end,
}
