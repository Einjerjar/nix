return {
  "https://github.com/atusy/treemonkey.nvim",
  event = { 'VeryLazy' },
  init = function()
    vim.keymap.set({"x", "o"}, "m", function()
      require("treemonkey").select({ ignore_injections = false })
    end)
  end
}
