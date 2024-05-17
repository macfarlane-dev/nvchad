require "nvchad.mappings"

local map = vim.keymap.set

-- alternative entrance to command mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- alternative escape from interactive mode
map("i", "jk", "<ESC>")

-- An alternative way of saving
map("i", "kjl", "<ESC>:w<CR>", { desc = "Save and exit insert mode" })
map("i", "<C-s>", "<ESC>:w<CR>a", { desc = "Save and say in insert mode" })

-- search
map("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Telescope Find Keymaps" })
map("n", "<leader>f\"", ":Telescope registers<CR>", { desc = "Telescope Find registers" })

-- git
map("n", "<leader>gl", ":Telescope git_commits<CR>", { desc = "Git Log" })

map("n", "<leader>gs", ":Gedit :<CR>", { desc = "Git Status" })
map("n", "<leader>gd", ":Gvdiff<CR>", { desc = "Git Diff" })
map("n", "<leader>gD", ":Gvdiff ", { desc = "Git Diff another branch" })
map("n", "<leader>ga", ":Gwrite<CR>", { desc = "Git Add" })
map("n", "<leader>gR", ":Gread<CR>", { desc = "Git Reset" })
map("n", "<leader>gC", ":vert Git commit<CR>", { desc = "Git Commit" })

map("n", "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Git Hunk Stage" })
map("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Git Hunk Stage" })
map("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Git Hunk Reset" })
map("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Git toggle line Blame" })
map("n", "<leader>go", ":Gitsigns toggle_signs<CR>", { desc = "Toggle On/Off git signs" })
map("n", "[c", ":Gitsigns prev_hunk<CR>", { desc = "Previous git Change hunk" })
map("n", "]c", ":Gitsigns next_hunk<CR>", { desc = "Next git Change hunk" })

-- telescope
map("n", "<leader>fg", ":Telescope git_files<CR>", { desc = "Telescope Find Git files" })

-- terminals
map("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit TERMINAL to NTERMINAL mode" })
map("t", "jk", "<C-\\><C-n>", { desc = "Exit TERMINAL to NTERMINAL mode" })

-- markdown
map("n", "<leader>sc", ":set conceallevel=2<CR>", { desc = "Style markdown to Conceal" })
map("n", "<leader>sr", ":set conceallevel=0<CR>", { desc = "Style markdown to Reveal" })
