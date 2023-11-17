local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

require 'core'
require('core.bootstrap').lazy(lazypath)
require('core.utils').load_mappings()

require('core.mappings').__utils.toggle_vtext(false)
