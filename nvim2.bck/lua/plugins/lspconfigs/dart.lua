local lsp = require("lspconfig")
local utils = require("plugins.utils")

local is_inactive = true

if is_inactive then
	is_inactive = false
	lsp.dartls.setup({
		filetypes = { "dart" },
		init_options = {
			closingLabels = true,
			flutterOutline = true,
			onlyAnalyzeProjectsWithOpenFiles = true,
			outline = true,
			suggestFromUnimportedLibraries = true,
		},
		settings = {
			dart = {
				completeFunctionCalls = true,
				showTodos = true,
			},
		},
	})

	vim.keymap.set("n", "<leader>o", function()
		utils.apply_fix_by_label("Import library 'package:")
	end)
	vim.keymap.set("n", "<leader>t", function()
		utils.apply_fix_by_label("Fix All")
	end)
end
