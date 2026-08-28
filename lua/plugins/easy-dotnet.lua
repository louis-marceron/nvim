vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/folke/snacks.nvim',
  'https://github.com/GustavEikaas/easy-dotnet.nvim',
}, { load = true, confirm = false })

require('easy-dotnet').setup()
