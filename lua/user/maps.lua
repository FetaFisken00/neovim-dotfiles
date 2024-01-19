-- TODO: add this shit for a well working clipbard
-- https://www.reddit.com/r/neovim/comments/3fricd/easiest_way_to_copy_from_neovim_to_system/ctrru3b/

local map = vim.keymap.set
local command = vim.api.nvim_create_user_command

local opts = { silent = true }
local expr_opts = { silent = true, expr = true }

-- stylua: ignore start
-----------------------------------------------------------
-- Modes
-- 		normal_mode = 'n',
-- 		insert_mode = 'i',
-- 		visual_mode = 'v',
-- 		visual_block_mode = 'x',
-- 		term_mode = 't',
-- 		command_mode = 'c',
-----------------------------------------------------------
--
-- Change leader to a space
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
-- Open file explorer
map({ 'n' }, '<leader>pv', vim.cmd.Ex, { desc = 'open file explorer' })

-- Exiting modes
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'exit insert mode with esc' })

-- Highlighting
map({ 'n' }, '<leader>c', ':nohl<CR>', { desc = 'clear search highlighting' })

-- Splits
map({ 'n', 't' }, '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'move around in split, left' })
map({ 'n', 't' }, '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'move around in split, down' })
map({ 'n', 't' }, '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'move around in split, up' })
map({ 'n', 't' }, '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'move around in split, right' })

-- Config reload
map('n', '<leader>r', ':so %<CR>', { desc = 'Reload configuration without restart nvim' })

-- Move the next line 1 line up without moving cursor position
-- TODO: find alternative keybind for this
-- map('n', 'J', 'mzJ`z', { desc = 'Move the next line 1 line up without moving cursor position' })

-- move selected line / block of text in visual mode
map('v', "K", ":m '<-2<CR>gv=gv", { desc = "move select up" })
map('v', "J", ":m '>+1<CR>gv=gv", { desc = "move select down" })

-- Scrolling with centered cursor
map('n', '<C-d>', '<C-d>zz', { desc = 'Move down in text, keep cursor centered' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Move up in text, keep cursor centered' })
map('n', 'n', 'nzzzv', { desc = 'Go to next occurence, but keep cursor centered for readability' })
map('n', 'N', 'Nzzzv', { desc = 'Go to next occurence, but keep cursor centered for readability' })

-----------------------------------------------------------
-- Neovim toggles
-----------------------------------------------------------

-- Linewrap toggle
map('n', '<M-z>', function()
  local wrap_status = vim.api.nvim_exec('set wrap ?', true)

  if wrap_status == 'nowrap' then
    vim.api.nvim_command('set wrap linebreak')
    print('Wrap enabled')
  else
    vim.api.nvim_command('set wrap nowrap')
    print('Wrap disabled')
  end
end, { desc = 'toggle line wrap', silent = true })


map({ 'n' }, 'x', '"_x')
map({ 'n' }, '<ESC>', ':noh<CR>', opts)

map({ 'n', 'v' }, '<leader>y', '"+y', opts)
map({ 'n', 'v' }, '<leader>Y', '"+yg_', opts)

map({ 'n', 'v' }, '<leader>p', '+p', opts)
map({ 'n', 'v' }, '<leader>P', '+P', opts)


map({ 'n' }, '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>', opts)
map({ 'n' }, '<leader>f', vim.lsp.buf.format, opts)

-- stylua: ignore end
