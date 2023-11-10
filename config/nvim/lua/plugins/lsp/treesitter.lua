local options = {
  ensure_installed = {
    'bash',
    'css',
    'go',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'python',
    'regex',
    'svelte',
    'svelte',
    'toml',
    'typescript',
    'vim',
    'yaml',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['a='] = '@assignment.outer',
        ['i='] = '@assignment.outer',
        ['l='] = '@assignment.lhs',
        ['r='] = '@assignment.rhs',

        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.outer',

        ['ai'] = '@conditional.outer',
        ['ii'] = '@conditional.outer',

        ['al'] = '@loop.outer',
        ['il'] = '@loop.outer',

        ['am'] = '@function.outer',
        ['im'] = '@function.outer',

        ['ac'] = '@class.outer',
        ['ic'] = '@class.outer',
      },
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = false,
      node_decremental = '<bs>',
    },
  },
  refactor = {
    navigation = {
      enable = true,
      keymaps = {
        -- goto_definition = 'gi',
        -- list_definitions = 'gf',
        -- list_definitions_toc = 'gF',
        goto_next_usage = '<a-*>',
        goto_previous_usage = '<a-#>',
      },
    },
  },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
}

return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
    'nvim-treesitter/playground',
  },
  config = function(_, _)
    require('nvim-treesitter.configs').setup(options)
  end,
}
