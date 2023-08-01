return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function ()
            vim.keymap.set('n', '<leader>tt', '<cmd>:ToggleTerm direction=horizontal<CR>')
            require('toggleterm').setup()
        end
    }
}
