local ayu = {
	"Shatur/neovim-ayu",
	config = function()
		local ayu = require("ayu")

		ayu.setup({
			overrides = {
				Normal = { bg = "None" },
				ColorColumn = { bg = "None" },
				SignColumn = { bg = "None" },
				Folded = { bg = "None" },
				FoldColumn = { bg = "None" },
				CursorLine = { bg = "black" },
				CursorColumn = { bg = "None" },
				WhichKeyFloat = { bg = "None" },
				VertSplit = { bg = "None" },
				LineNrAbove = { fg = "#FFFFFF", bold = true },
				LineNr = { fg = "#fcba03", bold = true },
				LineNrBelow = { fg = "#FFFFFF", bold = true },
			},
		})

		ayu.colorscheme()
	end,
}

local dark_horizon = {
	"akinsho/horizon.nvim",
	opts = {
		overrides = {
			colors = {
				Normal = { bg = "None" },
				ColorColumn = { bg = "None" },
				SignColumn = { bg = "None" },
				Folded = { bg = "None" },
				FoldColumn = { bg = "None" },
				CursorLine = { bg = "black" },
				CursorColumn = { bg = "None" },
				WhichKeyFloat = { bg = "None" },
				VertSplit = { bg = "None" },
				LineNrAbove = { fg = "#FFFFFF", bold = true },
				LineNr = { fg = "#fcba03", bold = true },
				LineNrBelow = { fg = "#FFFFFF", bold = true },
			},
		},
	},
}

return ayu
