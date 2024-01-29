local M = {
  "mbbill/undotree",
}


function M.config()
  vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", {desc = "Toggle undotree", noremap = true})
end

return M
