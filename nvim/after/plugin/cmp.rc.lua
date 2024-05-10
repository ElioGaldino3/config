local status, cmp = pcall(require, "cmp")
local status2, luasnip = pcall(require, "luasnip")
if (not status and not status2) then return end
local lspkind = require 'lspkind'

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

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

local function check_backspace()
  local col = vim.fn.col '.' - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

local function T(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end


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
    ['<Tab>'] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(T '<C-n>', 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(T '<Plug>luasnip-expand-or-jump', '')
      elseif check_backspace() then
        vim.fn.feedkeys(T '<Tab>', 'n')
      else
        vim.fn.feedkeys(T '<C-Space>')       -- Manual trigger
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(T '<C-p>', 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(T '<Plug>luasnip-jump-prev', '')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
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
