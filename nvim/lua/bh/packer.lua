-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'jay-babu/mason-null-ls.nvim'

  -- colorscheme
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }

  -- fuzzy file search
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'lewis6991/gitsigns.nvim'
  }

  -- quickfix
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

  -- better syntax highlighting
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  -- like nerdtree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  -- undo tree
  use('mbbill/undotree')

  -- lsp, auto complete etc
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- toggle comments
  use('numToStr/Comment.nvim')

  -- error / diagnostic problems
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  -- notifications
  use 'rcarriga/nvim-notify'

  -- js etc
  use('MunifTanjim/prettier.nvim')
  use('dmmulroy/tsc.nvim')

  -- golang
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommanded if need floating window support

  -- rust
  use('timonv/vim-cargo')
  use('p00f/clangd_extensions.nvim')
end)
