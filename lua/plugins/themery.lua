return {
  'zaldih/themery.nvim',
  config = function()
    require('themery').setup {
      -- themes = { 'tokyonight-night', 'tokyonight-day', 'tokyonight-storm', 'tokyonight-moon', 'rose-pine-main','rose-pine-moon','rose-pine-down' }, -- Your list of installed colorschemes.
      themes = {
        'tokyonight-night',
        'tokyonight-day',
        'tokyonight-storm',
        'tokyonight-moon',
        'rose-pine-moon',
        'rose-pine-main',
        'rose-pine-dawn',
        {
          name = 'Gruvbox dark',
          colorscheme = 'gruvbox',
          before = [[
      -- All this block will be executed before apply "set colorscheme"
      vim.opt.background = "dark"
    ]],
        },
        {
          name = 'Gruvbox light',
          colorscheme = 'gruvbox',
          before = [[
      vim.opt.background = "light"
    ]],
          after = [[-- Same as before, but after if you need it]],
        },
      },
      livePreview = true, -- Apply theme while picking. Default to true.
    }

    vim.keymap.set('n', '<leader>tt', function()
      local themery = require 'themery'
      local currentTheme = themery.getCurrentTheme()
      if currentTheme and currentTheme.name == 'gruvbox light' then
        themery.setThemeByName('gruvbox dark', true)
      else
        themery.setThemeByName('gruvbox light', true)
      end
    end, { noremap = true })
  end,
}
