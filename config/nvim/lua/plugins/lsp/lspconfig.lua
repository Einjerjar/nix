return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufWinEnter', 'BufNewFile' },
  dependencies = {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'VonHeikemen/lsp-zero.nvim',
    'b0o/SchemaStore.nvim',
  },
  init = function()
    local signs = {
      Error = '',
      Warn = '',
      Hint = '',
      Info = '',
    }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end
  end,
  config = function()
    local lz = require('lsp-zero').preset {}
    local ls = require 'lspconfig'
    local lc = require 'lspconfig.configs'

    lz.on_attach(function(_, bufnr) lz.default_keymaps { buffer = bufnr } end)

    local servers = {
      'html',
      'cssls',
      'gopls',
      'eslint',
      -- 'biome',
      -- 'jsonls',
      'svelte',
      'ruff_lsp',
      -- 'lemminx',
      'marksman',
      'tsserver',
      'tailwindcss',
      'pyright',
      'emmet_language_server',
      -- 'arduino_language_server',
    }

    local cap = require('cmp_nvim_lsp').default_capabilities()
    cap.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    ls.jsonls.setup {
      capabilities = cap,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    }

    ls.yamlls.setup {
      capabilities = cap,
      settings = {
        yaml = {
          schemaStore = {
            enable = false,
            url = '',
          },
          schemas = require('schemastore').yaml.schemas(),
        },
      },
    }

    ls.lua_ls.setup {
      capabilities = cap,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand '$VIMRUNTIME/lua'] = true,
              [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
              [vim.fn.stdpath 'data' .. '/lazy/lazy.nvim/lua/lazy'] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    }

    for _, lsp in ipairs(servers) do
      ls[lsp].setup { capabilities = cap }
    end

    local _custom = vim.api.nvim_get_runtime_file('lua/plugins/lsp/custom/*.lua', true)

    for _, server in pairs(_custom) do
      local cray = server:gsub('.*lua/', ''):gsub('.lua$', ''):gsub('/', '.')
      local name = cray:gsub('.*%.', '')
      local opts = require(cray)
      opts.capabilities = cap

      lc[name] = {
        default_config = opts,
      }

      ls[name].setup(opts)
    end

    -- require 'plugins.config.lspconfig'  -- initial + lua
    -- require 'plugins.config.lspconfig2' -- lsps
  end,
}
