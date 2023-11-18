-- helpers --
local u = require 'plugins.utils.themes'

local updateColors = function()
  -- get colors
  local prompt = u.find '@string'
  local result = u.find '@function'
  local preview = u.find '@keyword'
  local normal = u.find 'Normal'

  local t = {
    prompt = {
      fg = 'bg',
      bg = u.fm(prompt.fg),
    },
    result = {
      fg = 'bg',
      bg = u.fm(result.fg),
    },
    preview = {
      fg = 'bg',
      bg = u.fm(preview.fg),
    },
    normal = {
      -- make the prompt pop out a bit against default bg
      bg = u.fm(u.shift(normal.bg, -5)),
    },
  }

  -- apply styles to telescopr title
  u.hi(0, 'TelescopeNormal', t.normal)
  u.hi(0, 'TelescopeBorder', t.normal)
  u.hi(0, 'TelescopeTitle', t.prompt)
  u.hi(0, 'TelescopePreviewTitle', t.result)
  u.hi(0, 'TelescopeResultsTitle', t.preview)

  -- for indent-blankline
  u.hi(0, 'BGLighter', { bg = u.fm(u.shift(u.find('Normal').bg, 5)) })

  -- adjust cursorcolumn to match colorcolumn
  u.ln('CursorColumn', 'ColorColumn')

  vim.api.nvim_exec_autocmds('User', { pattern = 'UpdateColors' })
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    vim.cmd [[ colorscheme kanagawa ]]

    --  show line numbers on telesope preview
    vim.cmd 'autocmd User TelescopePreviewerLoaded setlocal number'

    updateColors()
  end,
})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = updateColors,
})

-- themes
return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
  },
}
