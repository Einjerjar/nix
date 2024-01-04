return {
	'Exafunction/codeium.vim',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  init = function()
    vim.g.codeium_disable_bindings = 1
    vim.g.codeium_bin = '/home/nixos/.nix-profile/bin/codeium_language_server'
    require('core.utils').load_mappings('codeium')
  end,
}
