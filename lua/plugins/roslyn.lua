vim.pack.add({ 'https://github.com/seblyng/roslyn.nvim' }, { load = true, confirm = false })

---@module 'roslyn.config'
---@type RoslynNvimConfig
local opts = {
  -- your configuration comes here; leave empty for default settings
}
require('roslyn').setup(opts)
