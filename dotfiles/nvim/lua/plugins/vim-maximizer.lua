return {
    "szw/vim-maximizer",
    keys = {
        { "<leader>sm", ":MaximizerToggle<CR>", desc = 'Maximize split' }
    },
    config = function()
        vim.g.maximizer_set_default_mapping = 0
        vim.g.maximizer_default_mapping_key = ''
    end
}
