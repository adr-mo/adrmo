local M = {
    'ahmedkhalf/project.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    event = 'VeryLazy',
}

function M.config()
    require('project_nvim').setup {
        -- Methods of detecting the root directory. **"lsp"** uses the native neovim
        -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
        -- order matters: if one is not detected, the other is used as fallback. You
        -- can also delete or rearangne the detection methods.
        detection_methods = { 'pattern' },
        patterns = { '.git', 'package.json', 'composer.json' },
    }

    require('telescope').load_extension('projects')
end

return M