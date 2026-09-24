vim.pack.add({
  'https://github.com/stevearc/oil.nvim',
}, { confirm = false })

---@module 'oil'
---@type oil.SetupOpts
require('oil').setup {
  view_options = {
    show_hidden = true,
  },
}

-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
