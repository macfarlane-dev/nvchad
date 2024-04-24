require "nvchad.mappings"

local map = vim.keymap.set

-- alternative entrance to command mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- alternative escape from interactive mode
map("i", "jk", "<ESC>")

-- search
map("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Telescope Find Keymaps" })
map("n", "<leader>f\"", ":Telescope registers<CR>", { desc = "Telescope Find registers" })

-- terminal
map("n", "<leader>tt", ":ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })

-- git
map("n", "<leader>gl", ":Telescope git_commits<CR>", { desc = "Git Log" })

map("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" })
map("n", "<leader>gd", ":Gvdiff<CR>", { desc = "Git Diff" })
map("n", "<leader>gD", ":Gvdiff ", { desc = "Git Diff another branch" })
map("n", "<leader>ga", ":Gwrite<CR>", { desc = "Git Add" })
map("n", "<leader>gR", ":Gread<CR>", { desc = "Git Reset" })
map("n", "<leader>gC", ":Git commit<CR>", { desc = "Git Commit" })

map("n", "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Git Hunk Stage" })
map("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Git Hunk Reset" })
map("n", "<leader>gB", ":Gitsigns toggle_current_line_blame", { desc = "Git toggle line Blame" })
map("n", "<leader>go", ":Gitsigns toggle_signs", { desc = "Toggle On/Off git signs" })
