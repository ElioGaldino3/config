local map = vim.keymap
vim.g.mapleader = " "

map.set("i", "jk", "<esc>")

map.set("n", "<leader>w", ":w<cr>")
map.set("n", "<leader>q", ":w<cr>:bdelete<cr>")
map.set("n", ";", ":")
map.set("n", "<leader>r", "A;<esc>")

map.set("n", "dw", 'vaw"_d')
map.set("n", "caw", 'vaw"_c')

map.set("n", "<leader>s", ":%s/")
map.set("n", "<esc>", ":nohl<cr>")
