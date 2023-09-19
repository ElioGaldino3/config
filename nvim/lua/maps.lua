local keymap = vim.keymap
local s = { silent = true }
vim.g.mapleader = " "

keymap.set('n', 'x', '"_x', s)
keymap.set('i', 'jk', '<esc>', s)
keymap.set('n', '<leader>w', ':w<cr>', s)
keymap.set('n', '<leader>q', ':w<cr>:lua require("bufdelete").bufdelete(0)<cr>', s)

-- delete backward word
keymap.set('n', 'dw', 'vb"_d')
-- Select all (ctrl+a)
keymap.set('n', 'C-a', 'gg<S-v>G')

-- New taklb
keymap.set('n', 'te', ':tabedit<cr>', s)
keymap.set('n', 'ts', ':split<cr><C-w>w', s)
keymap.set('n', 'tv', ':vsplit<cr><C-w>w', s)
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-l>', '<C-w>l')
