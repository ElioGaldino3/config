local keymap = vim.keymap
local s = { silent = true }
vim.g.mapleader = " "

keymap.set('n', 'x', '"_x', s)
keymap.set('i', 'jk', '<esc>', s)
keymap.set('n', '<leader>r', 'A;<esc>', s)
keymap.set('n', '<leader>w', ':w<cr>', s)
keymap.set('n', '<leader>q', ':w<cr>:lua require("bufdelete").bufdelete(0)<cr>', s)

keymap.set('n', 'gl', ':lua vim.diagnostic.open_float()<CR>')
-- delete backward word
keymap.set('n', 'dw', 'vb"_d')
-- Select all (ctrl+a)
keymap.set('n', 'C-a', 'gg<S-v>G')

-- New taklb
keymap.set('n', 'ts', ':split<cr><C-w>w', s)
keymap.set('n', 'tv', ':vsplit<cr><C-w>w', s)
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-l>', '<C-w>l')

keymap.set('i', '<F6>', '<esc>la,<space>')

keymap.set('n', '<leader>s', ':%s/')
keymap.set('n', '<leader>l', 'g_')
keymap.set('n', '<leader>h', '^')
keymap.set('n', '<leader>i', '%')

keymap.set('n', '<leader>a', '@a')