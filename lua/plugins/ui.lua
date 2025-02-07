return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.filters = {
        custom = {
          "^node_modules$",
          "^.git$",
          "^.github$",
        },
        dotfiles = false,
      }
    end,
  },
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    lazy = false,
    opts = require "configs.no-neck-pain",
  }
}
