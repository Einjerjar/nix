local u = require 'heirline.utils'
local c = require 'heirline.conditions'

return {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
    self.file_ro = not vim.bo.modifiable or vim.bo.readonly
  end,
  condition = function(self)
    return not c.buffer_matches {
      filetype = self.filetypes,
    }
  end,
  {
    provider = function(self)
      local f = vim.fn.fnamemodify(self.filename, ':t')
      return (self.file_ro and '  ' or ' ') .. f .. ' '
    end,
  },
}
