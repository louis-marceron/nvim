vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/stevearc/dressing.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  -- - The below dependencies are optional,
  'https://github.com/echasnovski/mini.pick', -- for file_selector provider mini.pick
  'https://github.com/nvim-telescope/telescope.nvim', -- for file_selector provider telescope
  'https://github.com/hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
  'https://github.com/ibhagwan/fzf-lua', -- for file_selector provider fzf
  'https://github.com/nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  'https://github.com/HakonHarnes/img-clip.nvim', -- support for image pasting
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/yetone/avante.nvim', -- Never pin this to "*".
}, { load = true, confirm = false })

require('img-clip').setup {
  -- recommended settings
  default = {
    embed_image_as_base64 = false,
    prompt_for_file_name = false,
    drag_and_drop = {
      insert_mode = true,
    },
    -- required for Windows users
    use_absolute_path = true,
  },
}

-- Configure Markdown rendering for Avante buffers.
require('render-markdown').setup {
  file_types = { 'markdown', 'Avante' },
}

require('avante').setup {
  selector = {
    --- @alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
    provider = 'fzf',
    -- Options override for custom providers
    provider_opts = {},
  },
  provider = 'ollama',
  providers = {
    ollama = {
      endpoint = 'http://localhost:11434',
      model = 'deepseek-r1:latest',
    },
  },
}

-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
-- build = 'make',
-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
