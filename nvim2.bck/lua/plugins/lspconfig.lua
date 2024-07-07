return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp'
  },
  config = function()
    require("plugins/lspconfigs/lua_ls")
    require("plugins/lspconfigs/dart")
    require("plugins/lspconfigs/python")
    require("plugins/lspconfigs/rust_analyzer")
    require("plugins/lspconfigs/zig")
  end,
}
