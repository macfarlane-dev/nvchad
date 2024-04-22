require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Telescope Find Keymaps" })
map("n", "<leader>f\"", ":Telescope registers<CR>", { desc = "Telescope Find registers" })
map("n", "<c-t>", ":ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
