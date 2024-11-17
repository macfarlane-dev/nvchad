require "nvchad.mappings"

local map = vim.keymap.set

-- alternative entrance to command mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- WSL specific yank to Windows clipboard
map("v", "<leader>y", ":'<,'>w !clip.exe<CR>", { desc = "Yank from WSL to Windows clipboard" })

-- alternative escape from interactive mode
map("i", "jk", "<ESC>")

-- Navigate to line beginning/end
map("n", "H", "^", { desc = "Navigate to beginning of the line" })
map("n", "L", "$", { desc = "Navigate to end of the line" })

-- An alternative way of saving
map("i", "kjl", "<ESC>:w<CR>", { desc = "Save and exit insert mode" })
map("i", "<C-s>", "<ESC>:w<CR>a", { desc = "Save and say in insert mode" })

-- search
map("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Telescope Find Keymaps" })
map("n", "<leader>f\"", ":Telescope registers<CR>", { desc = "Telescope Find registers" })
map("v", "<M-/>", "yq/p<CR>", { desc = "Search buffer for the selected text" })
map("n", "<M-/>", "viwyq/p<CR>", { desc = "Search buffer for the selected text" })

-- toggle line wrap
map("n", "<leader>w", ":set wrap!<CR>", { desc = "Toggle line Wrap" })

-- git
map("n", "<leader>gl", ":Telescope git_commits<CR>", { desc = "Git commit Log" })
map("v", "<leader>gb", ":Git blame<CR>", {desc = "Git blame line log"})

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
map("n", "<M-t>", ":term<CR>:setlocal nonumber norelativenumber<CR>i",
  { desc = "Open Terminal in buffer", silent = true })
map("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit TERMINAL to NTERMINAL mode" })
map("t", "jk", "<C-\\><C-n>", { desc = "Exit TERMINAL to NTERMINAL mode" })

-- markdown
map("n", "<leader>st", ":RenderMarkdown toggle<CR>", { desc = "Toggle markdown styling" })

-- special characters
map("i", "<S-Tab>", "<C-V><Tab>", { desc = "Literal tab character" })
