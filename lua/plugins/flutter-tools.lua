vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/stevearc/dressing.nvim', -- Optional (deprecated)
  'https://github.com/nvim-flutter/flutter-tools.nvim',
}, { load = true, confirm = false })

require('flutter-tools').setup {
  ui = {
    notification_style = 'plugin',
  },
  dev_log = {
    notify_errors = true, -- if there is an error whilst running then notify the user
    focus_on_open = false, -- focus on the newly opened log window
  },
  widget_guides = {
    enabled = true,
  },
  lsp = {
    color = {
      enabled = true,
      virtual_text = true,
      virtual_text_str = '■',
    },
  },
}
