vim.pack.add({ 'https://github.com/folke/trouble.nvim' }, { load = true, confirm = false })

require('trouble').setup {}

vim.keymap.set('n', '<leader>grr', '<cmd>Trouble lsp_references<CR>', { desc = '[G]oto [R]eferences' })
vim.keymap.set('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' })
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
