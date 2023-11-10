return {
  'ray-x/lsp_signature.nvim',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  init = function() require('core.utils').load_mappings 'signature' end,
  opts = {}
}
