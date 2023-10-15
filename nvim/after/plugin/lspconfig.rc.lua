local status, lsp = pcall(require, 'lspconfig')
if (not status) then return end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local contains_in = function(dictionary, target)
  for _, value in pairs(dictionary) do
    if type(value) == "string" and string.find(value, target) then
      return true
    end
  end
  return false
end

local apply_fix_by_label = function(label)
  vim.lsp.buf.code_action({
    filter = function(labelFilter)
      return contains_in(labelFilter, label)
    end,
    apply = true
  })
end

local on_time_attach_dart = true

local on_attach = function(client, _)
  if client.server_capabilities.documentFormattingProvider and not client.name == 'dartls' then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[autogroup END]]
  end
  if (on_time_attach_dart) then
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { '*.dart' },
      callback = function(_)
        vim.lsp.buf.format()
        apply_fix_by_label('Fix All')
      end
    })
    on_time_attach_dart = false
  end
end

lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}
lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascript.jsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

lsp.dartls.setup {
  on_attach = on_attach
}


lsp.html.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lsp.tailwindcss.setup {
  on_attach = on_attach
}

lsp.gopls.setup {
  on_attach = on_attach
}
