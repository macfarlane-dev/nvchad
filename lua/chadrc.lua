-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "nightowl",
  theme_toggle = { "nightowl", "github_dark" },

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "default",
    order = nil,
    modules = nil,
  },
}

M.nvdash = {
  load_on_startup = true
}

M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.4, vsp = 0.4, ["bo sp"] = 0.4, ["bo vsp"] = 0.4 },
  float = {
    relative = "editor",
    row = 0.05,
    col = 0.1,
    width = 0.8,
    height = 0.8,
    border = "single",
  },
}

M.mason = {
  cmd = true,
  pkgs = {
    "lua-language-server",
    "stylua",
    "shellcheck",
    "shfmt",
    "prettier",
    "terraform-ls",
    "pyright",
    "yaml-language-server"
  },
}

return M
