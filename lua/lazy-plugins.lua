-- [[ Configure and install plugins ]]
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

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- modular approach: using `require 'path/name'` will
  -- include a plugin definition from file lua/path/name.lua

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
  -- require 'kickstart.plugins.filetree',
  require 'plugins.indent_line',
  require 'plugins.harpoon',
  require 'plugins.debug',
  require 'plugins.copilot',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}

-- vim: ts=2 sts=2 sw=2 et
