local status, colorscheme = pcall(require, "onedark")
local status2, transparent = pcall(require, "transparent")

if not status and not status2 then
	print("Colorscheme not found!!!")
	return
end

colorscheme.load()

colorscheme.setup({
	style = "warmer",
	transparent = true,
	term_colors = true,
})

transparent.setup({
	enable = true,
})
