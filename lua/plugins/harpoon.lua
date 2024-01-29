local M = {
  "theprimeagen/harpoon",
}

function M.config()
  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")
  local map = vim.keymap.set

  map("n", "<leader>a", mark.add_file, { desc = "Add file to Harpoon" })
  map("n", "<leader>e", ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })

  -- map("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Navigate to file in position 1" })
  map("n", "<C-t>", function() ui.nav_file(1) end, { desc = "Navigate to file in position 2" })
  map("n", "<C-n>", function() ui.nav_file(2) end, { desc = "Navigate to file in position 3" })
  map("n", "<C-s>", function() ui.nav_file(3) end, { desc = "Navigate to file in position 4" })
end

return M
