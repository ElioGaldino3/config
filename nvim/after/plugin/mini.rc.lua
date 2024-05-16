local status, ai = pcall(require, 'mini.ai')
if not status then return end

ai.setup {n_lines = 500}
require('mini.surround').setup()
