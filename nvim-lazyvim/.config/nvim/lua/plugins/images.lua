return {
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        doc = {
          enabled = true,
          inline = false,
        },
      }
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        relative_to_current_file = true,
        dir_path = "",
      },
    },
    keys = {
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
}
