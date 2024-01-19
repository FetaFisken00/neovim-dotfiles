local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- statusupdates for lsp
    -- note 'opts = {}' is the same as calling 'require("fidget").status()'
    'j-hui/fidget.nvim',

    -- idk what this does
    'folke/neodev.nvim',

    --autocompletion
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- adds LSP completion capabilites
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',

    -- adds a number of user firendly snippets
    'rafamadriz/friendly-snippets',
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
  map('K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  map('<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
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

  local cmp = require('cmp')
  local luasnip = require('luasnip')

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




  require('neodev').setup {}

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

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


  require('luasnip.loaders.from_vscode').lazy_load()
  luasnip.config.setup()
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    completion = {
      completeopt = 'menu,menone,noinsert'
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete {},
      ['<C-y>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luansip' },
      { name = 'path' },
    },
  })
end

return M
