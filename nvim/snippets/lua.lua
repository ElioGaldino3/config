local ls = require("luasnip")
local s = ls.s
local i = ls.i
local fmta = require("luasnip.extras.fmt").fmta

local snippets, auto_snippets = {}, {}

local line_snippet = s('cln', fmta("local <> = s(<>, fmta('<>', {<>}))", { i(1), i(2), i(3), i(4) }))

table.insert(auto_snippets, line_snippet)

return snippets, auto_snippets
