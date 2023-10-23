local ls = require("luasnip")
local i = ls.i
local s = ls.s
local fmta = require("luasnip.extras.fmt").fmta


local snippets, autosnippets = {}, {}

local sized_box_height = s('sbh', fmta([[
  const SizedBox(height: <>),
  ]], { i(1) }
))
local sized_box_width = s('sbw', fmta([[
  const SizedBox(width: <>),
  ]], { i(1) }
))

local modular_module = s('smod', fmta([[
import 'package:flutter_modular/flutter_modular.dart';

class <>Module extends Module {
  <>
}
]], { i(1), i(2) }))

local screen_sizes = s('ssize', fmta([[
final size = MediaQuery.of(context).size;
final screenWidth = size.width;
final screenHeigth = size.height;
]], {}))


table.insert(autosnippets, sized_box_height)
table.insert(autosnippets, sized_box_width)
table.insert(autosnippets, modular_module)
table.insert(autosnippets, screen_sizes)

return snippets, autosnippets
