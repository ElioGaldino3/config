return {
	"neovim/nvim-lspconfig",
	config = function()
		require("plugins/lspconfigs/lua_ls")
		require("plugins/lspconfigs/dart")
		-- require("plugins/lspconfigs/rust_analyzer")
	end,
}
