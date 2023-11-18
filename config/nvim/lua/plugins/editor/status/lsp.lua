local c = require 'heirline.conditions'

local icons = {
  load = '  ',
  done = '  ',
}

local loading = true

local onLspProgress = function(data)
  if data ~= nil and data.result ~= nil and data.result.value ~= nil then
    local v = data.result.value

    if v.progress ~= nil and v.progress == 100 then
      loading = false
    else
      loading = true
    end
  end
end

local group = vim.api.nvim_create_augroup('lsp_progress', { clear = true })

vim.api.nvim_create_autocmd('LspProgress', {
  callback = onLspProgress,
  group = group,
  once = true,
})

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
    ---@diagnostic disable-next-line: deprecated
    for _, server in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
      self.lsp_name = server.name
      self.lsp_attached = true
      return
    end
  end,
  update = { 'LspAttach', 'LspDetach', 'LspProgress' },
  {
    provider = function(self) return '   ' .. self.lsp_name .. ' ' end,
    hl = 'Normal'
  },
}
