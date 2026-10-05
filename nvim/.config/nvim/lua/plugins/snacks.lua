local function tmux_select_pane(direction)
  if vim.env.TMUX then
    vim.fn.system({ "tmux", "select-pane", "-" .. direction })
  end
end

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
          -- The explorer's windows are floats inside a sidebar, so `wincmd j/k/h`
          -- (what vim-tmux-navigator uses) jumps to the editor window instead of
          -- falling through to tmux. The sidebar spans the full height and sits on
          -- the left edge, so up/down/left can go straight to the tmux pane.
          actions = {
            tmux_left = function() tmux_select_pane("L") end,
            tmux_down = function() tmux_select_pane("D") end,
            tmux_up = function() tmux_select_pane("U") end,
          },
          win = {
            input = {
              keys = {
                ["<c-h>"] = { "tmux_left", mode = { "i", "n" } },
                ["<c-j>"] = { "tmux_down", mode = { "i", "n" } },
                ["<c-k>"] = { "tmux_up", mode = { "i", "n" } },
                ["<c-l>"] = false,
              },
            },
            list = {
              keys = {
                ["<c-h>"] = "tmux_left",
                ["<c-j>"] = "tmux_down",
                ["<c-k>"] = "tmux_up",
                ["<c-l>"] = false,
              },
            },
          },
        },
      },
    },
  },
}
