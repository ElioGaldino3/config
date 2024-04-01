local status, null_ls = pcall(require, "null-ls")
if (status) then return end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
  }
}
