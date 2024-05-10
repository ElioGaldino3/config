local ls = require("luasnip")
local i = ls.i
local s = ls.s
local t = ls.t
local r = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta


local snippets, autosnippets = {}, {}

local bevy_component = s('comp', fmta([[
#[derive(Component, Debug)]
pub struct <> {
    <>
}
]], { i(1), i(2) }))

local bevy_delta_time = s('dt', t("time.delta_seconds()"))

local bevy_plugin = s('bpl', fmta([[
struct <>;

pub impl Plugin for <> {
  fn build(app: App){
    <>
  }
}
]], { i(1), r(1), i(2) }))

local bevy_query = s('bq', fmta('query: Query<>', { i(1) }))

table.insert(autosnippets, bevy_component)

return snippets, autosnippets
