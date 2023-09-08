return {
    'VonHeikemen/searchbox.nvim',
    dependencies = {
        { 'MunifTanjim/nui.nvim' }
    },
    init = function()
        vim.keymap.set('n', '<leader>S', ':SearchBoxIncSearch<CR>')
    end
}
