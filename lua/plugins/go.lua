vim.pack.add({
  'https://github.com/ray-x/guihua.lua',
  'https://github.com/neovim/nvim-lspconfig',
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/ray-x/go.nvim',
}, { confirm = false })

require('go').setup {
  lsp_codelens = false,
  lsp_inlay_hints = { enable = false },
}
