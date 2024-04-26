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
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.4 }
end, { desc = "Terminal Toggle Vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.4 }
end, { desc = "Terminal New Horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm", float_opts = {
  width = 0.8, height = 0.8, col = 0.1, row = 0.05 }}
end, { desc = "Terminal Toggle Floating term" })

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
