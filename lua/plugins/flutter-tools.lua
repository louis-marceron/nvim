vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' },
  'https://github.com/nvim-flutter/flutter-tools.nvim',
}, { load = true, confirm = false })

require('flutter-tools').setup {
  dev_log = {
    notify_errors = true,
    focus_on_open = false,
  },
  widget_guides = {
    enabled = true,
  },
  lsp = {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
  },
}
