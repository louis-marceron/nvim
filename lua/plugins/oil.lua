-- Optional dependencies
vim.pack.add({
  'https://github.com/echasnovski/mini.icons',
  'https://github.com/stevearc/oil.nvim',
}, { load = true, confirm = false })

require('mini.icons').setup {}

---@module 'oil'
---@type oil.SetupOpts
require('oil').setup {
  view_options = {
    skip_confirm_for_simple_edits = true,
    show_hidden = true,
  },
}

-- Use `https://github.com/nvim-tree/nvim-web-devicons` instead if you prefer nvim-web-devicons.
-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
