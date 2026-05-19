-- Define hook to update tree-sitter parsers after plugin is updated
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

-- -- Auto-install parsers
-- vim.api.nvim_create_autocmd('FileType', {
--   callback = function(ev)
--     local lang = vim.treesitter.language.get_lang(ev.match)
--     local available_langs = require('nvim-treesitter').get_available()
--     local is_available = vim.tbl_contains(available_langs, lang)
--     if is_available then
--       local installed_langs = require('nvim-treesitter').get_installed()
--       local installed = vim.tbl_contains(installed_langs, lang)
--       if not installed then
--         require('nvim-treesitter').install(lang):wait()
--       end
--       vim.treesitter.start()
--       require('nvim-treesitter').indentexpr()
--     end
--   end,
-- })

vim.pack.add {
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
}

-- Define languages which will have parsers installed and auto enabled
-- After changing this, restart Neovim once to install necessary parsers. Wait
-- for the installation to finish before opening a file for added language(s).
local languages = {
	'rust',
	'vimdoc',
	'markdown',
}

local isnt_installed = function(lang)
	return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
end

local to_install = vim.tbl_filter(isnt_installed, languages)
if #to_install > 0 then require('nvim-treesitter').install(to_install) end

-- Enable tree-sitter after opening a file for a target language
local filetypes = {}
for _, lang in ipairs(languages) do
	for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
		table.insert(filetypes, ft)
	end
end

local ts_start = function(ev) vim.treesitter.start(ev.buf) end

local opts = { group =  vim.api.nvim_create_augroup('custom-config', {}), pattern = pattern, callback = ts_start, desc = 'Start tree-sitter' }
vim.api.nvim_create_autocmd('FileType', opts)
