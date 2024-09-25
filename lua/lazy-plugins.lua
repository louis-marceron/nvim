require('lazy').setup {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  { 'numToStr/Comment.nvim', opts = {} },
  { 'typicode/bg.nvim', lazy = false },

  require 'plugins/gitsigns',
  require 'plugins/which-key',
  require 'plugins/telescope',
  require 'plugins/lspconfig',
  require 'plugins/conform',
  require 'plugins/cmp',
  require 'plugins/tokyonight',
  require 'plugins/todo-comments',
  require 'plugins/mini',
  require 'plugins/treesitter',
  require 'plugins/autopairs',
  require 'plugins.indent_line',
  require 'plugins.harpoon',
  require 'plugins.debug',
  require 'plugins.copilot',
  require 'plugins.neogit',
  require 'plugins.flutter-tools',
  require 'plugins.metals',
  require 'plugins.themery',
  require 'plugins.rose-pine', -- rose-pine
  require 'plugins.gruvbox',
  require 'plugins.yazi',
  -- require 'kickstart.plugins.filetree',
}

local metals = require 'metals'
local metals_config = metals.bare_config()
metals_config.on_attach = function(client, bufnr)
  print 'LSP Attached!'
end
metals.initialize_or_attach(metals_config)

-- vim: ts=2 sts=2 sw=2 et
