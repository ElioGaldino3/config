local status, notify = pcall(require, "notify")
if (not status) then return end

notify.setup({
  background_colour = "#0b0c0d",
})

vim.notify = require("notify")
