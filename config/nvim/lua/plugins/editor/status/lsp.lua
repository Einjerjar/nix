local u = require 'heirline.utils'
local c = require 'heirline.conditions'

return {
  condition = c.lsp_attached,
  static = {
    lsp_attached = false,
    show_lsps = {
      copilot = false,
      efm = false,
    },
  },
  init = function(self)
    for i, server in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
      self.lsp_name = server.name
      self.lsp_attached = true
      return
    end
  end,
  update = { 'LspAttach', 'LspDetach' },
  {
    provider = function(self) return '  ' .. self.lsp_name end,
  },
}
