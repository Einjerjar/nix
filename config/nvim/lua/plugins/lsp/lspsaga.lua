return {
  'nvimdev/lspsaga.nvim',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  opts = {
    outline = {
      -- close_after_jump = true,
    },
    ui = {
      -- lines = { '└', '├', '│', '─', '┌' },
      lines = { ' ', ' ', ' ', ' ', ' ' },
      expand = ' ',
      collapse = '',
    },
  },
}
