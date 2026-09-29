vim.pack.add({ { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' } }, { confirm = false })

local themes = {
  ['rose-pine-main'] = 'rose-pine-dawn',
  ['rose-pine-dawn'] = 'rose-pine-main',
}
local state_dir = vim.fn.stdpath 'state'
local state_file = state_dir .. '/theme'
local ok, saved = pcall(vim.fn.readfile, state_file, '', 1)
local theme = ok and themes[saved[1]] and saved[1] or 'rose-pine-dawn'

vim.cmd.colorscheme(theme)

vim.keymap.set('n', '<leader>tt', function()
  theme = themes[theme]
  vim.cmd.colorscheme(theme)

  local wrote, result = pcall(function()
    vim.fn.mkdir(state_dir, 'p')
    return vim.fn.writefile({ theme }, state_file)
  end)
  if not wrote or result ~= 0 then
    vim.notify('Theme changed but could not be saved', vim.log.levels.WARN)
  end
end, { desc = '[T]oggle light or dark theme' })
