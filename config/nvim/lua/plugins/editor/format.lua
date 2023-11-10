return {
  'mhartington/formatter.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function(_, _)
    require('core.utils').load_mappings 'format'
    require('formatter').setup {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        markdown = {
          require 'formatter.defaults.prettier' 'markdown',
        },
        go = {
          require('formatter.filetypes.go').goimports,
          require('formatter.filetypes.go').gofumpt,
          require('formatter.filetypes.go').golines,
        },
        python = {
          require('formatter.filetypes.python').isort,
          require('formatter.filetypes.python').black,
        },
        ocaml = {
          require('formatter.filetypes.ocaml').ocamlformat,
        },
        scss = {
          require 'formatter.defaults.prettier',
        },
        html = {
          require 'formatter.defaults.prettier',
        },
        svelte = {
          require 'formatter.defaults.prettier',
        },
        json = {
          require 'formatter.defaults.prettier' 'json',
        },
        javascript = {
          require 'formatter.defaults.prettier',
        },
        typescript = {
          require 'formatter.defaults.prettier',
        },
        prisma = {
          require 'formatter.defaults.prettier',
        },
        xml = {
          require 'formatter.defaults.prettier' 'html',
        },
        lua = {
          require('formatter.filetypes.lua').stylua,
        },
        ['*'] = {
          require('formatter.filetypes.any').remove_trailing_whitespace,
        },
      },
    }
  end,
}
