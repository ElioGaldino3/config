local ls = require("luasnip")
local i = ls.i
local s = ls.s
local t = ls.t
local r = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta


local snippets, autosnippets = {}, {}

local relations = s('rell', fmta([[
export const <>Relations = relations(<>, ({ <> }) =<> ({
  <>
}))
]], { i(1), i(2), i(3), t('>'), i(4) }))

local many_to_many = s('mmt', fmta([[
export const <> = pgTable('<>', {
  <>Id: text('<>_id').notNull().references(() =<> <>.id),
  <>Id: text('<>_id').notNull().references(() =<> <>.id)
})
]], { i(1), i(2), i(3), r(3), i('>'), r(3), i(4), r(4), t('>'), r(4) }))

local pg_table = s('tbl', fmta([[
export const <> = pgTable("<>", {
  id: text("id").$defaultFn(() =<> createId()),
  <>
});
]], { i(1), i(2), t('>'), i(3) }))

local current_firebase_user = s('fbu', fmta([[
const firebaseUser = await currentUser()
<>
]], { i(1) }))


table.insert(autosnippets, relations);
table.insert(autosnippets, many_to_many);
table.insert(autosnippets, pg_table);
table.insert(autosnippets, current_firebase_user)

return snippets, autosnippets
