return {
  'luukvbaal/statuscol.nvim',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  init = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:󰅀,foldsep: ,foldclose:󰅂]]
  end,
  config = function()
    local builtin = require 'statuscol.builtin'
    require('statuscol').setup {
      -- configuration goes here, for example:
      relculright = true,
      segments = {
        { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
        { text = { '%s' }, click = 'v:lua.ScSa' },
        { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
      },
    }
  end,
}
