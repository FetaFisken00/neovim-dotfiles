local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-----------------------------------------------------------
-- General settings
-----------------------------------------------------------
-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = "100" })
	end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "",
	command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "",
	command = "set fo-=c fo-=r fo-=o",
})

autocmd("BufWritePost", {
  -- command = "source %"
  pattern = "bash",
  command = "lua print('hello')"
})

augroup("ColorschemeHighlight", { clear = true })
autocmd("ColorScheme", {
	pattern = "*",
  callback = function()
    bg_color = vim.fn.synIDattr(vim.fn.hlID('Normal'), 'bg', 'gui')
    bg = vim.api.nvim_get_option('background')
    if bg == 'light' then
      vim.cmd [[highlight IndentBlanklineContextStart cterm=NONE gui=NONE guibg=#f0f0f0]]
      vim.cmd [[highlight IndentBlanklineContextChar guifg=#42464e]]
    else
      vim.cmd [[highlight IndentBlanklineContextStart cterm=NONE gui=NONE guibg=#353b45]]
      vim.cmd [[highlight IndentBlanklineContextChar guifg=#42464e]]
    end
  end
})

-----------------------------------------------------------
-- Settings for filetypes:
-----------------------------------------------------------

-- Disable line length marker
augroup("setLineLength", { clear = true })
autocmd("Filetype", {
	group = "setLineLength",
	pattern = { "text", "markdown", "html", "xhtml", "javascript", "typescript" },
	command = "setlocal cc=0",
})

-- Set indentation to 2 spaces
augroup("setIndent", { clear = true })
autocmd("Filetype", {
	group = "setIndent",
	pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua" },
	command = "setlocal shiftwidth=2 tabstop=2",
})

-- Java language server | nvim-jdtls
augroup("jdtls_lsp", { clear = true })
autocmd("FileType", {
	group = "jdtls_lsp",
	pattern = { "java" },
	command = "lua require'plugins.lsp.servers.jdtls'.setup()",
})

-- Terminal settings:
---------------------

-- -- Open a Terminal on the right tab
-- autocmd("CmdlineEnter", {
-- 	command = "command! Term :botright vsplit term://$SHELL",
-- })

-- -- Enter insert mode when switching to terminal
-- autocmd("TermOpen", {
-- 	command = "setlocal listchars= nonumber norelativenumber nocursorline",
-- })

-- -- Attempt to enter isnert mode when switching to terminal | the above version does not work
-- autocmd("BufEnter", {
-- 	pattern = "term://*",
-- 	command = "startinsert",
-- })

-- -- Close terminal buffer on process exit
-- autocmd("BufLeave", {
-- 	pattern = "term://*",
-- 	command = "stopinsert",
-- })

-- autocmd({ "BufWinEnter, WinEnter" }, {
-- 	pattern = "&buftype == 'terminal",
-- 	command = "i",
-- })
