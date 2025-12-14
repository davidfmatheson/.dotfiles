return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    ui = {
      enable = false,
    },
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault",
      },
    },
  },
}
