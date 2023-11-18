-- https://github.com/olimorris/dotfiles/blob/main/.config/nvim/lua/plugins/heirline/init.lua#
local filetypes = {
  '^git.*',
  'fugitive',
  'alpha',
  '^neo--tree$',
  '^neotest--summary$',
  '^neo--tree--popup$',
  '^NvimTree$',
  '^toggleterm$',
}

local buftypes = {
  'nofile',
  'prompt',
  'help',
  'quickfix',
}

local force_inactive_filetypes = {
  '^aerial$',
  '^alpha$',
  '^chatgpt$',
  '^DressingInput$',
  '^frecency$',
  '^lazy$',
  '^lazyterm$',
  '^netrw$',
  '^oil$',
  '^TelescopePrompt$',
  '^undotree$',
}

local align = { provider = '%= ', hl = 'Normal' }
local sep = { provider = '|', hl = 'Normal' }

return {
  'rebelot/heirline.nvim',
  event = 'VeryLazy',
  config = function(_, _)
    local c = require 'heirline.conditions'

    require('heirline').setup {
      static = {
        filetypes = filetypes,
        buftypes = buftypes,
        force_inactive_filetypes = force_inactive_filetypes,
      },
      statusline = {
        require 'plugins.editor.status.mode',
        require 'plugins.editor.status.file',
        align,
        require 'plugins.editor.status.recording',
        require 'plugins.editor.status.diag',
        require 'plugins.editor.status.lsp',
        {
          condition = c.lsp_attached,
          sep
        },
        require 'plugins.editor.status.git',
      },
    }
  end,
  opts = {},
}
