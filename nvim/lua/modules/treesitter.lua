local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "typescript", "dart", "rust", "go" },
    highlight = { enable = true },
    indent = { enable = true },
    autotag = {
      enable = true,
    },
    context_commentstring = {
      enable         = true,
      enable_autocmd = false,
    },
  }
end

return M
