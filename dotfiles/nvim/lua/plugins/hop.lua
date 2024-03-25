-- no longer maintained maybe look at https://github.com/folke/flash.nvim
return {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
        require('hop').setup({
            keys = 'etovxqpdygfblzhckisuran'
        })
        vim.keymap.set('n', 's', '<cmd>:HopWord<cr>', { remap = true })
    end
}
