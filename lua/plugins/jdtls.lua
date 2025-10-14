-- If exit code 13 : rm ~/.cache/jdtls/
-- https://github.com/LazyVim/LazyVim/discussions/4470
--
-- https://eruizc.dev/blog/en/java-with-neovim/
return {
  'mfussenegger/nvim-jdtls',
  dependencies = { 'folke/which-key.nvim' },
  lazy = true,
  ft = { 'java' },
  config = function()
    require('jdtls').start_or_attach {
      cmd = {
        vim.fn.expand '$HOME/.local/share/nvim/mason/bin/jdtls',
        ('--jvm-arg=-javaagent:%s'):format(vim.fn.expand '$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar'),
      },
    }
  end,
}
