local u = require 'plugins.utils.themes'

local group = vim.api.nvim_create_augroup('SLMode', { clear = true })

local updateColors = function()
  u.hi(0, 'SLNormal', { fg = 'bg', bg = u.fm(u.find('@function').fg)})
  u.hi(0, 'SLInsert', { fg = 'bg', bg = u.fm(u.find('@string').fg)})
  u.hi(0, 'SLVisual', { fg = 'bg', bg = u.fm(u.find('@label').fg)})
  u.hi(0, 'SLReplace', { fg = 'bg', bg = u.fm(u.find('@number').fg)})
  u.hi(0, 'SLTerm', { fg = 'bg', bg = u.fm(u.find('@field').fg)})
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'UpdateColors',
  callback = updateColors,
  group = group,
})

local static = {
  names = {
    n = 'N',
    v = 'V',
    ['\22'] = 'V',
    s = 'S',
    i = 'I',
    r = 'R',
    c = 'C',
    t = 'T',
  },
  colors = {
    N = 'SLNormal',
    I = 'SLInsert',
    V = 'SLVisual',
    S = 'SLSelect',
    R = 'SLReplace',
    C = 'SLCommand',
    T = 'SLTerm',
  },
}

updateColors()
return {
  init = function(self)
    self.mode = vim.fn.mode():sub(1, 1):lower()
    self.mode_name = static.names[self.mode]
    self.mode_color = static.colors[self.mode_name]
  end,
  update = {
    'ModeChanged',
    pattern = '*:*',
    callback = vim.schedule_wrap(function() vim.cmd 'redrawstatus' end),
  },
  {
    provider = function(self) return ' ' .. (self.mode_name or self.mode .. '?') .. ' ' end,
    hl = function(self) return self.mode_color end,
    on_click = {
      callback = function() vim.cmd 'LspInfo' end,
      name = 'mode',
    },
  },
}
