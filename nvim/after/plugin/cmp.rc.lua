local status, cmp = pcall(require, "cmp")
local status2, luasnip = pcall(require, "luasnip")
if (not status and not status2) then return end
local lspkind = require 'lspkind'

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}


cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          -- completion if a cmp item is selected
          cmp.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })
        elseif vim.fn.exists('b:_codeium_completions') ~= 0 then
          -- accept codeium completion if visible
          vim.fn['codeium#Accept']()
          fallback()
        elseif cmp.visible() then
          -- select first item if visible
          cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
        elseif has_words_before() then
          -- show autocomplete
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
  }),
  sources = {
    { name = "copilot",  max_item_count = 5 },
    { name = "luasnip",  max_item_count = 5 },
    { name = "nvim_lsp", max_item_count = 15 },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "buffer",   max_item_count = 6 },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        copilot = "[Copilot]",
        luasnip = "LuaSnip",
        nvim_lua = "[NVim Lua]",
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect,preview
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
