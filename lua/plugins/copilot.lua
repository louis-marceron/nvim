return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      filetypes = {
        markdown = true,
      },
      suggestion = {
        enabled = false,
        auto_trigger = true,
        keymap = {
          accept = '<C-f>',
        },
      },
    }
  end,
}
