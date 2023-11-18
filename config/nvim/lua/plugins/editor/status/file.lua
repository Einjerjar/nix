local ic = require('nvim-web-devicons')
local c = require 'heirline.conditions'

return {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
    self.file_ro = not vim.bo.modifiable or vim.bo.readonly
  end,
  condition = function(self)
    return not c.buffer_matches {
      filetype = self.filetypes,
    } and vim.api.nvim_buf_get_name(0) ~= ''
  end,
  {
    provider = function(self)
      local f = vim.fn.fnamemodify(self.filename, ':t')
      local i = ic.get_icon_by_filetype(vim.bo.filetype)
      return (self.file_ro and '  ' or ' ') .. (i ~=nil and i .. ' ' or '') .. f .. ' '
    end,
    hl = 'TelescopePreviewLine'
  },
}
