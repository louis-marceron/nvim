-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights on search' })

vim.keymap.set('i', 'jk', '<esc>', { desc = 'Leave insert mode' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic location list' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move the selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move the selection up' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center after jumping half a page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center after jumping half a page up' })

vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Keep the cursor in the middle when searching for terms' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Keep the cursor in the middle when searching for terms' })

vim.keymap.set('x', 'p', 'P', { desc = 'Paste without replacing the default register' })

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without putting the deleted content in the Neovim clipboard' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy to the OS clipboard' })

-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open file explorer' })
vim.keymap.set('n', '<leader>pv', '<cmd>Oil<CR>', { desc = 'Open file explorer' })

vim.keymap.set('n', '<C-Space>', '<C-6>', { desc = 'Alternate between two files' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Keep cursor position when joining line below' })

vim.keymap.set('v', '<', '<gv', { desc = 'Indent selection left multiple times without re-selecting it' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent selection right multiple times without re-selecting it' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace [w]ord cursor is on globally on the file' })

vim.keymap.set('n', '<leader>cc', 'yy<cmd>normal gcc<CR>p', { desc = 'Duplicate line, comment original, move down' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
