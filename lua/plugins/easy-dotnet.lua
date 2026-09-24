vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/folke/snacks.nvim',
  'https://github.com/GustavEikaas/easy-dotnet.nvim',
}, { confirm = false })

require('easy-dotnet').setup {
  lsp = { auto_refresh_codelens = false },
}
