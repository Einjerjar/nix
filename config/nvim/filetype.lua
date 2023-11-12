local f = vim.filetype

f.add({
  extension = {
    i3c = 'i3config'
  },
  filename = {
    -- ['.env'] = 'dotenv',
    -- ['env'] = 'dotenv',
  },
  pattern = {
    -- ['%.env%.[%w_.-]+'] = 'dotenv',
  }
})
