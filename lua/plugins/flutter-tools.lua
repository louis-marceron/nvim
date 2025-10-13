return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- Optional (deprecated)
  },
  opts = {
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
  },
}
