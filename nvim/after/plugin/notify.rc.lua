local status, notify = pcall(require, "notify")
if (not status) then return end

notify.setup {
  BackgroundColor = "#000000"
}
vim.notify = require("notify")
