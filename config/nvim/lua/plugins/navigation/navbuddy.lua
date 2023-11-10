return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
    'numToStr/Comment.nvim', -- Optional
    'nvim-telescope/telescope.nvim', -- Optional
  },
  init = function() require('core.utils').load_mappings 'navbuddy' end,
  opts = {
    lsp = {
      auto_attach = true,
    },
  },
}
