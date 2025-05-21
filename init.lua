vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.g.vscode then
  require 'options'
  require 'keymaps'
  require 'vscode_keymaps'
else
  require 'options'
  require 'keymaps'
  require 'lazy-bootstrap'
  require 'lazy-plugins'
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
