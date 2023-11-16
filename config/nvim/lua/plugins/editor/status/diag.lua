local u = require 'heirline.utils'
local c = require 'heirline.conditions'

local icons = {
  error = '  ',
  warn = '  ',
  hint = '  ',
  info = '  ',
}

return {
  init = function(self)
    self.lsp_error = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.lsp_warning = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.lsp_hint = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.lsp_info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,
  condition = c.has_diagnostics,
  update = { 'DiagnosticChanged', 'BufEnter' },
  {
    condition = function(self) return self.lsp_error > 0 end,
    provider = function(self) return icons.error .. self.lsp_error end,
  },
  {
    condition = function(self) return self.lsp_warning > 0 end,
    provider = function(self) return icons.warn .. self.lsp_warning end,
  },
  {
    condition = function(self) return self.lsp_hint > 0 end,
    provider = function(self) return icons.hint .. self.lsp_hint end,
  },
  {
    condition = function(self) return self.lsp_info > 0 end,
    provider = function(self) return icons.info .. self.lsp_info end,
  },
}
