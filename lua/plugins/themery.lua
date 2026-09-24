vim.pack.add({
  'https://github.com/folke/tokyonight.nvim',
  { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
  'https://github.com/zaldih/themery.nvim',
}, { confirm = false })

---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  styles = {
    comments = { italic = false },
  },
}

local themery = require 'themery'
themery.setup {
  themes = {
    'tokyonight-night',
    'tokyonight-day',
    'tokyonight-storm',
    'tokyonight-moon',
    'rose-pine-moon',
    'rose-pine-main',
    'rose-pine-dawn',
  },
}

if not vim.g.colors_name then
  vim.cmd.colorscheme 'tokyonight-day'
end

vim.keymap.set('n', '<leader>tt', function()
  local currentTheme = themery.getCurrentTheme()
  if currentTheme and currentTheme.name == 'rose-pine-main' then
    themery.setThemeByName('rose-pine-dawn', true)
  else
    themery.setThemeByName('rose-pine-main', true)
  end
end, { desc = '[T]oggle light or dark theme' })
