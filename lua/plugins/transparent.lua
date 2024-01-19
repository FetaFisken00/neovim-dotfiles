local M = {
  'xiyaowong/transparent.nvim',
}

function M.config()
  local transparent = require('transparent')

  transparent.setup({})
end

return M
