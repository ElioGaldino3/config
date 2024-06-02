local ls = require("luasnip")
local snip_loader = require("luasnip.loaders.from_lua")

ls.setup {
  update_events = { "TextChanged", "TextChangedI" },
  enable_autosnippets = true
}

ls.filetype_extend("dart", { "flutter" })

local path = "~/.config/nvim/snippets/"

snip_loader.lazy_load({ paths = path })
