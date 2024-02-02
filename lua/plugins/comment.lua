local M = {
  'numToStr/Comment.nvim',
  lazy = true,
  event = 'BufReadPost',
}

function M.config()
  local comment = require('Comment')

  comment.setup({})
end

return M
