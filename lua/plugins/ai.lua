return {
  {
    "yetone/avante.nvim",
    -- expects API keys set up on the shell
    -- export ANTHROPIC_API_KEY=your-api-key    # Claude
    -- export OPENAI_API_KEY=your-api-key       # OpenAI
    -- export AZURE_OPENAI_API_KEY=your-api-key # Azure OpenAI
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = require "configs.avante",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- build = "make",
    build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          dependencies = {"nvim-treesitter/treesitter", "echasnovski/mini.icons"},
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
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
    },
  }
}
