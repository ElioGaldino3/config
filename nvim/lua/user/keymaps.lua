local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)
keymap({ "i", "v", "x" }, "jk", "<Esc>l", opts)
keymap("n", "<leader>r", "A;<esc>", opts)
keymap("n", "<leader>q", ':w<cr>:lua require("bufdelete").bufdelete(0)<cr>', opts)
keymap('n', 'dw', 'vb"_d', opts)
keymap('i', '<F6>', '<esc>la,<space>', opts)
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Telescope
keymap('n', 'ff', ":Telescope find_files<cr>", opts)

keymap('n', 'ft', ":Telescope live_grep<cr>", opts)
keymap('n', 'fd', ":Telescope diagnostics<cr>", opts)


-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

keymap('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>',opts )
keymap('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', opts)

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
keymap("n", "<leader>w", ":w<cr>", opts)

-- window
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', opts)
