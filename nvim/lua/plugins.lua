local status, lazy = pcall(require, 'lazy')
if (not status) then
  print("Lazy is not installed")
  return
end

lazy.setup({
  'nvim-tree/nvim-web-devicons',
  'Shatur/neovim-ayu',
  'xiyaowong/transparent.nvim',
  'hoob3rt/lualine.nvim',
  'onsails/lspkind-nvim',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim
  'hrsh7th/nvim-cmp',     -- completion
  'neovim/nvim-lspconfig',
  'L3MON4D3/LuaSnip',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'akinsho/bufferline.nvim',
  'norcalli/nvim-colorizer.lua',
  'glepnir/lspsaga.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
  'lewis6991/gitsigns.nvim',
  'famiu/bufdelete.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'Exafunction/codeium.vim',
  {
    "folke/flash.nvim",
    keys = {
      {
        "s",
        mode = { "n", "o", "x" },
        function()
          require("flash").jump({
            search = { forward = true, wrap = false, multi_window = false },

          })
        end,
        desc =
        "Flash Forward"
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").jump({
            search = { forward = false, wrap = false, multi_window = false },

          })
        end,
        desc =
        "Flash Backward"
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc =
        "Remote Flash"
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
  {
    'numToStr/Comment.nvim',
    lazy = false,
}
})
