vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- Highlight on yank 
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Line numbers in browsing
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
-- Hide top banner
vim.g.netrw_banner = 0











































