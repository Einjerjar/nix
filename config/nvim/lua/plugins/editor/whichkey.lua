return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function() require('core.utils').load_mappings 'whichkey' end,
  opts = {
    triggers_blacklist = {
      n = { '<c-r>' },
    },
  },
}
