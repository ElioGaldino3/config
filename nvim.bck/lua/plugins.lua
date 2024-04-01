local status, lazy = pcall(require, 'lazy')
if (not status) then
  print("Lazy is not installed")
  return
end

lazy.setup({
  'nvim-tree/nvim-web-devicons',
  'shatur/neovim-ayu',
  'bluz71/vim-moonfly-colors',
  'xiyaowong/transparent.nvim',
  --'hoob3rt/lualine.nvim',
  'onsails/lspkind-nvim',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim
  'hrsh7th/nvim-cmp',     -- completion
  'mfussenegger/nvim-dap',
  'neovim/nvim-lspconfig',
  --'TabbyML/vim-tabby',
  --'nvim-tree/nvim-tree.lua',
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  'rcarriga/nvim-notify',
  {
    "L3MON4D3/LuaSnip",
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp"
  },
  'saadparwaiz1/cmp_luasnip',
  'nvim-treesitter/nvim-treesitter',
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  'windwp/nvim-ts-autotag',
  'kabouzeid/nvim-lspinstall',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'akinsho/bufferline.nvim',
  'norcalli/nvim-colorizer.lua',
  'glepnir/lspsaga.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'muniftanjim/prettier.nvim',
  'lewis6991/gitsigns.nvim',
  'famiu/bufdelete.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'exafunction/codeium.vim',
  {
    "folke/flash.nvim",
    keys = {
      {
        "s",
        mode = { "n", "o", "x" },
        function()
          require("flash").jump()
        end,
        desc =
        "flash forward"
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc =
        "remote flash"
      },
      {
        "r",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "treesitter search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "toggle flash search"
      },
    },
  },
  {
    'numtostr/comment.nvim',
    lazy = false,
  },
})
