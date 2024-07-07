local ls = require("luasnip")
local i = ls.i
local s = ls.s
local t = ls.t
local r = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta


local snippets, autosnippets = {}, {}

local bevy_import = s('bvy', t('use bevy::prelude::*;'))

local bevy_component = s('bcomp', fmta([[
#[derive(Component, Debug)]
pub struct <> {
    <>
}
]], { i(1), i(2) }))

local bevy_bundle = s('bbund', fmta([[
#[derive(Bundle)]
pub struct <>Bundle {
    <>
}
]], { i(1), i(2) }))

local bevy_resource = s('bres', fmta([[
#[derive(Resource, Debug, Default)]
pub struct <>Resource {
    <>
}
]], { i(1), i(2) }))

local bevy_delta_time = s('dt', t("time.delta_seconds()"))

local bevy_plugin = s('bpl', fmta([[
pub struct <>Plugin;

impl Plugin for <>Plugin {
  fn build(&self, app: &mut App){
    <>
  }
}
]], { i(1), r(1), i(2) }))

local bevy_query = s('bq', fmta('<>: Query<>', { i(1), i(2) }))
local bevy_time_res = s('btime', t('time: Res<Time>'))

table.insert(autosnippets, bevy_component)
table.insert(autosnippets, bevy_import)
table.insert(autosnippets, bevy_delta_time)
table.insert(autosnippets, bevy_plugin)
table.insert(autosnippets, bevy_bundle)
table.insert(autosnippets, bevy_resource)
table.insert(autosnippets, bevy_query)
table.insert(autosnippets, bevy_time_res)


return snippets, autosnippets
