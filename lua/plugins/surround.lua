local M = {
  'kylechui/nvim-surround',
  version = '*',
  event = 'VeryLazy',
}

function M.config()
  local wk = require('which-key')
  local surround = require('nvim-surround')

  surround.setup({})
end




return M
