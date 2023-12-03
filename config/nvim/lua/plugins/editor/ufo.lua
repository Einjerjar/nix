return {
  'kevinhwang91/nvim-ufo',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  dependencies = { 'kevinhwang91/promise-async' },
  init = function()
    local o = vim.o

    -- ufo stuff
    o.foldcolumn = '1'
    o.foldlevel = 99
    o.foldlevelstart = 99
    o.foldenable = true
  end,
  opts = {
    -- provider_selector = function(_, _)
    --   return {
    --     'indent',
    --     'treesitter',
    --   }
    -- end,
  },
}
