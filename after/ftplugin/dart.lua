vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.b.undo_ftplugin = (vim.b.undo_ftplugin or '') .. ' | setlocal tabstop< shiftwidth< expandtab<'
