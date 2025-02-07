local options = {
  width = 100,
  mappings = {
    enabled = true,
    toggle = "<Leader>np",
    toggleLeftSide = "<Leader>nql",
    toggleRightSide = "<Leader>nqr",
    widthUp = "<Leader>n=",
    widthDown = "<Leader>n-",
    scratchPad = "<Leader>ns",
  },
  integrations = {
    NvimTree = {
      reopen = true,
    }
  },
  {
    autocmds = {
      enableOnVimEnter = true,
      enableOnTabEnter = true,
    },
  },
  buffers = {
    setNames = true,
    scratchPad = {
      enabled = true,
      location = nil,
    },
    bo = {
      filetype = "md",
    },
    right = {
      enabled = false,
    },
  }
}

return options
