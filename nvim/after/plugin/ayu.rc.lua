local status, ayu = pcall(require, 'ayu')
local status2, transparent = pcall(require, 'transparent')
if (not status or not status2) then
  return
end

ayu.setup({
  mirage = false,   -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
  overrides = {},   -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})

transparent.setup {}

vim.cmd [[colorscheme ayu-dark]]
vim.cmd [[TransparentEnable]]
