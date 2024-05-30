local status, lazy = pcall(require, 'lazy')
if (not status) then
  print("Lazy is not installed")
  return
end

lazy.setup({
  'nvim-tree/nvim-web-devicons',
  'bluz71/vim-moonfly-colors',
  'xiyaowong/transparent.nvim',
  require('plugins.conform'),
  'onsails/lspkind-nvim',
  require('plugins.rust_vim'),
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
  require('plugins.autopairs'),
  'windwp/nvim-ts-autotag',
  'kabouzeid/nvim-lspinstall',
  {
    'nvim-lua/plenary.nvim',
    commit = '08e301982b9a057110ede7a735dd1b5285eb341f'
  },
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
  require('plugins.flash'),
  {
    'numtostr/comment.nvim',
    lazy = false,
  },
})
