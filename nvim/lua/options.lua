local o = vim.opt

vim.scriptencoding = "utf-8"
o.encoding = "utf-8"

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
o.updatetime = 150
o.writebackup = false
o.cmdheight = 1
o.laststatus = 0
o.expandtab = true
o.shell = "zsh"
o.backupskip = "/tmp/*,/private/tmp/*"
o.inccommand = "split"
o.ignorecase = true
o.smarttab = true
o.shiftwidth = 2
o.tabstop = 2
o.ai = true
o.si = true
o.wrap = false
o.formatoptions:append({ "r" })
o.backspace = "start,eol,indent"
o.path:append({ "**" })
o.wildignore:append({ "*/node_modules/*", "*/vendor/*" })

--Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})
