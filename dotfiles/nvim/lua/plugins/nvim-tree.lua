local P = {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}

function P.config()
    local tree = require('nvim-tree')
    local WIDTH_RATIO = 0.2

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
    local icons = require('config.icons')

    vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
    tree.setup({
        actions = {
            open_file = {
                resize_window = true,
            },
        },
        view = {
            width = function()
                return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
            end,
        },
        update_focused_file = {
            enable = true,
        },
        renderer = {
            icons = {
                glyphs = {
                    git = {
                        unstaged = icons.git.FileUnstaged,
                        untracked = icons.git.FileUntracked,
                    },
                },
            },
        },
        diagnostics = {
            icons = {
                hint = icons.diagnostics.Hint,
                info = icons.diagnostics.Info,
                warning = icons.diagnostics.Warning,
                error = icons.diagnostics.Error,
            },
        },
    })
end

return P
