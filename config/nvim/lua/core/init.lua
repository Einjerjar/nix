local go = vim.go
local o = vim.opt
local g = vim.g

-- ---------------

g.mapleader = ' '

go.shell = 'bash'

-- ---------------

o.swapfile = false

o.laststatus = 3
o.showmode = false

o.clipboard = 'unnamedplus'

o.conceallevel = 2

o.cursorline = true
o.cursorcolumn = true
o.colorcolumn = '120'

o.number = true
o.relativenumber = true
o.signcolumn = 'yes:1'
o.foldcolumn = '0'

o.background = 'dark'
o.termguicolors = true

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.backspace = 'indent,eol,start'
o.wrap = false

o.ignorecase = true
o.smartcase = true

o.splitbelow = true
o.splitright = true

o.shortmess:append 'sICc'

o.timeoutlen = 400
o.undofile = true

o.updatetime = 250
o.whichwrap:append '<>[]hl'

-- ---------------

o.foldcolumn = '0'
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- ---------------

for _, provider in ipairs { 'node', 'perl', 'python3', 'ruby' } do
  vim.g['loaded_' .. provider .. '_provider'] = 0
end

local is_windows = vim.loop.os_uname().sysname == 'Windows_NT'
vim.env.PATH = vim.fn.stdpath 'data' .. '/mason/bin' .. (is_windows and ';' or ':') .. vim.env.PATH
