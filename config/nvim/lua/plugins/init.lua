return {
  { 'nvim-lua/plenary.nvim', lazy = false },

  -- lsp
  {
    'b0o/schemastore.nvim',
    'hrsh7th/nvim-cmp',
    dependencies = {
      'SmiteshP/nvim-navbuddy',
      'L3MON4D3/LuaSnip',
      'windwp/nvim-autopairs',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'folke/neodev.nvim',
      'folke/neoconf.nvim',
    },
  },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- ai
  'Exafunction/codeium.vim',

  -- editor
  'norcalli/nvim-colorizer.lua',
  'cpea2506/relative-toggle.nvim',
  'cshuaimin/ssr.nvim',
  'numToStr/Comment.nvim',
  'wakatime/vim-wakatime',

  -- navigation
  'folke/flash.nvim',
  'christoomey/vim-tmux-navigator',

  -- sessions
  'Pocco81/auto-save.nvim',
  'rmagatti/auto-session',

  -- ui
  'folke/todo-comments.nvim',
  'nvim-zh/colorful-winsep.nvim',
  'nvim-tree/nvim-web-devicons',
  'stevearc/dressing.nvim',
  'lukas-reineke/indent-blankline.nvim',

  -- git
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',

  -- idk 1
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-refactor',
    },
  },
  'nvim-telescope/telescope.nvim',

  -- tools
  'nvim-tree/nvim-tree.lua',
  'folke/which-key.nvim',
}
