local status, _ = pcall(require, 'transparent')
if not status then return end

vim.cmd 'TransparentEnable'
