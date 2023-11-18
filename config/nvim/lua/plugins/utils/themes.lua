local M = {}

M.hi = vim.api.nvim_set_hl
M.ln = function(fr, to) M.hi(0, fr, { link = to }) end
M.gh = function(s) return vim.api.nvim_get_hl(0, { name = s }) end
M.fm = function(i) return string.format('#%06x', i) end

M.find = function(s)
  local h = M.gh(s)
  if h.link ~= nil then return M.find(h.link) end
  return h
end

-- modified to take in and return ints
-- https://stackoverflow.com/a/72431176
M.clamp = function(v) return math.min(math.max(v, 0), 255) end

M.shift = function(num, amt)
  local r = math.floor(num / 0x10000) + amt
  local g = (math.floor(num / 0x100) % 0x100) + amt
  local b = (num % 0x100) + amt
  return M.clamp(r) * 0x10000 + M.clamp(g) * 0x100 + M.clamp(b)
end

return M
