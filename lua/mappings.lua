require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>sk", ":Telescope keymaps<CR>", { desc = "Search Keymaps" })
map("n", "<leader>s\"", ":Telescope registers<CR>", { desc = "Search Registers" })
map("n", "<leader>ss", ":Telescope live_grep<CR>", { desc = "Search All files" })
map("n", "<leader>sH", ":Telescope help_tags<CR>", { desc = "Search Help documentation" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
