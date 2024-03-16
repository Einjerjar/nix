local options = {
  g = {
    mapleader = ' ',
  },
  go = {
    shell = 'bash',
  },

  opt = {
    scrolloff = 8,
    sidescrolloff = 8,
    clipboard = 'unnamedplus',
    conceallevel = 2,

    -- transparency
    pumblend = 20,
    winblend = 20,

    -- disable annoying swap files
    --  I use constant autosave anyways
    swapfile = false,

    -- save undo history
    undofile = true,

    -- global statusline, zero height cmd
    laststatus = 3,
    cmdheight = 0,

    -- columns
    cursorline = true,
    cursorcolumn = true,
    colorcolumn = '120',

    -- side
    number = true,
    relativenumber = true,
    signcolumn = 'yes:1',
    foldcolumn = '0',

    -- colors
    background = 'dark',
    termguicolors = true,

    -- tabs
    -- 2 supremacy,
    --  except python, cant go against the 4 law there
    tabstop = 2,
    shiftwidth = 2,
    shiftround = true,
    expandtab = true,
    autoindent = true,
    smartindent = true,
    smarttab = true,

    -- whitespace
    backspace = 'indent,eol,start',
    wrap = false,

    -- better search
    ignorecase = true,
    smartcase = true,

    -- splits
    splitbelow = true,
    splitright = true,

    -- interaction timers
    timeoutlen = 400,
    updatetime = 250,

    -- enable listchars
    list = true,

    -- use rg
    grepformat = '%f:%l:%c:%m',
    grepprg = 'rg --vimgrep',

    -- show items to replace
    inccommand = 'split',

    completeopt = 'menuone,noinsert,popup',
  },
}

local appends = {
  opt = {
    shortmess = 'sI',
    whichwrap = '<>[]hl',
    listchars = 'trail:·,precedes:←,extends:→,tab:· ',
  },
}

for m, o in pairs(options) do
  for k, v in pairs(o) do
    vim[m][k] = v
  end
end

for m, o in pairs(appends) do
  for k, v in pairs(o) do
    vim[m][k]:append(v)
  end
end
