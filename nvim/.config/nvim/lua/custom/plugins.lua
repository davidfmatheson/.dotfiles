local plugins = {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "nvimtools/none-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>ss",
          node_incremental = "<leader>si",
          scope_incremental = "<leader>sc",
          node_decremental = "<leader>sd",
        },
      },
    },
  },
  {
    "Equilibris/nx.nvim",

    lazy = false,

    dependencies = {
      "nvim-telescope/telescope.nvim",
    },

    config = function()
      require "custom.configs.nx"
    end,
  },
}
return plugins
