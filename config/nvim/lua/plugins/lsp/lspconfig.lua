---@diagnostic disable: missing-fields
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  dependencies = {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    -- 'VonHeikemen/lsp-zero.nvim',
  },
  config = function()
    -- local lz = require 'lsp-zero'
    -- local ls = require 'lspconfig'
    --
    -- lz.on_attach(function(client, bufnr) lz.default_keymaps { buffer = bufnr } end)

    -- require('neodev').setup()
    -- require('neoconf').setup()

    -- lz.setup_servers {
    --   'html',
    --   'cssls',
    --   'tsserver',
    --   'eslint',
    --   'emmet_language_server',
    --   'lemminx',
    --   'gopls',
    --   'svelte',
    --   'tailwindcss',
    -- }
    --
    -- ls.lua_ls.setup {
    --   settings = {
    --     Lua = {
    --       diagnostics = {
    --         globals = { 'vim' },
    --       },
    --       workspace = {
    --         library = {
    --           [vim.fn.expand '$VIMRUNTIME/lua'] = true,
    --           [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
    --           [vim.fn.stdpath 'data' .. '/lazy/lazy.nvim/lua/lazy'] = true,
    --         },
    --         maxPreload = 100000,
    --         preloadFileSize = 10000,
    --       },
    --     },
    --   },
    -- }

    require 'plugins.config.lspconfig'
    require 'plugins.config.lspconfig2'
  end,
}
