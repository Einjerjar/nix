return {
  'wfxr/minimap.vim',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  init = function()
    -- vim.g.minimap_auto_start = 1
  end
}
