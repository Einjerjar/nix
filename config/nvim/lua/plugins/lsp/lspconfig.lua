return {
  "neovim/nvim-lspconfig",
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  dependencies = {
    'VonHeikemen/lsp-zero.nvim',
  },
  config = function()
    local lz = require 'lsp-zero'

    lz.on_attach(function(client, bufnr)
      lz.default_keymaps({buffer = bufnr})
    end)

    lz.setup_servers({'lua_ls'})
    lz.setup_servers({'pyright'})
  end,
}
