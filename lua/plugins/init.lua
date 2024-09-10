return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- For LSP completion we must configure in order
      -- 1. mason
      -- 2. mason-lspconfig.nvim
      -- 3. nvim-lspconfig
      {
        "williamboman/mason.nvim",
      },
      {
        "williamboman/mason-lspconfig.nvim"
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"

      -- automatic lsp completion setup
      -- :h mason-lspconfig-automatic-server-setup
      require("mason").setup()
      require("mason-lspconfig").setup()

      require("mason-lspconfig").setup_handlers {
          -- The first entry (without a key) will be the default handler
          -- and will be called for each installed server that doesn't have
          -- a dedicated handler.
          function (server_name) -- default handler (optional)
              require("lspconfig")[server_name].setup {}
          end,
      }
    end,
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
    "hashivim/vim-terraform",
    ft = {"terraform", "hcl"},
    config = function ()
      vim.g.terraform_fmt_on_save = 1
      vim.g.terraform_align = 1
    end,
  },
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
    "Wansmer/treesj",
    keys = {
      { "<leader>lt", ":TSJToggle<CR>", desc = "multi-Line Toggle" },
      { "<leader>lj", ":TSJJoin<CR>", desc = "multi-Line Join" },
      { "<leader>ls", ":TSJSplit<CR>", desc = "multi-Line Split " },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup(
        require "configs.treesj"
      )
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      dependencies = {"nvim-treesitter/treesitter", "echasnovski/mini.icons"}
    },
    ft = "markdown",
    config = function()
      require('render-markdown').setup({
        debounce = 100,
        render_modes = { 'n', 'c' },
        injections = {
          gitcommit = {
            enabled = true,
            query = [[
              ((message) @injection.content
                (#set! injection.combined)
                (#set! injection.include-children)
                (#set! injection.language "markdown"))
            ]],
          },
        },
      })
    end,
  },
}
