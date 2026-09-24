vim.pack.add({
  'https://github.com/folke/lazydev.nvim',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' },
}, { load = true, confirm = false })

--- @module 'blink.cmp'
--- @type blink.cmp.Config
require('blink.cmp').setup {
  -- mini.cmdline owns command-line completion.
  cmdline = { enabled = false },

  sources = {
    default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
    },
  },

  signature = { enabled = true },
}

-- vim: ts=2 sts=2 sw=2 et
