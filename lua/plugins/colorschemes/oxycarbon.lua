local C = {
  "nyoom-engineering/oxocarbon.nvim",
}

function C.config()
	require("oxocarbon")
  vim.cmd [[ colorscheme oxocarbon ]]
end

return C
