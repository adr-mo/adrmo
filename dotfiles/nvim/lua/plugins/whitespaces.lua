return {
    'johnfrankmorgan/whitespace.nvim',
    config = function()
        require('whitespace-nvim').setup({
            highlight = 'DiffDelete',
            ignored_filetypes = { 'alpha', 'TelescopePrompt', 'Trouble', 'help', 'dashboard', 'toggleterm' },
            ignore_terminal = true,
        })

        vim.keymap.set('n', '<Leader>cw', require('whitespace-nvim').trim)
    end
}
