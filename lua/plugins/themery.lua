vim.pack.add({ 'https://github.com/zaldih/themery.nvim' }, { load = true, confirm = false })

require('themery').setup {
  themes = {
    'tokyonight-night',
    'tokyonight-day',
    'tokyonight-storm',
    'tokyonight-moon',
    'rose-pine-moon',
    'rose-pine-main',
    'rose-pine-dawn',
  },
  livePreview = true, -- Apply theme while picking. Default to true.
}

vim.keymap.set('n', '<leader>tt', function()
  local themery = require 'themery'
  local currentTheme = themery.getCurrentTheme()
  if currentTheme and currentTheme.name == 'rose-pine-main' then
    themery.setThemeByName('rose-pine-dawn', true)
  else
    themery.setThemeByName('rose-pine-main', true)
  end
end, { desc = '[T]oggle light or dark theme', noremap = true })
