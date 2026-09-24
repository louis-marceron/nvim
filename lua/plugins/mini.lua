-- Collection of various small independent plugins/modules
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' }, { load = true, confirm = false })

local icons = require 'mini.icons'
icons.setup { style = vim.g.have_nerd_font and 'glyph' or 'ascii' }
icons.mock_nvim_web_devicons()

local extra = require 'mini.extra'
extra.setup()

-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - ci'  - [C]hange [I]nside [']quote
-- Keep Neovim's native `an`/`in` Tree-sitter selections.
require('mini.ai').setup {
  mappings = {
    around_next = 'aN',
    inside_next = 'iN',
  },
}

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require('mini.surround').setup()

require('mini.jump2d').setup {
  labels = 'qsdfghjklmazertyuiopwxcvbn',
  mappings = { start_jumping = 's' },
  silent = true,
}

-- Move selections and lines with Alt-h/j/k/l.
require('mini.move').setup()

-- Toggle arguments between one line and multiple lines with gS.
require('mini.splitjoin').setup()

-- Command-line completion, typo correction, and range preview.
require('mini.cmdline').setup()
vim.keymap.set('c', '<C-y>', function()
  local completion = vim.fn.cmdcomplete_info()
  if completion.pum_visible == 1 and completion.selected == -1 then
    return '<C-n><C-y>'
  end
  return '<C-y>'
end, { expr = true, desc = 'Accept command-line completion' })

require('mini.diff').setup()
vim.keymap.set('n', '<Leader>hp', MiniDiff.toggle_overlay, { desc = 'Toggle Git hunk preview' })

local words = extra.gen_highlighter.words
require('mini.hipatterns').setup {
  highlighters = {
    fixme = words({ 'FIX', 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, 'MiniHipatternsFixme'),
    hack = words({ 'HACK', 'WARN', 'WARNING', 'XXX', 'PERF', 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' }, 'MiniHipatternsHack'),
    todo = words({ 'TODO' }, 'MiniHipatternsTodo'),
    note = words({ 'NOTE', 'INFO', 'TEST', 'TESTING', 'PASSED', 'FAILED' }, 'MiniHipatternsNote'),
  },
}

local clue = require 'mini.clue'
clue.setup {
  triggers = {
    { mode = { 'n', 'x' }, keys = '<Leader>' },
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },
    { mode = 'i', keys = '<C-x>' },
    { mode = { 'n', 'x' }, keys = 'g' },
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },
    { mode = 'n', keys = '<C-w>' },
    { mode = { 'n', 'x' }, keys = 'z' },
  },
  clues = {
    clue.gen_clues.square_brackets(),
    clue.gen_clues.builtin_completion(),
    clue.gen_clues.g(),
    clue.gen_clues.marks(),
    clue.gen_clues.registers(),
    clue.gen_clues.windows(),
    clue.gen_clues.z(),
  },
}

require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }

-- vim: ts=2 sts=2 sw=2 et
