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
        ['m='] = '@assignment.lhs',
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
    'nvim-treesitter/nvim-treesitter-context',
  },
  config = function(_, _)
    require('nvim-treesitter.configs').setup(options)

    require('treesitter-context').setup {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }
  end,
}
