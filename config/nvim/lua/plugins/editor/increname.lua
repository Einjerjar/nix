return {
  'smjonas/inc-rename.nvim',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  init = function() require('core.utils').load_mappings 'increname' end,
  opts = {
    input_buffer_type = 'dressing',
  },
}
