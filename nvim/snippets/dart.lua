local ls = require("luasnip")
local s = ls.s
local t = ls.t


local snippets, autosnippets = {}, {}

local my_first_snippet = s("myFirst", { t("Ola, esse e meu primeiro snippet") })

table.insert(snippets, my_first_snippet)

return snippets, autosnippets
