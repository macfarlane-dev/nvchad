return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      dependencies = {"nvim-treesitter/treesitter", "echasnovski/mini.icons"},
      file_types = { "markdown" },
    },
    ft = { "markdown" },
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
