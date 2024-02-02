local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  tag = "v0.9.2",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo"},
  build = ":TSUpdate",
  -- opts = function()
  --   return require "plugins.configs.treesitter"
  -- end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "syntax")
    require("nvim-treesitter.configs").setup(opts)
  end,
}

function M.config()
  ensure_installed = {
    "bash",
    -- "css",
    -- "dockerfile",
    -- "go",
    -- "gomod",
    -- "graphql",
    -- "html",
    -- "javascript",
    -- "json",
    "lua",
    -- "python",
    -- "regex",
    -- "rust",
    -- "scss",
    -- "toml",
    -- "tsx",
    -- "typescript",
    -- "yaml",
  }

  highlight = {
    enable = true,
    use_languagetree = true,
  }

  indent = {
    enable = true,
  }
end

return M
