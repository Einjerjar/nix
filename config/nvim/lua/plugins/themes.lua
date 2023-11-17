-- helpers --
local hi = vim.api.nvim_set_hl
local ln = function(fr, to) hi(0, fr, { link = to }) end
local gh = function(s) return vim.api.nvim_get_hl(0, { name = s }) end
local fm = function(i) return string.format('#%06x', i) end

-- cant use var = fun declaration for recursives, sad
local function resolve_hi(s)
  local h = gh(s)
  if h.link ~= nil then return resolve_hi(h.link) end
  return h
end

local updateTelescopeColors = function()
  -- ger colors
  local prompt = resolve_hi '@string'
  local result = resolve_hi '@function'
  local preview = resolve_hi '@keyword'

  local t = {
    prompt = {
      fg = 'bg',
      bg = fm(prompt.fg),
    },
    result = {
      fg = 'bg',
      bg = fm(result.fg),
    },
    preview = {
      fg = 'bg',
      bg = fm(preview.fg),
    },
  }

  -- apply styles to telescopr title
  hi(0, 'TelescopeTitle', t.prompt)
  hi(0, 'TelescopePreviewTitle', t.result)
  hi(0, 'TelescopeResultsTitle', t.preview)

  -- adjust cursorcolumn to match colorcolumn
  ln('CursorColumn', 'ColorColumn')
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    vim.cmd [[ colorscheme kanagawa ]]

    --  show line numbers on telesope preview
    vim.cmd 'autocmd User TelescopePreviewerLoaded setlocal number'

    updateTelescopeColors()
  end,
})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = updateTelescopeColors,
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
