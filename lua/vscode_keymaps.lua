local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- undo/REDO via vscode
vim.keymap.set('n', 'u', "<Cmd>call VSCodeNotify('undo')<CR>", { remap = true })
vim.keymap.set('n', '<C-r>', "<Cmd>call VSCodeNotify('redo')<CR>", { remap = true })

-- remap leader key
keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- yank to system clipboard
keymap({ 'n', 'v' }, '<leader>y', '"+y', opts)

-- paste from system clipboard
keymap({ 'n', 'v' }, '<leader>p', '"+p', opts)

-- better indent handling
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- move text up and down
keymap('v', 'J', ':m .+1<CR>==', opts)
keymap('v', 'K', ':m .-2<CR>==', opts)
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
keymap('v', 'p', '"_dP', opts)

-- removes highlighting after escaping vim search
keymap('n', '<Esc>', '<Esc>:noh<CR>', opts)

-- alternate between files
vim.keymap.set('n', '<C-i>', '<C-^>')

-- general keymaps
keymap({ 'n', 'v' }, '<leader>t', "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap({ 'n', 'v' }, '<leader>b', "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({ 'n', 'v' }, 'K', "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({ 'n', 'v' }, '<leader>ca', "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ 'n', 'v' }, '<leader>vd', "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ 'n', 'v' }, '<leader>cn', "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ 'n', 'v' }, '<leader>sf', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
-- keymap({ 'n', 'v' }, '<leader>sf', "<cmd>lua require('vscode').action('find-it-faster.findFilesWithType')<CR>")
keymap({ 'n', 'v' }, '<leader>sg', "<cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>")
keymap({ 'n', 'v' }, '<leader>sg', "<cmd>lua require('vscode').action('find-it-faster.findWithinFiles')<CR>")
keymap({ 'n', 'v' }, '<leader>cp', "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ 'n', 'v' }, '<leader>pr', "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({ 'n', 'v' }, '<leader>fd', "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap({ 'n', 'v' }, '<leader>ts', "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>")
keymap({ 'n', 'v' }, '<leader>th', "<cmd>lua require('vscode').action('workbench.action.toggleAuxiliaryBar')<CR>")
keymap({ 'n', 'v' }, '<leader>tp', "<cmd>lua require('vscode').action('workbench.action.togglePanel')<CR>")
keymap({ 'n', 'v' }, '<leader>pv', "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")

-- harpoon keymaps
keymap({ 'n', 'v' }, '<leader>ha', "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
keymap({ 'n', 'v' }, '<leader>ho', "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
keymap({ 'n', 'v' }, '<leader>he', "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
keymap({ 'n', 'v' }, 'C-j', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
keymap({ 'n', 'v' }, 'C-k', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
keymap({ 'n', 'v' }, 'C-l', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
keymap({ 'n', 'v' }, 'C-m', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
keymap({ 'n', 'v' }, '<leader>h5', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
keymap({ 'n', 'v' }, '<leader>h6', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
keymap({ 'n', 'v' }, '<leader>h7', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
keymap({ 'n', 'v' }, '<leader>h8', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
keymap({ 'n', 'v' }, '<leader>h9', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

-- project manager keymaps
keymap({ 'n', 'v' }, '<leader>pa', "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
keymap({ 'n', 'v' }, '<leader>po', "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({ 'n', 'v' }, '<leader>pe', "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
