local P = {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
}

function P.config()
    require('ibl').setup {
        indent = {
        },
        scope = {

        },
        exclude = {

            filetypes = {
                'help',
                'lazy',
                'toggleterm',
                'NeoTree',
            },

            buftypes = {
                'terminal',
                'nofile',
            },
        },
    }
end

return P
