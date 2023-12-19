local M = {}
M.nvterm = {
  terminals = {
  }
}
M.telescope = {
  plugin = true,

  n = {
    ["<leader>nx"] = { "<cmd> Telescope nx actions <CR>", "nx actions" },
  }
}
return M
