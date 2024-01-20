return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/Projects/vault/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Projects/vault/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Projects/vault",
      },
    },
  },
}
