return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          win = {
            input = {
              keys = {
                -- Unbind Ctrl-j in the input window (insert mode)
                ["<c-h>"] = false,
                ["<c-j>"] = false,
                ["<c-k>"] = false,
                ["<c-l>"] = false,
              },
            },
            list = {
              keys = {
                -- Unbind Ctrl-j in the list window (normal mode)
                ["<c-h>"] = false,
                ["<c-j>"] = false,
                ["<c-k>"] = false,
                ["<c-l>"] = false,
              },
            },
          },
        },
      },
    },
  },
}
