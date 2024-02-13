-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Color scheme
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  }

  -- Syntax highlighting based on treesitter
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }

  -- Manage buffer list
  use { 'theprimeagen/harpoon' }

  -- Undo tree history
  use { 'mbbill/undotree' }

  -- Git
  use { 'tpope/vim-fugitive' }
  -- Sensible default keybindings
  use { 'tpope/vim-unimpaired' }
  -- Surround text objects with quotes, brackets, etc.
  use { 'tpope/vim-surround' }
  -- Commenting
  use { 'tpope/vim-commentary' }
  -- Repeat plugin commands with .
  use { 'tpope/vim-repeat' }

  -- LSP, linting, formatting, autocompletion, and snippets
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- Copilot
  use { 'github/copilot.vim' }

  -- File explorer
  -- Learn netrw
  --
  -- -- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end
  }

end)
