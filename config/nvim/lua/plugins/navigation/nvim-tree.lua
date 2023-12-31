local options = {
  filters = {
    dotfiles = false,
    custom = {
      '__pycache__',
      '^\\.git$',
      '\\.pyc$',
      -- '^\\.svelte-kit$',
    },
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    adaptive_size = false,
    side = 'right',
    width = 30,
    preserve_window_proportions = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    root_folder_label = false,
    highlight_git = false,
    highlight_opened_files = 'none',

    indent_markers = {
      enable = false,
    },

    icons = {
      git_placement = 'signcolumn',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = '',
        symlink = '',
        folder = {
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
          arrow_open = '',
          arrow_closed = ' ',
        },
        git = {
          unstaged = '',
          staged = '',
          unmerged = '',
          renamed = '',
          untracked = '',
          deleted = '',
          ignored = '',
        },
      },
    },
  },
}

return {
  'nvim-tree/nvim-tree.lua',
  cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
  init = function() require('core.utils').load_mappings 'nvimtree' end,
  opts = options,
  config = function(_, opts) require('nvim-tree').setup(opts) end,
}
