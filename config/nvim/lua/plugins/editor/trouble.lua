return {
  'folke/trouble.nvim',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  init = function() require('core.utils').load_mappings 'trouble' end,
  opts = {},
}
