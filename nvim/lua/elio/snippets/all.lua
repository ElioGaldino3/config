local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local t = ls.text_node
local sn = ls.snippet_node
local i = ls.insert_node

local snake_to_pascal_case = function(texto)
	local palavras = {}

	-- Separa as palavras do texto em snake case
	for palavra in string.gmatch(texto, "[^_]+") do
		table.insert(palavras, palavra)
	end

	-- Converte a primeira letra de cada palavra para maiúscula
	for i = 1, #palavras do
		palavras[i] = string.upper(string.sub(palavras[i], 1, 1)) .. string.sub(palavras[i], 2)
	end

	-- Concatena as palavras em pascal case
	return table.concat(palavras)
end

local snippets = {
	s(
		"aclass",
		sn(1, {
			t({ "abstract class " }),
			f(function()
				return snake_to_pascal_case(string.gsub(vim.fn.expand("%:p:t"), ".dart", "")) .. " {"
			end),
			t({ "", "  " }),
			i(1),
			t({ "", "}" }),
		})
	),
	s(
		"iclass",
		sn(1, {
			t({ "class " }),
			f(function()
				local fileWithoutExtension = string.gsub(vim.fn.expand("%:p:t"), ".dart", "")
				return snake_to_pascal_case(fileWithoutExtension)
					.. " implements "
					.. snake_to_pascal_case(string.gsub(fileWithoutExtension, "_impl", ""))
					.. " {"
			end),
			t({ "", "" }),
			t({ "", "}" }),
		})
	),
	s(
		"sbh",
		sn(1, {
			t({ "const SizedBox(height: " }),
			i(1, "8"),
			t({ ")," }),
		})
	),
	s(
		"sbw",
		sn(1, {
			t({ "const SizedBox(width: " }),
			i(1, "8"),
			t({ ")," }),
		})
	),
}

return snippets
