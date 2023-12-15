local M = {}

local cmd = function(s) return '<Cmd>' .. s .. '<CR>' end

local l = function(s) return '<Leader>' .. s end

local fn = function(k, v)
  k = vim.fn[k]
  v = v or nil

  if v == nil then return function() return k() end end
  return function() return k(unpack(v)) end
end

-- utils

M.__utils = {
  plugin = false
}

-- set default state here
local vtext = true

M.__utils.toggle_vtext = function(val)
  vtext = val ~= nil and val or not vtext

  vim.diagnostic.config({
    virtual_text = vtext,
  })
end

M.core = {
  i = {
    ['jk'] = { '<Esc>', 'Leave insert mode' },

    ['<C-b>'] = { '<Esc>^i', 'Start of line' },
    ['<C-e>'] = { '<End>', 'End of line' },

    ['<C-k>'] = { '<Up>', 'Move cursor in insert mode (UP)' },
    ['<C-j>'] = { '<Down>', 'Move cursor in insert mode (DOWN)' },
    ['<C-h>'] = { '<Left>', 'Move cursor in insert mode (LEFT)' },
    ['<C-l>'] = { '<Right>', 'Move cursor in insert mode (RIGHT)' },

    ['<C-s>'] = { cmd 'w', 'Save' },
  },
  n = {
    [l 'di'] = { function() M.__utils.toggle_vtext() end, 'Toggle Virtual text' },
    ['<Esc>'] = { cmd 'noh', 'Clear search highlight' },
    [l 'nk'] = { cmd 'noh', 'Clear search highlight' },

    [l 'fl'] = { vim.lsp.buf.format, 'Clear search highlight' },
    ['gj'] = { vim.lsp.buf.signature_help, 'Signature help' },
    ['K'] = { vim.lsp.buf.hover, 'Hover' },
    -- ['ca'] = { vim.lsp.buf.code_action, 'Code action' },

    ['E'] = { cmd '+10', 'Scroll down' },
    ['Y'] = { cmd '-10', 'Scroll up' },

    ['k'] = { 'gk', 'Go up one line visually' },
    ['j'] = { 'gj', 'Go down one line visually' },
    ['H'] = { '^', 'Start of line' },
    ['L'] = { '$', 'End of line' },

    ['<A-j>'] = { ':m .+1<CR>==', 'Move line down' },
    ['<A-k>'] = { ':m .-2<CR>==', 'Move line up' },

    [l 's['] = { cmd 'vsplit', 'Split window vertically' },
    [l 's]'] = { cmd 'split', 'Split window horizontally' },
    [l 'sd'] = { cmd 'bd', 'Delete buffer' },
    [l 'sD'] = { cmd 'bd!', 'Force delete buffer' },

    -- [l 'fi'] = { call_picker '$DOTFILES/icons/all.txt', 'Copy icon' },
    -- [l 'fj'] = { call_picker '$DOTFILES/icons/emoji.txt', 'Copy emoji' },
    [l 'fi'] = { cmd 'silent !fish -c fi', 'Copy icon' },
    [l 'fp'] = { cmd '!fish -c fp', 'package.json scripts' },

    ['='] = { cmd 'vertical resize +2', 'Make the window bigger vertically' },
    ['-'] = { cmd 'vertical resize -2', 'Make the window smaller vertically' },
    ['+'] = { cmd 'horizontal resize +2', 'Make the window bigger horizontally' },
    ['_'] = { cmd 'horizontal resize -2', 'Make the window smaller horizontally' },

    ['<C-s>'] = { cmd 'w', 'Save' },
  },
  v = {
    ['<A-j>'] = { ":m '>+1<CR>gv=gv", 'Move line down' },
    ['<A-k>'] = { ":m '<-2<CR>gv=gv", 'Move line up' },

    ['k'] = { 'gk', 'Go up one line visually' },
    ['j'] = { 'gj', 'Go down one line visually' },
    ['H'] = { '^', 'Start of line' },
    ['L'] = { '$', 'End of line' },
  },
}

M.nvimtree = {
  n = {
    ['\\'] = { cmd 'NvimTreeFocus', 'Focus tree on current file' },
    [l 'e'] = { cmd 'NvimTreeToggle', 'Toggle File Tree' },
  },
}

M.whichkey = {
  n = {
    [l 'wK'] = {
      function() vim.cmd 'WhichKey' end,
      'Which-key all keymaps',
    },
    [l 'wk'] = {
      function()
        local input = vim.fn.input 'WhichKey: '
        vim.cmd('WhichKey ' .. input)
      end,
      'Which-key query lookup',
    },
  },
}

M.telescope = {
  n = {
    [l 'fg'] = { cmd 'Telescope live_grep', 'Live Grep' },
    [l 'fu'] = { cmd 'Telescope keymaps', 'List Keymaps' },
    [l 'ff'] = { cmd 'Telescope find_files', 'Find Files' },
    [l 'fw'] = { cmd 'Telescope grep_string', 'Grep String' },
    [l 'fr'] = { cmd 'Telescope current_buffer_fuzzy_find', 'Fuzzy buffer' },
    [l 'fo'] = { cmd 'Telescope oldfiles', 'List Old Files' },
    [l 'ft'] = { cmd 'Telescope filetypes', 'Change File type' },
    [l 'fm'] = { cmd 'Telescope highlights', 'List Highlights' },

    [l '<Space>'] = { cmd 'Telescope buffers', 'List Buffers' },
  },
}

M.increname = {
  n = {
    ['gr'] = {
      function() return ':IncRename ' .. vim.fn.expand '<cword>' end,
      'Incremental rename',
      { expr = true },
    },
  },
}

M.codeium = {
  i = {
    ['<C-u>'] = { fn 'codeium#Accept', 'Codium Accept', { expr = true } },
    ['<C-x>'] = { fn 'codeium#Clear', 'Codium Clear', { expr = true } },
  },
}

M.bufferline = {
  n = {
    [l 'qs'] = { cmd 'BufferLinePick', 'Pick buffer' },
    [l 'qh'] = { cmd 'BufferLineMovePrev', 'Move buffer left' },
    [l 'ql'] = { cmd 'BufferLineMoveNext', 'Move buffer right' },
    [l 'qq'] = { cmd 'BufferLinePickClose', 'Close buffer' },
    [l 'qn'] = { cmd 'BufferLineCycleNext', 'Next buffer' },
    [l 'qp'] = { cmd 'BufferLineCyclePrev', 'Prev buffer' },
    [l 'qt'] = { cmd 'BufferLineTogglePin', 'Prev buffer' },

    [l 'q['] = { cmd 'BufferLineCyclePrev', 'Previous buffer' },
    [l 'q]'] = { cmd 'BufferLineCycleNext', 'Next buffer' },

    [l 'so'] = { cmd 'BufferLineCloseOthers', 'Close Other buffer' },
  },
}

-- n
M.trouble = {
  n = {
    [l 'dt'] = { cmd 'Trouble', 'Toggle Trouble' },
    [l 'dz'] = { cmd 'Trouble document_diagnostics', 'Toggle Trouble document_diagnostics' },
    [l 'dq'] = { cmd 'Trouble quickfix', 'Toggle Trouble quickfix' },
    [l 'dl'] = { cmd 'Trouble loclist', 'Toggle Trouble loclist' },
  },
}

-- n
M.format = {
  n = {
    [l 'fh'] = { cmd 'Format', 'Format code' },
  },
}

-- n
M.neogit = {
  n = {
    [l 'ng'] = { cmd 'Neogit', 'Neogit' },
  }
}

-- n
M.signature = {
  n = {
    ['<M-p>'] = {function() require('lsp_signature').toggle_float_win() end, 'show signature'}
  },
  i = {
    ['<M-p>'] = {function() require('lsp_signature').toggle_float_win() end, 'show signature'}
  }
}

-- n
M.navbuddy = {
  n = {
    [l 'nb'] = { function() require('nvim-navbuddy').open() end, 'Navbuddy' },
  },
}

-- n
M.neorg = {
  n = {
    [l 'nwn'] = { cmd 'Neorg workspace home', 'Neorg workspaces' },
    [l 'nww'] = { cmd 'Neorg workspace work', 'Neorg workspaces' },
  },
}

M.gitsigns = {
  n = {
    [l 'gs'] = { cmd 'Gitsigns toggle_signs', 'Toggle signs' },
    [l 'gb'] = { cmd 'Gitsigns blame_line', 'Blame line' },
    -- [l 'gd'] = { cmd 'Gitsigns diffthis', 'Diff this' },

    [l 'gr'] = { cmd 'Gitsigns reset_hunk', 'Reset hunk' },
    [l 'gp'] = { cmd 'Gitsigns preview_hunk', 'Preview hunk' },
    [l 'gj'] = { cmd 'Gitsigns next_hunk', 'Next hunk' },
    [l 'gk'] = { cmd 'Gitsigns prev_hunk', 'Prev hunk' },
    [l 'gp'] = { cmd 'Gitsigns preview_hunk', 'Preview hunk' },
    [l 'gP'] = { cmd 'Gitsigns preview_hunk_inline', 'Preview hunk inline' },

    [l 'gl'] = { cmd 'Gitsigns toggle_linehl', 'Toggle linehl' },
    [l 'gn'] = { cmd 'Gitsigns toggle_numhl', 'Toggle deleted' },
  },
}

M.lspsaga = {
  n = {
    ['ca'] = { cmd 'Lspsaga code_action', 'Code action' },
    ['gf'] = { cmd 'Lspsaga finder', 'Finder' },
    ['gd'] = { cmd 'Lspsaga peek_definition', 'Peek definition' },
    ['gi'] = { cmd 'Lspsaga goto_definition', 'Go to definition' },
    ['gk'] = { cmd 'Lspsaga hover_doc', 'Hover doc' },

    [l 'do'] = { cmd 'Lspsaga outline', 'Document Outline' },
    [l 'dw'] = { cmd 'Lspsaga show_cursor_diagnostics', 'Cursor Diagnostics' },
    [l 'da'] = { cmd 'Lspsaga show_line_diagnostics', 'Cursor Diagnostics' },

    [l 'dj'] = { cmd 'Lspsaga diagnostic_jump_next', 'Next diagnostic' },
    [l 'dk'] = { cmd 'Lspsaga diagnostic_jump_prev', 'Previous diagnostic' },
  },
}

return M
