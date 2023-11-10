return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  init = function()
    require('core.utils').load_mappings('bufferline')
  end,
  config = function(_, opts)
    require('bufferline').setup(opts)
  end,
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      -- numbers = 'both',
      -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
      diagnostics_indicator = function(count, level, _, _)
        local icon = level:match('error') and ' ' or ' '
        return ' ' .. icon .. count
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
    },
  },
}
