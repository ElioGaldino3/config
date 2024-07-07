return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			background_colour = "#0b0c0d",
		})

		vim.notify = require("notify")
	end,
}
