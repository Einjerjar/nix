return {
  'nvim-neorg/neorg',
  event = 'VeryLazy',
  build = ':Neorg sync-parsers',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('core.utils').load_mappings 'neorg'
    require('neorg').setup {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.completion'] = {
          config = {
            engine = 'nvim-cmp',
          },
        },
        ['core.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              home = '~/ein/notes',
              work = '~/work/notes',
            },
          },
        },
      },
    }
  end,
}
