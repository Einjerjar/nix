return {
  'gelguy/wilder.nvim',
  event = 'VeryLazy',
  opts = { modes = { ':', '/', '?' } },
  config = function(_, opts)
    local wilder = require 'wilder'
    wilder.setup(opts)

    local gradient = {
      '#6e40aa',
      '#963db3',
      '#bf3caf',
      '#e4419d',
      '#fe4b83',
      '#ff5e63',
      '#ff7847',
      '#fb9633',
      '#e2b72f',
      '#c6d63c',
      '#aff05b',
    }

    for i, fg in ipairs(gradient) do
      gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = fg } })
    end

    wilder.set_option(
      'renderer',
      wilder.popupmenu_renderer {
        highlights = {
          gradient = gradient, -- must be set
          -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
        },
        highlighter = wilder.highlighter_with_gradient {
          wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
        },
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
      }
    )
  end,
}

