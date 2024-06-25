local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
	vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
})
