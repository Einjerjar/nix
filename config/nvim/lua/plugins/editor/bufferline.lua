return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  init = function() require('core.utils').load_mappings 'bufferline' end,
  config = function()
    local bl = require 'bufferline'

    bl.setup {
      options = {
        diagnostics = 'nvim_lsp',
        -- style = bl.style_preset.mininal,
        themable = true,
        -- numbers = 'both',
        diagnostics_indicator = function(count, level, _, _)
          local icon = level:match 'error' and ' ' or '󰔷 '
          return '' .. icon .. count
        end,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'NVIM-Tree',
            highlight = 'Directory',
            separator = true,
          },
          {
            filetype = 'neo-tree',
            text = 'NEO Tree',
            highlight = 'Directory',
            separator = true,
          },
          {
            filetype = 'CHADTree',
            text = 'CHADTree',
            highlight = 'Directory',
            separator = true,
          },
        },
        max_name_length = 7,
        tab_size = 7,
        name_formatter = function(buf)
          -- return string.sub(buf.name, 1, 3) .. '...'
          return '#' .. buf.bufnr
          -- return ''
        end,
      },
    }
  end,
}
