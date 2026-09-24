vim.pack.add({
  'https://github.com/oribarilan/lensline.nvim',
}, { load = true, confirm = false })

require('lensline').setup {
  profiles = {
    {
      name = 'default',
      providers = {
        { name = 'usages', breakdown = false, show_zero = false },
      },
      style = {
        placement = 'inline',
        prefix = '',
        use_nerdfont = vim.g.have_nerd_font,
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
