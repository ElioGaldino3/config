return {
	"glepnir/lspsaga.nvim",
	config = function()
		local saga = require("lspsaga")
		saga.setup({
			ui = {
				border = "rounded",
			},
			symbol_in_winbar = {
				enable = false,
			},
			lightbulb = {

				enable = false,
			},
			outline = {
				layout = "float",
			},
			code_action = {
				num_shortcut = true,
				keys = {
					quit = "q",
					exec = "<CR>",
				},
			},
		})

		local opts = { noremap = true, silent = true }
		vim.g.mapleader = " "

		vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
		vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
		vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
		vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
		vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)

		-- code action
		vim.keymap.set({ "n", "v" }, "<leader>i", "<cmd>Lspsaga code_action<CR>", opts)
	end,
}
