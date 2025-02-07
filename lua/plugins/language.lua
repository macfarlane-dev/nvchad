return {
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

      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml", "yml" },
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" }
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
      local cfg = require("yaml-companion").setup(require "configs.yaml-companion")
      require("lspconfig")["yamlls"].setup(cfg)
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
}
