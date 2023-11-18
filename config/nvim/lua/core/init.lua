local go = vim.go
local o = vim.opt
local g = vim.g

-- ---------------

g.mapleader = ' '

go.shell = 'bash'

-- ---------------

-- transparency
o.pumblend = 10

-- disable annoying swap files
--  I use constant autosave anyways
o.swapfile = false

-- global statusline, zero height cmd
o.laststatus = 3
o.cmdheight = 0

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

-- 2 supremacy,
--  except python, cant go against the 4 law there
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

o.backspace = 'indent,eol,start'
o.wrap = false

-- better search
o.ignorecase = true
o.smartcase = true

o.splitbelow = true
o.splitright = true

-- hide `Press ENTER or type command to continue`
--  for some messages
o.shortmess:append 'sI'

o.undofile = true

o.timeoutlen = 400
o.updatetime = 250

-- allow h and l to move through lines
o.whichwrap:append '<>[]hl'

-- visible but unobtrusive trailing whitespace indicator
o.list = true
o.listchars:append 'trail:·,precedes:←,extends:→,tab:· '

-- ---------------

-- ufo stuff
o.foldcolumn = '0'
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- ---------------
