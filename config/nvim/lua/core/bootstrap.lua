local M = {}

local function shell_call(args)
  local output = vim.fn.system(args)
  assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end

M.echo = function(str)
  vim.cmd('redraw')
  vim.api.nvim_echo({ { str, 'Bold' } }, true, {})
end

M.lazy = function(install_path)
  if not vim.loop.fs_stat(install_path) then
    M.echo(' Installing Lazy')
    local repo = 'https://github.com/folke/lazy.nvim.git'
    shell_call {
      'git',
      'clone',
      '--filter=blob:none',
      '--branch=stable',
      repo,
      install_path,
    }
  end

  vim.opt.rtp:prepend(install_path)

  require('lazy').setup({
    {
      { import = 'plugins' },
      { import = 'plugins.lsp' },
      { import = 'plugins.editor' },
      { import = 'plugins.navigation' },
      { import = 'plugins.tools' },
    },
  }, require('plugins.config.lazy'))
end

return M
