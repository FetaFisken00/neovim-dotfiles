local C = {
	"rose-pine/neovim",
}

function C.config()
	require("rose-pine").setup({
    name="moonlight",
  })
end

return C
