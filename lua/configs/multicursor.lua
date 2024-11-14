local M = {}

M.setup = function()
  local mc = require("multicursor-nvim")

  mc.setup()

  local map = vim.keymap.set

  -- This will be overwritten by NvChad mappings unless it is loaded after
  -- by lazy-loading on `event = "VeryLazy"`
  map("n", "<esc>", function()
      if not mc.cursorsEnabled() then
          mc.enableCursors()
      elseif mc.hasCursors() then
          mc.clearCursors()
      else
          vim.cmd("noh") -- Default <esc> handler.
      end
  end, { desc = "Clear multiple cursors or highlights" })

  -- Add or skip cursor above/below the main cursor.
  map({"n", "v"}, "<up>", function() mc.lineAddCursor(-1) end, { desc = "Add a multicursor and move up" })
  map({"n", "v"}, "<down>", function() mc.lineAddCursor(1) end, { desc = "Add a multicursor and move down" })
  map({"n", "v"}, "<leader><up>", function() mc.lineSkipCursor(-1) end, { desc = "Skip the current line and add a multicursor above" })
  map({"n", "v"}, "<leader><down>", function() mc.lineSkipCursor(1) end, { desc = "Skip the current line and add a multicursor below" })

  -- Add or skip adding a new cursor by matching word/selection
  map({"n", "v"}, "<leader>n", function() mc.matchAddCursor(1) end, { desc = "Add a multicursor and move to the next word" })
  map({"n", "v"}, "<leader>s", function() mc.matchSkipCursor(1) end, { desc = "Skip this multicursor and move to the next word" })
  map({"n", "v"}, "<leader>N", function() mc.matchAddCursor(-1) end, { desc = "Add a multicursor and move to the previous word" })
  map({"n", "v"}, "<leader>S", function() mc.matchSkipCursor(-1) end, { desc = "Skip this multicursor and move to the previous word" })

  -- Add all matches in the document
  map({"n", "v"}, "<leader>A", mc.matchAllAddCursors, { desc = "Add a multicursor to all occurrences of the current word" })

  -- You can also add cursors with any motion you prefer:
  -- map("n", "<right>", function()
  --     mc.addCursor("w")
  -- end)
  -- map("n", "<leader><right>", function()
  --     mc.skipCursor("w")
  -- end)

  -- Rotate the main cursor.
  map({"n", "v"}, "<left>", mc.prevCursor, { desc = "Rotate the main cursor up multicuror lines" })
  map({"n", "v"}, "<right>", mc.nextCursor, { desc = "Rotate the main cursor down multicuror lines" })

  -- Delete the main cursor.
  map({"n", "v"}, "<leader>c", mc.deleteCursor, { desc = "Clear the main cursor" })

  -- Add and remove cursors with control + left click.
  map("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add a Multicursor" })

  -- Easy way to add and remove cursors using the main cursor.
  map({"n", "v"}, "<c-m>", mc.toggleCursor, { desc = "Add a Multicursor" })

  -- Clone every cursor and disable the originals.
  map({"n", "v"}, "<leader><c-m>", mc.duplicateCursors, { desc = "Clone ever cursor and disable originals" })

  -- bring back cursors if you accidentally clear them
  map("n", "<leader>gv", mc.restoreCursors, { desc = "Restore cleared cursors" })

  -- Align cursor columns.
  map("n", "<leader>a", mc.alignCursors, { desc = "Align cursor columns" })

  -- Split visual selections by regex.
  map("v", "S", mc.splitCursors, { desc = "Split visual selection by regex" })

  -- Append/insert for each line of visual selections.
  map("v", "I", mc.insertVisual, { desc = "Insert for each line of a visual selection" })
  map("v", "A", mc.appendVisual, { desc = "Append for each line of a visual selection" })

  -- match new cursors within visual selections by regex.
  map("v", "M", mc.matchCursors, { desc = "" })

  -- Rotate visual selection contents.
  map("v", "<leader>t",
      function() mc.transposeCursors(1) end, { desc = "Rotate visual selection" })
  map("v", "<leader>T",
      function() mc.transposeCursors(-1) end, { desc = "Rotate visual selection in reverse" })

  -- Jumplist support
  map({"v", "n"}, "<c-i>", mc.jumpForward, { desc = "Multicursor jump forward" })
  map({"v", "n"}, "<c-o>", mc.jumpBackward, { desc = "Multicursor jump backward" })

  -- Customize how cursors look.
  local hl = vim.api.nvim_set_hl
  hl(0, "MultiCursorCursor", { link = "Cursor" })
  hl(0, "MultiCursorVisual", { link = "Visual" })
  hl(0, "MultiCursorSign", { link = "SignColumn"})
  hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
  hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
  hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
end

return M
