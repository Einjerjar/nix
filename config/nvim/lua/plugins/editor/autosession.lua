local utils = require('core.utils')

local close_ft = {
  'NvimTree',
  'sagaoutline'
}

local close_stuff = function()
  local winfos = vim.fn.getwininfo()
  for _, win in ipairs(winfos) do
    local bufnr = win.bufnr
    local t = vim.api.nvim_buf_get_option(bufnr, 'filetype')

    if utils.has_value(close_ft, t) then
      vim.cmd('bd ' .. bufnr)
    end
  end
end

return {
  'rmagatti/auto-session',
  lazy = false,
  opts = {
    log_level = 'error',
    auto_session_enable_file_tree_integration = true,
    auto_session_suppress_dirs = {
      '~/',
      '/',
    },
    pre_save_cmds = { close_stuff },
  },
}
