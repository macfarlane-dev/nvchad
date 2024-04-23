require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Telescope Find Keymaps" })
map("n", "<leader>f\"", ":Telescope registers<CR>", { desc = "Telescope Find registers" })
map("n", "<c-i>", ":ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
map("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" })
map("n", "<leader>gd", ":Gvdiff<CR>", { desc = "Git Diff" })
map("n", "<leader>gD", ":Gvdiff ", { desc = "Git Diff another branch" })
map("n", "<leader>ga", ":Gwrite<CR>", { desc = "Git Add" })
map("n", "<leader>gR", ":Gread<CR>", { desc = "Git Reset" })
map("n", "<leader>gC", ":Git commit<CR>", { desc = "Git Commit" })
map("n", "<leader>gl", ":Telescope git_commits<CR>", { desc = "Git Log" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
