vim.pack.add({ 'https://github.com/NMAC427/guess-indent.nvim' }, { load = true, confirm = false })
require('guess-indent').setup {}

require 'plugins.gitsigns'
require 'plugins.which-key'
require 'plugins.telescope'
require 'plugins.lspconfig'
require 'plugins.conform'
require 'plugins.blink-cmp'
require 'plugins.tokyonight'
require 'plugins.todo-comments'
require 'plugins.mini'
require 'plugins.treesitter'
require 'plugins.autopairs'
require 'plugins.debug'
require 'plugins.indent_line'
require 'plugins.lint'
require 'plugins.harpoon'
require 'plugins.neogit'
require 'plugins.snacks'
require 'plugins.themery'
require 'plugins.yazi'
require 'plugins.oil'
require 'plugins.go'
require 'plugins.fff'
require 'plugins.ts-context'
require 'plugins.markview'
require 'plugins.easy-dotnet'
require 'plugins.flutter-tools'

vim.pack.add({
  'https://github.com/dart-lang/dart-vim-plugin',
  'https://github.com/github/copilot.vim',
}, { load = true, confirm = false })

-- vim: ts=2 sts=2 sw=2 et
