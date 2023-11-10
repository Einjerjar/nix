local M = {}

M.echo = function(str)
  vim.cmd('redraw')
  vim.api.nvim_echo({ { str, 'Bold' } }, true, {})
end

local default_map_opts = {
  noremap = true,
  silent = true,
}

M.has_value = function(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

M.get_color = function(group, attr)
    return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
end

M.load_mappings = function(plugin, mapping_opts)
  plugin = plugin or ''
  mapping_opts = mapping_opts or {}
  local m = require('core.mappings')

  local opts = vim.tbl_extend('force', default_map_opts, mapping_opts)

  local load_mapping = function(ref, modes)
    -- M.echo('Loading mappings for ' .. ref)
    if plugin ~= '' and modes.plugin == false then
      return
    end

    if modes.plugin and ref ~= plugin then
      return
    end

    for mode, maps in pairs(modes) do
      for key, map in pairs(maps) do
        local action = map[1]
        local o_opts = map[3] or {}
        o_opts = vim.tbl_deep_extend('force', o_opts, opts)
        o_opts.desc = map[2]

        vim.keymap.set(mode, key, action, o_opts)
      end
    end
  end

  for ref, modes in pairs(m) do
    load_mapping(ref, modes)
  end
end

return M
