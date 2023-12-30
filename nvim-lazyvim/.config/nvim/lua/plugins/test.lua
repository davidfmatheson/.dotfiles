return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npx jest",
          jestConfigFile = function()
            local file = vim.fn.expand("%:p")
            local repoRoot = vim.fn.getcwd()
            if string.find(file, repoRoot .. "/apps/") or string.find(file, repoRoot .. "/libs/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            end

            return repoRoot .. "/jest.config.ts"
          end,
          env = { CI = true },
          cwd = function()
            local file = vim.fn.expand("%:p")
            local repoRoot = vim.fn.getcwd()
            if string.find(file, repoRoot .. "/apps/") or string.find(file, repoRoot .. "/libs/") then
              return string.match(file, "(.-/[^/]+/)src")
            end
            return vim.fn.getcwd()
          end,
        })
      )
    end,
  },
}
