require "nvchad.options"
HOME_PATH = '/home/' .. vim.fn.expand('$USER')

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
o.relativenumber = true
o.encoding = "utf-8"
o.showmatch = true
o.signcolumn = 'yes'
o.scrolloff = 8
o.backup = false
o.termguicolors = true

o.undodir = HOME_PATH .. "/.config/nvim/.undo"
o.undofile = true
o.undolevels = 100
o.undoreload = 100

vim.cmd [[
set laststatus=0
hi! link StatusLine Normal
hi! link StatusLineNC Normal
set statusline=%{repeat('─',winwidth('.'))}
]]
