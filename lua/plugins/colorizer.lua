local M = {
  "norcalli/nvim-colorizer.lua",
  event = 'BufReadPre',
}

function M.config()
  local colorizer = require 'colorizer'
  local map = vim.keymap.set

  colorizer.setup({
    '*',
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = true,
      AARRGGBB = false,
      rgb_fn = true,
      hsl_fn = true,
      css = false,
      css_fn = false,
      mode = 'background',
      tailwind = true,
    },
    buftypes = {},
  })

  -- colorizer.attach_to_buffer(0, {})

  map('n', '<leader>tc', '<cmd>ColorizerToggle<cr>', { desc = 'toggle inline colorizer', noremap = true })
end

return M
