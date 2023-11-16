local u = require 'heirline.utils'
local c = require 'heirline.conditions'

local icons = {
  branch = '  ',
  added = '  ',
  removed = '  ',
  changed = '  ',
}

return {
  conditions = c.is_git_repo,
  init = function(self) self.git_dict = vim.b.gitsigns_status_dict or {} end,
  {
    condition = function(self)
      return not c.buffer_matches {
        filetype = self.filetypes,
      }
    end,
    {
      provider = function(self)
        local d = self.git_dict
        return icons.branch .. (d.head == nil and 'main' or d.head) .. ' '
      end,
    },
    {
      provider = function(self)
        local d = self.git_dict
        return icons.added .. (d.added == nil and '0' or d.added) .. ' '
      end,
    },
    {
      provider = function(self)
        local d = self.git_dict
        return icons.changed .. (d.changed == nil and '0' or d.changed) .. ' '
      end,
    },
    {
      provider = function(self)
        local d = self.git_dict
        return icons.removed .. (d.removed == nil and '0' or d.removed) .. ' '
      end,
    },
  },
}
