local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  tag = "v0.9.2",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo"},
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "lua",
    },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = {
      enable = true,
    },
  })
end

return M
