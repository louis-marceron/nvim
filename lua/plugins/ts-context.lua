vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter-context' }, { load = true, confirm = false })

require('treesitter-context').setup {
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
}
