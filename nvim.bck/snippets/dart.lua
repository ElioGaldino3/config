local ls = require("luasnip")
local i = ls.i
local s = ls.s
local t = ls.t
local fmta = require("luasnip.extras.fmt").fmta
local r = require("luasnip.extras").rep


local snippets, autosnippets   = {}, {}

local sized_box_height         = s('sbh', fmta([[
  const SizedBox(height: <>),
  ]], { i(1) }
))
local sized_box_width          = s('sbw', fmta([[
  const SizedBox(width: <>),
  ]], { i(1) }
))

local modular_module           = s('smod', fmta([[
import 'package:flutter_modular/flutter_modular.dart';

class <>Module extends Module {
  <>
}
]], { i(1), i(2) }))

local screen_sizes             = s('ssize', fmta([[
final size = MediaQuery.of(context).size;
final screenWidth = size.width;
final screenHeigth = size.height;
]], {}))

local column                   = s('coll', fmta([[
Column(
  children: [
    <>,
  ],
)
]], { i(1) }))

local row                      = s('roll', fmta([[
Row(
  children: [
    <>,
  ],
)
]], { i(1) }))

local svg_picture              = s('svga', fmta([[
SvgPicture.asset(
  '<>',
  width: <>,
  height: <>,
),
]], { i(1), i(2), i(2) }))

local main_axis                = s('maxis', fmta([[
mainAxisAlignment: MainAxisAlignment.<>,
]], { i(1) }))

local cross_axis               = s('caxis', fmta([[
crossAxisAlignment: CrossAxisAlignment.<>,
]], { i(1) }))

local text                     = s('tx', fmta([[
Text('<>')
]], { i(1) }))

local text_editting_controller = s('tcont', fmta([[
final TextEditingController _textEditingController<> = TextEditingController();
]], { i(1) }))

local text_form_field          = s('tff', fmta([[
CustomTextFormField(onChanged: (v) =<> <> = v)
]], { t('>'), i(1) }))

local custom_button            = s('cbu', fmta([[
CustomButton(onPressed: <>, child: const Text('<>').defaultFont().white()),
]], { i(''), i(1) }))

local statefull_widget         = s('stf', fmta([[
class <> extends StatefulWidget {
  <>({super.key});

  @override
  State<<<>>> createState() =>> _<>State();
}

class _<>State extends State<<<>>> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child:<>,
    );
  }
}
]], { i(1), r(1), r(1), r(1), r(1), r(1), i(2) }))

local stateless_widget         = s('stl', fmta([[
class <> extends StatelessWidget {
  const <>({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: <>,
    );
  }
}
]], { i(1), r(1), i(2) }))

local disposer                 = s('disp', t('disposer();'))
local child                    = s('chill', { t('child: '), i(1) })
local children                 = s('child', fmta('children: [<>]', { i(1) }))
local child_slash              = s('chs', t('child: '))
local on_pressed               = s('onP', t('onPressed: '))
local function_void            = s('fnv', { t('() {'), i(1), t('}') })
local json_to_object_list      = s('jsl', { t('map((e) => '), i(1), t(').toList();') })
local from_json                = s('fjs', { t('fromJson(e)') })


table.insert(autosnippets, sized_box_height)
table.insert(autosnippets, sized_box_width)
table.insert(autosnippets, modular_module)
table.insert(autosnippets, screen_sizes)
table.insert(autosnippets, child)
table.insert(autosnippets, children)
table.insert(autosnippets, child_slash)
table.insert(autosnippets, on_pressed)
table.insert(autosnippets, function_void)
table.insert(autosnippets, column)
table.insert(autosnippets, row)
table.insert(autosnippets, svg_picture)
table.insert(autosnippets, main_axis)
table.insert(autosnippets, cross_axis)
table.insert(autosnippets, text)
table.insert(autosnippets, text_editting_controller)
table.insert(autosnippets, disposer)
table.insert(autosnippets, text_form_field)
table.insert(autosnippets, custom_button)
table.insert(autosnippets, json_to_object_list)
table.insert(autosnippets, from_json)
table.insert(autosnippets, statefull_widget)
table.insert(autosnippets, stateless_widget)

return snippets, autosnippets
