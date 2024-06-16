return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local ts = require("nvim-treesitter.configs")
		ts.setup({
			highlight = {
				enable = true,
				disable = {},
			},
			indent = {
				enable = true,
				disable = { "dart", "flutter" },
			},
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"tsx",
				"typescript",
				"toml",
				"json",
				"yaml",
				"css",
				"html",
				"lua",
				"dart",
				"rust",
				"go",
				"sql",
			},
			autotag = {
				enable = true,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
	end,
}
