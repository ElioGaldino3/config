return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	lazy = false, -- This plugin is already lazy
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	setup = function()
		vim.g.rustaceanvim = {
			tools = {},
			server = {
				root_dir = "Cargo.toml",
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = function(_, bufnr)
					local opts = { silent = true }
					vim.keymap.set("n", "<leader>.", vim.cmd.RustLsp("debug"), opts)
					vim.keymap.set("n", "<leader>i", function()
						vim.cmd.RustLsp("codeAction")
					end, opts)
					vim.keymap.set("n", "gd", vim.cmd.RustLsp("debug"), opts)
				end,
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
				default_settings = {
					["rust-analyzer"] = {
						allFeatures = true,
						checkOnSave = {
							command = "clippy-driver",
						},
					},
				},
			},
		}
	end,
}
