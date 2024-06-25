local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local map = vim.keymap
		vim.g.mapleader = " "
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		local fb_actions = require("telescope").extensions.file_browser.actions

		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["q"] = actions.close,
						["<esc>"] = actions.close,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
					},
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["q"] = actions.close,
					},
				},
			},
			extensions = {
				file_browser = {
					theme = "dropdown",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["i"] = {

							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
							["<C-k>"] = function(prompt_bufnr)
								for _ = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-j>"] = function(prompt_bufnr)
								for _ = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
						},
						["n"] = {
							-- your custom normal mode mappings
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-k>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-j>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,

							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
			},
		})

		telescope.load_extension("file_browser")

		map.set("n", "<leader>ff", builtin.find_files)
		map.set("n", "<leader>ft", builtin.live_grep)
		map.set("n", "<leader>b", builtin.buffers)
		map.set("n", "<leader>e", function()
			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = telescope_buffer_dir(),
				respect_gitignore = true,
				hidden = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_config = { height = 70 },
			})
		end)
	end,
}
