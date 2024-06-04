local status, lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_time_attach_dart = true
local on_time_attach_go_pls = true

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

local on_attach = function(client, _)
  if client == nil then return end
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = "*",
    callback = function()
      require('conform').format()
    end
  })
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
    return
  end
  if client.name == "gopls" then
    if on_time_attach_go_pls then
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*.go' },
        callback = function(_)
          vim.lsp.buf.format()
          apply_fix_by_label('Organize Imports')
        end
      })
      on_time_attach_go_pls = false
    end
    return
  end
  if client.name == "dartls" then
    if on_time_attach_dart then
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*.dart' },
        callback = function(_)
          apply_fix_by_label('Fix All')
        end
      })
      on_time_attach_dart = false
    end
    return
  end
end

lsp.eslint.setup {
  on_attach = on_attach
}

lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file("", true),
        },
        checkThirdParty = false
      }
    }
  }
}

lsp.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascript.jsx" },
  cmd = { "typescript-language-server", "--stdio" },
  on_attach = on_attach
}

lsp.dartls.setup {
  on_attach = on_attach
}

lsp.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      },
      cargo = {
        allFeatures = true,
      }
    }
  }
}


lsp.html.setup {
  on_attach = on_attach
}

lsp.tailwindcss.setup {
  on_attach = on_attach
}

lsp.gopls.setup {
  on_attach = on_attach
}

lsp.pylsp.setup {
  on_attach = on_attach
}

lsp.yamlls.setup {
  on_attach = on_attach
}
