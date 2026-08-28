vim.pack.add({
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/dlyongemallo/diffview-plus.nvim', -- Maintained fork of "sindrets/diffview.nvim".
  'https://github.com/stevearc/dressing.nvim', -- Recommended but not required. Better UI for pickers.
  'https://github.com/nvim-tree/nvim-web-devicons', -- Recommended but not required. Icons in discussion tree.
  {
    src = 'https://github.com/harrisoncramer/gitlab.nvim',
    -- version = "main", -- Uncomment to use a stable version. The default, possibly unstable, but more actively maintained branch is `develop`.
  },
}, { load = true, confirm = false })

---@type GitlabSettings
local opts = {} -- Your configuration
require('gitlab').setup(opts)
