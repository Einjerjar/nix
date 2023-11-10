local lc = require 'plugins.config.lspconfig'

local on_attach = lc.on_attach
local capabilities = lc.capabilities

local lspconfig = require 'lspconfig'

local servers = {
  'html',
  'cssls',
  'tsserver',
  'eslint',
  'emmet_language_server',
  'lemminx',
  'gopls',
  'svelte',
  'tailwindcss',
}
local _extends = vim.api.nvim_get_runtime_file('lua/plugins/conf/lsp/extends/*.lua', true)
local _extend_rename = {}

-- extend settings for default servers
for _, server in ipairs(_extends) do
  local cray = server:gsub('.*lua/', ''):gsub('.lua$', ''):gsub('/', '.')
  local name = cray:gsub('.*%.', '')

  _extend_rename[name] = cray
end

for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if _extend_rename[lsp] ~= nil then opts = vim.tbl_deep_extend('force', opts, require(_extend_rename[lsp])) end

  lspconfig[lsp].setup(opts)
end

-- load per server config from servers folder
local _servers = vim.api.nvim_get_runtime_file('lua/plugins/config/lsp/servers/*.lua', true)

local default_opts = {
  on_attach = on_attach,
  capabilities = capabilities,
}

for _, server in pairs(_servers) do
  local cray = server:gsub('.*lua/', ''):gsub('.lua$', ''):gsub('/', '.')
  local name = cray:gsub('.*%.', '')
  local opts = require(cray)

  opts = vim.tbl_deep_extend('force', default_opts, opts)

  lspconfig[name].setup(opts)
end
