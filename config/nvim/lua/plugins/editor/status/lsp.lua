local c = require 'heirline.conditions'

local icons = {
  load = '',
  done = '',
}

local registered = false
local loading = false
local load_msg = ''

local onLspProgress = function(err, msg, ctx)
  local value = msg.value

  if value.kind ~= 'end' then
    loading = true
    load_msg = (value and ((value.message and (value.message .. ' ') or '') .. value.title) or '')
    if load_msg ~= '' then
      load_msg = ' ' .. load_msg
    end
  else
    loading = false
  end
end

if not registered then
  if vim.lsp.handlers['$/progress'] then
    local old = vim.lsp.handlers['$/progress']
    vim.lsp.handlers['$/progress'] = function(...)
      old(...)
      onLspProgress(...)
    end
  else
    vim.lsp.handlers['$/progress'] = onLspProgress
  end
end

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
    local bufnr = vim.api.nvim_get_current_buf()
    local lsp_clients = vim.lsp.get_clients({bufnr = bufnr})
    local lsp_names = {}
    for _, client in pairs(lsp_clients) do
      table.insert(lsp_names, client.name)
    end

    self.lsp_name = table.concat(lsp_names, ', ')
    self.lsp_attached = #lsp_names > 0
  end,
  update = { 'LspAttach', 'LspDetach', 'LspProgress' },
  {
    provider = function(self) return ' ' .. (loading and (icons.load .. ' ' .. load_msg) or icons.done .. ' ') .. ' ' .. self.lsp_name .. ' ' end,
    hl = 'Normal'
  },
}
