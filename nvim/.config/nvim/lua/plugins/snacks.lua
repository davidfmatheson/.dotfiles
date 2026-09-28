return {
  "folke/snacks.nvim",
  opts = {
    lazygit = {
      configure = false,
    },
    picker = {
      win = {
        input = {
          keys = {
            -- Disable default bindings so they don't intercept your tmux keys
            ["<c-j>"] = false,
            ["<c-k>"] = false,
          },
        },
        list = {
          keys = {
            ["<c-j>"] = false,
            ["<c-k>"] = false,
          },
        },
      },
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
