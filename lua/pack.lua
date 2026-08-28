-- Build plugins after `vim.pack` installs or updates them.
local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then
      output = 'No output from build command.'
    end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    local name = event.data.spec.name
    local kind = event.data.kind
    if kind ~= 'install' and kind ~= 'update' then
      return
    end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make' }, event.data.path)
    elseif name == 'nvim-treesitter' then
      if not event.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    elseif name == 'fff' then
      if not event.data.active then
        vim.cmd.packadd 'fff'
      end
      require('fff.download').download_or_build_binary()
    elseif name == 'go.nvim' then
      if not event.data.active then
        vim.cmd.packadd 'go.nvim'
      end
      require('go.install').update_all_sync()
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
