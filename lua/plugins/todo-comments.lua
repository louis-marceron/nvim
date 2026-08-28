-- Highlight todo, notes, etc in comments
vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/folke/todo-comments.nvim',
}, { load = true, confirm = false })

require('todo-comments').setup { signs = false }
-- vim: ts=2 sts=2 sw=2 et
