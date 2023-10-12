vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local WIDTH_RATIO = 0.2  -- You can change this too

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
                width = function()
                    return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
                end,
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
