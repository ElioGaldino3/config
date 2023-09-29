local ls = require("luasnip")
local s = ls.s
local t = ls.t
local i = ls.i

local snippets, auto_snippets = {}, {}

local my_first_snippet = s("myFirstSnippet", {
  t({ "My First Snippet, Hello World!", "" }),
  t("Second, line"),
  i(1, " placeholder text")
})

table.insert(snippets, my_first_snippet)

return snippets, auto_snippets
