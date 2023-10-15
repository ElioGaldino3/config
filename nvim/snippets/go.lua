local ls = require("luasnip")
local s = ls.s
local t = ls.t
local i = ls.i
local fmta = require("luasnip.extras.fmt").fmta

local snippets, auto_snippets = {}, {}

local post_fiber = s('post', fmta([[
	app.Post("/<>", func(c *fiber.Ctx) error {
		return <>
	})
  ]], { i(1), i(2) }
))
local get_fiber = s('post', fmta([[
	app.Get("/<>", func(c *fiber.Ctx) error {
		return <>
	})
  ]], { i(1), i(2) }
))

table.insert(auto_snippets, post_fiber)
table.insert(auto_snippets, get_fiber)
return snippets, auto_snippets
