return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
     require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
        "shellcheck", "shfmt",
--			"prettier",
        "terraform-ls"
  		},
  	},
  },
  {
    "nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  		  "vim", "lua", "vimdoc",
        "json", "yaml", "groovy", "query", "regex", "bash",
        "git_config",
        "terraform"
  		},
  	},
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make || cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      config = function()
        require("telescope").load_extension("fzf")
      end
    },
  },
  {
    "echasnovski/mini.surround",
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete surrounding" },
        { opts.mappings.find, desc = "Find right surrounding" },
        { opts.mappings.find_left, desc = "Find left surrounding" },
        { opts.mappings.highlight, desc = "Highlight surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "https://github.com/preservim/vim-markdown",
    branch = "master",
    dependencies = {
      "https://github.com/godlygeek/tabular"
    },
    ft = "markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.opt.conceallevel = 2
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.filters.custom = {
        "^node_modules$",
        "^.git$",
        "^.github$",
      }
    end,
  },
  {
    "Wansmer/treesj",
    lazy = false,
    keys = {
      { "<leader>lt", ":TSJToggle<CR>", desc = "multi-Line Toggle" },
      { "<leader>lj", ":TSJJoin<CR>", desc = "multi-Line Join" },
      { "<leader>ls", ":TSJSplit<CR>", desc = "multi-Line Split " },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require('treesj').setup()
    end,
  },
}
