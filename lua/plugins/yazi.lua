vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/mikavilpas/yazi.nvim',
}, { load = true, confirm = false })

-- 👇 in this section, choose your own keymappings!
vim.keymap.set('n', '<leader>e', '<cmd>Yazi<cr>', { desc = 'Open yazi at the current file' })

-- Open in the current working directory
vim.keymap.set('n', '<leader>wc', '<cmd>Yazi cwd<cr>', { desc = "Open the file manager in nvim's working directory" })

vim.keymap.set('n', '<c-up>', '<cmd>Yazi toggle<cr>', { desc = 'Resume the last yazi session' })

---@type YaziConfig
require('yazi').setup {}
