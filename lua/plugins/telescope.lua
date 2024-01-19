local M = {
  "nvim-telescope/telescope.nvim",
  -- tag = '0.1.0',
  dependencies = {
    { "nvim-lua/plenary.nvim" }
  },
  cmd = { "Telescope" , "Tel" },
  keys = { '<leader>p' },
}

function M.config()
  local telescope = require('telescope')
  local builtin = require('telescope.builtin')
  local wk = require('which-key')
  local map = vim.keymap.set


  map('n', '<leader>pk', builtin.keymaps, {desc = 'keymaps'})
  map('n', '<leader>pf', builtin.find_files, {desc = 'find files'})
  map('n', '<leader>pp', builtin.git_files, {desc = 'git files'})
  map('n', '<leader>ph', builtin.help_tags, {desc = 'help tags'})
  map('n', '<leader>pg', builtin.live_grep, {desc = 'live grep'})
  map('n', '<leader>pb', builtin.buffers, {desc = 'buffers'})

  map('n', '<leader>pd', builtin.diagnostics, {desc = 'diagnostics'})
  map('n', '<leader>pt', builtin.treesitter, {desc = 'treesitter'})
  map('n', '<leader>pc', builtin.colorscheme, {desc = 'colorscheme'})
  map('n', '<leader>pm', builtin.builtin, {desc = 'builiin'})

  map('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ")})
  end, {desc = 'grep string'})

  map('n', '<leader>pws', function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word})
  end, {desc = 'grep word'})

  map('n', '<leader>pWs', function()
    local line = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = line})
  end, {desc = 'grep WORD'})

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = builtin.move_selection_next,
          ["<C-k>"] = builtin.move_selection_previous,
          ["<C-c>"] = builtin.close,
        },
      },
    },
    pickers = {
      colorscheme = {
        file_ignore_patterns = {
          "blue",
          "zaibatsu",
          "darkblue",
          "delek",
          "desert",
          "elflord",
          "evening",
          "koehler",
          "morning",
          "murphy",
          "pablo",
          "peachpuff",
          "ron",
          "shine",
          "slate",
          "torte",
          "vim",
          "wildcharm",
          "zellner",
        },
        enable_preview = true,
        preview_cutoff = 0,
        theme = "dropdown",
        initial_mode = "normal",
        -- disable_devicons = true,
        -- layout_strategy = "vertical",
        layout_config = {
          height = 0.6,
          -- width = 0.9,
        },
      },
    },

  })
end

return M
