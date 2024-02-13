local f = vim.filetype

f.add({
  extension = {
    i3c = 'i3config'
  },
  filename = {
    ['odoo.conf'] = 'confini',
    ['openerp-server.conf'] = 'confini',
    -- ['env'] = 'dotenv',
  },
  pattern = {
    ['[%w_.-]+.tmux.conf'] = 'tmux',
    -- ['%.env%.[%w_.-]+'] = 'dotenv',
  }
})
