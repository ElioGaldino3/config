local o = vim.opt

o.clipboard:prepend({ "unnamed", "unnamedplus" })

vim.wo.number = true
o.relativenumber = true

o.cursorline = true
o.autoindent = true
o.hlsearch = true
o.backup = false
o.timeoutlen = 300
o.undofile = true

o.scrolloff = 8
o.writebackup = false
o.laststatus = 0
o.expandtab = true
o.backupskip = "/tmp/*"

o.ignorecase = true
o.smarttab = true
o.shiftwidth = 2
o.tabstop = 2

o.wildignore:append({ "*/node_modules/*", "*/vendor/*" })

--Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- opt.cursorline = true
o.termguicolors = true

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
	  vim.highlight.on_yank()
	end,
  })
