return {
  init = function(self)
    self.mode = vim.fn.mode():sub(1, 1):lower()
    self.mode_color = self.colors[self.mode]
  end,
  update = {
    'ModeChanged',
    pattern = '*:*',
    callback = vim.schedule_wrap(function() vim.cmd 'redrawstatus' end),
  },
  static = {
    names = {
      n = 'N',
      v = 'V',
      s = 'S',
      i = 'I',
      r = 'R',
      c = 'C',
      t = 'T',
    },
    colors = {
      n = 'purple',
      i = 'green',
      v = 'orange',
      s = 'yellow',
      r = 'red',
      c = 'blue',
      t = 'cyan',
    },
  },
  {
    provider = function(self) return ' ' .. self.names[self.mode] .. ' ' end,
    hl = function(self) return { fg = 'bg', bg = self.mode_color } end,
    on_click = {
      callback = function() vim.cmd 'LspInfo' end,
      name = 'mode',
    },
  },
}
