local status, ls = pcall(require, "luasnip")
if (not status) then return end

vim.notify("snippets loaded")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
ls.config.setup { store_selection_keys = "<A-p>" }
vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])

ls.config.set_config({
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
        virt_text = { { "●", "GruvboxOrange" } }
      }
    }
  }
})

ls.filetype_extend("dart", { "flutter" })

vim.keymap.set({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')
local cmp = require("cmp")

-- vim.keymap.set({ "i", "s" }, "<C-k>", function()
-- 	if ls.expand_or_jumpable() then
-- 		ls.expand_or_jump()
-- 	end
-- end, { silent = true })
-- vim.keymap.set({ "i", "s" }, "<C-j>", function()
-- 	if ls.jumpable() then
-- 		ls.jump(-1)
-- 	end
-- end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-y>", "<Esc>o", { silent = true })

vim.keymap.set({ "i", "s" }, "<a-k>", function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<a-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<a-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  else
    -- print current time
    local t = os.date("*t")
    local time = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
    print(time)
  end
end)
vim.keymap.set({ "i", "s" }, "<a-h>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end) --}}}

-- More Settings --

vim.keymap.set("n", "<Leader><CR>", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })
vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]])
