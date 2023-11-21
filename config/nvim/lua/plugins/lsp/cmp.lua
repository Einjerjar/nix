return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'SmiteshP/nvim-navbuddy',
    'L3MON4D3/LuaSnip',
    'windwp/nvim-autopairs',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'FelipeLema/cmp-async-path',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'chrisgrieser/cmp-nerdfont',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
  },
  event = 'InsertEnter',
  config = function()
    local cmp = require 'cmp'

    local bordered = {
      border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
      winhighlight = 'Normal:Normal,FloatBorder:Comment,CursorLine:CursorLine,Search:None',
    }

    local icons = {
      Text = '󰉿',
      Variable = '󰫧',
      Snippet = '',
      Function = '󰊕',
      Field = '',
      Keyword = '',
      Property = '',
    }

    cmp.setup {
      formatting = {
        format = function(entry, vim_item)
          local ic = icons[vim_item.kind] or ''
          if ic ~= '' then
            ic = ic .. ' '
          end
          vim_item.kind = ic .. vim_item.kind
          return vim_item
        end
      },
      snippet = {
        expand = function(args) vim.fn['vsnip#anonymous'](args.body) end,
      },
      window = {
        documentation = bordered,
        completion = bordered,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'nvim_lsp_signature_help' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 2 },
        { name = 'async_path' },
      },
    }

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline', option = { ignore_cmds = { 'Man' }} },
      }),
    })
  end,
}
