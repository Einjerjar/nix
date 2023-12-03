local lu = require 'lspconfig.util'

local root_files = {
  '.odoo_lsp',
}

return {
  name = 'odoo-lsp',
  cmd = { 'odoo-lsp' },
  filetypes = {
    -- 'xml',
    'python',
  },
  root_dir = lu.root_pattern(unpack(root_files)),
  settings = {},
}
