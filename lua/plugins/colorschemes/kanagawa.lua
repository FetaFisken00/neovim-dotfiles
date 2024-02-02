-- local get_color = function(name)
-- 	local color = vim.api.nvim_get_color_by_name(name)
-- 	if color == -1 then
-- 		color = vim.opt.background:get() == "dark" and 000 or 255255255
-- 	end
-- 	local byte = function(value, offset)
-- 		return bit.band(bit.rshift(value, offset), 0xFF)
-- 	end
-- 	return { byte(color, 16), byte(color, 8), byte(color, 0) }
-- end

-- local blend = function(fg, bg, alpha)
-- 	local bg_color = get_color(bg)
-- 	local fg_color = get_color(fg)
-- 	local channel = function(i)
-- 		local ret = (alpha * fg_color[i] + ((1 - alpha) * bg_color[i]))
-- 		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
-- 	end
-- 	return string.format("#%02X%02X%02X", channel(1), channel(2), channel(3))
-- end

local config = function()
	require("kanagawa").setup({
		compile = false,
		undercurl = true,
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false,
		dimInactive = true,
		terminalColors = true,
		colors = {
			palette = {},
			theme = {
				wave = {},
				lotus = {},
				dragon = {},
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
	})
	vim.cmd.colorscheme("kanagawa-wave")
end

return {
	"rebelot/kanagawa.nvim",
	config = config,
	lazy = true,
}
