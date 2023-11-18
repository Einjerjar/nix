local u = require 'plugins.utils.themes'
local c = require 'heirline.conditions'

local icons = {
  error = '  ',
  warn = '  ',
  hint = '  ',
  info = '  ',
}

local sev = vim.diagnostic.severity
local count_diag = function(s) return #vim.diagnostic.get(0, { severity = s }) end

local diag_col_from_hl = function(h, name)
  local col = u.find(h)
  local fg = col.fg or u.find('Normal').fg
  local bg = u.shift(fg, -90)

  u.hi(0, name, { fg = fg, bg = bg })
end

local updateColors = function()
  diag_col_from_hl('@keyword.return', 'SLDerror')
  diag_col_from_hl('@field', 'SLDwarn')
  diag_col_from_hl('@label', 'SLDhint')
  diag_col_from_hl('@function', 'SLDinfo')
end

local group = vim.api.nvim_create_augroup('SLDiag', { clear = true })

vim.api.nvim_create_autocmd('User', {
  pattern = 'UpdateColors',
  callback = updateColors,
  group = group,
})

updateColors()

return {
  init = function(self)
    self.lsp_error = count_diag(sev.ERROR)
    self.lsp_warn = count_diag(sev.WARN)
    self.lsp_hint = count_diag(sev.HINT)
    self.lsp_info = count_diag(sev.INFO)
  end,
  condition = c.has_diagnostics,
  update = { 'DiagnosticChanged', 'BufEnter' },
  {
    condition = function(self) return self.lsp_error > 0 end,
    provider = function(self) return icons.error .. self.lsp_error .. ' ' end,
    hl = 'SLDerror',
  },
  {
    condition = function(self) return self.lsp_warn > 0 end,
    provider = function(self) return icons.warn .. self.lsp_warn .. ' ' end,
    hl = 'SLDwarn',
  },
  {
    condition = function(self) return self.lsp_hint > 0 end,
    provider = function(self) return icons.hint .. self.lsp_hint .. ' ' end,
    hl = 'SLDhint',
  },
  {
    condition = function(self) return self.lsp_info > 0 end,
    provider = function(self) return icons.info .. self.lsp_info .. ' ' end,
    hl = 'SLDinfo',
  },
}
