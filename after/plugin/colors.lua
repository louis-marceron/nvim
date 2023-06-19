function Dark()
	vim.cmd.colorscheme("catppuccin")
end

function Light()
    require('rose-pine').setup({
        variant = 'dawn',
    })
	vim.cmd.colorscheme('rose-pine')
end

Dark()
