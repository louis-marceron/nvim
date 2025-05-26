return {
  'folke/trouble.nvim',
  opt = {},
  cmd = 'Trouble',
  keys = {
    {
      '<leader>grr',
      '<cmd>Trouble lsp_references<CR>',
      desc = '[G]oto [R]eferences',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
  },
}
