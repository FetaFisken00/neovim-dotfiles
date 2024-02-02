local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- statusupdates for lsp
    -- note 'opts = {}' is the same as calling 'require("fidget").status()'
    'j-hui/fidget.nvim',

    -- -- idk what this does
    -- 'folke/neodev.nvim',
    --
    -- --autocompletion
    -- 'hrsh7th/nvim-cmp',
    -- 'L3MON4D3/LuaSnip',
    -- 'saadparwaiz1/cmp_luasnip',
    --
    -- -- adds LSP completion capabilites
    -- 'hrsh7th/cmp-nvim-lsp',
    -- 'hrsh7th/cmp-path',
    -- 'hrsh7th/cmp-cmdline',
    -- 'hrsh7th/cmp-buffer',
    --
    -- -- adds a number of user firendly snippets
    -- 'rafamadriz/friendly-snippets',
  },
}

local function on_attach(client, bufnr)
  print("LSP started.", client, bufnr);
  local function map(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
  -- vim.lsp.buf.rename
  map("<F2>", '<cmd>lua vim.lsp.buf.rename()<cr>', 'rename')
  map('K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  map('<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  map('gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  map('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  -- vim.lsp.buf.code_action
  -- vim.lsp.buf.signature_help

  -- lesser used lsp functionalyy
  -- vim.lsp.buf.declaration
  -- vim.lsp.buf.add_workspace_folder
  -- vim.lsp.buf.remove_workspace_folder
  -- list_workspace_folders (as a function)
  -- vim.lsp.buf.list_workspace_folders

  -- now do wk stuff if needed
end

function M.config()
  local mason = require('mason')
  local masonconfig = require('mason-lspconfig')

  -- bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  -- bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  -- bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  -- bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  -- bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
  -- bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
  -- bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
  -- bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
  -- bufmap({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
  -- vim.keymap.map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  -- bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
  -- bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  -- bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

  mason.setup({})
  masonconfig.setup({
    ensure_installed = {

    },
    handlers = {
      function(server_name)
        -- print(server_name)
        require('lspconfig')[server_name].setup {
          on_attach = on_attach,
        }
      end,
    }
  })

end

return M
