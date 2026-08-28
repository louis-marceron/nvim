vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
}, { load = true, confirm = false })

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Add file to Harpoon' })

vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Open harpoon window' })

vim.keymap.set('n', '<C-j>', function()
  harpoon:list():select(1)
end, { desc = 'Open Harpoon file 1' })

vim.keymap.set('n', '<C-k>', function()
  harpoon:list():select(2)
end, { desc = 'Open Harpoon file 2' })

vim.keymap.set('n', '<C-l>', function()
  harpoon:list():select(3)
end, { desc = 'Open Harpoon file 3' })

vim.keymap.set('n', '<C-m>', function()
  harpoon:list():select(4)
end, { desc = 'Open Harpoon file 4' })
