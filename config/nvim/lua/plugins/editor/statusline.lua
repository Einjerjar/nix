return {
  'feline-nvim/feline.nvim',
  event = 'VeryLazy',
  config = function(_, opts)
    local theme = {
      aqua = '#7AB0DF',
      bg = '#1d202f',
      blue = '#5FB0FC',
      cyan = '#70C0BA',
      darkred = '#FB7373',
      fg = '#C7C7CA',
      gray = '#292e42',
      green = '#79DCAA',
      lime = '#54CED6',
      orange = '#FFD064',
      pink = '#D997C8',
      purple = '#C397D8',
      red = '#F87070',
      yellow = '#FFE59E',
    }

    local mode_theme = {
      ['NORMAL'] = theme.green,
      ['OP'] = theme.cyan,
      ['INSERT'] = theme.aqua,
      ['VISUAL'] = theme.yellow,
      ['LINES'] = theme.darkred,
      ['BLOCK'] = theme.orange,
      ['REPLACE'] = theme.purple,
      ['V-REPLACE'] = theme.pink,
      ['ENTER'] = theme.pink,
      ['MORE'] = theme.pink,
      ['SELECT'] = theme.darkred,
      ['SHELL'] = theme.cyan,
      ['TERM'] = theme.lime,
      ['NONE'] = theme.gray,
      ['COMMAND'] = theme.blue,
    }

    local component = {}

    component.vim_mode = {
      provider = function()
        -- return vim.api.nvim_get_mode().mode:upper()
        return '▌'
      end,
      hl = function()
        return {
          bg = 'gray',
          fg = require('feline.providers.vi_mode').get_mode_color(),
          style = 'bold',
          name = 'NeovimModeHLColor',
        }
      end,
      left_sep = '',
      right_sep = 'block',
    }
    component.vim_mode2 = {
      provider = function()
        -- return vim.api.nvim_get_mode().mode:upper()
        return '▐'
      end,
      hl = function()
        return {
          bg = 'bg',
          fg = require('feline.providers.vi_mode').get_mode_color(),
          style = 'bold',
          name = 'NeovimModeHLColor',
        }
      end,
      left_sep = 'block',
      right_sep = '',
    }

    component.git_branch = {
      provider = 'git_branch',
      hl = {
        fg = 'fg',
        bg = 'gray',
        style = 'bold',
      },
      left_sep = 'block',
      right_sep = 'block',
    }

    component.git_add = {
      provider = 'git_diff_added',
      hl = {
        fg = 'green',
        bg = 'bg',
      },
      left_sep = '',
      right_sep = '',
    }

    component.git_delete = {
      provider = 'git_diff_removed',
      hl = {
        fg = 'red',
        bg = 'bg',
      },
      left_sep = '',
      right_sep = '',
    }

    component.git_change = {
      provider = 'git_diff_changed',
      hl = {
        fg = 'purple',
        bg = 'bg',
      },
      left_sep = '',
      right_sep = '',
    }

    component.separator = {
      provider = '',
      hl = {
        fg = 'bg',
        bg = 'bg',
      },
    }

    component.diagnostic_errors = {
      provider = 'diagnostic_errors',
      hl = {
        fg = 'red',
      },
    }

    component.diagnostic_warnings = {
      provider = 'diagnostic_warnings',
      hl = {
        fg = 'yellow',
      },
    }

    component.diagnostic_hints = {
      provider = 'diagnostic_hints',
      hl = {
        fg = 'aqua',
      },
    }

    component.diagnostic_info = {
      provider = 'diagnostic_info',
    }

    local lsp_data = {
      name = nil,
      progress = false
    }

    function progress_handler(_, msg, ctx)
      local cid = ctx.client_id
      local client = vim.lsp.get_client_by_id(cid)
      local cname = client and client.name or 'unknown'

      lsp_data.name = cname

      local val = msg.value
      if val.kind == 'begin' or val.kind == 'report' then
        -- print('begin ' .. cname)
        lsp_data.progress = true
      elseif val.kind == 'end' then
        -- print('end ' .. cname)
        lsp_data.progress = false
        lsp_data.name = nil
      end
    end

    if vim.lsp.handlers['$/progress'] then
      local old_handler = vim.lsp.handlers['$/progress']
      vim.lsp.handlers['$/progress'] = function(...)
        old_handler(...)
        progress_handler(...)
      end
    else
      vim.lsp.handlers['$/progress'] = progress_handler
    end

    component.lsp = {
      provider = function()
        if not rawget(vim, 'lsp') then
          return ''
        end

        if vim.o.columns < 120 then
          return ''
        end

        local clients = vim.lsp.get_active_clients({ bufnr = 0 })
        if #clients ~= 0 then
          if lsp_data.progress then
            local spinners = {
              '◜ ',
              '◠ ',
              '◝ ',
              '◞ ',
              '◡ ',
              '◟ ',
            }
            local ms = vim.loop.hrtime() / 1000000
            local frame = math.floor(ms / 120) % #spinners
            local content = string.format('%%<%s', spinners[frame + 1]) .. (lsp_data.name or 'unknown_ls')
            return content or ''
          else
            return ' ' .. (lsp_data.name or 'LSP')
          end
        end
        return ''
      end,
      hl = function()
        return {
          fg = lsp_data.progress and 'yellow' or 'green',
          bg = 'gray',
          style = 'bold',
        }
      end,
      left_sep = '',
      right_sep = 'block',
    }

    -- component.possession = {
    --   provider = function()
    --     return (require("nvim-possession").status() or "")
    --   end,
    --   hl = {
    --     fg = 'fg',
    --     -- bg = 'gray',
    --   },
    --   left_sep = 'block',
    --   -- right_sep = 'block',
    -- }

    component.file_type = {
      provider = {
        name = 'file_type',
        opts = {
          filetype_icon = true,
        },
      },
      hl = {
        fg = 'fg',
        bg = 'gray',
      },
      left_sep = 'block',
      right_sep = 'block',
    }

    component.scroll_bar = {
      provider = function()
        local chars = {
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
        }
        local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
        local position = math.floor(line_ratio * 100)
        local s_position = tostring(position)

        if position <= 5 then
          s_position = ' TOP'
        elseif position >= 95 then
          s_position = ' BOT'
        else
          s_position = chars[math.floor(line_ratio * #chars)] .. position
        end
        return s_position
      end,
      hl = function()
        local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
        local fg
        local style

        if position <= 5 then
          fg = 'aqua'
          style = 'bold'
        elseif position >= 95 then
          fg = 'red'
          style = 'bold'
        else
          fg = 'purple'
          style = nil
        end
        return {
          fg = fg,
          style = style,
          bg = 'bg',
        }
      end,
      left_sep = 'block',
      right_sep = 'block',
    }

    component.position = {
      provider = function()
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        return '↔ ' .. col .. ' ↕ ' .. row
      end,
      hl = {
        fg = 'fg',
        bg = 'gray',
      },
      left_sep = 'block',
      right_sep = 'block',
    }

    component.macro = {
      provider = 'macro',
      hl = {
        fg = 'fg',
        -- bg = 'gray',
      },
      left_sep = 'block',
      right_sep = 'block',
    }

    local left = {
      component.vim_mode,
      component.file_type,
      component.lsp,
      -- component.possession,
      component.diagnostic_errors,
      component.diagnostic_warnings,
      component.diagnostic_info,
      component.diagnostic_hints,
    }
    local middle = {}
    local right = {
      component.macro,
      component.position,
      component.scroll_bar,
      component.git_branch,
      component.git_add,
      component.git_delete,
      component.git_change,
      component.vim_mode2,
    }

    local components = {
      active = {
        left,
        middle,
        right,
      },
    }

    opts['components'] = components
    opts['theme'] = theme
    opts['vi_mode_colors '] = mode_theme

    require('feline').setup(opts)
  end,
  opts = {},
}
