return {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    config = function()
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
                    'NvimTree',
                },
                buftypes = {
                    'terminal',
                    'nofile',
                },
            },
        }
    end
}
