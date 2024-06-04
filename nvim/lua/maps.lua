local keymap = vim.keymap
local s = { silent = true }
vim.g.mapleader = " "

keymap.set('n', 'x', '"_x', s)
keymap.set('i', 'jk', '<esc>', s)
keymap.set('n', '<leader>r', 'A;<esc>', s)
keymap.set('n', '<leader>w', ':w<cr>', s)
keymap.set('n', '<leader>q', ':w<cr>:lua require("bufdelete").bufdelete(0)<cr>', s)

-- delete backward word
keymap.set('n', 'dw', 'vaw"_d')
keymap.set('n', 'caw', 'vaw"_c')
-- Select all (ctrl+a)
keymap.set('n', 'C-a', 'gg<S-v>G')

-- New taklb
keymap.set('n', 'ts', ':split<cr><C-w>w', s)
keymap.set('n', 'tv', ':vsplit<cr><C-w>w', s)
-- Move window

keymap.set('i', '<F6>', '<esc>la,<space>')

keymap.set('n', '<leader>s', ':%s/')
keymap.set('n', '<leader>l', 'g_')
keymap.set('n', '<leader>h', '^')
keymap.set('n', '<leader>j', '%')

keymap.set('n', '<leader>a', '@a')
