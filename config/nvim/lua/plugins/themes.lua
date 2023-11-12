local hi = vim.api.nvim_set_hl
local ln = function(fr, to) hi(0, fr, { link = to }) end

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    require('onedark').setup {
      style = 'darker',
      code_style = {
        comments = 'italic',
        keywords = 'bold',
        strings = 'italic',
        functions = 'none',
        variables = 'italic,bold',
      }
      -- transparent = true,
    }
    vim.cmd [[ colorscheme onedark ]]

    local result_bg = '#282c34'
    local prompt_bg = '#111316'
    local preview_bg = '#171a1e'

    local prompt_fg = '#8ebd6b'
    local result_fg = '#4fa6ed'
    local preview_fg = '#e55561'

    -- require('core.utils').echo('--' .. prompt_bg .. '--')

    hi(0, '__B_PROMPT', { bg = preview_bg })
    hi(0, '__B_RESULT', { bg = prompt_bg })
    hi(0, '__B_PREVIEW', { bg = preview_bg })

    hi(0, '__T_PROMPT', { fg = prompt_bg, bg = prompt_fg })
    hi(0, '__T_RESULT', { fg = prompt_bg, bg = result_fg })
    hi(0, '__T_PREVIEW', { fg = prompt_bg, bg = preview_fg })

    hi(0, 'IndentBlanklineContextStart', { bg = '#444953' })

    ln('TelescopeTitle', '__T_PROMPT')

    ln('TelescopePromptBorder', '__B_PROMPT')
    ln('TelescopePromptNormal', '__B_PROMPT')

    ln('TelescopePreviewBorder', '__B_PREVIEW')
    ln('TelescopePreviewNormal', '__B_PREVIEW')
    ln('TelescopePreviewTitle', '__T_PREVIEW')

    ln('TelescopeResultsBorder', '__B_RESULT')
    ln('TelescopeResultsNormal', '__B_RESULT')
    ln('TelescopeResultsTitle', '__T_RESULT')

    vim.cmd 'autocmd User TelescopePreviewerLoaded setlocal number'
    vim.cmd 'set mouse=a'
  end,
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
