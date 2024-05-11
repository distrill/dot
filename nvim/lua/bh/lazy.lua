local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'jay-babu/mason-null-ls.nvim',

  -- colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },

  -- fuzzy file search
  {
    'nvim-telescope/telescope.nvim', 
    version = '0.1.4',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },

  'lewis6991/gitsigns.nvim',

  -- quickfix
  {
    'kevinhwang91/nvim-bqf', 
    ft = 'qf',
  },

  -- better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate',
  },

  -- like nerdtree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- undo tree
  'mbbill/undotree',

  -- lsp, auto complete etc
  'neovim/nvim-lspconfig',
  'jose-elias-alvarez/null-ls.nvim',
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    }
  },

  -- toggle comments
  'numToStr/Comment.nvim',

  -- error / diagnostic problems
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },

  -- notifications
  'rcarriga/nvim-notify',

  -- js etc
  'MunifTanjim/prettier.nvim',
  'dmmulroy/tsc.nvim',

  -- golang
  'ray-x/go.nvim',
  'ray-x/guihua.lua',

  -- rust
  'timonv/vim-cargo',
  'p00f/clangd_extensions.nvim',
}, {})
