return {
  -- Color scheme
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme tokyonight-moon')
    end
  },

  -- setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  'folke/neodev.nvim',

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },

  -- Syntax highlighting based on treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- Quick access buffer list
  'theprimeagen/harpoon',

  -- Undo tree history
  'mbbill/undotree',

  -- Git
  'tpope/vim-fugitive',
  -- Sensible default keybindings
  'tpope/vim-unimpaired',
  -- Surround text objects with quotes, brackets, etc.
  'tpope/vim-surround',
  -- Commenting
  'tpope/vim-commentary',
  -- Repeat plugin commands with .
  'tpope/vim-repeat',

  -- LSP Support
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    'onsails/lspkind.nvim',
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
  },
  -- Linting
  'mfussenegger/nvim-lint',

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
  },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("lualine").setup({
        icons_enabled = true,
        theme = 'dracula',
      })
    end,
  },

  -- Copilot
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      'zbirenbaum/copilot.lua',
    },
  },

  -- Pop up window explaining keybindings, buffers, etc.
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end
  },

  -- File explorer
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
        },
      })
    end
  },

  -- Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
    end
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    },
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
  }

}
