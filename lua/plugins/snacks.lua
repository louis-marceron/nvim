vim.pack.add({ 'https://github.com/folke/snacks.nvim' }, { confirm = false })

---@type snacks.Config
require('snacks').setup {
  bigfile = {},
  input = {},
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'bigfile',
  callback = function(event)
    local filetype = vim.filetype.match { buf = event.buf } or 'text'
    vim.bo[event.buf].commentstring = vim.filetype.get_option(filetype, 'commentstring')
  end,
})
