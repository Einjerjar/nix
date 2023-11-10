return {
  'kevinhwang91/nvim-ufo',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  dependencies = { 'kevinhwang91/promise-async' },
  init = function()
    local o = vim.o
  end,
  opts = {
    provider_selector = function(_, _)
      return {
        'treesitter',
        'indent',
      }
    end,
  },
}
