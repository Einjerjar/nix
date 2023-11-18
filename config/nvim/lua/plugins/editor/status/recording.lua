return {
  init = function(self) self.m_recording = vim.fn.reg_recording() end,
  condition = function(_) return vim.fn.reg_recording() ~= '' end,
  {
    provider = function(self) return ' ▶ ' .. self.m_recording .. ' ' end,
    hl = 'TelescopePreviewLine',
  },
}
