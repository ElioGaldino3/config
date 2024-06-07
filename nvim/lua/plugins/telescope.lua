return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'BurntSushi/ripgrep',
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		local map = vim.keymap
		vim.g.mapleader = " "
		local tsb = require'telescope.builtin'

		map.set('n','<leader>ff', tsb.find_files)
		map.set('n','<leader>ft', tsb.live_grep)
		map.set('n','<leader>fb', tsb.buffers)
	end
}
