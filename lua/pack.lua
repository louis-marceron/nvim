vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    local name = event.data.spec.name
    local kind = event.data.kind
    if kind ~= 'install' and kind ~= 'update' then
      return
    end

    if name == 'nvim-treesitter' then
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
