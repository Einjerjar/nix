local c = require 'heirline.conditions'

return {
  init = function(self)
    local pos = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())
    local lines = vim.api.nvim_buf_line_count(vim.api.nvim_get_current_buf())

    self.cur_x = pos[2]
    self.cur_y = pos[1]
    self.scroll = self.cur_y == 1 and 0 or math.floor((self.cur_y / lines) * 100)
  end,
  condition = function(self)
    return not c.buffer_matches {
      filetype = self.filetypes,
    } and vim.api.nvim_buf_get_name(0) ~= ''
  end,
  {
    provider = function(self)
      return '  ' .. self.cur_x .. ' ' .. self.cur_y .. ' 󰹹 ' .. self.scroll .. '%% '
    end,
    hl = 'Normal'
  },
}
