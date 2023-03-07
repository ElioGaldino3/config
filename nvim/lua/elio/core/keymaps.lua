vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":BufferClose<CR>")

-- windows
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")

keymap.set("n", "<TAB>", ":BufferNext<CR>")
keymap.set("n", "<S-TAB>", ":BufferPrevious<CR>")

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- surround

keymap.set("n", '<leader>"', 'ysiw"')
keymap.set("n", "<leader>'", "ysiw'")

-- nvim tree

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
-- keymap.set(
-- 	"n",
-- 	"<leader>e",
-- 	'<cmd>lua require("telescope").extensions.file_browser.file_browser({path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = {height = 40}})<cr>'
-- )
