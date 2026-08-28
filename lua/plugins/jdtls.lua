-- If exit code 13 : rm ~/.cache/jdtls/
-- https://github.com/LazyVim/LazyVim/discussions/4470
--
-- https://eruizc.dev/blog/en/java-with-neovim/
vim.pack.add({
  'https://github.com/folke/which-key.nvim',
  'https://github.com/mfussenegger/nvim-jdtls',
}, { load = true, confirm = false })

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('jdtls-start', { clear = true }),
  pattern = 'java',
  callback = function()
    require('jdtls').start_or_attach {
      cmd = {
        vim.fn.expand '$HOME/.local/share/nvim/mason/bin/jdtls',
        ('--jvm-arg=-javaagent:%s'):format(vim.fn.expand '$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar'),
      },
    }
  end,
})
