vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/sindrets/diffview.nvim',
  'https://github.com/NeogitOrg/neogit',
}, { load = true, confirm = false })

require('neogit').setup()
