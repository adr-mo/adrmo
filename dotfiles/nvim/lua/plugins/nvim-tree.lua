vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

return {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            actions = {
                open_file = {
                    resize_window = true,
                },
            },
            view = {
                width = 30
            },
            update_focused_file = {
                enable = true,
            },
        },
        keys = {
            { "<Leader>e", ":NvimTreeFindFileToggle<CR>", noremap = true, silent = true }
        }
    }
}
