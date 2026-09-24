vim.pack.add({
  'https://github.com/folke/lazydev.nvim',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/j-hui/fidget.nvim',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' },
  'https://github.com/neovim/nvim-lspconfig',
}, { load = true, confirm = false })

require('lazydev').setup {
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
}

require('mason').setup()

require('fidget').setup()

local lsp_group = vim.api.nvim_create_augroup('lsp-config', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_group,
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then
      return
    end

    local builtin = require 'telescope.builtin'
    local function map(keys, func, desc, mode)
      vim.keymap.set(mode or 'n', keys, func, { buf = event.buf, desc = 'LSP: ' .. desc })
    end

    map('grr', builtin.lsp_references, '[G]oto [R]eferences')
    map('gri', builtin.lsp_implementations, '[G]oto [I]mplementation')
    map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('<leader>vd', vim.diagnostic.open_float, '[V]iew [D]iagnostics')
    map('gO', builtin.lsp_document_symbols, 'Open Document Symbols')
    map('gW', builtin.lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end

    MiniClue.ensure_buf_triggers(event.buf)
  end,
})

local diagnostic_icons = {
  [vim.diagnostic.severity.ERROR] = '󰅚 ',
  [vim.diagnostic.severity.WARN] = '󰀪 ',
  [vim.diagnostic.severity.INFO] = '󰋽 ',
  [vim.diagnostic.severity.HINT] = '󰌶 ',
}

vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = { text = diagnostic_icons },
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    prefix = '●',
  },
}

vim.filetype.add {
  pattern = {
    ['openapi.*%.ya?ml'] = 'yaml.openapi',
    ['openapi.*%.json'] = 'json.openapi',
  },
}

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      completion = { callSnippet = 'Replace' },
    },
  },
})

vim.env.JDTLS_JVM_ARGS = '-javaagent:' .. vim.fs.joinpath(vim.fn.stdpath 'data', 'mason', 'packages', 'jdtls', 'lombok.jar')

local servers = {
  'asm_lsp',
  'docker_compose_language_service',
  'dockerls',
  'eslint',
  'gopls',
  'jdtls',
  'jsonls',
  'lua_ls',
  'rust_analyzer',
  'ts_ls',
  'vacuum',
  'yamlls',
}

require('mason-lspconfig').setup {
  ensure_installed = servers,
}

require('mason-tool-installer').setup {
  ensure_installed = { 'goimports', 'stylua', 'tree-sitter-cli' },
}

-- vim: ts=2 sts=2 sw=2 et
