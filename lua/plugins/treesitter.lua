vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
}, { load = true, confirm = false })

local parsers = {
  'bash',
  'c',
  'c_sharp',
  'dart',
  'diff',
  'dockerfile',
  'go',
  'html',
  'java',
  'javascript',
  'json',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'rust',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'xml',
  'yaml',
}

local mason_cli = vim.fs.joinpath(vim.fn.stdpath 'data', 'mason', 'bin', 'tree-sitter')
local function install_parsers()
  if vim.fn.executable(mason_cli) == 1 then
    require('nvim-treesitter').install(parsers)
  end
end

install_parsers()
vim.api.nvim_create_autocmd('User', {
  desc = 'Install Tree-sitter parsers after Mason installs its CLI',
  group = vim.api.nvim_create_augroup('treesitter-install', { clear = true }),
  pattern = 'MasonToolsUpdateCompleted',
  callback = install_parsers,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable Tree-sitter highlighting and folding when a parser is available',
  group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
  callback = function(event)
    if pcall(vim.treesitter.start, event.buf) then
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[0][0].foldlevel = 99
      vim.wo[0][0].foldmethod = 'expr'
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
