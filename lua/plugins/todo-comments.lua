local M = {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}

--------------------------------------
-- Keywords
-- TODO:

-- HACK:

-- WARN:
-- WARNING:
-- XXX:

-- PERF:
-- OPTIM:
-- PERFORMANCE:
-- OPTIMIZE:



-- NOTE:
-- THIS:
-- INFO:

-- TEST:
-- TESTING:
-- PASSED:
-- FAILED:

--------------------------------------

function M.config()
  local todo = require('todo-comments')
  todo.setup({
    keywords = {
      PERF = {
        icon = '󰅒',
        color = '#b69cf0',
        alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' },
      },
      HACK = {
        alt = { 'FIRE', 'TRASHCODE', 'SHITCODE' },
        color = '#C70039',
      },
      NOTE = {
        icon = '',
        color = '#8AEA92',
        alt = { 'BOOKMARK', 'THIS', 'INFO' },
      },
    }
  })
end

return M
