return {
  'stevearc/conform.nvim',
  config = function()
    require 'conform'.setup {
      format_on_save = {
        timeout_ms = 1500,
        lsp_fallback = true,
      }
    }
  end
}
