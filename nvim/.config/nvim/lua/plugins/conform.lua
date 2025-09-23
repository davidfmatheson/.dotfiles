return {
  {
    "conform.nvim",
    opts = function(_, opts)
      if LazyVim.has_extra("formatting.prettier") then
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        opts.formatters_by_ft.groovy = { "npm-groovy-lint" }
        opts.timeout_ms = 5000
      end
    end,
  },
}
