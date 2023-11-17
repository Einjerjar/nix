local highlight = {
  'ColorColumn',
  'Whitespace',
}

return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'VeryLazy' },
  main = 'ibl',
  opts = {
    indent = { highlight = highlight, char = '' },
    whitespace = {
      highlight = highlight,
      remove_blankline_trail = false,
    },
    scope = {
      enabled = false,
    },
    exclude = {
      filetypes = {
        'help',
        'terminal',
        'lazy',
        'lspinfo',
        'TelescopePrompt',
        'TelescopeResults',
        'mason',
        'nvdash',
        'nvcheatsheet',
        '',
      },
    },
  },
}
