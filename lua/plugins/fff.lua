vim.pack.add({ 'https://github.com/dmtrKovalenko/fff' }, { load = true, confirm = false })

require('fff').setup { lazy_sync = true }

vim.keymap.set('n', '<leader>sf', function()
  require('fff').find_files() -- or find_in_git_root() if you only want git files
end, { desc = 'Open file picker' })

vim.keymap.set('n', '<leader>sg', function()
  require('fff').live_grep()
end, { desc = 'LiFFFe grep' })
