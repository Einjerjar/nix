return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  dependencies = {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    require 'plugins.config.lspconfig'  -- initial + lua
    require 'plugins.config.lspconfig2' -- lsps
  end,
}
