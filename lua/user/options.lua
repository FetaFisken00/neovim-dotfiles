-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- Structure: https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/options.lua

local g            = vim.g   -- Global variables
local opt          = vim.opt -- Set options (global/buffer/windows-scoped)
local undodir      = os.getenv("HOME") or os.getenv("UserProfile")

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse          = "a"                         -- Enable mouse support
opt.clipboard      = "unnamedplus"		-- Copy/paste to system clipboard
opt.swapfile       = false                       -- Don't use swapfile
opt.completeopt    = "menuone,noinsert,noselect" -- Autocomplete options
opt.backspace      = "indent,eol,start"

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number         = true -- Show line number
opt.relativenumber = true -- Show numbers relative to the current line
opt.cursorline     = true -- Highlight the current line
opt.showmatch      = true -- Highlight matching parenthesis
opt.colorcolumn    = "80" -- Line lenght marker at 80 columns
opt.splitright     = true -- Vertical split to the right
opt.splitbelow     = true -- Horizontal split to the bottom
opt.ignorecase     = true -- Ignore case letters when search
opt.smartcase      = true -- Ignore lowercase for the whole pattern
opt.linebreak      = true -- Wrap on word boundary
opt.termguicolors  = true -- Enable 24-bit RGB colors
opt.laststatus     = 3    -- Set global statusline
-- opt.signcolumn = "yes"      -- Always show

-----------------------------------------------------------
-- Folding
-- Source |https://www.reddit.com/r/neovim/comments/10q2mjq/i_dont_really_get_folding/j6nmuw8/|
-----------------------------------------------------------
-- opt.fillchars = { fold = " " } -- TODO: write what this does
opt.foldmethod     = "indent" -- Enable folding (default 'foldmarker')
opt.foldenable     = false
opt.foldlevel      = 99

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab      = true -- Use spaces instead of tabs
opt.shiftwidth     = 4    -- Shift 4 spaces when tab
opt.tabstop        = 4    -- 1 tab == 4 spaces
opt.smartindent    = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden         = true  -- Enable background buffers
opt.history        = 10000 -- Remember N lines in history
opt.lazyredraw     = true  -- Faster scrolling
opt.synmaxcol      = 240   -- Max column for syntax highlight
opt.updatetime     = 250   -- ms to wait for trigger an event
opt.undofile       = true  -- Save undo shit in a file
opt.undodir        = undodir .. "/.nvim/undodir"

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro | see: https://neovim.io/doc/user/options.html#'shortmess'
opt.shortmess:append("s")

-- -- Disable builtin plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  -- "netrw",
  -- "netrwPlugin",
  -- "netrwSettings",
  -- "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

-- If windows set clipbard to unamedplus
if vim.loop.os_uname().sysname == "Windows_NT" then
	g.clipboard = xsel
-- If linux set clipbard to xsel
elseif vim.loop.os_uname().sysname == "Linux" then
	g.clipboard = {
		name = "xsel",
		copy = { ["+"] = "xsel --nodetach -i -b", ["*"] = "xsel --nodetach -i -p" },
		paste = { ["+"] = "xsel -o -b", ["*"] = "xsel -o -b" },
		cache_enabled = 1,
	}
end
