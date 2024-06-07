local status, lazy = pcall(require, 'lazy')
if (not status) then
  print("Lazy is not installed")
  return
end

lazy.setup({
  require('plugins.rust_vim'),
  require('plugins.conform'),
  require('plugins.autopairs'),
  require('plugins.tmux_vim'),
  'nvim-tree/nvim-web-devicons',
  'bluz71/vim-moonfly-colors',
  'xiyaowong/transparent.nvim',
  'onsails/lspkind-nvim',
  'echasnovski/mini.nvim',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim
  'hrsh7th/nvim-cmp',     -- completion
  'neovim/nvim-lspconfig',
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  'rcarriga/nvim-notify',
  'saadparwaiz1/cmp_luasnip',
  'nvim-treesitter/nvim-treesitter',
  'windwp/nvim-ts-autotag',
  'kabouzeid/nvim-lspinstall',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'akinsho/bufferline.nvim',
  'norcalli/nvim-colorizer.lua',
  'glepnir/lspsaga.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'lewis6991/gitsigns.nvim',
  'famiu/bufdelete.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    'numtostr/comment.nvim',
    lazy = false,
  },
})
