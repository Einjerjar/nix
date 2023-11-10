return {
	'Exafunction/codeium.vim',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  init = function()
    require('core.utils').load_mappings('codeium')
  end,
}
