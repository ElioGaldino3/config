local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins/web_devicons"),
	require("plugins/lspconfig"),
	require("plugins/telescope"),
	require("plugins/conform"),
	require("plugins/rust_vim"),
	require("plugins/tmux_vim"),
	require("plugins/colorscheme"),
	require("plugins/cmp"),
	require("plugins/comment"),
	--	require("plugins/lsp_kind"),
	require("plugins/lsp_saga"),
	require("plugins/luasnip"),
	require("plugins/notify"),
	require("plugins/telescope"),
	require("plugins/treesitter"),
	require("plugins/autopairs"),
	-- require("plugins/harpon"),
	require("plugins/mason"),
})
