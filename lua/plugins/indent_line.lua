-- Add indentation guides even on blank lines
vim.pack.add({ 'https://github.com/lukas-reineke/indent-blankline.nvim' }, { load = true, confirm = false })

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help ibl`
require('ibl').setup {}
