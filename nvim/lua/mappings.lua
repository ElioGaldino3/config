require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', 'caw', 'vaw"_c')
map('n', 'dw', 'vaw"_d')
map('n', '<leader>r', 'A;<esc>')
map('n', '<leader>s', ':%s/')
map('n', '<leader>l', 'g_')
map('n', '<leader>h', '^')
map('n', '<leader>w', ':w<cr>')
map('n', '<leader>q', ':w<cr>:lua require("bufdelete").bufdelete(0)<cr>')
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local nomap = vim.keymap.del

nomap('n', '<leader>wK')
nomap('n', '<leader>wk')
nomap('n', '<leader>fm')
nomap('n', '<C-s>')
nomap('n', '<C-h>')
nomap('n', '<C-l>')
nomap('n', '<C-j>')
nomap('n', '<C-k>')
nomap('n', '<leader>e')
-- nomap('n', '')
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end
map('n', '<leader>e', function()
  require('telescope').extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
