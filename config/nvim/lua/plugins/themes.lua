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

-- modified to take in and return ints
-- https://stackoverflow.com/a/72431176
local function clamp(component) return math.min(math.max(component, 0), 255) end
function LightenDarkenColor(num, amt)
  local r = math.floor(num / 0x10000) + amt
  local g = (math.floor(num / 0x100) % 0x100) + amt
  local b = (num % 0x100) + amt
  return clamp(r) * 0x10000 + clamp(g) * 0x100 + clamp(b)
end

local updateTelescopeColors = function()
  -- ger colors
  local prompt = resolve_hi '@string'
  local result = resolve_hi '@function'
  local preview = resolve_hi '@keyword'
  local normal = resolve_hi('Normal')

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
    normal = {
      -- make the prompt pop out a bit against default bg
      bg = fm(LightenDarkenColor(normal.bg, -5))
    }
  }

  -- apply styles to telescopr title
  hi(0, 'TelescopeNormal', t.normal)
  hi(0, 'TelescopeBorder', t.normal)
  hi(0, 'TelescopeTitle', t.prompt)
  hi(0, 'TelescopePreviewTitle', t.result)
  hi(0, 'TelescopeResultsTitle', t.preview)

  -- for indent-blankline
  hi(0, 'BGLighter', { bg = fm(LightenDarkenColor(resolve_hi('Normal').bg, 5)) })

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
