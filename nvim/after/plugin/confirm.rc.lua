local status, conform = pcall(require, 'conform')

if not status then return end

conform.setup {
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  }
}
