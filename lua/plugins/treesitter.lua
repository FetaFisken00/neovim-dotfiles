local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ':TSUpdate',
  dependencies = {
    {
      "nvim-treesitter/playground",
      'nvim-treesitter/nvim-treesitter-context',

    }
  },
  lazy_load = true,
}

function M.config()
end

return M
