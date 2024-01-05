local status, ayu = pcall(require, 'ayu')
local status2, transparent = pcall(require, 'transparent')
if (not status) then
  return
end

ayu.setup({
  mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
  overrides = {
    Type = { fg = "#8e22bd" },
    Function = { fg = "#39dbcb" },
    ["@parameter"] = { fg = "#FFFFFF" },
    ["@type.qualifier"] = { fg = "#c7c7c7" },
    ["@conditional.rust"] = { fg = "#d47b00" },
    ["@keyword.rust"] = { fg = "#ff9503" },
    Statement = { fg = "#c7c7c7" },
    -- change background color
    NormalNC = { bg = "#000000" },
  }, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})

vim.cmd [[colorscheme ayu-dark]]
transparent.setup {}

vim.cmd("TransparentEnable")
