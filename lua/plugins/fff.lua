vim.pack.add({ 'https://github.com/dmtrKovalenko/fff.nvim' }, { load = true, confirm = false })

require('fff').setup {
  debug = {
    enabled = true, -- we expect your collaboration at least during the beta
    show_scores = true, -- to help us optimize the scoring system, feel free to share your scores!
  },
}

vim.keymap.set('n', '<leader>sf', function()
  require('fff').find_files() -- or find_in_git_root() if you only want git files
end, { desc = 'Open file picker' })

vim.keymap.set('n', 'sg', function()
  require('fff').live_grep()
end, { desc = 'LiFFFe grep' })
