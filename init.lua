-- Leaders must be set before plugins define mappings.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

require 'options'
require 'keymaps'
require 'pack'
require 'plugins'

-- vim: ts=2 sts=2 sw=2 et
